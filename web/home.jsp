<%-- 
    Document   : home
    Created on : Jun 30, 2023, 9:02:10 PM
    Author     : giadu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lily Lane</title>
    <!-- Google font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@100;200;300;400&display=swap" rel="stylesheet">
    <!-- boostrap -->
    <link rel="stylesheet" href="./assets/css/bootstrap.min/bootstrap.min.css">
    <!-- css -->
    <link rel="stylesheet" href="./assets/css/font/css/all.css">
    <link rel="stylesheet" href="./assets/css/stylehome.css">
</head>

<body>
    <c:import url="header.jsp"></c:import>

    <div class="body">
        <div class="banner">
            <div class="banner-img">
                <div class="banner-img-text">
                    <p>Flower & Gift</p>
                    <h1>Perfect Bunch </h1>
                    <h1>For Every Occasion</h1>
                    <a href="#move"><span>Shop Now</span></a>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid intro-product">
        <div class="hot-product">

            <div class="product">
                <div class="product-text">
                    <p>NEW ARRIVALS</p>
                    <p>For Birthdays.</p>
                    <p>Starting from <span>$19.00</span></p>
                    <input type="submit" value="SHOP NOW >" name="#move">
                </div>
                <div class="product-img-left child"></div>
            </div>

            <div class="product">
                <div class="product-text">
                    <p>ON SALES</p>
                    <p>For Birthdays.</p>
                    <p>Starting from <span>$19.00</span></p>
                    <input type="submit" value="SHOP NOW >">
                </div>
                <div class="product-img-center child"></div>
            </div>

            <div class="product">
                <div class="product-text">
                    <p>NEW ARRIVALS</p>
                    <p>For Birthdays.</p>
                    <p>Starting from <span>$19.00</span></p>
                    <input type="submit" value="SHOP NOW >">
                </div>
                <div class="product-img-right child"></div>
            </div>
        </div>
    </div>

    <div class="process">
        <div class="process-list">
            <div class="process-object">
                <i class="fa-regular fa-paper-plane fa-3x" style="color: #ff6b6b;"></i>
                <p>Delievred Express</p>
                <p>We ship express in our exclusive packing to provide your gifts with a 100% secure protected journey.
                </p>
            </div>
            <div class="process-object">
                <i class="fa-sharp fa-solid fa-medal fa-3x" style="color: #ff6b6b;"></i>
                <p>Checked for Quality</p>
                <p>We usr a 7-step process to unsure the quality of every single flower.</p>
            </div>
            <div class="process-object">
                <i class="fa-solid fa-gift fa-3x" style="color: #ff6b6b;"></i>
                <p>Weekly Exculive Gifts</p>
                <p>Visit The Loke and shop our selection of weekly special gifts for all today!</p>
            </div>
            <div class="process-object">
                <i class="fa-regular fa-message fa-3x" style="color: #ff6b6b;"></i>
                <p>Delievred Express</p>
                <p>We ship express in our exclusive packing to provide your gifts with a 100% secure protected journey.
                </p>
            </div>
        </div>
    </div>


    <div class="container-fluid best-seller" id="move">
        <div class="best-seller-title">
            <h1>BEST SELLER</h1>
            <p>We're more than just a pretty vase. Learn more about our flowers, our values, and our commitment to the
                planet.</p>
        </div>
        <div>
            <div class="best-seller-product">
            <c:if test="${sessionScope.listP != null}">
                <c:if test="${not empty sessionScope.listP}">
                    <c:forEach var="pro" items="${sessionScope.listP}">
                        <div class="best-seller-product-list">
                            <div class="hot-sale">HOT</div>
                            <form action="">
                                <div class="best-add-to-cart">
                                    <div class="cart-service">
                                        <button><i class="fa-solid fa-search"></i></button>
                                        <input type="submit" value="ADD TO CART">
                                        <button><i class="fa-solid fa-shuffle"></i></button>
                                    </div>
                                </div>
                                <div class="best-text">
                                    <p>${pro.name}</p>
                                    <p>${pro.price} &#8363;</p>
                                </div>
                            </form>
                            <div class="best-seller-product-object-one child" style="background-image: url('./assets/img/best-seller/${pro.img}');"></div>
                        </div>
                    </c:forEach>
                </c:if>
            </c:if>
            <c:if test="${sessionScope.listP == null}">
                <h3 style="color: red">Sold Out.</h3>
            </c:if>
                
            </div>
        </div>
    </div>
    </div>





    <div class="subscribe">
        <div class="subcribe-img">
            <div class="subcribe-img-object">
                <div class="subcribe-img-text">
                    <h1>Subscribe</h1>
                    <h1>for New Updates!</h1>
                    <p>When looking for a new bouquet idea for Valentine or Mother's Day, ask us for a tip!
                    </p>
                </div>
                <div class="subcribe-search">
                    <input type="text" placeholder="Enter your email">
                    <button><i class="fa-solid fa-paper-plane"></i></button>
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
