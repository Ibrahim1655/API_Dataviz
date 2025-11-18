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

// Debug : vérifier que les données sont bien reçues
if ($data === null && json_last_error() !== JSON_ERROR_NONE) {
    http_response_code(400);
    echo json_encode([
        'error' => 'Format JSON invalide',
        'message' => 'Le corps de la requête doit être au format JSON valide'
    ]);
    exit();
}

// Vérifier la présence des champs email et password
if (!isset($data['email']) || empty($data['email']) || !isset($data['password']) || empty($data['password'])) {
    http_response_code(400);
    echo json_encode([
        'error' => 'Champs manquants',
        'message' => 'Les champs email et password sont requis pour la connexion'
    ]);
    exit();
}

try {
    $userManager = new UserManager();
    
    // Chercher un utilisateur avec cet email
    $user = $userManager->getUserByEmail($data['email']);
    
    // Si l'utilisateur n'existe pas ou que le mot de passe est incorrect
    if (!$user || !password_verify($data['password'], $user['password'])) {
        http_response_code(401);
        echo json_encode([
            'error' => 'Identifiants invalides',
            'message' => 'Invalid email or password'
        ]);
        exit();
    }
    
    // Si le mot de passe est bon, créer un nouveau token
    $token = bin2hex(random_bytes(32));
    
    // Mettre à jour le token en base
    $userManager->updateToken($user['id'], $token);
    
    // Renvoyer un message de succès avec le token
    http_response_code(200);
    echo json_encode([
        'success' => true,
        'message' => 'Connexion réussie',
        'token' => $token,
        'user' => [
            'id' => $user['id'],
            'firstname' => $user['firstname'],
            'lastname' => $user['lastname'],
            'email' => $user['email']
        ]
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        'error' => 'Une erreur est survenue',
        'message' => $e->getMessage()
    ]);
}
?>

