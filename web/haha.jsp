<%-- 
    Document   : haha
    Created on : Jul 4, 2023, 4:59:30 PM
    Author     : giadu
--%>

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
        <!-- boostrap -->
        <link rel="stylesheet" href="./assets/css/bootstrap.min/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/css/font/css/all.css">
        <link rel="stylesheet" href="./assets/css/styleheader.css">
        <link rel="stylesheet" href="./assets/css/stylefooter.css">
        <link rel="stylesheet" href="./assets/css/stylecart.css">



    </head>

    <style>

    </style>


    <body>
        <c:import url="header.jsp"></c:import>

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
                        <h4><a href="./home.html"><i class="fa-solid fa-home"></i></a>
                            <i class="fa-solid fa-angle-right"></i> Your shopping
                            cart
                        </h4>
                    </div>
                </div>
                <form action="">
                    <div class="checkout">
                        <table class="table table-cart">
                            <thead>
                                <tr class="title">
                                    <th>Flower</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody class="left-tbody">

                                <tr>
                                    <td>
                                        <div class="product">
                                            <img src="./assets/img/best-seller/Pink-Flower-Tree.png" alt width="70px"
                                                 height="70px">
                                            <p>Pink Flower Tree</p>
                                        </div>
                                    </td>
                                    <td> <span>$18.00</span></td>
                                    <td class="quantity">
                                        <input type="number" value="1" min="1">
                                    </td>
                                    <td>$18.00</td>
                                    <td>
                                        <div class="action">
                                            <div class="update">
                                                <!-- <input type="submit" value="Update"> -->
                                                <button><i class="fa-solid fa-pen-to-square"></i></button>
                                            </div>
                                            <div class="delete">
                                                <!-- <input type="submit" value="Delete"> -->
                                                <button><i class="fa-solid fa-trash-can"></i></button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="product">
                                            <img src="./assets/img/best-seller/Autumn-basket.webp" alt width="70px"
                                                 height="70px">
                                            <p>Autumn basket</p>
                                        </div>
                                    </td>
                                    <td> <span>$18.00</span></td>
                                    <td class="quantity">
                                        <input type="number" value="1" min="1">
                                    </td>
                                    <td>$18.00</td>
                                    <td>
                                        <div class="action">
                                            <div class="update">
                                                <!-- <input type="submit" value="Update"> -->
                                                <button><i class="fa-solid fa-pen-to-square"></i></button>
                                            </div>
                                            <div class="delete">
                                                <!-- <input type="submit" value="Delete"> -->
                                                <button><i class="fa-solid fa-trash-can"></i></button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="product">
                                            <img src="./assets/img/best-seller/Autumn-basket.webp" alt width="70px"
                                                 height="70px">
                                            <p>Autumn basket</p>
                                        </div>
                                    </td>
                                    <td> <span>$18.00</span></td>
                                    <td class="quantity">
                                        <input type="number" value="1" min="1">
                                    </td>
                                    <td>$18.00</td>
                                    <td>
                                        <div class="action">
                                            <div class="update">
                                                <!-- <input type="submit" value="Update"> -->
                                                <button><i class="fa-solid fa-pen-to-square"></i></button>
                                            </div>
                                            <div class="delete">
                                                <!-- <input type="submit" value="Delete"> -->
                                                <button><i class="fa-solid fa-trash-can"></i></button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="product">
                                            <img src="./assets/img/best-seller/Autumn-basket.webp" alt width="70px"
                                                 height="70px">
                                            <p>Autumn basket</p>
                                        </div>
                                    </td>
                                    <td> <span>$18.00</span></td>
                                    <td class="quantity">
                                        <input type="number" value="1" min="1">
                                    </td>
                                    <td>$18.00</td>
                                    <td>
                                        <div class="action">
                                            <div class="update">
                                                <!-- <input type="submit" value="Update"> -->
                                                <button><i class="fa-solid fa-pen-to-square"></i></button>
                                            </div>
                                            <div class="delete">
                                                <!-- <input type="submit" value="Delete"> -->
                                                <button><i class="fa-solid fa-trash-can"></i></button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="product">
                                            <img src="./assets/img/best-seller/Autumn-basket.webp" alt width="70px"
                                                 height="70px">
                                            <p>Autumn basket</p>
                                        </div>
                                    </td>
                                    <td> <span>$18.00</span></td>
                                    <td class="quantity">
                                        <input type="number" value="1" min="1">
                                    </td>
                                    <td>$18.00</td>
                                    <td>
                                        <div class="action">
                                            <div class="update">
                                                <!-- <input type="submit" value="Update"> -->
                                                <button><i class="fa-solid fa-pen-to-square"></i></button>
                                            </div>
                                            <div class="delete">
                                                <!-- <input type="submit" value="Delete"> -->
                                                <button><i class="fa-solid fa-trash-can"></i></button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="product">
                                            <img src="./assets/img/best-seller/Autumn-basket.webp" alt width="70px"
                                                 height="70px">
                                            <p>Autumn basket</p>
                                        </div>
                                    </td>
                                    <td> <span>$18.00</span></td>
                                    <td class="quantity">
                                        <input type="number" value="1" min="1">
                                    </td>
                                    <td>$18.00</td>
                                    <td>
                                        <div class="action">
                                            <div class="update">
                                                <!-- <input type="submit" value="Update"> -->
                                                <button><i class="fa-solid fa-pen-to-square"></i></button>
                                            </div>
                                            <div class="delete">
                                                <!-- <input type="submit" value="Delete"> -->
                                                <button><i class="fa-solid fa-trash-can"></i></button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
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
                                        <td>$167.00</td>
                                    </tr>
                                    <tr class="caculator">
                                        <td>Shipping:</td>
                                        <td>$3.00</td>
                                    </tr>
                                    <tr style="border-top: 2px solid #CCCCCC;"></tr>
                                    <tr class="caculator">
                                        <td class="total">Total:</td>
                                        <td class="cost">$170.00</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="check-out">
                                            <input type="submit" value="CHECK OUT">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="buy-more">
                                            <input type="submit" value="BUY MORE">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </form>


            </div>
        </div>

        <c:import url="footer.jsp"></c:import>

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
