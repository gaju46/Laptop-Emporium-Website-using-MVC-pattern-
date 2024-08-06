<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="service.ProductDao"%>


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
    </style>
</head>
<body>
    <div class="container">
        <h2>Add a New Laptop</h2>
        <form action="${pageContext.request.contextPath}/update" method="post" enctype="multipart/form-data" id="updateProduct">
            <!-- Laptop Name -->
            <div class="form-group">
                <label class="form-label" for="name">Laptop Name:</label>
                <input type="text" id="name" value="${product.name }" name="name" class="form-control" required>
            </div>

            <!-- Category -->
            <div class="form-group">
                <label class="form-label" for="category">Category:</label>
                <select id="category" name="category" class="form-control" required>
                    <option value="hp" <c:if test="${product.category eq 'hp'}">selected</c:if>>HP</option>
                    <option value="acer" <c:if test="${product.category eq 'acer'}">selected</c:if>>Acer</option>
                    <option value="msi" <c:if test="${product.category eq 'msi'}">selected</c:if>>MSI</option>
                    <option value="apple" <c:if test="${product.category eq 'apple'}">selected</c:if>>Apple</option>
                    <option value="asus" <c:if test="${product.category eq 'asus'}">selected</c:if>>Asus</option>
                    <option value="samsung" <c:if test="${product.category eq 'samsung'}">selected</c:if>>Samsung</option>
                </select>
            </div>

            <!-- Price -->
            <div class="form-group">
                <label class="form-label" for="price">Price:</label>
                <input type="text" id="price" value="${product.price}" name="price" class="form-control" required>
            </div>

            <!-- Processor -->
            <div class="form-group">
                <label class="form-label" for="processor">Processor:</label>
                <select id="processor" name="processor" class="form-control" required>
                    <option value="intel-i3" <c:if test="${product.processor eq 'intel-i3'}">selected</c:if>>Intel i3</option>
                    <option value="intel-i5" <c:if test="${product.processor eq 'intel-i5'}">selected</c:if>>Intel i5</option>
                    <option value="intel-i7" <c:if test="${product.processor eq 'intel-i7'}">selected</c:if>>Intel i7</option>
                    <option value="amd-ryzen3" <c:if test="${product.processor eq 'amd-ryzen3'}">selected</c:if>>AMD Ryzen 3</option>
                    <option value="amd-ryzen5" <c:if test="${product.processor eq 'amd-ryzen5'}">selected</c:if>>AMD Ryzen 5</option>
                    <option value="amd-ryzen7" <c:if test="${product.processor eq 'amd-ryzen7'}">selected</c:if>>AMD Ryzen 7</option>
                </select>
            </div>

            <!-- RAM -->
            <div class="form-group">
                <label class="form-label" for="ram">RAM:</label>
                <select id="ram" name="ram" class="form-control" required>
                    <option value="2gb" <c:if test="${product.ram eq '2gb'}">selected</c:if>>2 GB</option>
                    <option value="4gb" <c:if test="${product.ram eq '4gb'}">selected</c:if>>4 GB</option>
                    <option value="8gb" <c:if test="${product.ram eq '8gb'}">selected</c:if>>8 GB</option>
                    <option value="16gb" <c:if test="${product.ram eq '16gb'}">selected</c:if>>16 GB</option>
                    <option value="32gb" <c:if test="${product.ram eq '32gb'}">selected</c:if>>32 GB</option>
                </select>
            </div>
            

            <!-- Storage -->
            <div class="form-group">
                <label class="form-label" for="storage">Storage:</label>
                <select id="storage" name="storage" class="form-control" required>
                    <option value="128gb" <c:if test="${product.storage eq '128gb'}">selected</c:if>>128 GB</option>
                    <option value="256gb" <c:if test="${product.storage eq '256gb'}">selected</c:if>>256 GB</option>
                    <option value="512gb" <c:if test="${product.storage eq '512gb'}">selected</c:if>>512 GB</option>
                    <option value="1tb" <c:if test="${product.storage eq '1tb'}">selected</c:if>>1 TB</option>
                    <option value="2tb" <c:if test="${product.storage eq '2tb'}">selected</c:if>>2 TB</option>
                </select>
            </div>

            <!-- Stock Adjustment -->
            <div class="form-group stock-adjust">
                <label for="stock">Stock:</label>
                <button type="button" class="adjust-button decrement">-</button>
                <input type="text" id="stock" name="stock" class="form-control" required value="${product.stock}" style="text-align: center; width: 50px;">
                <button type="button" class="adjust-button increment">+</button>
            </div>

            <!-- Display Size -->
            <div class="form-group">
                <label class="form-label" for="display">Display Size:</label>
                <input type="text" id="display" name="display" class="form-control" required value="${product.display}">
            </div>

            <!-- Graphics Card -->
            <div class="form-group">
                <label class="form-label" for="graphics">Graphics Card:</label>
                <input type="text" id="graphics" name="graphic" class="form-control" required value="${product.graphic}">
            </div>

            <!-- Image Upload -->
            <div class="form-group">
                <label class="form-label" for="image">Upload Image:</label>
                <input type="file" id="image" name="image" accept="image/*" class="form-control">
            </div>
            
            <!-- Submit Button -->
            <button type="submit" class="submit-button" name="submit">Update</button>
            
            <div class="navigation">
		        <a href=home> Go Back</a>
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
