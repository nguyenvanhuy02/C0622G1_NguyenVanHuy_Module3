<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/10/2022
  Time: 10:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1 class="text-center">Thêm mới danh sách dịch vụ</h1>
<a href="../view/home.jsp">Quay lại trang chủ</a>
<form action="/facility?action=add" method="post">
    <pre>Name:                          <input type="text" name="name"></pre>
    <pre>Area:                          <input type="text" name="area"></pre>
    <pre>Cost:                          <input type="text" name="cost"></pre>
    <pre>Max People:                    <input type="text" name="maxPeople"></pre>
    <pre>Rent Type Id:                  <input type="text" name="rentTypeId"></pre>
    <pre>Facility Type Id:              <input type="text" name="facilityTypeId"></pre>
    <pre>Standard Room:                 <input type="text" name="standardRoom"></pre>
    <pre>Description Other Convenience: <input type="text" name="descriptionOtherConvenience"></pre>
    <pre>Pool Area:                     <input type="text" name="poolArea"></pre>
    <pre>Number Of Floors:              <input type="text" name="numberOfFloors"></pre>
    <pre>Facility Free:                 <input type="text" name="facilityFree"></pre>
    <pre>                               <button>Save</button></pre>
</form>
</body>
</html>
