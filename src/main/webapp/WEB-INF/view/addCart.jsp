<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Shopping Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .cart-container {
            max-width: 800px;
            margin: auto;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 20px;
        }

        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }

        .quantity-control {
            background-color: #ddd;
            border: none;
            padding: 5px;
            cursor: pointer;
            margin: 0 5px;
        }

        .remove-button {
            background-color: #e74c3c;
            color: white;
            border-radius: 5px;
            padding: 5px 10px;
            border: none;
            cursor: pointer;
        }
        button{
        	
        }
    </style>
</head>
<body>
    <h1>Shopping Cart</h1>

    <div class="cart-container">
        <c:forEach var="item" items="${cart.items}">
            <div class="cart-item">
                <div>
                    <span style="font-size: 18px; color: #555;">${item.product.name}</span>
                </div>
                <div>
                    
                    <form method="post" action="/cart">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="product_id" value="${item.product.id}">

                        <button>
                            class="quantity-control"
                            type="submit"
                            name="quantity"
                            value="${item.quantity - 1}"
                            
                        >-</button>

                        <input type="number" name="quantity" min="1" value="${item.quantity}" readonly style="width: 50px; text-align: center;">
                        
                        <button
                            class="quantity-control"
                            type="submit"
                            name="quantity"
                            value="${item.quantity + 1}"
                        >+</button>
                    </form>

                    <!-- Form to remove the item from the cart -->
                    <form method="post" action="/cart">
                        <input type="hidden" name="action" value="remove">
                        <input type="hidden" name="product_id" value="${item.product.id}">
                        <button class="remove-button" type="submit">Remove</button>
                    </form>
                </div>
            </div>
        </c:forEach>

        
        <div style="display: flex; justify-content: space-between; align-items: center;">
            <span style="font-size: 20px; color: #333;">Total:</span>
            <span style="font-size: 20px; color: #333;">NPR ${cart.getTotalPrice()}</span>
        </div>
    </div>
</body>
</html>
