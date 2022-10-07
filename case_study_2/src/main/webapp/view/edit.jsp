<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/10/2022
  Time: 11:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../bootstrap/bootstrap-5.0.2-dist/css/bootstrap.css">
</head>
<body>
<h1>Chỉnh sửa thông tin khách hàng</h1>
<a href="/customer" class="btn btn-primary">Quay lại trang chủ</a>
<form action="/customer?action=edit" method="post">
    <fieldset>
        <legend>Thông tin sản phẩm</legend>
        <table>
            <tr>
                <td>id: </td>
                <td><input type="text" name="id" id="id" value="${customer.getId()}"></td>
            </tr>
            <tr>
                <td>id customer: </td>
                <td><input type="text" name="customer_type_id" id="customer_type_id" value="${customer.getIdCustomerType()}"></td>
            </tr>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" id="name" value="${customer.getName()}"></td>
            </tr>
            <tr>
                <td>Birthday: </td>
                <td><input type="date" name="date_of_birth" id="date_of_birth" value="${customer.getDateOfBirth()}"></td>
            </tr>
            <tr>
                <td>Gender: </td>
                <td><input type="radio" name="gender" value="true">Nam <input type="radio" value="false" name="gender"> Nữ</td>
            </tr>
            <tr>
                <td>Id Card: </td>
                <td><input type="text" name="id_card" id="id_card" value="${customer.getIdCard()}"></td>
            </tr>
            <tr>
                <td>Phone Number: </td>
                <td><input type="text" name="phone_number" id="phone_number" value="${customer.getPhoneNumber()}"></td>
            </tr>
            <tr>
                <td>Email: </td>
                <td><input type="text" name="email" id="email" value="${customer.getEmail()}"></td>
            </tr>
            <tr>
                <td>Address: </td>
                <td><input type="text" name="address" id="address" value="${customer.getAddress()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Chỉnh sửa"></td>
            </tr>

        </table>
    </fieldset>
</form>
<script src="../bootstrap/bootstrap-5.0.2-dist/js/bootstrap.js"></script>
</body>
</html>
