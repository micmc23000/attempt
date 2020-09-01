<%-- 
    Document   : allItems
    Created on : 1 Sep 2020, 12:25:35
    Author     : Michael
--%>


<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Products</title>
    </head> 
    <body>
        <security:authorize access="!isAuthenticated()">
            <a href="/login">Login</a>
        </security:authorize>
        <security:authorize access="!isAuthenticated()">
            <a href="/logout">Logout</a>
        </security:authorize>

        <security:authorize access="hasRole('USER')">
            <table style="width:100%">
                <tr>
                    <th align="left">Code</th>
                    <th align="left">Name</th>
                    <th align="left">Description</th>
                    <th align="left">Buy Price</th>
                    <th align="left">Sell Price</th>
                    <th align="left">Qty In Stock</th>
                </tr>
                <c:forEach items="${itemsList}" var="item"> 
                    <tr>
                        <td>${item.code}</td>
                        <td>${item.name}</td>
                        <td>${item.description}</td>
                        <td>${item.buyPrice}</td>
                        <td>${item.sellPrice}</td>
                        <td>${item.quantityInStock}</td>
                    </tr>
                </c:forEach>
            </table>
        </security:authorize>    

        <security:authorize access="hasRole('ADMIN')">
            <table style="width:100%">
                <tr>
                    <th align="left">Code</th>
                    <th align="left">Name</th>
                    <th align="left">Description</th>
                    <th align="left">Buy Price</th>
                    <th align="left">Sell Price</th>
                    <th align="left">Qty In Stock</th>
                    <th align="left">Actions</th>
                </tr>
                <c:forEach items="${itemsList}" var="item"> 
                    <tr>
                        <td>${item.code}</td>
                    <td>${item.name}</td>
                    <td>${item.description}</td>
                    <td>${item.buyPrice}</td>
                    <td>${item.sellPrice}</td>
                    <td>${item.quantityInStock}</td>
                        <td><button><a href="/login/deleteProduct?id=${product.code}">Delete</a></button></td>
                    </tr>
                </c:forEach>
            </table>
        </security:authorize> 


        <security:authorize access="hasRole('SUPERADMIN')">
             <table style="width:100%">
            <tr>
                <th align="left">Code</th>
                <th align="left">Name</th>
                <th align="left">Description</th>
                <th align="left">Buy Price</th>
                <th align="left">Sell Price</th>
                <th align="left">Qty In Stock</th>
                <th align="left">Actions</th>
            </tr>
            <c:forEach items="${itemsList}" var="item">
                <tr>
                    <td>${item.code}</td>
                    <td>${item.name}</td>
                    <td>${item.description}</td>
                    <td>${item.buyPrice}</td>
                    <td>${item.sellPrice}</td>
                    <td>${item.quantityInStock}</td>
                    <td><a href="/deleteItem${product.code}">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
                    
                  
        </security:authorize> 

    </body>
</html>
