<?php

header('Access-Control-Allow-Origin: http://localhost:3000'); // Adjust this if your React app is hosted elsewhere
header('Access-Control-Allow-Credentials: true');
header('Access-Control-Allow-Headers: Content-Type');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');

include 'db_config.php'; 

$pdo = getDB(); 
$data = json_decode(file_get_contents("php://input"), true);
$complaintId = $data['complaintId'] ?? '';
$comments = $data['comments'] ?? '';
$status = $data['status'] ?? '';


if (empty($complaintId) || empty($status)) {
    echo json_encode(['success' => false, 'message' => 'Missing required fields']);
    exit;
}


try {
    $stmt = $pdo->prepare("UPDATE complaints SET status = ?, comment = ? WHERE id = ?");
    $stmt->execute([$status, $comments, $complaintId]);
    echo json_encode(['success' => true, 'message' => 'Complaint updated successfully']);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => 'Database error: ' . $e->getMessage()]);
}
?>