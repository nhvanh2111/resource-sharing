<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
        <title>Fail Verify Page</title>
    </head>
    <body>
        <c:set var="user" value="${sessionScope.USER}"/>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="ServletController?btAction=loadDefaul" style="color: green;">Resource's Company</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#" style="font-weight: bold;">Welcome ${user.fullName}!</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="UserVerifyServlet">Verify Email</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ServletController?btAction=Signout">Sign Out</a>
                    </li>
                </ul>

            </div>
        </nav>
        <div class="mt-4"></div>
        <h1 style="color:red;">Failed to send verification email</h1>
    </body>
</html>
