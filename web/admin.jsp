<%-- 
    Document   : admin
    Created on : Jun 30, 2023, 10:19:10 PM
    Author     : giadu
--%>

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
    <link rel="stylesheet" href="./assets/css/styleadmin.css">

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
                        <a href="#">
                            <li><i class="fa-regular fa-user"></i> Manager User </li>
                        </a>
                        <a href="#">
                            <li><i class="fa-solid fa-bars-progress"></i> Manager Product</li>
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
                    <p>Manager User</p>
                </div>
                    <div class="control-add-user">
                        <form action="MainController">
                            <div class="add-user">
                                <input type="submit" name="" value="+ Add User">
                            </div>
                        </form>
                    </div>
                    <div class=" user-list">
                        <p>User List</p>
                        <div>
                            <form action="MainController">
                                <input type="text" name="search" placeholder="Search user" value="${param.search}"/>
                                <input type="submit" name="action" id="" value="Search">
                            </form>
                        </div>
                    </div>          
                <div class="list-info">
                    <c:if test="${requestScope.LIST_USER != null}">
                        <c:if test="${not empty requestScope.LIST_USER}">
                            <table class="table">
                                <tr>
                                    <td>No</td>
                                    <td>User ID</td>
                                    <td>Full Name</td>
                                    <td>Role ID</td>
                                    <td>Address</td>
                                    <td>Email</td>
                                    <td style="text-align: center;">Action</td>
                                </tr>
                                <c:forEach var="user" varStatus="counter" items="${requestScope.LIST_USER}">
                                    <form action="MainController" method="POST">
                                        <tr style="background-color: white; border: none;">
                                            <td>${counter.count}</td>
                                            <td class="userID">${user.userID}</td>
                                            <td class="name">
                                                <input type="text" name="fullName" value="${user.fullName}"/>
                                            </td>
                                            <td class="role">
                                                <input type="text" name="roleID" value="${user.roleID}"/>
                                            </td>
                                            <td class="address">${user.address}</td>
                                            <td>${user.email}</td>
                                            <td class="action">
                                                <div class="update">
                                                    <input type="hidden" name="action" value="Update">
                                                    <input type="hidden" name="userID" value="${user.userID}">
                                                    <input type="hidden" name="search" value="${param.search}"/>
                                                    <button><i class="fa-solid fa-pen-to-square"></i></button>
                                                </div>
                                            </form>
                                                <div class="delete">
                                                    <form action="MainController">
                                                        <input type="hidden" name="userID" value="${user.userID}">
                                                        <input type="hidden" name="search" value="${param.search}"/>
                                                        <input type="hidden" name="action" value="Delete">
                                                        <button><i class="fa-solid fa-trash-can"></i></button>
                                                    </form>
                                                    
                                                </div>
                                            </td>
                                        </tr>
                                    
                                </c:forEach>
                            </c:if>
                        </c:if>   
                    </table>
                </div>



            </div>
        </div>
    </div>






    <script src="./assets/js/bootstrap/jquery.min.js"></script>
    <script src="./assets/js/bootstrap/popper.min.js"></script>
    <script src="./assets/js/bootstrap/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.2/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.toast').toast({delay: 5000});
            $('.toast').toast('show');
        });
    </script>

</body>

</html>