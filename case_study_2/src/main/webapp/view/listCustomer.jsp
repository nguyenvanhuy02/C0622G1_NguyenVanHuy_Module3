<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/10/2022
  Time: 1:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Danh sách khách hàng</title>
    <link rel="stylesheet" href="../bootstrap/bootstrap-5.0.2-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../bootstrap/datatables/css/dataTables.bootstrap5.css">
</head>
<body background="/img/cover_furama_1.jpg" style="background-size: cover" >
<h1 class="text-center">
    Trang danh sách khách hàng
</h1>
<a href="../view/home.jsp" class="btn btn-primary">Quay lại trang list</a>

<form class="row g-3 d-fex justify-content-end" action="/customer" method="get">
    <input type="text" name="action" value="search" hidden>
    <div class="col-auto">
        <input type="text" name="searchName" class="form-control" placeholder="Name">
    </div>
    <div class="col-auto">
        <button type="submit" class="btn btn-outline-primary mb-3">Search</button>
    </div>
</form>

<table id="tableCustomer" class="table table-sm , bg-body">
    <thead>
    <tr class="bg-warning">
        <th>ID</th>
        <th>ID Customer Type</th>
        <th>Name</th>
        <th>Birthday</th>
        <th>Gender</th>
        <th>Card</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Address</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    </thead>

    <tbody>
    <c:forEach var="customer" items="${customerList}">
        <tr>
            <td>${customer.getId()}</td>
            <td>${customer.getIdCustomerType()}</td>
            <td>${customer.getName()}</td>
            <td>${customer.getDateOfBirth()}</td>
            <c:if test="${customer.isGender()}">
                <td>Nam</td>
            </c:if>
            <c:if test="${!customer.isGender()}">
                <td>Nữ</td>
            </c:if>
            <td>${customer.getIdCard()}</td>
            <td>${customer.getPhoneNumber()}</td>
            <td>${customer.getEmail()}</td>
            <td>${customer.getAddress()}</td>
            <td><a href="/customer?action=edit&id=${customer.getId()}" class="btn btn-primary">Chỉnh sửa</a></td>
            <td>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal${customer.id}">
                    Xoá
                </button>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal${customer.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel" style="color: #000">Xoá khách hàng</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body" style="color: #000" >
                                Bạn có muốn xoá không ?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Quay lại</button>
                                <a href="/customer?action=delete&id=${customer.getId()}" class="btn btn-secondary" >Xoá</a>
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
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</body>
</html>
