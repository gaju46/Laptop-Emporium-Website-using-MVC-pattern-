<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin Panel - Add Laptop</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
    
    <style>
        
        body {
            background-color: #f5f5f5;
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .form-control {
            border-radius: 8px;
            transition: box-shadow 0.3s ease;
        }

        .form-control:hover {
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
        }

        .submit-button {
            display: block;
            margin: 20px auto;
            padding: 10px 25px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-button:hover {
            background-color: #218838;
        }

        .stock-adjust {
            display: flex; 
            justify-content: flex-start;
            align-items: center;
            gap: 10px;
        }

        .adjust-button {
            background-color: #d1d1d1;
            border: none;
            border-radius: 5px;
            font-size: 1.5em;
            cursor: pointer;
        }

        .adjust-button:hover {
            background-color: #a1a1a1;
        }
        .navigation a{
        	margin-left: 30px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add a New Laptop</h2>
        <form action="${pageContext.request.contextPath}/manage" method="post" enctype="multipart/form-data" id="addProduct">
            <!-- Laptop Name -->
            <div class="form-group">
                <label class="form-label" for="name">Laptop Name:</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>

            <!-- Category -->
            <div class="form-group">
                <label class="form-label" for="category">Category:</label>
                <select id="category" name="category" class="form-control" required>
                    <option value="hp">HP</option>
                    <option value="acer">Acer</option>
                    <option value="msi">MSI</option>
                    <option value="apple">Apple</option>
                    <option value="asus">Asus</option>
                    <option value="samsung">Samsung</option>
                </select>
            </div>

            <!-- Price -->
            <div class="form-group">
                <label class="form-label" for="price">Price:</label>
                <input type="text" id="price" name="price" class="form-control" required>
            </div>

            <!-- Processor -->
            <div class="form-group">
                <label class="form-label" for="processor">Processor:</label>
                <select id="processor" name="processor" class="form-control" required>
                    <option value="intel-i3">Intel i3</option>
                    <option value="intel-i5">Intel i5</option>
                    <option value="intel-i7">Intel i7</option>
                    <option value="amd-ryzen3">AMD Ryzen 3</option>
                    <option value="amd-ryzen5">AMD Ryzen 5</option>
                    <option value="amd-ryzen7">AMD Ryzen 7</option>
                </select>
            </div>

            <!-- RAM -->
            <div class="form-group">
                <label class="form-label" for="ram">RAM:</label>
                <select id="ram" name="ram" class="form-control" required>
                    <option value="2gb">2 GB</option>
                    <option value="4gb">4 GB</option>
                    <option value="8gb">8 GB</option>
                    <option value="16gb">16 GB</option>
                    <option value="32gb">32 GB</option>
                </select>
            </div>

            <!-- Storage -->
            <div class="form-group">
                <label class="form-label" for="storage">Storage:</label>
                <select id="storage" name="storage" class="form-control" required>
                    <option value="128gb">128 GB</option>
                    <option value="256gb">256 GB</option>
                    <option value="512gb">512 GB</option>
                    <option value="1tb">1 TB</option>
                    <option value="2tb">2 TB</option>
                </select>
            </div>

            <!-- Stock Adjustment -->
            <div class="form-group stock-adjust">
                <label for="stock">Stock:</label>
                <button type="button" class="adjust-button decrement">−</button>
                <input type="text" id="stock" name="stock" class="form-control" required value="1" style="text-align: center; width: 50px;">
                <button type="button" class="adjust-button increment">+</button>
            </div>

            <!-- Display Size -->
            <div class="form-group">
                <label class="form-label" for="display">Display Size:</label>
                <input type="text" id="display" name="display" class="form-control" required>
            </div>

            <!-- Graphics Card -->
            <div class="form-group">
                <label class="form-label" for="graphics">Graphics Card:</label>
                <input type="text" id="graphics" name="graphic" class="form-control" required>
            </div>

            <!-- Image Upload -->
            <div class="form-group">
                <label class="form-label" for="image">Upload Image:</label>
                <input type="file" id="image" name="image" accept="image/*" class="form-control" required>
            </div>
            
            

            <!-- Submit Button -->
            <button type="submit" class="submit-button">Add Product</button>
            
            <div class="navigation">
		        <a href=manager> Go Back</a>
		        <a href=list>List</a>
		    </div>
        </form>
    </div>


    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const stockInput = document.getElementById("stock");

            const incrementButtons = document.querySelectorAll(".adjust-button.increment");
            const decrementButtons = document.querySelectorAll(".adjust-button.decrement");

            incrementButtons.forEach((button) => {
                button.addEventListener("click", function() {
                    let currentValue = parseInt(stockInput.value, 10);
                    stockInput.value = currentValue + 1;
                });
            });

            decrementButtons.forEach((button) => {
                button.addEventListener("click", function() {
                    let currentValue = parseInt(stockInput.value, 10);
                    if (currentValue > 0) {
                        stockInput.value = currentValue - 1;
                    }
                });
            });
        });
    </script>
</body>
</html>
