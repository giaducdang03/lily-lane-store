<%-- 
    Document   : about
    Created on : Jul 8, 2023, 11:58:47 AM
    Author     : giadu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About us | Lily Lane</title>
    <!-- Google font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@100;200;300;400&display=swap" rel="stylesheet">
    <!-- boostrap -->
    <link rel="stylesheet" href="./assets/css/bootstrap.min/bootstrap.min.css">
    <!-- css -->
    <link rel="stylesheet" href="./assets/css/font/css/all.css">
    <link rel="stylesheet" href="./assets/css/styleheader.css">
    <link rel="stylesheet" href="./assets/css/stylefooter.css">
    <link rel="stylesheet" href="./assets/css/styleabout.css">
</head>

<body>
    
    <c:import url="header.jsp"></c:import>

    <div class="container-fluid">
        <div class="row banner">
            <div class="banner-text">
                <h4>LiLy Lane Store</h4>
                <h1>ABOUT US</h1>
            </div>
        </div>
    </div>
    <div class="container content">
        <div class="row">
            <div class="title-page col-md-12">
                <h4><a href="./home.html"><i class="fa-solid fa-home"></i></a>
                    <i class="fa-solid fa-angle-right"></i> About us
                </h4>
            </div>
        </div>
        <div class="main row">
            <div class="col-md-6">
                <div>
                    <div class="mb-5">
                        <img src="./assets/img/logo/lily-lane-logo-web.png" alt="" style="width: 250px;">
                    </div>
                    <h5>WEB PROJECT: LILY LANE STORE</h5>
                    <ul>
                        <li>Instructor: Doan Nguyen Thanh Hoa (HoaDTN)</li>
                        <li>Class: SE1717 - FPT University HCM</li>
                        <li>By Dang Phan Gia Duc</li>
                    </ul>
                    <h5>Main Function of website</h5>
                    <ul>
                        <li>Login / Register / Logout</li>
                        <li>User Management (for admin role)</li>
                        <li>Shopping: add to cart, update cart, checkout, payment</li>
                        <li>
                            <p style="color: #ff6b6b;">Payment with VNPAY</p>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="col-md-6">
                <div class="website">
                    <div class="img-mockup d-flex align-items-center">
                        <img src="./assets/img/about/website-mockup-psd.jpg" alt="">
                    </div>

                    <div class="img-mockup-text">
                        <div class="design">
                            <div class="">
                                <h5>DESIGN BY</h5>
                                <ul>
                                    <li>
                                        <p>Dang Phan Gia Duc</p>
                                    </li>
                                    <li>
                                        <a href="https://www.figma.com/file/A9PMzVANLpEjgcsLpBJM5o/Lily-Lane?type=design&node-id=0%3A1&mode=design&t=Zo5rc5ovohzb354t-1"
                                            target="_blank">Link Figma</a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="front-end">
                            <div>
                                <h5>FRONT END</h5>
                                <ul>
                                    <li>Dang Phan Gia Duc</li>
                                    <li>Duong Ton Bao - <a href="https://www.facebook.com/duongbao0803" target="_blank">Facebook</a></li>
                                </ul>
                                <p>
                                    <i class="fa-brands fa-github"></i>
                                    <a href="https://github.com/giaducdang03/flowerStore" target="_blank">Link GITHUB front end</a>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="backend-img d-flex align-items-center">
                        <img src="./assets/img/about/code-web.webp" alt="">
                    </div>

                    <div class="backend-text">
                        <div>
                            <h5>BACK END (Java Servlet/JSP/JSTL)</h5>
                            <ul style="margin-bottom: 5px;">
                                <li>Dang Phan Gia Duc</li>
                            </ul>
                            <div class="in4">
                                <p>
                                    <i class="fa-brands fa-github"></i>
                                    <a href="https://github.com/giaducdang03/lilylaneStore" target="_blank">Link project on GITHUB</a>
                                </p>
                                <p>
                                    <i class="fa-brands fa-facebook"></i>
                                    <a href="https://www.facebook.com/dang.giaduc03" target="_blank">Dang Gia Duc</a>
                                </p>
                                <p>
                                    <i class="fa-brands fa-google"></i> ducdpgse171092@fpt.edu.vn
                                </p>
                            </div>
                        </div>
                    </div>




                    <div class="technology-img d-flex align-items-center">
                        <img src="./assets/img/about/Technology-PNG-Transparent.png" alt="">
                    </div>

                    <div class="technology-text">
                        <div class="technology">
                            <div class="">
                                <h5>TECHNOLOGY</h5>
                                <ul>
                                    <li>Login use Google account</li>
                                    <li>reCAPTCHA for Register</li>
                                    <li>Use FETCH for add to cart</li>
                                    <li>Payment with <a href="https://vnpay.vn/" target="_blank">VNPAY</a></li>
                                    <li>Send bill via email customer</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <c:import url="footer.jsp"></c:import>

    <script src="./assets/js/bootstrap/jquery.min.js"></script>
    <script src="./assets/js/bootstrap/popper.min.js"></script>
    <script src="./assets/js/bootstrap/bootstrap.min.js"></script>
</body>

</html>
