<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Panel</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .card-container {
        	margin-left: 100px;
        	margin-right: 100px;
            display: flex;
            justify-content: space-between;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .card {
            flex: 1;
            text-align: center;
            padding: 15px;
            margin: 10px 10px;
            background-color: #f0f0f0;
            border: 1px solid #ddd;
            border-radius: 10px;
            text-decoration: none;
            color: #333;
            transition: background-color 0.3s;
        }

        .card img {
            width: 250px;
            height: 250px;
            border-radius: 15%;
            margin-bottom: 10px;
        }

        .card:hover {
            background-color: #e0e0e0;
        }

        h1 {
            text-align: center;
            color: #333;
            padding-top: 20px;
        }

        .logout-form {
            text-align: center;
            padding: 20px;
        }

        .logout-form button {
            padding: 10px 20px;
            background-color: #e74c3c;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .logout-form button:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
    <h1>Admin Panel</h1>

    <div class="card-container">
    <a href="list">
        <div class="card">
            <img src="Images/orderList.webp" alt="Product Management Icon">
            <br>
            Product Management
        </div></a>

		<a href="orderlist">
        <div class="card">
            <img src="Images/productManage.webp" alt="Order List Icon">
            <br>
            Order List
        </div>
        </a>

		
    </div>

    <div class="logout-form">
        <form action="${pageContext.request.contextPath}/logout" method="post">
            <button type="submit">Logout</button>
        </form>
    </div>
</body>
</html>
