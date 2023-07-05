<%-- 
    Document   : checkout
    Created on : Jul 5, 2023, 4:32:12 PM
    Author     : giadu
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Check out | Lily Lane</title>
    <!-- Google font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@100;200;300;400&display=swap" rel="stylesheet">

    <!-- default -->
    <link rel="stylesheet" href="./assets/css/bootstrap.min/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/font/css/all.css">
    <link rel="stylesheet" href="./assets/css/toastMessage.css">
    <link rel="stylesheet" href="./assets/css/styleheader.css">
    <link rel="stylesheet" href="./assets/css/stylefooter.css">
    <!-- custom -->
    <link rel="stylesheet" href="./assets/css/stylecheckout.css">

</head>


<body>

    <c:import url="header.jsp"></c:import>


    <div class="container-fluid">
        <div class="row banner">
            <div class="banner-text">
                <h4>LiLy Lane Store</h4>
                <h1>CHECKOUT</h1>
            </div>
        </div>
    </div>
    
    <c:if test="${sessionScope.LOGIN_USER == null}">
        <div class="checkout-nologin">
            <div class="container">
                <div class="row">
                    <div class="title-page col-md-12">
                        <h4><a href="./home.html"><i class="fa-solid fa-home"></i></a>
                            <i class="fa-solid fa-angle-right"></i> Your shopping cart
                            <i class="fa-solid fa-angle-right"></i> Checkout
                        </h4>
                    </div>
                    <div class="col-md-12 text-center noti-checkout">
                        <img src="./assets/img/checkout/warning-icon.png" alt="" width="15%">
                        <h4>You must Login before the payment process</h4>
                        <a href="MainController?action=Login">Login here</a> 
                    </div>
                </div>

            </div>
        </div>
    </c:if>
    <c:if test="${sessionScope.LOGIN_USER != null}">

    <div class="background-container">
        <div class="container">
            <div class="row">
                <div class="title-page col-md-12">
                    <h4><a href="./home.html"><i class="fa-solid fa-home"></i></a>
                        <i class="fa-solid fa-angle-right"></i> Your shopping
                        cart
                        <i class="fa-solid fa-angle-right"></i> Checkout
                    </h4>
                </div>
            </div>
            <form action="MainController" method="POST">
                <div>
                    <div class="checkout">
                        <div>
                            <p>Billing Details</p>
                            <table class="table-cart">
                                <tr>
                                    <td>Full Name:</td>
                                    <td>${sessionScope.LOGIN_USER.fullName}</td>
                                </tr>
                                <tr>
                                    <td>Address:</td>
                                    <td><input type="text" value="${sessionScope.LOGIN_USER.address}"></td>
                                </tr>
                                <tr>
                                    <td>Email:</td>
                                    <td><input type="text" value="${sessionScope.LOGIN_USER.email}"></td>
                                </tr>

                            </table>
                        </div>

                        <div>
                            <table class="table-checkout">
                                <thead>
                                    <td colspan="2" class="title">
                                        Cart total
                                    </td>
                                </thead>
                                <tbody>
                                    <tr class="caculator">
                                        <td>Subtotal:</td>
                                        <td><fmt:formatNumber value="${requestScope.TOTAL_CART}" pattern="#,###" /></td>
                                    </tr>
                                    <tr class="caculator">
                                        <td>Shipping:</td>
                                        <td><fmt:formatNumber value="20000" pattern="#,###" /></td>
                                    </tr>
                                    <tr style="border-top: 2px solid #CCCCCC;"></tr>
                                    <tr class="caculator">
                                        <td>Total:</td>
                                        <td><fmt:formatNumber value="${requestScope.TOTAL_CART + 20000}" pattern="#,###" /></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>


                <div style="margin-top: 250px;">
                    <div class="checkout">
                        <div>
                            <p>Your Order</p>
                            <c:if test="${sessionScope.CHECKOUT != null}">
                            <table class="table table-cart">
                                <thead>
                                    <tr class="title">
                                        <th>Flower</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody class="left-tbody">
                                    <c:forEach var="entry" items="${sessionScope.CHECKOUT.cart}">
                                    <tr>
                                        <td>
                                            <div class="product">
                                                <img src="./assets/img/best-seller/${entry.value.img}" alt
                                                    width="70px" height="70px">
                                                <p>${entry.value.name}</p>
                                            </div>

                                        </td>
                                        <td class="quantity">
                                            ${entry.value.quantity}
                                        </td>
                                        <td><fmt:formatNumber value="${entry.value.price}" pattern="#,###" /></td>
                                        <td><fmt:formatNumber value="${entry.value.price * entry.value.quantity}" pattern="#,###" /></td>
                                    </tr>
                                    </c:forEach>
                                    
                                    
                                    <tr class="back-to-cart"> 
                                        <td><a href="MainController?action=ViewCart"><i class="fa-solid fa-arrow-left-long"></i> Back to Cart</a></td>
                                    </tr>
                                </tbody>
                            </table>
                            </c:if>
                        </div>

                        <div>
                            <table class="table-checkout">
                                <thead>
                                    <td colspan="2" class="title">
                                        Payment Method
                                    </td>
                                </thead>
                                <tbody>
                                    <tr class="payment">
                                        <td>
                                            <div class="vnpay-method">
                                                <label class="vnpay">
                                                    <input type="radio" name="payment-method" value="vnpay" required="">
                                                    <span class="radio-fake"></span>
                                                    <span class="lable">
                                                        <div style="cursor: pointer; height: 64px;">
                                                            <div class="payment-method_detail">
                                                                <img src="./assets/img/checkout/vnpay.png" alt="" width="40px">
                                                                <div style="margin-right: 12px;">
                                                                    <div class="payment-method_title">
                                                                        <span>Payment with VNPAY</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </span>
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="payment">
                                        <td>
                                            <div class="vnpay-method">
                                                <label class="vnpay">
                                                    <input type="radio" readonly name="payment-method" value="cod" required="">
                                                    <span class="radio-fake"></span>
                                                    <span class="lable">
                                                        <div style="cursor: pointer; height: 64px;">
                                                            <div class="payment-method_detail">
                                                                <img src="./assets/img/checkout/cash-delivery.png" alt="" width="40px">
                                                                <div style="margin-right: 12px;">
                                                                    <div class="payment-method_title">
                                                                        <span>Payment on delivery (COD)</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </span>
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="check-terms">
                                            <div class="terms">
                                                <input type="checkbox" required="">
                                                <p>I have read and accept the terms and conditions</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="check-out" readonly>
                                            <input type="hidden" name="totalPayment" value="${requestScope.TOTAL_CART + 20000}"/>
                                            <input type="submit" name="action" value="Payment">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    </c:if>

    <c:import url="footer.jsp"></c:import>

    <script src="./assets/js/bootstrap/jquery.min.js"></script>
    <script src="./assets/js/bootstrap/popper.min.js"></script>
    <script src="./assets/js/bootstrap/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.2/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.toast').toast({delay: 5000});
            $('.toast').toast('show');
        });
    </script>
</body>

</html>
