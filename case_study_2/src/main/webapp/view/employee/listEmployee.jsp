<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/10/2022
  Time: 11:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../bootstrap/bootstrap-5.0.2-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../../bootstrap/datatables/css/dataTables.bootstrap5.css">
</head>
<body background="/img/cover_furama_1.jpg" >
<h1 class="text-center">
    Trang danh sách nhân viên
</h1>
<a href="../view/home.jsp" class="btn btn-primary">Quay lại trang chủ</a>

<form class="row g-3 d-fex justify-content-end" action="/employee" method="get">
    <input type="text" name="action" value="search" hidden>
    <div class="col-auto">
        <input type="text" name="searchName" class="form-control" placeholder="Name">
    </div>
    <div class="col-auto">
        <button type="submit" class="btn btn-outline-primary mb-3">Search</button>
    </div>
</form>

<table id="tableEmployee" class="table table-sm , bg-body">
    <thead>
    <tr class="bg-warning">
        <th>ID</th>
        <th>Name</th>
        <th>Date_Of_Birth</th>
        <th>ID_Card</th>
        <th>Salary</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Address</th>
        <th>Position</th>
        <th>Education_Degree</th>
        <th>Division</th>
        <th>usname</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    </thead>

    <tbody>
    <c:forEach var="employee" items="${listEmployee}">
        <tr>
            <td>${employee.getId()}</td>
            <td>${employee.getName()}</td>
            <td>${employee.getDateOfBirth()}</td>
            <td>${employee.getIdCard()}</td>
            <td>${employee.getSalary()}</td>
            <td>${employee.getPhoneNumber()}</td>
            <td>${employee.getEmail()}</td>
            <td>${employee.getAddress()}</td>
            <c:if test="${employee.getPositionId() == 1}">
                <td>Quản lý</td>
            </c:if>
            <c:if test="${employee.getPositionId() == 2}">
                <td>Nhân viên</td>
            </c:if>

            <c:if test="${employee.getEducationDegreeId() == 1}">
                <td>Trung cấp</td>
            </c:if>
            <c:if test="${employee.getEducationDegreeId() == 2}">
                <td>Cao đẳng</td>
            </c:if>
            <c:if test="${employee.getEducationDegreeId() == 3}">
                <td>Đại học</td>
            </c:if>
            <c:if test="${employee.getEducationDegreeId() == 4}">
                <td>Sau đại học</td>
            </c:if>

            <c:if test="${employee.getDivisionId() == 1}">
                <td>Sale-Marketing</td>
            </c:if>
            <c:if test="${employee.getDivisionId() == 2}">
                <td>Hành chính</td>
            </c:if>
            <c:if test="${employee.getDivisionId() == 3}">
                <td>Phục vụ</td>
            </c:if>
            <c:if test="${employee.getDivisionId() == 4}">
                <td>Quản lý</td>
            </c:if>

            <td>${employee.getUsername()}</td>

<%--            <td><a href="/customer?action=edit&id=${employee.getId()}" class="btn btn-primary">Chỉnh sửa</a></td>--%>
            <td>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal${employee.id}">
                    Chỉnh sửa
                </button>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal${employee.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel1" style="color: #000">Chỉnh sửa nhân viên</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body" style="color: #000" >
                                <form action="/employee?action=edit" method="post">
                                    <fieldset>
                                        <legend>Thông tin sản phẩm</legend>
                                        <table>
                                            <tr>
                                                <td>Id: </td>
                                                <td><input type="text" name="id" id="id" value="${employee.getId()}"></td>
                                            </tr>
                                            <tr>
                                                <td>Name: </td>
                                                <td><input type="text" name="name" id="name" value="${employee.getName()}"></td>
                                            </tr>
                                            <tr>
                                                <td>Birthday: </td>
                                                <td><input type="date" name="dateOfBirth" id="dateOfBirth" value="${employee.getDateOfBirth()}"></td>
                                            </tr>
                                            <tr>
                                                <td>Id Card: </td>
                                                <td><input type="text" name="idCard" id="idCard" value="${employee.getIdCard()}"></td>
                                            </tr>
                                            <tr>
                                                <td>Salary: </td>
                                                <td><input type="text" name="salary" id="salary" value="${employee.getSalary()}"></td>
                                            </tr>
                                            <tr>
                                                <td>Phone Number: </td>
                                                <td><input type="text" name="phoneNumber" id="phoneNumber" value="${employee.getPhoneNumber()}"></td>
                                            </tr>
                                            <tr>
                                                <td>Email: </td>
                                                <td><input type="text" name="email" id="email" value="${employee.getEmail()}"></td>
                                            </tr>
                                            <tr>
                                                <td>Address: </td>
                                                <td><input type="text" name="address" id="address" value="${employee.getAddress()}"></td>
                                            </tr>
                                            <tr>
                                                <td>Position Id: </td>
                                                <td><input type="text" name="positionId" id="positionId" value="${employee.getPositionId()}"></td>
                                            </tr>
                                            <tr>
                                                <td>Education Degree Id: </td>
                                                <td><input type="text" name="educationDegreeId" id="educationDegreeId" value="${employee.getEducationDegreeId()}"></td>
                                            </tr>
                                            <tr>
                                                <td>Division Id: </td>
                                                <td><input type="text" name="divisionId" id="divisionId" value="${employee.getDivisionId()}"></td>
                                            </tr>
                                            <tr>
                                                <td>Username: </td>
                                                <td><input type="text" name="username" id="username" value="${employee.getUsername()}"></td>
                                            </tr>


                                        </table>
                                    </fieldset>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Quay lại</button>
                                        <button class="btn btn-secondary" data-bs-dismiss="modal" >Chỉnh sửa</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </td>
            <td>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#deleteModal${employee.id}">
                    Xoá
                </button>

                <!-- Modal -->
                <div class="modal fade" id="deleteModal${employee.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel" style="color: #000">Xoá nhân viên</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body" style="color: #000" >
                                Bạn có muốn xoá không ?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Quay lại</button>
                                <a href="/employee?action=delete&id=${employee.getId()}" class="btn btn-secondary" >Xoá</a>
                            </div>
                        </div>
                    </div>
                </div>

            </td>
        </tr>
    </c:forEach>
    </tbody>


</table>
<script src="../bootstrap/bootstrap-5.0.2-dist/js/bootstrap.js"></script>
<script src="../bootstrap/jquery/jquery-3.5.1.min.js"></script>
<script src="../bootstrap/datatables/js/jquery.dataTables.js"></script>
<script src="../bootstrap/datatables/js/dataTables.bootstrap5.js"></script>
<script>
    $(document).ready(function () {
        $('#tableEmployee').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</body>
</html>
