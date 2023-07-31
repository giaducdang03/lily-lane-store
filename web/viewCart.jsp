<%-- 
    Document   : viewCart
    Created on : Jul 4, 2023, 4:14:48 PM
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
        <title>Cart | Lily Lane</title>
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
        <link rel="stylesheet" href="./assets/css/stylecart.css">

    </head>

    <body>
        
        <c:import url="header.jsp"></c:import>
        
        <c:if test="${sessionScope.CART == null}">
            <c:import url="cartNull.jsp"></c:import>
        </c:if>

        <c:if test="${sessionScope.CART != null}">
            <c:if test="${empty sessionScope.CART.cart}">
                <c:import url="cartNull.jsp"></c:import>
            </c:if>
            <c:if test="${not empty sessionScope.CART.cart}">
                <div class="container-fluid">
                    <div class="row banner">
                        <div class="banner-text">
                            <h4>LiLy Lane Store</h4>
                            <h1>MY CART</h1>
                        </div>
                    </div>
                </div>

                <div class="background-container">
                    <div class="container">
                        <div class="row">
                            <div class="title-page col-md-12">
                                <h4><a href="MainController"><i class="fa-solid fa-home"></i></a>
                                    <i class="fa-solid fa-angle-right"></i> Your shopping cart
                                </h4>
                            </div>
                        </div>

                        <div class="checkout">
                            <table class="table table-cart">
                                <thead>
                                    <tr class="title">
                                        <th style="text-align: left">Flower</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody class="left-tbody">
                                    <c:forEach var="entry" varStatus="counter" items="${sessionScope.CART.cart}">
                                        <c:set scope="request" var="total" value="${requestScope.total + entry.value.quantity * entry.value.price}"></c:set>
                                        <form action="MainController">
                                            <tr>
                                                <td>
                                                    <div class="product">
                                                        <img src="./assets/img/best-seller/${entry.value.img}" alt width="70px"
                                                         height="70px">
                                                    <p>${entry.value.name}</p>
                                                </div>
                                            </td>
                                            <td> <span><fmt:formatNumber value="${entry.value.price}" pattern="#,###" /></span></td>
                                            <td class="quantity">
                                                <input type="number" name="quantity" value="${entry.value.quantity}" min="1">
                                            </td>
                                            <td><fmt:formatNumber value="${entry.value.price * entry.value.quantity}" pattern="#,###" /></td>
                                            <td>
                                                <div class="action">
                                                    <div class="update">
                                                        <input type="hidden" name="action" value="UpdateCart"/>
                                                        <input type="hidden" name="productID" value="${entry.value.ID}"/>
                                                        <button><i class="fa-solid fa-pen-to-square"></i></button>
                                                    </div>
                                        </form>   
                                    <div class="delete">
                                        <form action="MainController">
                                              <input type="hidden" name="action" value="DeleteCart"/>
                                              <input type="hidden" name="productID" value="${entry.value.ID}"/>
                                            <button><i class="fa-solid fa-trash-can"></i></button>
                                        </form>
                                    </div>
                            </div>
                            </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                        </table>

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
                                        <td><fmt:formatNumber value="${requestScope.total}" pattern="#,###" /> &#8363;</td>
                                    </tr>
                                    <tr class="caculator">
                                        <td>Shipping:</td>
                                        <td><fmt:formatNumber value="20000" pattern="#,###" /> &#8363;</td>
                                    </tr>
                                    <tr style="border-top: 2px solid #CCCCCC;"></tr>
                                    <tr class="caculator">
                                        <td class="total">Total:</td>
                                        <td class="cost"><fmt:formatNumber value="${requestScope.total + 20000}" pattern="#,###" /></td>
                                    </tr>
                                <form action="MainController" method="POST">
                                    <tr>
                                        <td colspan="2" class="check-out">
                                            <input onclick="showToast()" type="submit" name="action" value="CHECKOUT"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="buy-more">
                                            <input type="submit" name="" value="BUY MORE"/>
                                        </td>
                                    </tr>
                                </form>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>


                </div>
            </div>
        </c:if>
    </c:if>
    
    <c:if test="${requestScope.MESSAGE != null}">
        <c:import url="toast.jsp"></c:import>
    </c:if>


    <c:import url="footer.jsp"></c:import>

    <script src="./assets/js/bootstrap/jquery.min.js"></script>
    <script src="./assets/js/bootstrap/popper.min.js"></script>
    <script src="./assets/js/bootstrap/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.2/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.toast').toast({delay: 3000});
            $('.toast').toast('show');
        });
    </script>
</body>

</html>