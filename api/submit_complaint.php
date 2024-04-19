<?php
include 'db_config.php';

header('Access-Control-Allow-Origin: http://localhost:3000'); 
header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $title = $_POST['title'];
    $description = $_POST['description'];
    $status = 'submitted';
    $userId = $_POST['userId']; 
    $department = '';
    $priority = '';
    $comment = '';
    $feedback = '';

    // Handle file upload
    if (isset($_FILES['file']) && $_FILES['file']['error'] == 0) {
        $allowed = ['jpg', 'jpeg', 'png']; // allowed file types
        $ext = pathinfo($_FILES['file']['name'], PATHINFO_EXTENSION);

        if (in_array(strtolower($ext), $allowed)) {
            $filePath = 'uploads/' . uniqid() . '.' . $ext;
            move_uploaded_file($_FILES['file']['tmp_name'], $filePath);
        } else {
            echo json_encode(['success' => false, 'message' => 'Invalid file type']);
            exit;
        }
    } else {
        $filePath = '';
    }

    $pdo = getDB();
    $stmt = $pdo->prepare("INSERT INTO complaints (title, description, file_path, status,user_id,department, priority, comment, feedback) VALUES (?, ?, ?,?,?, ?, ?, ?, ?)");
    if ($stmt->execute([$title, $description, $filePath, $status,$userId,$department, $priority, $comment, $feedback])) {
        echo json_encode(['success' => true, 'message' => 'Complaint registered successfully']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Failed to register complaint']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid request method']);
}
?>
