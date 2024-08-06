<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Search</title>
    <link rel="Stylesheet" href="${pageContext.request.contextPath}/css/styles.css"> 
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #153651;
            color: white;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        form {
            display: flex;
            justify-content: center;
            margin: 20px;
        }

        input[type="text"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            width: 250px;
            margin-right: 10px;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus {
            border-color: #4CAF50;
            box-shadow: 0 0 8px rgba(76, 175, 80, 0.5);
        }

        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #45a049;
        }

        .product-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }

        .product {
            border: none;
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            width: 300px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .product:hover {
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
            transform: translateY(-5px);
        }

        .product-image {
            text-align: center;
            margin-bottom: 15px;
        }

        .product-specs {
            text-align: left;
        }

        .product-details {
            text-align: center;
        }

        .add-to-cart {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .add-to-cart:hover {
            background-color: #45a049;
        }

        .no-products {
            font-size: 1.1em;
            color: #999;
            text-align: center;
            padding: 20px;
        }
    </style>
</head>
<body>
    <header>
        <h1>Product Search</h1>
    </header>
    
    <form method="get" action="search">
        <label for="search">Enter product name:</label>
        <input type="text" id="search" name="productName" required>
        <button type="submit">Search</button>
    </form>

    <div class="product-container">
        <c:if test="${not empty products}">
            <c:forEach var="product" items="${products}">
                <div class="product">
                    <div class="product-image">
                        <c:set var="image" value="${Base64.getEncoder().encodeToString(product.imageUrlFromPart)}"/>
                        <img src="data:image/jpeg;base64,${image}" alt="${product.name}">
                    </div>
                    <div class="product-specs">
                        <h2>Specifications:</h2>
                        <p><span>Processor:</span> ${product.processor}</p>
                        <p><span>RAM:</span> ${product.ram}</p>
                        <p><span>Storage:</span> ${product.storage}</p>
                        <p><span>Display:</span> ${product.display}</p>
                        <p><span>Graphics:</span> ${product.graphic}</p>
                    </div>
                    <div class="product-details">
                        <h3>${product.name}</h3>
                        <p>Price: ${product.price}</p>
                        <button class="add-to-cart">Add to Cart <i class="fas fa-shopping-cart"></i></button>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${empty products}">
            <p class="no-products">No products found.</p>
        </c:if>
    </div>
</body>
</html>
