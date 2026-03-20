<?php 
    function ifnotlogged() {
        if (!isset($_SESSION['LOGGED_USER'])) {
            header('location: login.php');    
            return;
        }
    }

    function verify_password() {
        $regex = '/^(?=.*[0-9])(?=.*[A-Z])(?=.*[?!_.\/])/s';

        if (strlen($_POST['password']) < 8) {
            $_SESSION['ERRORLOGUP'] = "Le mot de passe doit contenir au moins 8 caractères !";
            header('location: ../logup.php');
            return;
        }

        if (!preg_match($regex, $_POST['password'])) {
            $_SESSION['ERRORLOGUP'] = "Le mot de passe ne remplis pas toute les conditions !";
            header('location: ../logup.php');
            return;
        }
    }
?>