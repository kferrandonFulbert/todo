<?php
// connexion à la BDD.
try {
    $db = new PDO('mysql:host=localhost;dbname=todo',
            "root", "",  array (1002 => 'SET NAMES utf8' ));
    /* Exemple serveur bdd externe
    $db = new PDO('mysql:host=172.16.100.100;dbname=TODO',
            "TODO", "todo",  array (1002 => 'SET NAMES utf8' ));*/
    // set the PDO error mode to exception
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    // on affiche un message d'erreur si on arrive pas à se connecter
    print "Erreur !: " . $e->getMessage() . "<br/>";
    die();
}
?>
