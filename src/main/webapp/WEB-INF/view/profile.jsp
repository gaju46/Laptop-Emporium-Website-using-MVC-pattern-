<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Profile Page</title>
    
    <link rel="Stylesheet" href="${pageContext.request.contextPath}/css/userProfile.css">
</head>
<body>
    <!-- Top left greeting -->
    <div class="top-left-greeting">

        Hey, <c:out value="${user.username}"/>
    </div>
    <!-- Main container with three sections -->
    <div class="main-container">
        
        <!-- Left section for cart, payment, wishlist -->
        <div class="left-section">
            <h2>Profile</h2>
        
            <a href="profile">
            <div class="heading-with-image">
                <img src="Images/account.png" alt="Accounts Icon">  <!-- Image for Accounts -->
                <h3>Accounts</h3>  <!-- Heading beside the image -->
            </div>
            </a>
            
            <a href="order">
            <div class="heading-with-image">
                <img src="Images/orders.jpg" alt="Orders Icon">  <!-- Image for Orders -->
                <h4>Orders</h4>
            </div>
            </a>
            
            <a href="home">
            <div class="heading-with-image">
                <img src="Images/Asus-Logo.png" alt="Orders Icon">  <!-- Image for Orders -->
                <h4>Got to Home</h4>
            </div>
            </a>

        </div>
        

        <!-- Middle section for personal details -->
        <div class="middle-section">
            <img src="Images/dua.jpg" alt="Profile Picture">
            <h1>
                <span class="change">Change Personal Details</span>
                |
                <a href="userdetail"><span class="editt">EDIT</span></a>
            </h1>
            <h2>Personal Details  </h2>
            <p><c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/></p>
            
            <p>Email: <c:out value="${user.email}"/></p>
            <p>Phone Number: <c:out value="${user.phoneNumber}"/></p>
        </div>

        <!-- Right section for shipping address -->
        <div class="right-section">
            <div>
            <h2>
                <span class="shipping-address">Shipping Address</span>
                | 
                <a href="address"><span class="edit">EDIT</span></a>
                
            </h2>
            
            </div>

            
        </div>

    </div>
</body>
</html>
