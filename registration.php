<?php
include "connexion.php";
/**
 * Hash du mot de passe à l'aide de
 * l'algorythme Bcrypt 
 * @param string password
 * @return string
 */
function passwordToBcrypt(string $password)
{
    $hash = password_hash($password, PASSWORD_BCRYPT);
    return $hash;
}
//https://www.php.net/manual/en/function.filter-input.php
//https://www.php.net/manual/en/filter.filters.sanitize.php
$lastname = filter_input(INPUT_POST,'lastname',FILTER_SANITIZE_SPECIAL_CHARS);
$firstname = filter_input(INPUT_POST,'name', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$taux_horaire = 60;
$mail =filter_input(INPUT_POST,'email', FILTER_SANITIZE_EMAIL) ;

// Si un filtre n'est pas respecté on renvoie vers la page formulaire
if(!$lastname||!$firstname||!$mail){
    header("location: ./register.php");
    // on pourrait envoyer un message d'erreur à la page formulaire
    // à l'aide d'une variable de session par exemple 
    // $_SESSION['erreur'] = "Le formulaire n'est pas valide";
    die;
}
//hashage du mot de passe
$password = passwordToBcrypt($_POST['password']);

try{
$req = "INSERT INTO salarie (nom, prenom, taux_horaire, mail, mdp) 
VALUES (:nom, :prenom, :taux, :mail, :mdp)";
   $sth = $db->prepare($req);
   $sth->bindParam(':nom', $lastname, PDO::PARAM_STR, 50);
   $sth->bindParam(':prenom', $firstname, PDO::PARAM_STR, 50);
   $sth->bindParam(':taux', $taux_horaire, PDO::PARAM_INT);
   $sth->bindParam(':mail', $mail, PDO::PARAM_STR, 255);
   $sth->bindParam(':mdp', $password, PDO::PARAM_STR, 255);
   $sth->execute();
}catch(Exception $e){
    echo $e->getMessage();
    die;
}
// s'il n'y a pas d'erreur je renvoie à la page de login
// pour que les visiteurs puissent s'authentifier
header("location: ./login.php?msg=Enregistrement%20validé");