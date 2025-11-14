<?php
// Connexion à la base de données avec PDO
$host = 'localhost';
$dbname = 'sushi_crousty';
$username = 'root';
$password = ''; // à modifier selon votre configuration

$pdo = new PDO ('mysql:host=localhost;dbname=sushi_crousty',$username,$password);
$boxes = $pdo->query("select * from boxes")->fetchAll(PDO::FETCH_ASSOC);

?>