<?php 
    $movieStatement = $mysqlClient -> prepare("SELECT * FROM movies");
    $movieStatement -> execute();
    $movies = $movieStatement -> fetchAll(PDO::FETCH_ASSOC);

    $categoryStatement = $mysqlClient -> prepare("SELECT * FROM categories");
    $categoryStatement -> execute();
    $categories = $categoryStatement -> fetchAll(PDO::FETCH_ASSOC);
?>