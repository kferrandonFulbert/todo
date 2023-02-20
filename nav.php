<div class="topnav" id="myTopnav">
  <a href="../" class="active">Accueil</a>
  <?php if(isset($_SESSION['username'])){
?>
<a href="../disconnect.php">Se déconnecter</a>
<?php
  }else{
?>
  <a href="./login.php">Se connecter</a>
  <?php
  }
  ?>
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
</div>