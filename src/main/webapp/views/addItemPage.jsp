<%-- 
    Document   : addItem
    Created on : 1 Sep 2020, 12:22:28
    Author     : Michael
--%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
		<header>
			<h1>Product Catalog (Java Web 8)</h1>
		</header>
        <nav>
            <ul>
                <li><a href="<%=request.getContextPath()%>">Home</a></li>
                <!--<li><a href="<%=WebsiteMappings.Products%>">All Products</a></li>-->
                <!--<li><a href="<%=WebsiteMappings.AddProduct%>">Add Product</a></li>-->
            </ul>
        </nav>
        <form:form action="/addItemHandler" modelAttribute="item">
            <table>
                <tr>
                    <td><form:label path="code">Code</form:label></td>
                    <td><form:input path="code"/></td>
                    <td style="color:red"><form:errors path="code"/> </td>
                </tr>
                <tr>
                    <td><form:label path="name">Name</form:label></td>
                    <td><form:input path="name" /></td>
                    <td style="color:red"><form:errors path="name"/> </td>
                </tr>
                <tr>
                    <td><form:label path="description">Description</form:label></td>
                    <td><form:input path="description"/></td>
                    <td style="color:red"><form:errors path="description"/> </td>
                </tr>
                <tr>
                    <td><form:label path="buyPrice">Buy Price</form:label></td>
                    <td><form:input path="buyPrice"/></td>
                    <td style="color:red"> <form:errors path="buyPrice"/> </td>
                </tr>
                <tr>
                    <td><form:label path="sellPrice">Sell Price</form:label></td>
                    <td><form:input path="sellPrice"/></td>
                    <td style="color:red"> <form:errors path="sellPrice"/> </td>
                </tr>
                <tr>

                    <td><form:label path="quantityInStock">Quantity In Stock</form:label></td>
                    <td><form:input type="quantityInStock" path="quantityInStock"/></td>
                    <td style="color:red"> <form:errors path="quantityInStock"/> </td>
                </tr>
                <tr>
                    <td><input type="submit" value="Add Product"/></td>
                </tr>
            </table>
        </form:form>
    </body>
</html><html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Products</title>
    </head>
    <body>
        <header>
			<h1>Product Catalog (Java Web 8)</h1>
		</header>
        <nav>
            <ul>
                <li><a href="<%=request.getContextPath()%>">Home</a></li>
                <li><a href="/allItems">All Products</a></li>
                <li><a href="/addItems">Add Product</a></li>
            </ul>
        </nav>
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
            <c:forEach items="${temsList}" var="itme">
                <tr>
                    <td>${product.code}</td>
                    <td>${product.name}</td>
                    <td>${product.description}</td>
                    <td>${product.buyPrice}</td>
                    <td>${product.sellPrice}</td>
                    <td>${product.quantityInStock}</td>
                    <td><a href="/DeleteItem/${product.code}">Delete</a></td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>





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
            <c:forEach items="${itemsList}" var="itme">
                <tr>
                    <td>${product.code}</td>
                    <td>${product.name}</td>
                    <td>${product.description}</td>
                    <td>${product.buyPrice}</td>
                    <td>${product.sellPrice}</td>
                    <td>${product.quantityInStock}</td>
                    <td><a href="/DeleteItem/${product.code}">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
