<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="Stylesheet" href="${pageContext.request.contextPath}/css/userAccount.css">
<style>

body{
	background-color: #77B0AA;
}
.edit-container{
	display:flex;
	align-content: center;
	justify-content: center;
	background-color: rgba(255,255,255,0.4);
	padding-top: 50px;
	padding-left: 150px;
	padding-right: 150px;
	padding-bottom: 50px;
	
}

</style>
</head>
<body>
<div class="edit-container">
	<form action="<%=request.getContextPath() %>/address" class="address" id="addressForm" method="post">
        
        
            <div class="row">
                <div class="col">
                    <label for="street">Street:</label>
                    <br>
                    <input type="text" id="street" name="street" required>

                </div>
            </div> 
            <div class="row">
                <div class="col">
                    <label for="city">City:</label>
                    <br>
                    <input type="text" id="city" name="city" required>

                </div>
            </div> 
            <div class="row">
                <div class="col">
                    <label for="zipcode">Zip Code:</label>
                    <br>
                    <input type="text" id="zipcode" name="zipcode" required>

                </div>
            </div> 
            
        <div class="button">
            <button type="submit" class="address-button" name="submit">Update</button>
        </div>
        
        <div class="navigation" style="margin-top: 30px; ">
		        <a href=profile> Go Back</a>
		    </div>
            
        </form>
        </div>
</body>
</html>