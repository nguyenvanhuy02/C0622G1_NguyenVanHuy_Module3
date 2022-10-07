<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/10/2022
  Time: 10:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Thêm mới danh sách khách hàng</h1>
<a href="../view/home.jsp">Quay lại trang chủ</a>
<c:if test="${mess!=null}">
    <span>${mess}</span>
</c:if>
<form action="/customer?action=add" method="post">
    <pre>ID:                            <input type="text" name="id"></pre>
    <pre>ID customer type:              <input type="text" name="idCustomerType"></pre>
    <pre>Name:                          <input type="text" name="name"></pre>
    <pre>Brithday:                      <input type="date" name="dateOfBirth"></pre>
    <pre>Gender :                       <input type="radio" name="gender" value="true">Nam <input type="radio" value="false" name="gender"> Nữ </pre>
    <pre>Id Card:                       <input type="text" name="idCard"></pre>
    <pre>Phone Number:                  <input type="text" name="phoneNumber"></pre>
    <pre>Email:                         <input type="text" name="email"></pre>
    <pre>Address:                       <input type="text" name="address"></pre>
    <pre>                               <button>Save</button></pre>
</form>
</body>
</html>
