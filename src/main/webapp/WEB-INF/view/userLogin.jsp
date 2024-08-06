<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>

<link rel="Stylesheet" href="${pageContext.request.contextPath}/css/userAccount.css">

<style type="text/css">
.error{
	margin-left:50px;
	color:red;
}
</style>
</head>
<body>

<div class="container">
    <div class="toggle-page">
    	<a href="login" class="active">SIGN IN</a>
        <a href="register">SIGN UP</a>
    </div>

    <div class="form-slide">
        <form action="<%=request.getContextPath() %>/login" class="login-page" id="loginForm" method="post">
        <div class="error"><c:out value="${error }"></c:out></div>
        
            <div class="row">
                <div class="col">
                    <label for="username">Username:</label>
                    <br>
                    <input type="text" id="username" name="username" required>

                </div>
            </div> 
            <div class="row">
                <div class="col">
                <label for="password">Password:</label>
                <br>
                <input type="password" id="password" name="password" required>

            </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="role">Role:</label>
                    <select id="role" name="role" required>
                        <option value="user">User</option>
                        <option value="admin">Admin</option>
                    </select>
                </div>
            </div>
        <div class="button">
            <button type="submit" class="login-button" name="submit">Login</button>
        </div>
        
        <div class="navigation">
		        <a href=home> Go Back</a>
		    </div>
            
        </form>

</body>
</html>