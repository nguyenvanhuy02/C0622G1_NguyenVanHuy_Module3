<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/9/2022
  Time: 2:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Product</title>
</head>
<body>
<h1>Danh sách sản phẩm</h1>

<c:if test="${mess != null}">
    <span>${mess}</span>
</c:if>

<a href="/product?action=add">Thêm mới</a>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Tên sản phẩm</th>
        <th>Giá sản phẩm</th>
        <th>Mô tả sản phẩm</th>
        <th>Nhà sản xuất</th>
    </tr>
    <c:forEach var="product" items="${productList}">
        <tr>
            <td>${product.getId()}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescribe()}</td>
            <td>${product.getProducer()}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
