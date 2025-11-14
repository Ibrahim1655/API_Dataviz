<?php
// Définir TOUS les headers EN PREMIER
// Pour eviter une erreur CORS
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    header("Access-Control-Allow-Origin: http://localhost:4200");
    header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
    header("Access-Control-Allow-Headers: Content-Type, Authorization");
    header("Access-Control-Max-Age: 3600");
    http_response_code(200);
    exit();
}

header("Access-Control-Allow-Origin: http://localhost:4200");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Content-Type: application/json; charset=UTF-8");

// 2. Exécuter la logique et les 'require' APRÈS
require "../../Manager/BoxManager.php";

// Gestion des erreurs
try {
    if(isset($_GET['id'])){
        $boxManager = new BoxManager();
        $boxes = $boxManager->findById($_GET['id']);
    } else {
        $boxManager = new BoxManager();
        $boxes = $boxManager->findAll();
    }
    
    // 3. Envoyer la réponse JSON en DERNIER
    echo json_encode($boxes);

} catch (Exception $e) {
    // Si la BDD ou le Manager plante, on envoie une erreur propre
    http_response_code(500); // Erreur serveur
    echo json_encode([
        'error' => 'Une erreur est survenue sur le serveur.',
        'message' => $e->getMessage() 
    ]);
}
?>