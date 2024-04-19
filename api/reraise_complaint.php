<?php
include 'db_config.php'; 

header('Access-Control-Allow-Origin: http://localhost:3000'); 
header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    exit(0);
}

$data = json_decode(file_get_contents("php://input"));
$complaintId = $data->complaintId ?? '';

if (empty($complaintId)) {
    echo json_encode(['success' => false, 'message' => 'Missing complaint ID']);
    exit;
}

$pdo = getDB();
$stmt = $pdo->prepare("UPDATE complaints SET status = 'reraised' WHERE id = ?");

if ($stmt->execute([$complaintId])) {
    echo json_encode(['success' => true, 'message' => 'Complaint status updated to reraised']);
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to update complaint status']);
}
?>
