<%-- 
    Document   : bill-manager
    Created on : Jul 20, 2023, 4:19:55 PM
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
        <title>Admin Page | Lily Lane</title>
        <!-- Google font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@100;200;300;400&display=swap"
              rel="stylesheet">
        <!-- boostrap -->
        <link rel="stylesheet" href="./assets/css/bootstrap.min/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/css/font/css/all.css">
        <link rel="stylesheet" href="./assets/css/toastMessage.css">
        <link rel="stylesheet" href="./assets/css/bill-manager.css">

    </head>

    <body>
        <c:if test="${sessionScope.LOGIN_USER == null}">
            <c:redirect url="MainController"></c:redirect>
        </c:if>
        <c:if test="${requestScope.MESSAGE != null}">
            <c:import url="toast.jsp"></c:import>
        </c:if>
        <div class="container-fluid header_main">
            <div class="container-fluid navbar-content">
                <nav class="navbar navbar-expand-lg">
                    <div class="logo col-md-2">
                        <a class="navbar-brand" href="MainController"><img
                                src="./assets/img/logo/lily-lane-logo-web.png" alt width="100px"></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                    </div>
                    <div class="service col-md-7 collapse navbar-collapse" id="navbarSupportedContent">
                        <a class="nav-link active" href="#">Admin Page</a>


                    </div>
                    <div class="right-nav col-md-2">
                        <div class="account">
                            <div class="logo-admin">
                                <img src="./assets/img/admin/avt-admin.png" alt="" width="60px">
                            </div>
                            <div class="admin-text">
                                <p>ADMIN</p>
                                <p>${sessionScope.LOGIN_USER.fullName}</p>
                            </div>
                        </div>
                    </div>
                    <div class="bell col-md-1">
                        <a href="#"><i class="fa-solid fa-bell"></i></a>
                    </div>
                </nav>
            </div>
        </div>

        <div class="body-main">
            <div class="row" style="margin: 0px;">
                <div class="left-bar col-md-2">
                    <div class="service">
                        <ul class="list-service">
                            <a href="#">
                                <li><i class="fa-solid fa-chart-line"></i> Dashboard</li>
                            </a>
                            <a href="admin.jsp">
                                <li><i class="fa-regular fa-user"></i> User </li>
                            </a>
                            <a href="#">
                                <li><i class="fa-solid fa-bars-progress"></i> Product</li>
                            </a>
                            <a href="MainController?action=Order">
                                <li><i class="fa-solid fa-file-invoice"></i> Order </li>
                            </a>
                            <c:url var="logoutLink" value="MainController">
                                <c:param name="action" value="Logout"></c:param>
                            </c:url>
                            <a href="${logoutLink}">
                                <li><i class="fa-solid fa-right-from-bracket"></i> Logout</li>
                            </a>
                        </ul>
                    </div>
                </div>

                <div class="right-bar col-md-10" style="  background-color: #f2f6fa;">
                    <div class="info">
                        <p>Order Management</p>
                    </div>
                    <form action="MainController" method="POST">
                        <div class=" order-list">
                            <p>Order List</p>
                            <div>
                                <input type="text" name="search" placeholder="Search by userID" value="${param.search}"/>
                                <input type="hidden" name="action" value="OrderSearch">
                                <input type="submit" value="Search">
                            </div>
                        </div>

                    </form>

                    <div class="list-order">
                        <c:if test="${requestScope.LIST_ORDER != null}">
                            <c:if test="${not empty requestScope.LIST_ORDER}">
                                <table class="table">
                                    <tr>
                                        <td>Order Code</td>
                                        <td>User ID</td>
                                        <td>Order Date</td>
                                        <td>Total</td>
                                        <td>Payment Method</td>
                                        <td>Payment Date</td>
                                        <td>Status</td>
                                        <td style="text-align: center">is Success</td>
                                        <td style="text-align: center;">Change</td>
                                    </tr>
                                    <c:forEach var="order" items="${requestScope.LIST_ORDER}">
                                        <form action="MainController" method="POST">
                                            <tr style="background-color: white; border: none;">
                                                <td style="font-weight: bold">#${order.orderCode}</td>
                                                <td class="userID">${order.userID}</td>
                                                <td>
                                                    ${order.orderDate}
                                                </td>
                                                <td>
                                                    <fmt:formatNumber value="${order.total}" pattern="#,###" /> &#8363;
                                                </td>
                                                <td>${order.payment_method}</td>
                                                <td>
                                                    ${order.payment_date}
                                                </td>
                                                <td class="status status-${order.status.toLowerCase()}">
                                                    <p>${order.status}</p>
                                                </td>
                                                <td style="text-align: center">
                                                    <input type="checkbox" name="" required="" 
                                                        <c:if test="${order.status.toLowerCase() == 'completed'}">checked=""</c:if> 
                                                        <c:if test="${order.status.toLowerCase() == 'cancelled'}">disabled="true"</c:if>
                                                    />
                                                </td>
                                                <td class="action">
                                                    <div class="update">
                                                        <input type="hidden" name="action" value="UpdateStatusOrder">
                                                        <input type="hidden" name="orderCode" value="${order.orderCode}"/>
                                                        <button><i class="fa-solid fa-pen-to-square"></i></button>
                                                        <input type="hidden" name="search" value="${param.search}"/>
                                                    </div>
                                                </td>
                                            </tr>
                                        </form>
                                    </c:forEach>
                                </table>
                            </c:if>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>






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
