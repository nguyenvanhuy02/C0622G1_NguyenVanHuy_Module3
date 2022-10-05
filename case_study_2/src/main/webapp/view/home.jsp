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
                    <img src="/img/logo_furama.png" alt="" width="100" height="100">
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
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarCusomer" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Cusomer
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarService" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Service
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarContract" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Contract
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
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
        <div class="col-9">

        </div>


    </div>


</div>

<script src="../bootstrap/bootstrap-5.0.2-dist/js/bootstrap.js"></script>
</body>
</html>
