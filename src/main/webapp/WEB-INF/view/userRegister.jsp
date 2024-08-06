<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="Stylesheet" href="${pageContext.request.contextPath}/css/userAccount.css">
<style type="text/css">
.toggle-page{
        background-color: rgb(141, 159, 222);
        border-radius: 20px;
        margin-bottom: 25px;
        border-bottom: 3px solid #ccc;
        border-top: 3px solid #ccc;
        margin-right: 85px;
        margin-left: 85px;
        padding:5px;
        text-align: center;
    }
    .toggle-page a{
        border: none;
        color: black;
        cursor: pointer;
        text-decoration: none;
        font-size: 16px;
        padding-top: 6px;
        padding-bottom: 9px;
        padding-left: 25px;
        border-radius: 30px;
        transition: 1s;
        font-weight: bold;
        
    }

    .toggle-page a:hover{
        background-color: rgba(245, 245, 255, 0.8);
    }
    .active{
        background-color: rgba(245, 245, 255, 0.8);
        border-radius: 10px;
        padding: 10px;
        
    }
    
    .error{
    	text-align:center;
		color:red;
		margin-bottom:20px;
    }
</style>
</head>
<body>

<div class="container">
    <div class="toggle-page">
    	<a href="login">SIGN IN</a>
        <a href="register" class="active">SIGN UP</a>
    </div>

        <form action="<%=request.getContextPath() %>/register" method="post" class="registration-form" id="registrationForm">
            <div class="error"><c:out value="${error }"></c:out></div>
            <div class="row">
                <div class="col">
                    <label for="firstName">First Name:</label><input type="text"
                        id="firstName" name="firstName" required>
                </div>
                <div class="col">
                    <label for="lastName">Last Name:</label> <input type="text"
                        id="lastName" name="lastName" required>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="username">Username:</label> <input type="text"
                        id="username" name="username" required>
                </div>
                <div class="col">
                    <label for="birthday">Birthday:</label> <input type="date"
                        id="birthday" name="birthday" required>
                </div>

            </div>
            <div class="row">
                <div class="col">
                    <label for="gender">Gender:</label> <select id="gender"
                        name="gender" required>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                    </select>
                </div>

                <div class="col">
                    <label for="phoneNumber">Phone Number:</label> <input type="tel"
                        id="phoneNumber" name="phoneNumber" required>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="email">Email:</label> <br><input type="email" id="email"
                        name="email" required>
                </div>
                <div class="col">
                    <label for="password">Password:</label> <input type="password"
                        id="password" name="password" required>
                </div>
            </div>
            <div class="row">
                <div class="col " style="text-align: left;">
                    <label for="retypePassword">Retype Password:</label>
                    <br> <input
                        type="password" id="retypePassword" name="retypePassword" required>
                </div>
                
            </div>
            <div class="button">
                <button type="submit" name="submit">Submit</button>
            </div>
            
            <div class="navigation">
		        <a href=home> Go Back</a>
		    </div>
        </form>
</div>
</body>
</html>