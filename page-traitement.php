<?php 
$mars = "Mars";
$pluton = "Pluton";
$terre = "Terre";
$planetes = [$mars, $pluton, $terre];
var_dump($planetes);
/* array(3) { [0]=> string(4) "Mars" [1]=> string(6)
     "Pluton" [2]=> string(5) "Terre" }
*/

  /*  if(isset($_POST['nom'])){
        //page-traitement.php
        // on récupère le champ à l'aide de la fonction PHP filter_input
        // Le 1er argument et la méthode de récupération (POST dans notre cas)
        // suivi du nom puis du type de filtre à utiliser.
        // @return valeur ou false plus d'info => 
        // https://www.php.net/manual/en/function.filter-input.php
        // https://www.php.net/manual/en/filter.filters.sanitize.php
        $nom = filter_input(INPUT_POST,'nom',FILTER_SANITIZE_SPECIAL_CHARS);
        var_dump($nom);
        // suite du traitement
    }*/
?>
<!-- formulaire.php -->
<form action="/page-traitement.php" method="post">
    <input type="text" name="nom">
    <button type="submit">Valider</button>
</form>