<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/10/2022
  Time: 9:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="../bootstrap/bootstrap-5.0.2-dist/css/bootstrap.css">
</head>
<body>
<div class="container-fluid m-0 p-0">
    <div class="row" style="background: #0a58ca">
        <div class="col-3 header">
            <span>
                <a class="navbar-brand" href="#">
                    <img src="/img/logo.png" alt="" width="100" height="100" style="border-radius: 50%">
                </a>
            </span>
        </div>
        <div class="col-5 header"></div>
        <div class="col-4 header position-relative">
            <span class="position-absolute top-50 start-50 translate-middle">Nguyễn Văn Huy</span>
        </div>
    </div>
    <div class= "row p-0 m-0 sticky-top">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Home</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarEmployee" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Employee
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/employee">Danh sách nhân viên</a></li>
                                <li><a class="dropdown-item" href="/employee?action=add">Thêm Mới nhân viên</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarCusomer" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Cusomer
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/customer">Danh sách khách hàng</a></li>
                                <li><a class="dropdown-item" href="/customer?action=add">Thêm mới khách hàng</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarService" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Facility
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/facility">Danh sách dịch vụ</a></li>
                                <li><a class="dropdown-item" href="/facility?action=add">Thêm mới dịch vụ</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarContract" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Contract
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Danh sách hợp đồng</a></li>
                                <li><a class="dropdown-item" href="#">Thêm mới hợp đồng</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>
    </div>

    <div class="row">
        <div class="col-3">
            <ul style="list-style: none">
                <li>
                    <div class="card" style="width: 18rem;">
                        <img src="/img/img_furama.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="card" style="width: 18rem;">
                        <img src="/img/img_furama.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="card" style="width: 18rem;">
                        <img src="/img/img_furama.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="col-9" >
            <div class="row container-fluid" >
                <div>
                    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="/img/cover_furama_1.jpg" class="d-block w-100 " style="height: 450px;"  alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="/img/cover_furama_5.jpg" class="d-block w-100 " style="height: 450px;" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="/img/cover_furama_3.jpg" class="d-block w-100 " style="height: 450px;" alt="...">
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
            </div>
            <div class="row container-fluid">
                <h3 class="text-center">
                    KHU NGHỈ DƯỠNG ĐẲNG CẤP THẾ GIỚI, FURAMA ĐÀ NẴNG, NỔI TIẾNG LÀ KHU NGHỈ DƯỠNG ẨM THỰC TẠI VIỆT NAM.
                </h3>
                <p class="text-center fw-bold">
                    Hướng ra bãi biển Đà Nẵng trải dài cát trắng, Furama Resort Đà Nẵng là cửa ngõ đến với 3 di sản văn hoá thế giới: Hội An (20 phút), Mỹ Sơn (90 phút) và Huế (2 tiếng. 196 phòng hạng sang cùng với 70 căn biệt thự từ hai đến bốn phòng ngủ có hồ bơi riêng đều được trang trí trang nhã, theo phong cách thiết kế truyền thống của Việt Nam và kiến trúc thuộc địa của Pháp, biến Furama thành khu nghỉ dưỡng danh giá nhất tại Việt Nam – vinh dự được đón tiếp nhiều người nổi tiếng, giới hoàng gia, chính khách, ngôi sao điện ảnh và các nhà lãnh đạo kinh doanh quốc tế.
                </p>
                <div class="ratio ratio-16x9">
                    <iframe src="https://www.youtube.com/embed/IjlT_4mvd-c" title="YouTube video" allowfullscreen></iframe>
                </div>
            </div>
        </div>
    </div>
    <div class="footer bg-dark" style="height: 100px">Huy Huy Huy Huy Huy</div>

</div>

<script src="../bootstrap/bootstrap-5.0.2-dist/js/bootstrap.js"></script>
</body>
</html>
