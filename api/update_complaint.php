<?php
include 'db_config.php';

header('Access-Control-Allow-Origin: http://localhost:3000'); // Adjust as needed for your environment
header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');
header('Content-Type: application/json');

$complaintId = $_POST['complaintId'];
$department = $_POST['department'] ?? null; 
$priority = $_POST['priority'] ?? null;

$pdo = getDB();

if ($department !== null) {
    $stmt = $pdo->prepare("UPDATE complaints SET department = ? , status = 'assigned' WHERE id = ?");
    $success = $stmt->execute([$department, $complaintId]);
}

if ($priority !== null) {
    $stmt = $pdo->prepare("UPDATE complaints SET priority = ? WHERE id = ?");
    $success = $stmt->execute([$priority, $complaintId]);
}

if ($success) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false]);
}
?>
