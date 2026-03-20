<?php 
    session_start();

    require_once(__DIR__ . "/../config/config.php");
    require_once(__DIR__ . "/../config/variables.php");
    
    $tab = [
        "data" => $movies
    ];

    $temp = [];
    $test = [];

    $bool = true;

    $addLikeStatement = $mysqlClient -> prepare("UPDATE movies SET likes = likes + 1 WHERE id_movie = :id_movie");
    $addDislikeStatement = $mysqlClient -> prepare("UPDATE movies SET dislikes = dislikes + 1 WHERE id_movie = :id_movie");

    $removeLikeStatement = $mysqlClient -> prepare("UPDATE movies SET likes = likes - 1 WHERE id_movie = :id_movie");
    $removeDislikeStatement = $mysqlClient -> prepare("UPDATE movies SET dislikes = dislikes - 1 WHERE id_movie = :id_movie");

    $movieCategoryStatement = $mysqlClient -> prepare(
    "SELECT *,
     (
     SELECT name
     FROM categories
     WHERE id_categorie = movies_categories.id_category
     ) AS name_cat
    FROM movies_categories 
    WHERE id_movie = :id");

    foreach ($tab['data'] as $key => $value) {
        $movieCategoryStatement -> execute([
            'id' => $value['id_movie'],
        ]);
        $moviesCategories = $movieCategoryStatement -> fetchAll(PDO::FETCH_ASSOC);

        if ($moviesCategories) {
            foreach ($moviesCategories as $categorie) {
                $tab['data'][$key]["categories"][] = [
                    "id" => $categorie['id_category'],
                    "name" => $categorie['name_cat'],
                ];
            }
        } else {
            $tab['data'][$key]["categories"] = [];
        }
    }

    if (isset($_GET['id'])) {
        foreach ($tab['data'] as $key => $value) {
            if ($_GET["id"] == $value['id_movie']) {
                if (isset($_GET['like'])) {
                    $addLikeStatement -> execute([
                        'id_movie' => $value['id_movie'],
                    ]);
                } else if (isset($_GET['dislike'])) {
                    $addDislikeStatement -> execute([
                        'id_movie' => $value['id_movie'],
                    ]);
                } else if (isset($_GET['removelike'])) {
                    $removeLikeStatement -> execute([
                        'id_movie' => $value['id_movie'],
                    ]);
                } else if (isset($_GET['removedislike'])) {
                    $removeDislikeStatement -> execute([
                        'id_movie' => $value['id_movie'],
                    ]);
                }

                $selectByIdStatement = $mysqlClient -> prepare("SELECT * FROM movies WHERE id_movie = :id");
                $selectByIdStatement -> execute([
                    'id' => $value['id_movie'],
                ]);
                $selectById = $selectByIdStatement -> fetch(PDO::FETCH_ASSOC);

                $temp['data'] = $selectById + ["categories" => $value['categories']];

                echo json_encode($temp);

                $bool = true;
                break;
            } else {
                $bool = false;
            }
        }

        if ($bool === false) {
            echo json_encode(["Aucun film trouvé"]);
        }
    } else {
        echo json_encode($tab);
    }


    header('Accept: application/json');
    header('Content-Type: application/json');
    header('Access-Control-Allow-Origin: *');
    header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
    header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");
?>