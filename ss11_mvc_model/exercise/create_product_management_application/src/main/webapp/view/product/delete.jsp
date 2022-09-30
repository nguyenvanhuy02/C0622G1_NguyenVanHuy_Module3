<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/9/2022
  Time: 10:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Xoá</title>
</head>
<body>
<h1>Xoá sản phẩm</h1>
<p>
    <a href="/product">Quay lại</a>
</p>
<form method="post">
<h3>Bạn có chắc chắn muốn xoá ?</h3>
<fieldset>
    <legend>Thông tin sản phẩm</legend>
    <tr>
        <td>Name: </td>
        <td>${requestScope["product"].getName()}</td>
    </tr>
    <tr>
        <td><input type="submit" value="Xoá"></td>
        <td><a href="/product">Quay lại</a></td>
    </tr>
</fieldset>
</form>
</body>
</html>
