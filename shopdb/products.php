<?php
header("Content-Type: application/json");
require "db.php"; // ไฟล์เชื่อมต่อฐานข้อมูล (ต้องมีตัวแปร $conn)

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
            $products = $result->fetch_all(MYSQLI_ASSOC);
            echo json_encode($products);
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"), true);

        if (!isset($data['name'], $data['price'])) {
            http_response_code(400);
            echo json_encode(["error" => "Missing required fields (name, price)"]);
            exit;
        }

        $stmt = $conn->prepare("
            INSERT INTO products (name, price, description, category, image)
            VALUES (?, ?, ?, ?, ?)
        ");
        $stmt->bind_param(
            "sdsss",
            $data['name'],
            $data['price'],
            $data['description'] ?? '',
            $data['category'] ?? '',
            $data['image'] ?? ''
        );

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

        $stmt = $conn->prepare("
            UPDATE products
            SET name = ?, price = ?, description = ?, category = ?, image = ?
            WHERE id = ?
        ");
        $stmt->bind_param(
            "sdsssi",
            $data['name'],
            $data['price'],
            $data['description'],
            $data['category'],
            $data['image'],
            $id
        );

        if ($stmt->execute()) {
            echo json_encode(["message" => "Updated", "affected" => $stmt->affected_rows]);
        } else {
            http_response_code(500);
            echo json_encode(["error" => "Failed to update"]);
        }
        break;

    case 'DELETE':
        // ลบสินค้า
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
