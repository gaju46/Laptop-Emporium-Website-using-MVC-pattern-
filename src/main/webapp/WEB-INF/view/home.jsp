<%@page import="java.util.Base64"%>
<%@page import="service.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="Description" content="Home Page"/>
    <meta name="Author" content="Jayavir"/>
    <link rel="Stylesheet" href="${pageContext.request.contextPath}/css/styles.css"> <!--linking the css file-->
    <link rel="icon" href="Photos/logo.png">  <!--adding logo in the tab of the webpage-->
    <title>Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>

        .circle img{
        	width: 70px;
        	height: 70px;
        }

    </style>
</head>
<body>
    <div class="nav-container">
        <nav>
            <div class="circle">
            	<a href="home"><img alt="" src="Images/logo.png"></a>
            </div>
            <div class="nav-pages">
                <ul>
                    <li><a href="home">Home</a></li>
                    <li><a href="about">About Us</a></li>
                </ul>
            </div>
            <div  class="search-container">
            <form action=  method="get">
                <input type="text" placeholder="Search..." name="search">
                <input type="submit" value="<i class="fas fa-search"></i>">
                </form>
            </div>
            <div class="user-and-cart">
                <a href="cart"><i class="fas fa-shopping-cart"></i></a>
                <a href=login><i class="fas fa-user"></i></a>
            </div>
        </nav>
    </div>

    <div class="banner">
        <img src="Images/banner 1.jpg" alt="laptop banner"> 
        <div class="banner-text">
            <h1>FORGE YOUR PATH TO VICTORY</h1>
            <p>START WITH THE RIGHT GEAR.</p>
            <a href="#" class="button">Shop Now <i class="fas fa-arrow-right"></i></a>
        </div>
    </div>

    <div class="browse">
        <h2>Browse Laptops</h2>
        <p>Select Category:</p>
    </div>



    <hr>
    <div class="category-container">
        <a href="#" class="category-link">
            <h2>All Laptops</h2>
        </a>
        <a href="#" class="category-link">
            <img src="Images/samsung.png" alt="Samsung">
            <span>Samsung</span>
        </a>
        <a href="#" class="category-link">
            <img src="Images/apple.png" alt="Apple">
            <span>Apple</span>
        </a>
        <a href="#" class="category-link">
            <img src="Images/MSI-Logo.png" alt="MSI">
            <span>MSI</span>
        </a>
        <a href="#" class="category-link">
            <img src="Images/Asus-Logo.png" alt="Asus">
            <span>Asus</span>
        </a>
        <a href="#" class="category-link">
            <img src="Images/hp logo.png" alt="Asus">
            <span>HP</span>
        </a>
    </div>
    <hr>

    <!-- Product Section -->
    <div class="product-container">
        <c:forEach var="product" items="${products}">
            <div class="product">
                <div class="product-image">
                	<c:set var="image" value="${Base64.getEncoder().encodeToString(product.imageUrlFromPart)}"/>
                    <img src="data:image/jpeg;base64,${image}" alt="${product.name}">
                    <div class="product-specs">
                        <h2>Specifications:</h2>
                        <p><span>Processor:</span> ${product.processor}</p>
                        <p><span>RAM:</span> ${product.ram}</p>
                        <p><span>Storage:</span> ${product.storage}</p>
                        <p><span>Display:</span> ${product.display}</p>
                        <p><span>Graphics:</span> ${product.graphic}</p>
                    </div>
                </div>
                <div class="product-details">
                    <h3>${product.name}</h3>
                    <p>${product.price}</p>
                    <button class="add-to-cart">Add to Cart <i class="fas fa-shopping-cart"></i></button>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Footer -->
    <footer class="footer-container">
        <div class="social-icons">
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
        </div>
        <p>Kamal Pokhari, Behind City Center, Kathmandu 44600, Nepal</p>
        <div class="call-mail">
            <a href="tel:+977-123456789"><i class="fas fa-phone"></i> +977-123456789</a>
            <a href="mailto:example@example.com"><i class="fas fa-envelope"></i> example@example.com</a>
        </div>
    </footer>
    
    <script type="text/javascript" src="${ pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>
