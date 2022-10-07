<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/10/2022
  Time: 1:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Thêm mới danh sách nhân viên</h1>
<a href="../view/home.jsp">Quay lại trang list</a>
<c:if test="${mess!=null}">
    <span>${mess}</span>
</c:if>
<form action="/employee?action=add" method="post">
    <pre>ID:                            <input type="text" name="id"></pre>
    <pre>Name:                          <input type="text" name="name"></pre>
    <pre>Brithday:                      <input type="date" name="dateOfBirth"></pre>
    <pre>Id Card:                       <input type="text" name="idCard"></pre>
    <pre>Salary:                       <input type="text" name="salary"></pre>
    <pre>Phone Number:                  <input type="text" name="phoneNumber"></pre>
    <pre>Email:                         <input type="text" name="email"></pre>
    <pre>Address:                       <input type="text" name="address"></pre>
    <pre>Position Id:                       <input type="text" name="positionId"></pre>
    <pre>Education Degree Id:                       <input type="text" name="educationDegreeId"></pre>
    <pre>Division Id:                       <input type="text" name="divisionId"></pre>
    <pre>Username:                       <input type="text" name="username"></pre>
    <pre>                               <button>Save</button></pre>
</form>
</body>
</html>
