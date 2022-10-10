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
<body background="/img/cover_furama_1.jpg" style="background-size: cover" >
<h1>Thêm mới danh sách nhân viên</h1>
<a href="../view/home.jsp">Quay lại trang list</a>
<c:if test="${mess!=null}">
    <p style="color: red">${mess}</p>
</c:if>
<form action="/employee?action=add" method="post">
<%--    <pre>ID:                            <input type="text" name="id" ></pre>   --%>
    <pre>Name:                          <input type="text" name="name" required value="${employee.getName()}"></pre>
    <c:if test="${map.get('name')!=null}">
        <span style="color: red">${map.get('name')}</span>
    </c:if>
    <pre>Birthday:                      <input type="date" name="dateOfBirth" required></pre>
    <pre>Id Card:                       <input type="text" name="idCard" required></pre>
    <c:if test="${map.get('idCard')!=null}">
        <span style="color: red">${map.get('idCard')}</span>
    </c:if>
    <pre>Salary:                       <input type="text" name="salary" required></pre>
    <c:if test="${map.get('salary')!=null}">
        <span style="color: red">${map.get('salary')}</span>
    </c:if>
    <pre>Phone Number:                 <input type="text" name="phoneNumber" required></pre>
    <c:if test="${map.get('phoneNumber')!=null}">
        <span style="color: red">${map.get('phoneNumber')}</span>
    </c:if>
    <pre>Email:                         <input type="text" name="email" required></pre>
    <c:if test="${map.get('email')!=null}">
        <span style="color: red">${map.get('email')}</span>
    </c:if>
    <pre>Address:                       <input type="text" name="address" required></pre>
    <pre>Position Id:                   <input type="text" name="positionId" required></pre>
    <pre>Education Degree Id:           <input type="text" name="educationDegreeId" required></pre>
    <pre>Division Id:                   <input type="text" name="divisionId" required></pre>
    <pre>Username:                      <input type="text" name="username" required></pre>
    <pre>                               <button>Save</button></pre>
</form>
</body>
</html>
