<%-- 
    Document   : login.jsp
    Created on : Jun 30, 2023, 9:46:45 PM
    Author     : giadu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page | Lily Lane</title>
        <!-- Google font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@100;200;300;400&display=swap"
              rel="stylesheet">
        <!-- boostrap -->
        <link rel="stylesheet" href="assets/css/bootstrap.min/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/font/css/all.css">
        <link rel="stylesheet" href="./assets/css/styleheader.css">
        <link rel="stylesheet" href="./assets/css/stylefooter.css">
        <link rel="stylesheet" href="./assets/css/toastMessage.css">
        <link rel="stylesheet" href="./assets/css/stylelogin.css">
    </head>

    <body onload="getCookiedata()">
        <c:import url="header.jsp"></c:import>
        
        <div class="background-img"></div>
        <div class="outline">
            <div class="background-url" id="container">
                <div class="form-container  login-container" id="login">
                    <form action="MainController" style="top: 60px;" method="POST">
                        <div class="header">
                            <div>SIGN IN</div>
                        </div>
                        <div class="login-type">
                            <div class="inputBox">
                                <input type="text" name="userID" required="" id="username"/>
                                <span>UserName</span>
                            </div>
                            <div class="inputBox">
                                <div class="password-input">
                                    <input type="password" name="password" required="" id="password-text" />
                                    <span>Password</span>
                                </div>
                            </div>
                        </div>
                        <li class="login-function">
                            <span><input type="checkbox" onclick="saveInfo()">Remember Me</span>
                            <a href="#" id="forgot-pass" onclick="forgot_pass()">Forgot Password?</a>
                            <p class="mess-error"><span>${requestScope.ERROR}</span></p>
                        </li>

                        <div class="login-success">
                            <input type="submit" name="action" value="Login"/>
                        </div>
                        <div class="other-login-icon">
                            <div class="or-login">
                                <div class="line"></div>
                                <span>OR</span>
                                <div class="line"></div>
                            </div>
                            <ul class="other-signin">
                                <a href="https://accounts.google.com/o/oauth2/auth?scope=profile email&redirect_uri=http://localhost:8080/LiLyLaneStore/LoginGoogleController&response_type=code&client_id=695980553416-fjh5nf3qs3al9lf9om7aullfr7p8o2bn.apps.googleusercontent.com&approval_prompt=force">
                                    <li><i class="fab fa-google"></i>Continue with Google</li>
                                </a>
                            </ul>
                        </div>

                    </form>
                </div>
                <div class="form-container register-container" id="register">
                    <div class="header">
                        <div>SIGN UP</div>
                    </div>
                    <form id="form-regis" action="MainController" method="POST">
                        <div class="login-type">
                            <div class="inputBox-signup">
                                <div class="inputBox">
                                    <input type="text" name="userID" required=""/>
                                    <span>UserName</span>
                                </div>
                                <p class="mess-error">${requestScope.USER_ERROR.userIDError}</p>
                            </div>

                            <div class="inputBox-signup">
                                <div class="inputBox">
                                    <input type="text" name="fullName" required=""/>
                                    <span>FullName</span>
                                </div>
                                <p class="mess-error">${requestScope.USER_ERROR.fullNameError}</p>
                            </div>

                            <div class="inputBox-signup">
                                <div class="inputBox">
                                    <input type="email" name="email" required=""/>
                                    <span>Email</span>
                                </div>
                                <p class="mess-error">${requestScope.USER_ERROR.emailError}</p>
                            </div>

                            <div class="inputBox-signup">
                                <div class="inputBox">
                                    <div class="password-input">
                                        <input type="password" name="password" required="" />
                                        <span>Password</span>
                                    </div>
                                </div>
                                <p class="mess-error">${requestScope.USER_ERROR.passwordError}</p>
                            </div>

                            <div class="inputBox-signup">
                                <div class="inputBox">
                                    <div class="password-input">
                                        <input type="password" name="confirm" required=""/>
                                        <span>Rewrite Password</span>
                                    </div>
                                </div>
                                <p class="mess-error">${requestScope.USER_ERROR.confirmError}</p>
                            </div>
                            <div class="inputBox-signup">
                                <div class="capcha">
                                    <div class="captcha" id="html_element"></div>
                                    <div id="error" style="color: red; font-size: 15px;"></div>
                                </div>
                            </div>
                        </div>
                        <div class="login-success">
                            <input type="hidden" name="action" value="Sign Up"/>
                            <input type="submit" value="Sign Up"/>
                            <input type="hidden" name="roleID" required="" value="US"/>
                        </div>
                    </form>
                </div>

                <div class="slide-box ${requestScope.TYPE == 'right' ? 'right' : ""}">
                    <div>
                        <h2>
                            Welcome to, Lilylane Store.
                        </h2>
                        <p class="slide-box-p1">
                            You bring the love. We’ll bring the flowers.
                        </p>
                        <p class="slide-box-p2">
                            If you don't have acount before, please touch button below
                        </p>

                    </div>
                    <button id="change" onclick="change()">
                        Create new Account
                    </button>
                </div>
            </div>

        </div>
        <c:if test="${requestScope.MESSAGE != null}">
            <c:import url="toast.jsp"></c:import>
        </c:if>

        <div class="pop-up" id="popup">
            <a href="#" onclick="hide()" id="close"><i class="fa fa-close" style="font-size:32px"></i></a>
            <h2>Forgot Password</h2>

            <p style="text-align: start;">Email</p>
            <input type="" placeholder="Username" required="" id="username" style="border: 2px solid black; width: 81%;">
            <span class="user"
                  style="background-color: yellow; border: 2px solid black; padding: 6px 15px; border-radius: 5px;">
                <i class="fa fa-paper-plane" aria-hidden="true"></i>
            </span>

            <p>Mã xác nhận (được gửi về Email)</p>
            <input type="" placeholder="Username" required="" id="username" style="border: 2px solid black;">
            <p style="margin-top: 0; margin-bottom: 10px;">Bạn vẫn chưa nhận được mã? <span
                    style="color:rgb(255,139,139);">Gửi lại</span></p>

            <input type="submit" value="SEND">
        </div>

        <c:import url="footer.jsp"></c:import>


        <script src="assets/js/bootstrap/jquery.min.js"></script>
        <script src="assets/js/bootstrap/popper.min.js"></script>
        <script src="assets/js/bootstrap/bootstrap.min.js"></script>
        <script src="./assets/js/login.js"></script>
        <script src="./assets/js/saveInfo.js"></script>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"async defer></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.2/js/bootstrap.bundle.min.js"></script>
        <script>
            $(document).ready(function() {
                $('.toast').toast({delay: 5000});
                $('.toast').toast('show');
            });
        </script>
        <script type="text/javascript" defer="">
            var onloadCallback = function () {
                grecaptcha.render('html_element', {
                    'sitekey': '6Le2n4kmAAAAAGA2sQ-4rJpYthuvckW-HfPawoN2'
                });
            };
        </script>
        <script>
			window.onload = function (){
                            let isValid = false;
				const form = document.getElementById("form-regis");
				const error = document.getElementById("error");
				
				form.addEventListener("submit", function (event){
					event.preventDefault();
					const response = grecaptcha.getResponse();
					if (response){
						form.submit();
					} else {
						error.innerHTML = "Please check reCAPTCHA.";
					}
				});
			}
	</script>
        <script>
            function change() {
                var changebtn = document.getElementById("change");
                var slidebox = document.querySelector(".slide-box");
                var slideboxp1 = document.querySelector(".slide-box-p1");
                var slideboxp2 = document.querySelector(".slide-box-p2");
                let data = changebtn.innerHTML;
                if (slidebox.classList.contains("right")) {
                    slideboxp1.innerHTML = "You bring the love. We’ll bring the flowers.";
                    slideboxp2.innerHTML = "If you don't have acount before, please touch button below";
                    changebtn.innerHTML = "Create new Account";
                    slidebox.classList.remove("right");
                } else {
                    slideboxp1.innerHTML = "Let us help you with all your flower needs.";
                    slideboxp2.innerHTML = "If you already have an account, click blow button to login";
                    changebtn.innerHTML = "Go to Login";
                    slidebox.classList.add("right");
                }

            }
            fill();

            function fill() {

                if ($('.slide-box').hasClass('right')) {
                    $('.slide-box-p1').html("Let us help you with all your flower needs.");

                    $('.slide-box-p2').html("If you already have an account, click blow button to login");
                    $('#change').html('Go to Login');
                } else {
                    $('.slide-box .slide-box-p1').text("You bring the love. We’ll bring the flowers.");
                    $('.slide-box-p2').html("If you don't have acount before, please touch button below");
                    $('#change').html('Create new Account');
                }

            }
            
        </script>
    </body>

</html>
