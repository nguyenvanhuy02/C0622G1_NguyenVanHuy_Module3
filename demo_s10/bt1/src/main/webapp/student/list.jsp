<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 29/9/2022
  Time: 2:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>
    Trang danh sách sinh viên
</h1>
<table>
    <tr>
        <th>STT</th>
        <th>ID</th>
        <th>Name</th>
        <th>Gender</th>
        <th>Birthday</th>
        <th>Point</th>
        <th>Rank</th>
        <th>Account</th>
        <th>ClassID</th>
        <th>Email</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="student" items="${studentList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${student.getId()}</td>
            <td>${student.getName()}</td>

            <c:if test="${student.isGender()}">
                <td>Nam</td>
            </c:if>
            <c:if test="${!student.isGender()}">
                <td>Nữ</td>
            </c:if>

            <td>${student.getBirthday()}</td>
            <td>${student.getPoint()}</td>

            <c:choose>
                <c:when test="${student.getPoint()>=8}">
                    <td>Giỏi</td>
                </c:when>
                <c:when test="${student.getPoint()>=7}">
                    <td>Khá</td>
                </c:when>
                <c:when test="${student.getPoint()>=5}">
                    <td>Trung bình</td>
                </c:when>
                <c:otherwise>
                    <td>Yếu</td>
                </c:otherwise>
            </c:choose>

            <td>${student.getAccount()}</td>

            <%-- Hiển thị thông tin tên lớp--%>

            <c:forEach var="cls" items="${classList}">
                <c:if test="${cls.getId()==student.getClassId()}">
                    <td>${cls.getName()}</td>
                </c:if>
            </c:forEach>

            <td>${student.getEmail()}</td>
            <td><button>Edit</button></td>
            <td><button>Delete</button></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
