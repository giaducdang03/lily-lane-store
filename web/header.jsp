<%-- 
    Document   : header
    Created on : Jul 1, 2023, 11:20:50 AM
    Author     : giadu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container-fluid" id="header">
    <div class="container" id="header-content">
        <p class="mail"><i class="fa-regular fa-paper-plane"></i> lilylanestore.flower@gmail.com</p>
        <p class="phone"><i class="fa-solid fa-phone"></i> +84 98 088 9898</p>
        <p class="signal"></i> Whatever the occasion, we'll find a bouquet</p>


    </div>
</div>

<div class="container-fluid header_main">
    <div class="container-fluid navbar-content">
        <nav class="navbar navbar-expand-lg">
            <div class="logo col-md-3">
                <a class="navbar-brand" href="#"><img src="./assets/img/logo/lily-lane-logo-web.png" alt
                                                      width="100px"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
            <div class="service col-md-6 collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class=" nav-item ">
                        <a class="nav-link active" href="#">Home</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Flower Gallery</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Service</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
                    </li>
                </ul>
            </div>
            <div class="right-nav nav-item col-md-3">
                <ul class="col-md-5 cart navbar-nav mr-auto">
                    <li class="nav-item" style="padding: 0;">
                        <a class="nav-link" href="#" style="font-size: 20px;"><i
                                class="fa-solid fa-cart-shopping"></i></a>
                    </li>
                </ul>
                <c:if test="${sessionScope.LOGIN_USER == null}">
                    <div class="col-md-7 account">
                        <a href="MainController?action=Login"><i class="fa-solid fa-user"></i> Login</a>
                    </div>
                </c:if>
                <c:if test="${sessionScope.LOGIN_USER != null}">
                    <div class="col-md-7 account">
                        <li style="list-style-type: none;" class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa-solid fa-user"></i> ${sessionScope.LOGIN_USER.fullName}
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <c:if test="${sessionScope.LOGIN_USER.roleID == 'AD'}">
                                    <a class="dropdown-item" href="admin.jsp">My account</a>
                                </c:if>
                                <c:if test="${sessionScope.LOGIN_USER.roleID == 'US'}">
                                    <a class="dropdown-item" href="user.jsp">My account</a>
                                </c:if>
                                <a class="dropdown-item" href="MainController?action=Logout">Logout</a>
                            </div>
                        </li>
                    </div>
                </c:if>
                
            </div>
        </nav>
    </div>
</div>
<!-- end: header  -->
