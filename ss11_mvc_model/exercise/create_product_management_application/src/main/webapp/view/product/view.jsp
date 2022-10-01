<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/10/2022
  Time: 3:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Xem Thông tin sản phẩm</title>
</head>
<body>
<h1>Thông tin sản phẩm </h1>

<p>
    <a href="/product">Quay lại</a>
</p>

<fieldset>
    <legend>Thông tin sản phẩm</legend>
    <table>
        <tr>
            <td>Id: </td>
            <td>${product.getId()}</td>
        </tr>
        <tr>
            <td>Price: </td>
            <td>${product.getPrice()}</td>
        </tr>
        <tr>
            <td>Describe: </td>
            <td>${product.getDescribe()}</td>
        </tr>
        <tr>
            <td>Producer: </td>
            <td>${product.getProducer()}</td>
        </tr>
    </table>
</fieldset>
</body>
</html>
