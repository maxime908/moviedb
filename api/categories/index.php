<?php 
    require_once(__DIR__ . "/../config/config.php");
    require_once(__DIR__ . "/../config/variables.php");

    header('Accept: application/json');
    header('Content-Type: application/json');
    header('Access-Control-Allow-Origin: *');
    header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS,  PATCH");
    header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");

    if ($_SERVER['REQUEST_METHOD'] === "POST") {
        $data = json_decode(file_get_contents('php://input'), true);

        $addCategorieStatement = $mysqlClient -> prepare("INSERT INTO categories (name) VALUES (:name)");
        $addCategorieStatement -> execute([
            "name" => $data["name"],
        ]);

        exit;
    }

    if ($_SERVER['REQUEST_METHOD'] === "DELETE" && isset($_GET['id'])) {
        $deleteMoviesCatsStatement = $mysqlClient -> prepare("DELETE FROM movies_categories WHERE id_category = :id_category");
        $deleteMoviesCatsStatement -> execute([
            'id_category' => $_GET['id'],
        ]);

        $deleteCatStatement = $mysqlClient -> prepare("DELETE FROM categories WHERE id_categorie = :id_categorie");
        $deleteCatStatement -> execute([
            'id_categorie' => $_GET['id'],
        ]);

        exit;
    }

    if ($_SERVER['REQUEST_METHOD'] === "PUT" && isset($_GET['id'])) {
        $data = json_decode(file_get_contents('php://input'), true);

        $updateCatStatement = $mysqlClient -> prepare("UPDATE categories SET name = :name WHERE id_categorie = :id_categorie");
        $updateCatStatement -> execute([
            "id_categorie" => $_GET['id'],
            "name" => $data['name'],
        ]);

        exit;
    }

    $tab = [
        "data" => $categories,
    ];

    $movieCategoriesStatement = $mysqlClient -> prepare(
        "SELECT *
        FROM movies
        INNER JOIN movies_categories
        ON movies_categories.id_category = :id_categories
        WHERE movies.id_movie = movies_categories.id_movie
        ");

    foreach ($tab['data'] as $key => $value) {
        $movieCategoriesStatement -> execute([
            'id_categories' => $value['id_categorie'],
        ]);
        $movieCategories = $movieCategoriesStatement -> fetchAll(PDO::FETCH_ASSOC);

        if ($movieCategories) {
            foreach ($movieCategories as $value2) {
                $tab['data'][$key]["movies"][] = [
                    "id_movie" => $value2['id_movie'],
                    "name" => $value2['name'],
                    "description" => $value2['description'],
                    "releaseYear" => $value2['releaseYear'],
                    "author" => $value2['author'],
                    "likes" => $value2['likes'],
                    "dislikes" => $value2['dislikes'],
                    "img" => $value2['img'],
                    "video" => $value2['video'],
                ];
            }
        } else {
            $tab['data'][$key]["movies"] = [];
        }
    }

    if (isset($_GET['id'])) {
        foreach ($tab['data'] as $key => $value) {
            if ($_GET["id"] == $value['id_categorie']) {
                echo json_encode($value);

                $bool = true;
                break;
            } else {
                $bool = false;
            }
        }

        if ($bool === false) {
            echo json_encode(["Aucune catégorie trouvé"]);
        }
    } else {
        echo json_encode($tab);
    }
?>