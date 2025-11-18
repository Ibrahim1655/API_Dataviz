<?php

class UserManager {
    
    private $pdo;

    public function __construct()
    {
        try {
            $this->pdo = new PDO('mysql:host=localhost;dbname=sushi_crousty;charset=utf8', 'root', '');
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            die('Erreur de connexion : ' . $e->getMessage());
        }
    }

    
      //Crée un nouvel utilisateur en base de données

    public function createUser($firstname, $lastname, $email, $password)
    {
        $passwordHash = password_hash($password, PASSWORD_DEFAULT);
        // Génération d'un token API unique
        $apiToken = bin2hex(random_bytes(32));

        $sql = "INSERT INTO users (firstname, lastname, email, password, api_token, created_at)
                VALUES (:firstname, :lastname, :email, :password, :api_token, NOW())";

        $query = $this->pdo->prepare($sql);

        $query->execute([
            ':firstname'    => $firstname,
            ':lastname'     => $lastname,
            ':email'        => $email,
            ':password'     => $passwordHash,
            ':api_token'    => $apiToken
        ]);

        return [
            'id' => $this->pdo->lastInsertId(),
            'api_token' => $apiToken
        ];
    }

    //Récupère un utilisateur par son email
    public function getUserByEmail($email)
    {
        $sql = "SELECT * FROM users WHERE email = :email";
        $query = $this->pdo->prepare($sql);
        $query->execute([':email' => $email]);
        
        return $query->fetch(PDO::FETCH_ASSOC);
    }

    //Met à jour le token API d'un utilisateur
    public function updateToken($userId, $token)
    {
        $sql = "UPDATE users SET api_token = :token WHERE id = :id";
        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':token' => $token,
            ':id' => $userId
        ]);
    }
}

?>

