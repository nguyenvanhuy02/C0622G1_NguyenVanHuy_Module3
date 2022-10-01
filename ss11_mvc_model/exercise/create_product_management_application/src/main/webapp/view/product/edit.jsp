<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/9/2022
  Time: 11:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chỉnh sửa sản phẩm</title>
</head>
<body>
<h1>Chỉnh sủa sản phẩm</h1>

<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>

<p>
    <a href="/product">Quay lại</a>
</p>

<form method="post">
    <fieldset>
        <legend>Thông tin sản phẩm</legend>
            <table>
                <tr>
                    <td>id: </td>
                    <td><input type="text" name="id" id="id" value="${product.getId()}"></td>
                </tr>
                <tr>
                    <td>Name: </td>
                    <td><input type="text" name="name" id="name" value="${product.getName()}"></td>
                </tr>

                <td>price: </td>
                <td><input type="text" name="price" id="price" value="${product.getPrice()}"></td>
                </tr>

                <td>describe: </td>
                <td><input type="text" name="describe" id="describe" value="${product.getDescribe()}"></td>
                </tr>

                <td>producer: </td>
                <td><input type="text" name="producer" id="producer" value="${product.getProducer()}"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Chỉnh sửa"></td>
                </tr>
            </table>
    </fieldset>
</form>
</body>
</html>
