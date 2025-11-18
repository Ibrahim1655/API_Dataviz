<?php
// Définir TOUS les headers EN PREMIER
// Pour éviter une erreur CORS
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

// Inclure le UserManager
require "../../Manager/UserManager.php";

// Récupérer les données JSON envoyées
$content = file_get_contents('php://input');
$data = json_decode($content, true);

// Vérifier la présence des champs et s'ils ne sont pas vides
$requiredFields = ['firstname', 'lastname', 'email', 'password'];
$missingFields = [];

foreach ($requiredFields as $field) {
    if (!isset($data[$field]) || empty($data[$field])) {
        $missingFields[] = $field;
    }
}

// Si des champs sont manquants ou vides, renvoyer une erreur 400
if (!empty($missingFields)) {
    http_response_code(400);
    echo json_encode([
        'error' => 'Champs manquants ou vides',
        'message' => 'Les champs suivants sont requis : ' . implode(', ', $missingFields)
    ]);
    exit();
}

try {
    $userManager = new UserManager();
    $result = $userManager->createUser(
        $data['firstname'],
        $data['lastname'],
        $data['email'],
        $data['password']
    );

    http_response_code(201);
    echo json_encode([
        'response' => 'user created',
        'success' => true,
        'user_id' => $result['id']
    ]);

} catch (PDOException $e) {
    // Vérifier si c'est une erreur de contrainte unique (email déjà existant)
    if ($e->getCode() == 23000) {
        http_response_code(409);
        echo json_encode([
            'error' => 'Email déjà utilisé',
            'message' => 'Cet email est déjà enregistré'
        ]);
    } else {
        http_response_code(500);
        echo json_encode([
            'error' => 'Erreur lors de la création de l\'utilisateur',
            'message' => $e->getMessage()
        ]);
    }
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        'error' => 'Une erreur est survenue',
        'message' => $e->getMessage()
    ]);
}
?>