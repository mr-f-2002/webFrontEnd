<%--
  Created by IntelliJ IDEA.
  User: Nahin
  Date: 3/30/2024
  Time: 1:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Select Products</h2>
<form action="cartProducts" method="post">
    <input type="checkbox" id="mouseCheckbox" name="products" value="mouse"> Mouse<br>
    <input type="checkbox" id="keyboardCheckbox" name="products" value="keyboard"> Keyboard<br>
    <input type="checkbox" id="laptopCheckbox" name="products" value="laptop"> Laptop<br>
    <input type="checkbox" id="monitorCheckbox" name="products" value="monitor"> Monitor<br>
    <input type="submit" value="Add To Cart" onclick="addToCart()">
</form>

<form action="cartedProducts"  method="post">
    <input type="submit" value="Go to CART">
</form>

<form action="logoutServlet"  method="post">
    <input type="submit" value="Log Out">
</form>

<script>
    function addToCart() {
        var checkboxes = document.querySelectorAll('input[name="products"]:checked');
        var selectedProducts = [];
        checkboxes.forEach(function(checkbox) {
            selectedProducts.push(checkbox.value);
        });
        alert("Selected Products: " + selectedProducts.join(", "));
    }
</script>
</body>
</html>
