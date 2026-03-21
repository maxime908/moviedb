<?php 
    session_start();

    require_once(__DIR__ . "/../config/config.php");
    require_once(__DIR__ . "/../config/variables.php");

    header('Accept: application/json');
    header('Content-Type: application/json');
    header('Access-Control-Allow-Origin: *');
    header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS,  PATCH");
    header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");

    if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
        http_response_code(200);
        exit();
    }

    $i = 0;

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $data = json_decode(file_get_contents('php://input'), true);

        $addMovieStatement = $mysqlClient -> prepare("INSERT INTO movies (name, description, releaseYear, author, likes, dislikes, img, video) VALUES (:name, :description, :releaseYear, :author, :likes, :dislikes, :img, :video)");
        $addMovieStatement -> execute([
            'name' => $data['name'],
            'description' => $data['description'],
            'releaseYear' => $data['releaseYear'],
            'author' => $data['author'],
            'likes' => 0,
            'dislikes' => 0,
            'img' => $data['img'],
            'video' => $data['video'],
        ]);

        $id = $mysqlClient -> lastInsertId();

        $categorieMovieStatement = $mysqlClient -> prepare("INSERT INTO movies_categories (id_movie, id_category) VALUES (:id_movie, :id_category)");

        foreach ($data['categories'] as $value) {
            $categorieMovieStatement -> execute([
                'id_movie' => $id,
                'id_category' => $value,
            ]);
        }
        exit;
    }

    if (!isset($_GET["like"]) && !isset($_GET['dislike']) && !isset($_GET["removelike"]) && !isset($_GET['removedislike'])) {
        if ($_SERVER['REQUEST_METHOD'] === 'PATCH' && isset($_GET["id"])) {
            $data = json_decode(file_get_contents('php://input'), true);

            $addMovieStatement = $mysqlClient -> prepare("UPDATE movies SET name = :name, description = :description, releaseYear = :releaseYear, author = :author, img = :img, video = :video WHERE id_movie = :id_movie");
            $addMovieStatement -> execute([
                'id_movie' => $_GET["id"],
                'name' => $data['name'],
                'description' => $data['description'],
                'releaseYear' => $data['releaseYear'],
                'author' => $data['author'],
                'img' => $data['img'],
                'video' => $data['video'],
            ]);

            $deleteMovieCategoriesStatement = $mysqlClient -> prepare("DELETE FROM movies_categories WHERE id_movie = :id_movie");
            $deleteMovieCategoriesStatement -> execute([
                "id_movie" => $_GET['id'],
            ]);

            $addMovieCategoriesStatement = $mysqlClient -> prepare("INSERT INTO movies_categories (id_movie, id_category) VALUES (:id_movie, :id_category)");

            foreach ($data['categories'] as $value) {
                $addMovieCategoriesStatement -> execute([
                    'id_movie' => $_GET['id'],
                    'id_category' => $value,
                ]);
            }

            exit;
        }
    }
    
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

                if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
                    $deleteMovieCatStatement = $mysqlClient -> prepare("DELETE FROM movies_categories WHERE id_movie = :id_movie");
                    $deleteMovieCatStatement -> execute([
                        'id_movie' => $value['id_movie'],
                    ]);

                    $deleteStatement = $mysqlClient -> prepare("DELETE FROM movies WHERE id_movie = :id_movie");
                    $deleteStatement -> execute([
                        'id_movie' => $value['id_movie'],
                    ]);

                    exit;
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
?>