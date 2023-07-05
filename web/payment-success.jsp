<%-- 
    Document   : payment-success
    Created on : Jul 5, 2023, 9:56:37 PM
    Author     : giadu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment | Lily Lane</title>
    <!-- Google font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@100;200;300;400&display=swap"
              rel="stylesheet">

        <!-- default -->
        <link rel="stylesheet" href="./assets/css/bootstrap.min/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/css/font/css/all.css">
        <link rel="stylesheet" href="./assets/css/toastMessage.css">
        <link rel="stylesheet" href="./assets/css/styleheader.css">
        <link rel="stylesheet" href="./assets/css/stylefooter.css">
        <!-- custom -->
        <link rel="stylesheet" href="./assets/css/stylepayment-success.css">
</head>

<body>
    
    <c:import url="header.jsp"></c:import>

    <div class="outline">
        <div class="container payment-body">
            <div class="row payment-container">
                <div class="col-md-12 pay-header">
                    <h5>PAYMENT INFORMATION</h5>
                </div>

                <div class="col-md-12 pay-img">
                    <img src="./assets/img/checkout/success-icon.png" alt="" width="100px">
                    <h4>Payment success</h4>
                </div>
                <div class="col-md-12 payment-in4">
                    <table>
                        <tbody>
                            <tr>
                                <th>Customer:</th>
                                <td>Duong Ton Bao</td>
                            </tr>
                            <tr>
                                <th>Email:</th>
                                <td>duongbao2k3@gmail.com</td>
                            </tr>
                            <tr>
                                <th>Order code:</th>
                                <td>ABC123456</td>
                            </tr>
                            <tr>
                                <th>Amout paid:</th>
                                <td class="amout">3.000.000 VND</td>
                            </tr>
                            <tr>
                                <th>Transaction ID:</th>
                                <td>2112122121</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-12 break">
                    <div class="line"></div>
                    <span>Details</span>
                    <div class="line"></div>
                </div>
                <div class="col-md-12 payment-details">
                    <table>
                        <tbody>
                            <tr>
                                <th>Billing content:</td>
                                <td>Thanh toan don hang: 685787</td>
                            </tr>
                            <tr>
                                <th>Bank code:</td>
                                <td>TP BANK</td>
                            </tr>
                            <tr>
                                <th>Payment type:</td>
                                <td>VISA</td>
                            </tr>
                            <tr>
                                <th>Bank transaction no:</td>
                                <td>54325626226</td>
                            </tr>
                            <tr>
                                <th>Payment date:</td>
                                <td>25/06/2023 21:25</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="thanks">
                        <p>Thank you for choosing us.</p>
                        <p>See you again!</p>
                    </div>
                    <div class="payment-footer">
                        <p><a href="#">Back to home page</a></p>
                        <p>Powered by <a href="#">VNPAY</a></p>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div>
            <div class="row footer">
                <div class="col-md-3" style="margin: auto;">
                    <div style="text-align: center;">
                        <img src="./assets/img/logo/353377363_270213872326179_7859750982400627396_n.png" alt=""
                            style="width: 120%;">
                    </div>
                </div>

                <div class="col-md-4">
                    <h2>ABOUT OUR SHOP</h2>
                    <ul>
                        <li><i class="fa-solid fa-map-location-dot"></i> 289 Tran Hung Dao, District 1, Ho
                            Chi
                            Minh City
                        </li>
                        <li><i class="fa-solid fa-paper-plane"></i> lilylanestore.flower@gmail.com</li>
                        <li><i class="fa-solid fa-phone"></i> 0989 899 998</li>
                    </ul>
                    <div class="icon">
                        <a href="#"><i class="fa-brands fa-square-facebook  fa-2x" style="color: #807171;"></i></a>
                        <a href="#"><i class="fa-brands fa-square-youtube  fa-2x" style="color: #807171;"></i></a>
                        <a href="#"><i class="fa-brands fa-square-twitter  fa-2x" style="color: #807171;"></i></a>
                        <a href="#"><i class="fa-brands fa-square-instagram  fa-2x" style="color: #807171;"></i></a>
                    </div>
                </div>
                <div class="col-md-2">
                    <h2>CUSTOMER SERVICE</h2>
                    <ul>
                        <li>Shipping Policy</li>
                        <li>Help & Contact Us</li>
                        <li>Terms and Conditions</li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <h2>INFORMATION</h2>
                    <ul>
                        <li>About Us</li>
                        <li>Delivery Information</li>
                        <li>Privacy Page</li>
                    </ul>
                </div>
            </div>
            <div class="row footer_bottom">
                <span>Copyright @2023 All rights reserved | <span style="font-weight: bold;">Lily
                        Lane</span></span>
            </div>
        </div>
    </div>

    <c:import url="footer.jsp"></c:import>

    <script src="./assets/js/bootstrap/jquery.min.js"></script>
    <script src="./assets/js/bootstrap/popper.min.js"></script>
    <script src="./assets/js/bootstrap/bootstrap.min.js"></script>
</body>

</html>
