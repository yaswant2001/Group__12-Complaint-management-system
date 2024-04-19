<?php
include 'db_config.php';

header('Access-Control-Allow-Origin: http://localhost:3000'); // Adjust as needed for your environment
header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');
header('Content-Type: application/json');

$pdo = getDB();
$stmt = $pdo->query("SELECT * FROM complaints");
$complaints = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($complaints);
