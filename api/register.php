<?php
include 'db_config.php';

header('Access-Control-Allow-Origin: http://localhost:3000'); // Adjust this if your React app is hosted elsewhere
header('Access-Control-Allow-Credentials: true');
header('Access-Control-Allow-Headers: Content-Type');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    exit; 
}

$data = json_decode(file_get_contents("php://input"));

if (isset($data->email) && isset($data->password) && isset($data->role)) {
    $email = filter_var($data->email, FILTER_SANITIZE_EMAIL);
    $password = password_hash($data->password, PASSWORD_DEFAULT);
    $role = $data->role;

    $pdo = getDB();
    $stmt = $pdo->prepare("INSERT INTO users (email, password, role) VALUES (?, ?, ?)");
    
    try {
        $stmt->execute([$email, $password, $role]);
        echo json_encode(['success' => true, 'message' => 'User registered successfully']);
    } catch (PDOException $e) {
        echo json_encode(['success' => false, 'message' => 'Registration failed: ' . $e->getMessage()]);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Required fields are missing']);
}
?>
