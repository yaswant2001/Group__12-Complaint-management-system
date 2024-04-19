<?php
include 'db_config.php'; // Ensure this path correctly points to your database configuration file

header('Access-Control-Allow-Origin: http://localhost:3000'); // Adjust as needed for your environment
header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    exit(0); // Handle CORS preflight
}

$data = json_decode(file_get_contents("php://input"));
$complaintId = $data->complaintId ?? '';
$feedback = $data->feedback ?? '';

if (empty($complaintId) || empty($feedback)) {
    echo json_encode(['success' => false, 'message' => 'Missing data']);
    exit;
}

$pdo = getDB();
$stmt = $pdo->prepare("UPDATE complaints SET feedback = CONCAT(feedback, ?) WHERE id = ?");
$feedbackToStore = "\n" . $feedback; // Append new feedback on a new line

if ($stmt->execute([$feedbackToStore, $complaintId])) {
    echo json_encode(['success' => true, 'message' => 'Feedback submitted successfully']);
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to submit feedback']);
}
?>
