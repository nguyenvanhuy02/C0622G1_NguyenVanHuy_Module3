<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 29/9/2022
  Time: 3:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1 style="text-align: center">Danh sách khách hàng</h1>
<table border="1" style="width: 100% ; height: 600px;text-align: center">
    <tr>
        <th>Tên</th>
        <th>Ngày Sinh</th>
        <th>Địa chỉ</th>
        <th style="width: 100px" >Ảnh</th>
    </tr>
    <c:forEach var="customer" items="${customers}">
        <tr>
            <td>${customer.getName()}</td>
            <td>${customer.getBirthday()}</td>
            <td>${customer.getAddress()}</td>
            <td><img style="width: 200px ; height: 200px ; " src="${customer.getImg()}"></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
