<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/9/2022
  Time: 3:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm mới sản phẩm</title>
</head>
<body>
<h1>Thêm mới sản phẩm</h1>

<a href="/product">Quay lại</a>

<c:if test="${mess!=null}">
    <span>${mess}</span>
</c:if>

<form action="/product?action=add" method="post">
    ID: <input type="text" name="id">
    Name: <input type="text" name="name">
    price: <input type="text" name="price">
    describe: <input type="text" name="describe">
    producer: <input type="text" name="producer">
    <button>Lưu</button>
</form>
</body>
</html>
