<?php
header("Content-Type: application/json");
require "db.php";

$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    case 'GET':
        if (isset($_GET['id'])) {
            $id = intval($_GET['id']);
            $stmt = $conn->prepare("SELECT * FROM products WHERE id = ?");
            $stmt->bind_param("i", $id);
            $stmt->execute();
            $result = $stmt->get_result();
            $product = $result->fetch_assoc();
            if ($product) {
                echo json_encode($product);
            } else {
                http_response_code(404);
                echo json_encode(["error" => "Product not found"]);
            }
        } else {
            $result = $conn->query("SELECT * FROM products");
            echo json_encode($result->fetch_all(MYSQLI_ASSOC));
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"), true);
        if (!isset($data['name'], $data['price'])) {
            http_response_code(400);
            echo json_encode(["error" => "Missing required fields (name, price)"]);
            exit;
        }

        $name = $data['name'];
        $price = $data['price'];
        $description = $data['description'] ?? '';
        $category = $data['category'] ?? '';
        $image_url = $data['image_url'] ?? '';

        $stmt = $conn->prepare("
            INSERT INTO products (name, price, description, category, image_url)
            VALUES (?, ?, ?, ?, ?)
        ");
        $stmt->bind_param("sdsss", $name, $price, $description, $category, $image_url);

        if ($stmt->execute()) {
            http_response_code(201);
            echo json_encode(["message" => "Created", "id" => $stmt->insert_id]);
        } else {
            http_response_code(500);
            echo json_encode(["error" => "Failed to insert product"]);
        }
        break;

    case 'PUT':
        if (!isset($_GET['id'])) {
            http_response_code(400);
            echo json_encode(["error" => "Missing product ID"]);
            exit;
        }

        $id = intval($_GET['id']);
        $data = json_decode(file_get_contents("php://input"), true);

        $name = $data['name'] ?? '';
        $price = $data['price'] ?? 0;
        $description = $data['description'] ?? '';
        $category = $data['category'] ?? '';
        $image_url = $data['image_url'] ?? '';

        $stmt = $conn->prepare("
            UPDATE products
            SET name = ?, price = ?, description = ?, category = ?, image_url = ?
            WHERE id = ?
        ");
        $stmt->bind_param("sdsssi", $name, $price, $description, $category, $image_url, $id);

        if ($stmt->execute()) {
            echo json_encode(["message" => "Updated", "affected" => $stmt->affected_rows]);
        } else {
            http_response_code(500);
            echo json_encode(["error" => "Failed to update"]);
        }
        break;

    case 'DELETE':
        if (!isset($_GET['id'])) {
            http_response_code(400);
            echo json_encode(["error" => "Missing product ID"]);
            exit;
        }

        $id = intval($_GET['id']);
        $stmt = $conn->prepare("DELETE FROM products WHERE id = ?");
        $stmt->bind_param("i", $id);

        if ($stmt->execute()) {
            echo json_encode(["message" => "Deleted", "affected" => $stmt->affected_rows]);
        } else {
            http_response_code(500);
            echo json_encode(["error" => "Failed to delete"]);
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(["error" => "Method Not Allowed"]);
        break;
}

$conn->close();
?>
