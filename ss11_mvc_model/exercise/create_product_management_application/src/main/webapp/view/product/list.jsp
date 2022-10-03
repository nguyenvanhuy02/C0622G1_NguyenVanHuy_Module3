<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/9/2022
  Time: 2:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Product</title>
    <link rel="stylesheet" href="../../bootstrap-5.0.2-dist/css/bootstrap.css">
</head>
<body>
<h1>Danh sách sản phẩm</h1>

<c:if test="${mess != null}">
    <span>${mess}</span>
</c:if>

<a href="/product?action=add">Thêm mới</a>

<form action="/product?action=find" method="post" >
    <fieldset>
        <legend>Tìm kiếm sản phẩm</legend>
        Name : <input type="text" name="name">
        <input type="submit" value="Tìm kiếm">
    </fieldset>
</form>

<%--Cách dùng get --%>
<%--<form action="/product" >--%>
<%--    <input type="hidden" name="action" value="find">--%>
<%--    <fieldset>--%>
<%--        <legend>Tìm kiếm sản phẩm</legend>--%>
<%--        Name : <input type="text" name="name">--%>
<%--        <input type="submit" value="Tìm kiếm">--%>
<%--    </fieldset>--%>
<%--</form>--%>

<table class="table table-dark">
    <tr>
        <th>ID</th>
        <th>Tên sản phẩm</th>
        <th>Giá sản phẩm</th>
        <th>Mô tả sản phẩm</th>
        <th>Nhà sản xuất</th>
        <th>Chỉnh sửa</th>
        <th>Xoá</th>
        <th>Thông tin chi tiết</th>
    </tr>
    <c:forEach var="product" items="${productList}">
        <tr>
            <td>${product.getId()}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescribe()}</td>
            <td>${product.getProducer()}</td>
            <td><a href="/product?action=edit&id=${product.getId()}">Chỉnh sửa</a></td>
<%--            <td><a href="/product?action=delete&id=${product.getId()}">Xoá</a></td>--%>
            <td>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal${product.id}">
                    Xoá
                </button>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal${product.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel" style="color: #000">Xoá sản phẩm</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body" style="color: #000" >
                                Bạn có muốn xoá không ?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Quay lại</button>
                                <a href="/product?action=delete&id=${product.id}" class="btn btn-danger" >Xoá</a>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
            <td><a href="/product?action=view&id=${product.getId()}">Thông tin</a></td>
        </tr>
    </c:forEach>
</table>
<script src="../../bootstrap-5.0.2-dist/js/bootstrap.js" >

</script>
</body>
</html>
