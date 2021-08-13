<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View List Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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

                    <c:if test="${user.isManage eq true}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Booking
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="ServletController?btAction=loadAllRequestNew">Request Process</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="ServletController?btAction=loadAllRequestHistory">Request History</a>
                            </div>
                        </li>    
                    </c:if>
                    <li class="nav-item">
                        <a class="nav-link" href="ServletController?btAction=Signout">Sign Out</a>
                    </li>
                </ul>

            </div>
        </nav>
        <c:set var="search" value="${requestScope.SearchAction}"/>
        <div class="mt-4"></div>
        <c:if test="${search eq 'History'}">
            <div class="row" style="margin: auto;width: 80%">
                <form action="ServletController" class="form-row" style="width: 100%;">
                    <div class="form-group col-sm-4">
                        <label for="searchDate">Search By Date</label>
                        <input type="date" value="${param.searchDate}" name="searchDate" class="form-control" id="searchDate" required >
                    </div>
                    <button name="btAction" value="SearchHistory" type="submit" class="btn btn-primary">SEARCH</button>
                </form>
            </div>
        </c:if>


        <div class="mt-4"></div>
        <div class="row" style="margin: auto;width: 80%">
            <c:set var="resutl" value="${requestScope.result}"/>
            <c:if test="${result !=null}"> 
                <c:if test="${not empty search}">
                    <h1>
                        ${search}
                    </h1>
                </c:if>
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Resource ID</th>
                            <th scope="col">User Request</th>
                            <th scope="col">Status</th>
                            <th scope="col">Date</th>

                            <c:if test="${empty requestScope.userRole}"> 
                                <c:if test="${search eq 'History'}">
                                    <th scope="col">Delete</th>
                                    </c:if>
                                    <c:if test="${search ne 'History'}">
                                    <th scope="col">Delete</th>
                                    <th scope="col">Accept</th>   
                                    </c:if>
                                </c:if>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dto" items="${result}" varStatus="counter">
                            <tr>
                                <th scope="row">${counter.count}</th>
                                <td>${dto.resourceID}</td>
                                <td>${dto.userID}</td>
                                <td>${dto.status}</td>
                                <td>${dto.createDate}</td>
                                <c:if test="${empty requestScope.userRole}"> 
                                    <c:if test="${search eq 'History'}">
                                        <c:if test="${dto.status eq 'delete'}">
                                            <td>
                                                <button disabled type="button" class="btn btn-danger">Removed</button>
                                            </td>    
                                        </c:if>
                                        <c:if test="${dto.status ne 'delete'}">
                                            <td>
                                                <a href="ServletController?btAction=updateStatusResource&requestID=${dto.requestID}&status=delete" class="btn btn-danger">Remove</a>
                                            </td>    
                                        </c:if>

                                    </c:if>
                                    <c:if test="${search ne 'History'}">
                                        <c:if test="${dto.status ne 'delete'}">

                                            <td>
                                                <a href="ServletController?btAction=updateStatusResource&requestID=${dto.requestID}&status=delete" class="btn btn-danger">Denied</a>
                                            </td>
                                            <c:if test="${dto.status eq 'accept'}">
                                                <td>
                                                    <button disabled class="btn btn-success">Accept</button>    
                                                </td>
                                            </c:if>
                                            <c:if test="${dto.status ne 'accept'}">
                                                <td>

                                                    <c:if test="${dto.isStock eq true}">
                                                        <a class="btn btn-warning">Cannot Accept(OutOfStock)</a>    
                                                    </c:if>
                                                    <c:if test="${dto.isStock eq false}">
                                                        <a href="ServletController?btAction=updateStatusResource&requestID=${dto.requestID}&status=accept" class="btn btn-success">Accept</a>    
                                                    </c:if>

                                                </td>
                                            </c:if>

                                        </c:if>
                                        <c:if test="${dto.status eq 'delete'}">
                                            <td>
                                                <button disabled class="btn btn-danger">Denied</button>
                                            </td>
                                            <td>
                                                <button disabled class="btn btn-success">Accept</button>    
                                            </td>
                                        </c:if>


                                    </c:if>

                                </c:if>

                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
            </c:if>
            <c:if test="${result == null}"> 
                <h2 style="color: red">List Empty</h2>
            </c:if>
        </div>
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
