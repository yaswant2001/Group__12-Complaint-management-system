<?php
include 'db_config.php';

header('Access-Control-Allow-Origin: http://localhost:3000'); // Adjust as needed for your environment
header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');
header('Content-Type: application/json');

$pdo = getDB();
$department = isset($_GET['department']) ? $_GET['department'] : null;
$status = 'assigned';

if (!empty($department)) {
    $stmt = $pdo->prepare("SELECT * FROM complaints WHERE department = ? AND status = ?");
    $stmt->execute([$department, $status]);
} else {
    $stmt = $pdo->prepare("SELECT * FROM complaints WHERE status = ? OR status = 'reraised'");
    $stmt->execute([$status]);
}

$complaints = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($complaints);
