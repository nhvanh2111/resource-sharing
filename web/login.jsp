<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/registration.css">
    <script src='https://www.google.com/recaptcha/api.js?hl=en'></script>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#" style="color: green;">Resource's Company</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="register.jsp">Register</a>
                </li>
            </ul>

        </div>
    </nav>
    <div class="mt-4"></div>
    <form action="ServletController" method="POST">
            <div class="container">
                <div style="text-align: center;">
                    <h1>Login</h1>
                </div>
                <hr>

                <c:if test="${not empty requestScope.FAILEMAIL}">
                    <label for="email"><b>Email</b></label>
                    <input style="border: 2px red solid;" type="email" placeholder="Enter Email" name="userID" id="email" required>
                    <h2 style="color: red;margin-top: -10px;">${requestScope.FAILEMAIL}</h2>
                </c:if>

                <c:if test="${empty requestScope.FAILEMAIL}">
                    <label for="email"><b>Email</b></label>
                    <input type="email" placeholder="Enter Email" name="userID" value="${param.userID}" id="email" required>
                </c:if>

                <c:if test="${not empty requestScope.FAILPASS}">
                    <label for="psw"><b>Password</b></label>
                    <input  style="border: 2px red solid;" type="password" placeholder="Enter Password" name="password" id="psw" required>
                    <h2 style="color: red;margin-top: -10px;">${requestScope.FAILPASS}</h2>
                </c:if>
                <c:if test="${empty requestScope.FAILPASS}">
                    <label for="psw"><b>Password</b></label>
                    <input type="password" placeholder="Enter Password" name="password" id="psw" required>
                </c:if>
                <div class="g-recaptcha"
                     data-sitekey="6Lc609QaAAAAAPKDpgYwT6ZIG_eewTpL0cyFWUbu">
                </div>
                <c:if test="${not empty requestScope.CAPTCHA}">
                    <p style="color: red;">${requestScope.CAPTCHA}</p>
                </c:if>

                <hr>
                <button name="btAction" type="submit" value="Login" class="loginbtn">Login</button>
            </div>

            <div class="container signin">
                <p>Register an account? <a href="register.jsp">Register</a>.</p>
            </div>
        </form>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>

</html>