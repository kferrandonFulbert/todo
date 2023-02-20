<?php
// appel au fichier de connexion à la base de données. 
require "connexion.php";
try {
  // on récupère la liste des projets et des clients associés
    $req = "SELECT client.nom as cli, projet.* from projet
    inner join client on projet.client_id = client.id
    ";
    $jeu_enregistrement = $db->query($req);

} catch (PDOException $e) {
    print "Erreur !: " . $e->getMessage() . "<br/>";
    die();
}
?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Task Project</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="./assets/css/style.css" rel="stylesheet">
  </head>
  <body>
<?php include 'nav.php'; ?>
    <h1>Todo</h1>
    <div class="row">
        <?php 
        // on affiche les projets et ses infos
        foreach($jeu_enregistrement as $row){ ?>
            <div class="col-3">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">
                        <?= 'Projet de '.$row['cli']; ?>
                    </h5>
                    <p class="card-text"><?= $row['nom']?></p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>
        </div>
      <?php  } ?>    
    </div>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
  </body>
</html>
