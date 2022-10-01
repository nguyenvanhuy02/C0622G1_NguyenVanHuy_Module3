<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/10/2022
  Time: 2:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Tìm kiếm sản phẩm</title>
</head>
<body>
<h1>Tìm kiếm sản phẩm</h1>

<p>
    <a href="/product">Quay lại</a>
</p>

<form action="/product?action=find" method="post">
    <fieldset>
        <legend>Tìm kiếm sản phẩm</legend>
        Name : <input type="text" name="name">
        <input type="submit" value="Tìm kiếm">
    </fieldset>
</form>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Tên sản phẩm</th>
        <th>Giá sản phẩm</th>
        <th>Mô tả sản phẩm</th>
        <th>Nhà sản xuất</th>
        <th>Chỉnh sửa</th>
        <th>Xoá</th>
    </tr>
    <c:forEach var="product" items="${listProducts}">
        <tr>
            <td>${product.getId()}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescribe()}</td>
            <td>${product.getProducer()}</td>
            <td><a href="/product?action=edit&id=${product.getId()}">Chỉnh sửa</a></td>
            <td><a href="/product?action=delete&id=${product.getId()}">Xoá</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
