<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/10/2022
  Time: 9:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../bootstrap/bootstrap-5.0.2-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../../bootstrap/datatables/css/dataTables.bootstrap5.css">
</head>
<body>
<h1 class="text-center">Danh sách dịch vụ</h1>
<a href="../view/home.jsp" class="btn btn-primary">Quay lại trang chủ</a>
<table id="tableFacility" class="table table-sm , bg-body">
    <thead>
    <tr class="bg-warning">
        <th>STT</th>
        <th>name</th>
        <th>area</th>
        <th>cost</th>
        <th>max_people</th>
        <th>rent_type_id</th>
        <th>facility_type_id</th>
        <th>standard_room</th>
        <th>description_other_convenience</th>
        <th>pool_area</th>
        <th>number_of_floors</th>
        <th>facility_free</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="facility" items="${listFacility}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${facility.getName()}</td>
            <td>${facility.getArea()}</td>
            <td>${facility.getCost()}</td>
            <td>${facility.getMaxPeople()}</td>
            <td>${facility.getRentTypeId()}</td>
            <td>${facility.getFacilityTypeId()}</td>
            <td>${facility.getStandardRoom()}</td>
            <td>${facility.getDescriptionOtherConvenience()}</td>
            <td>${facility.getPoolArea()}</td>
            <td>${facility.getNumberOfFloors()}</td>
            <td>${facility.getFacilityFree()}</td>
            <td>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal${facility.id}">
                    Chỉnh sửa
                </button>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal${facility.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel1" style="color: #000">Chỉnh sửa dịch vụ</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body" style="color: #000" >
                                <form action="/facility?action=edit" method="post">
                                    <fieldset>
                                        <legend>Thông tin sản phẩm</legend>
                                        <pre>Id:                            <input type="hidden" name="id" id="id" value="${facility.getId()}"></pre>
                                        <pre>Name:                          <input type="text" name="name" id="name" value="${facility.getName()}"></pre>
                                        <pre>Area:                          <input type="text" name="area" id="area" value="${facility.getArea()}"></pre>
                                        <pre>Cost:                          <input type="text" name="cost" id="cost" value="${facility.getCost()}"></pre>
                                        <pre>Max People:                    <input type="text" name="maxPeople" id="maxPeople" value="${facility.getMaxPeople()}"></pre>
                                        <pre>Rent Type Id:                  <input type="text" name="rentTypeId" id="rentTypeId" value="${facility.getRentTypeId()}"></pre>
                                        <pre>Facility Type Id:              <input type="text" name="facilityTypeId" id="facilityTypeId" value="${facility.getFacilityTypeId()}"></pre>
                                        <pre>Standard Room:                 <input type="text" name="standardRoom" id="standardRoom" value="${facility.getStandardRoom()}"></pre>
                                        <pre>Description Other Convenience: <input type="text" name="descriptionOtherConvenience" id="descriptionOtherConvenience" value="${facility.getDescriptionOtherConvenience()}"></pre>
                                        <pre>Pool Area:                     <input type="text" name="poolArea" id="poolArea" value="${facility.getPoolArea()}" ></pre>
                                        <pre>Number Of Floors:              <input type="text" name="numberOfFloors" id="numberOfFloors" value="${facility.getNumberOfFloors()}" ></pre>
                                        <pre>Facility Free:                 <input type="text" name="facilityFree" id="facilityFree" value="${facility.getFacilityFree()}" ></pre>
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


<%--            <td>--%>
<%--                <!-- Button trigger modal -->--%>
<%--                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal${facility.id}">--%>
<%--                    Chỉnh sửa--%>
<%--                </button>--%>

<%--                <!-- Modal -->--%>
<%--                <div class="modal fade" id="exampleModal${facility.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">--%>
<%--                    <div class="modal-dialog">--%>
<%--                        <div class="modal-content">--%>
<%--                            <div class="modal-header">--%>
<%--                                <h5 class="modal-title" id="exampleModalLabel1" style="color: #000">Chỉnh sửa nhân viên</h5>--%>
<%--                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--                            </div>--%>
<%--                            <div class="modal-body" style="color: #000" >--%>
<%--                                <form action="/facility?action=edit" method="post">--%>
<%--                                    <fieldset>--%>
<%--                                        <legend>Thông tin dịch vụ</legend>--%>
<%--                                        <table>--%>
<%--                                            <tr>--%>
<%--                                                <td>Name: </td>--%>
<%--                                                <td><input type="text" name="name" id="name" value="${facility.getName()}"></td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td>Name: </td>--%>
<%--                                                <td><input type="text" name="area" id="area" value="${facility.getArea()}"></td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td>Name: </td>--%>
<%--                                                <td><input type="text" name="cost" id="cost" value="${facility.getCost()}"></td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td>Name: </td>--%>
<%--                                                <td><input type="text" name="maxPeople" id="maxPeople" value="${facility.getMaxPeople()}"></td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td>Name: </td>--%>
<%--                                                <td><input type="text" name="rentTypeId" id="rentTypeId" value="${facility.getRentTypeId()}"></td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td>Name: </td>--%>
<%--                                                <td><input type="text" name="facilityTypeId" id="facilityTypeId" value="${facility.getFacilityTypeId()}"></td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td>Name: </td>--%>
<%--                                                <td><input type="text" name="standardRoom" id="standardRoom" value="${facility.getStandardRoom()}"></td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td>Name: </td>--%>
<%--                                                <td><input type="text" name="descriptionOtherConvenience" id="descriptionOtherConvenience" value="${facility.getDescriptionOtherConvenience()}"></td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td>Name: </td>--%>
<%--                                                <td><input type="text" name="poolArea" id="poolArea" value="${facility.getPoolArea()}"></td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td>Name: </td>--%>
<%--                                                <td><input type="text" name="numberOfFloors" id="numberOfFloors" value="${facility.getNumberOfFloors()}"></td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td>Name: </td>--%>
<%--                                                <td><input type="text" name="facilityFree" id="facilityFree" value="${facility.getFacilityFree()}"></td>--%>
<%--                                            </tr>--%>

<%--                                        </table>--%>
<%--                                    </fieldset>--%>
<%--                                    <div class="modal-footer">--%>
<%--                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Quay lại</button>--%>
<%--                                        <button class="btn btn-secondary" data-bs-dismiss="modal" >Chỉnh sửa</button>--%>
<%--                                    </div>--%>
<%--                                </form>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--            </td>--%>
            <td>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#deleteModal${facility.id}">
                    Xoá
                </button>

                <!-- Modal -->
                <div class="modal fade" id="deleteModal${facility.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                <a href="/facility?action=delete&id=${facility.getId()}" class="btn btn-secondary" >Xoá</a>
                            </div>
                        </div>
                    </div>
                </div>

            </td>
<%--            <td><button>Delete</button></td>--%>
        </tr>
    </c:forEach>
    </tbody>

</table>



<script src="../../bootstrap/bootstrap-5.0.2-dist/js/bootstrap.js"></script>
<script src="../../bootstrap/jquery/jquery-3.5.1.min.js"></script>
<script src="../../bootstrap/datatables/js/jquery.dataTables.js"></script>
<script src="../../bootstrap/datatables/js/dataTables.bootstrap5.js"></script>
<script>
    $(document).ready(function () {
        $('#tableFacility').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</body>
</html>
