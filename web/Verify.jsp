<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <title>Verify Page</title>
    </head>
    <body>
        <c:set var="user" value="${sessionScope.USER}"/>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="ServletController?btAction=LoadDefaul" style="color: green;">Resource's Company</a>
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
                        <a class="nav-link" href="ServletController?btAction=Signout">Sign Out</a>
                    </li>
                </ul>

            </div>
        </nav>
        <div class="mt-4"></div>
        <div style="margin-top: 20px;"></div>
        <form action="VerifyCodeServlet">
            <div class="input-group mb-3" style="width: 60%; margin: auto;">
                <c:if test="${empty requestScope.INCORRECT}">
                    <input type="number" name="authcode" class="form-control" placeholder="Input Code..." aria-label="Apply Discount"
                           aria-describedby="basic-addon2">
                    <div class="input-group-append">
                        <button class="btn btn-outline-primary" type="submit">Verify Code</button>
                    </div>
                </c:if>
                <c:if test="${not empty requestScope.INCORRECT}">
                    <input type="number" name="authcode" class="form-control" placeholder="Input Code..." aria-label="Apply Discount"
                           value="${param.authcode}" style="border: 1px red solid;" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                        <button class="btn btn-outline-primary" type="submit">Verify Code</button>
                    </div>
                    <h2 style="color: red; text-align: center;">
                        ${requestScope.INCORRECT}
                    </h2>
                </c:if>
            </div>

        </form>
    </body>
</html>