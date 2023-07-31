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
                            <c:if test="${not empty sessionScope.LOGIN_USER.avatar}">
                            <div class="logo-admin">
                                <img style="border-radius: 50%" src="${LOGIN_USER.avatar}" alt="" width="60px">
                            </div>
                            </c:if>
                            <c:if test="${empty sessionScope.LOGIN_USER.avatar}">
                                <div class="logo-admin">
                                    <img src="./assets/img/admin/avt-admin.png" alt="" width="60px">
                                </div>
                            </c:if>
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
                            <a href="MainController?action=ViewAdminAccount">
                                <li><i class="fa-solid fa-user"></i> My account </li>
                            </a>
                            <a href="MainController?action=Admin">
                                <li><i class="fa-regular fa-user"></i> Manager User </li>
                            </a>
                            <a href="#">
                                <li><i class="fa-solid fa-bars-progress"></i> Manager Product</li>
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
                        <p>Manager User</p>
                    </div>
                    <div class="control-add-user">
                        <form action="MainController">
                            <div class="add-user">
                                <button onclick="showAddModal()" type="button">+ Add User</button>
                            </div>
                        </form>
                    </div>
                    <div class=" user-list">
                        <p>User List</p>
                        <div>
                            <form action="MainController">
                                <input type="text" name="search" placeholder="Search user" value="${param.search}"/>
                                <input type="submit" name="action" id="" value="Search"/>
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
                                            <form id="form-delete-${user.userID}" action="MainController">
                                                <input type="hidden" name="userID" value="${user.userID}">
                                                <input type="hidden" name="search" value="${param.search}"/>
                                                <input type="hidden" name="action" value="Delete">
                                                <button type="button" id="button-del" onclick="handleDelete('${user.userID}')" user-id="${user.userID}"><i class="fa-solid fa-trash-can"></i></button>
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
        <!-- Modal delete action -->
        <div class="modal fade modalDelete" id="deleteAction" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button onclick="closeModal()" type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true"><i class="fa-solid fa-times"></i></span>
                        </button>
                    </div>
                    <div class="text-center">
                        <img src="./assets/img/admin/canclled-icon_2.png" alt="" width="100px">
                    </div>
                    <div class="modal-body">
                        <h3 style="text-align: center;">Are you sure?</h3>
                        <p>
                            Do you really want to delete this User? This process cannot be undone.
                        </p>   
                    </div>
                    <div class="modal-footer">
                        <div>
                            <button onclick="closeModal()" type="button" class="button btn-close" data-dismiss="modal">Close</button>
                            <button id="delete-button" type="button" class="button btn-del">Delete</button>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        
        <!-- Modal add user -->
        <div class="modal fade modalAdd" id="addUserModal" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Add user</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true"><i class="fa-solid fa-times"></i></span>
                        </button>
                    </div>
                    <form action="MainController" method="POST">
                    <div class="modal-body">
                        
                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <label for="inputUserID">User ID</label>
                                    <input type="text" class="form-control" id="inputUserID" name="userID" placeholder="Enter user ID" required>
                                    <p class="mess-error">${requestScope.USER_ERROR.userIDError}</p>
                                </div>
                                <div class="col-md-6 form-group">
                                    <label for="inputUserAvt">Link avatar</label>
                                    <input type="url" class="form-control" id="inputUserAvt" name="avt" placeholder="Link avatar">
                                    <p class="mess-error"></p>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="inputFullName">Full name</label>
                                <input type="text" class="form-control" id="inputFullName" name="fullName" placeholder="Enter full name" required>
                                <p class="mess-error">${requestScope.USER_ERROR.fullNameError}</p>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword">Password</label>
                                <input type="text" class="form-control" id="inputPassword" value="123456" readonly>
                                <p class="mess-error"></p>
                            </div>
                            <div class="form-group">
                                <label for="inputRoleID">Role ID</label>
                                <select class="form-control" id="inputRoleID" name="roleID">
                                    <option value="AD">Admin</option>
                                    <option value="US">User</option>
                                </select>
                              </div>
                            <div class="form-group">
                                <label for="inputEmail">Email</label>
                                <input type="email" class="form-control" id="inputEmail" name="email" placeholder="example: abc@gmail.com" required="">
                                <p class="mess-error"></p>
                            </div>
                            <div class="form-group">
                                <label for="inputAddress">Address</label>
                                <input type="text" class="form-control" id="inputAddress" name="address" placeholder="Enter address" required="">
                                <p class="mess-error"></p>
                            </div>
                            <input type="hidden" name="action" value="AddUser"/>
                            <input type="hidden" name="search" value="${param.search}"/>
                        
                    </div>
                    <div class="modal-footer">
                        <button onclick="closeAddModal()" type="button" class="button btn-close" data-dismiss="modal">Close</button>
                        <button type="submit" class="button btn-add">Add</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
                            


        

        <script src="./assets/js/bootstrap/jquery.min.js"></script>
        <script src="./assets/js/bootstrap/popper.min.js"></script>
        <script src="./assets/js/bootstrap/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.2/js/bootstrap.bundle.min.js"></script>
        <c:if test="${requestScope.TYPE == 'add'}">
            <script>
                showAddModal();
            </script>
        </c:if>

        <script>
            $(document).ready(function () {
                $('.toast').toast({delay: 3000});
                $('.toast').toast('show');
            });
             
            function showAddModal() {
                $("#addUserModal").modal("show");
            }
            
            function closeAddModal() {
                $("#addUserModal").modal("hide");
            }
            
            function handleDelete(user_id) {
                let formID = "#form-delete-" + user_id;
                $("#deleteAction").modal("show");
                $("#delete-button").click(function () {
                    $(formID).submit();
                })
            }
            
            function closeModal(){
                $("#deleteAction").modal("hide");
            }
        </script>

    </body>

</html>