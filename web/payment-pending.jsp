<%-- 
    Document   : pending
    Created on : Jul 5, 2023, 9:24:08 PM
    Author     : giadu
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pending | Lily Lane</title>
        <!-- Google font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@100;200;300;400&display=swap"
              rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=Signika Negative' rel='stylesheet'>

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
                        <img src="./assets/img/checkout/pending.png" alt="" width="100px">
                        <h4>Payment Pending</h4>
                    </div>
                    <div class="col-md-12 payment-in4">
                        <c:if test="${requestScope.ORDER == null}">
                            <h2>Opps.</h2>
                            <p>We'are sorry, but somthing went wrong.</p>
                            <a href="#">Go back to home page.</a>    
                        </c:if>
                        <table>
                            <tbody>
                                <tr>
                                    <th>Customer:</th>
                                    <td>${sessionScope.LOGIN_USER.fullName}</td>
                                </tr>
                                <tr>
                                    <th>Email:</th>
                                    <td>${sessionScope.LOGIN_USER.email}</td>
                                </tr>
                                <tr>
                                    <th>Address</td>
                                    <td>${sessionScope.LOGIN_USER.address}</td>
                                </tr>
                                <tr>
                                    <th>Order code:</th>
                                    <td>${requestScope.ORDER.orderCode}</td>
                                </tr>
                                
                                <tr>
                                    <th>Amount paid:</th>
                                    <td class="amout"><fmt:formatNumber value="${requestScope.ORDER.total}" pattern="#,###" /></td>
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
                                    <th>Payment type:</td>
                                    <td>Payment on delivery (COD)</td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="thanks">
                            <p>Thank you for choosing us.</p>
                            <p>See you again!</p>
                        </div>
                        <div class="payment-footer">
                            <p><a href="MainController">Back to home page</a></p>
                            <p>Powered by <a href="#">VNPAY</a></p>
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
