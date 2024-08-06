<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Base64"%>
<%@page import="service.ProductDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>List of Products</title>

    <style type="text/css">
        body{
            background-color: whitesmoke;
        }
        .container{
            display: flex;

            justify-content: center;
            flex-direction: column;


        }
        table{

            box-shadow: 5px 5px 5px 5px rgba(0, 0, 0, 0.3);
            border-radius: 10px;
            
        }
        .button{
        display: flex;
        flex-direction: column;
       
        
        
        }
        .button button{
        	margin-top: 4px;
        	padding: 8px;
        	border-radius: 3px;
        }
        
        button:hover{
            background-color: #bbb;

        }
        
        .description{
            background-color: rgb(124, 214, 261);
        }
        .description td{
            border: none;
        }
        tr{
            box-shadow: 1px 1px 1px 1px rgba(0, 0, 0, 0.1);

        }
        td{
            border-top: 1px solid;
            border-right: 1px solid;
			text-align: center;
            padding: 6px;

        }

        img{
            height: 50px;
            width: 50px;
        }
        .link{
            margin-bottom: 30px;
            flex-direction: row;
            text-align: center;
        }
        .link a{
            margin-left: 20px;
            box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.4);
            text-decoration: none;
            padding: 10px;
            border-radius: 8px;
            color: blue;
            transition: 0.4s;
        }
        
        .link a:hover{
            background-color: #bbb;

        }
        
    </style>
</head>
<body>

<div class="container">
    <div class="link">
			<a href="manage">Add more product</a>
		    <a href="manager">Home</a>
	</div>
    <table>
        <tr class="description">
            <td>Name</td>
            <td>Category</td>
            <td>Price</td>
            <td>Processor</td>
            <td>RAM</td>
            <td>Storage</td>
            <td>Display</td>
            <td>Graphics</td>
            <td>Stock</td>
            <td>Image</td>
            <td>Button</td>
        </tr>

        <c:forEach var="product" items="${products}">
            <tr>
            <td>${product.name}</td>
            <td>${product.category}</td>
            <td>$ ${product.price}</td>
            <td>${product.processor}</td>
            <td>${product.ram}</td>
            <td>${product.storage}</td>
            <td>${product.display}</td>
            <td>${product.graphic}</td>
            <td>${product.stock}</td>
            <td><c:set var="image" value="${Base64.getEncoder().encodeToString(product.imageUrlFromPart)}"/>
                    <img src="data:image/jpeg;base64,${image}" alt="${product.name}"></td>
            <td class="button">
            <form action=edit method="post">
            	<input type="hidden" name="productid" value=${product.productId }>
				<button class="edit">Edit</button>
            </form>
                <form action=delete method="post">
                	<input type="hidden" name="productid" value=${product.productId }>
                	<button class="delete">Delete</button>
                </form>
            </td>
            </tr>
        </c:forEach>
    </table>
    
    
    
</div>
</body>
</html>