<?php
/** 
 * Session_start doit se trouver sur toutes les pages qui ont besoin de
 * la super globale $_SESSION[''];
 */
session_start();
require_once 'connexion.php';

if (isset($_POST['mail']) && isset($_POST['password'])) {

    $username = htmlspecialchars($_POST['mail']);
    $password = htmlspecialchars($_POST['password']);

    // si le user et mdp est renseigné
    if ($username !== "" && $password !== "") {
        // le quote place des guillemets simples autour d'une chaîne d'entrée
        // cela ne sécurise pas des attaques, il faut utiliser le bindParam
        $requete = "SELECT id, nom,  mail, mdp from salarie where mail=:mail" ;
          $sth = $db->prepare($requete);
          $sth->bindParam(':mail', $username, PDO::PARAM_STR, 255);
          $sth->execute();
          // retourn un dictionnaire (tableau associatif clef => valeur)
          $res = $sth->fetch(PDO::FETCH_ASSOC);
       // $res = $db->query($requete);
     
            $mdp = $res['mdp'];
            $name = $res['nom'];
            $role = "admin";
            $id = $res['id'];
        
      //  Vérifie que le hachage récupéré de la BDD correspond bien au mot de passe saisi par l'utilisateur.
        if (password_verify($password, $mdp)) {
            session_regenerate_id();
            $_SESSION['username'] = $name;
            $_SESSION['role'] = "admin";
            $_SESSION['idUser'] = $id;   
               
            /**
             * Todo gérer les messages flash
             */
            if ($role == 'admin') {
                header('Location: ./admin/');
            } else {
                header('Location: ./');
            }
        } else {
            header('Location: ./login.php'); // utilisateur ou mot de passe incorrect
        }
    } else {
        header('Location: ./login.php'); // utilisateur ou mot de passe vide
    }
} else {
    //  header('Location: login.php');
    header('Location: ./login.php'); //formulaire non renseigne
}
?>