<?php
/**
 * Une fois la connexion effectuer par l'utilisateur
 * on va donner verifier qu'il ait bien accès à la page ajouter
 * (dans notre cas s'il est admin) 
 * ainsi si un utilisateur ajoute dans l'url index.php?page=ajouter
 * sans s'être authentifié il sera redirigé vers la page de login
 * Attention le session_start doit être appelé sur toutes les pages pour 
 * pouvoir utiliser les variables de session.
 */
session_start();
if (isset($_SESSION['role'])) {
    if ($_SESSION["role"] == "admin") {
        include "dashboard.php";
    }else{
        header('HTTP/1.0 403 Forbidden');
    }
}else{
    header('HTTP/1.0 403 Forbidden');
}