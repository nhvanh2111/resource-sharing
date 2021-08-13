<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
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
                    <c:if test="${user.status eq false}">
                        <li class="nav-item">
                            <a class="nav-link" href="UserVerifyServlet">Verify Email</a>
                        </li>
                    </c:if>
                    <c:if test="${user.status eq true && user.isManage eq false}">
                        <li class="nav-item">
                            <a class="nav-link" href="ServletController?btAction=loadAllRequestHistoryUserID&userID=${user.userID}">Request History</a>
                        </li>
                    </c:if>
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
        <div class="mt-4"></div>
        <div class="row" style="margin: auto;width: 80%">
            <form action="ServletController" class="form-row" style="width: 100%;">
                <div class="form-group col-md-4">
                    <label for="searchName">Search By Name</label>
                    <input type="text" name="searchName" value="${param.searchName}" class="form-control" id="searchName" placeholder="Search By Name..." required>

                </div>
                <div class="form-group col-md-4">
                    <label for="searchCate">Search By Cate</label>
                    <select id="searchCate" class="form-control" name="searchCate">
                        <option value="E">Electronic</option>
                        <option value="P">Physical</option>
                    </select>
                </div>
                <div class="form-group col-sm-4">
                    <label for="searchDate">Search By Date</label>
                    <input type="date" value="${param.searchDate}" name="searchDate" class="form-control" id="searchDate" required >
                </div>
                <button name="btAction" value="Search" type="submit" class="btn btn-primary">SEARCH</button>
            </form>
        </div>
        <div class="mt-4"></div>
        <div class="row" style="margin: auto;width: 80%;padding: auto;">

            <c:set var="result" value="${requestScope.result}"/>
            <c:if test="${result != null}">
                <c:forEach var="dto" items="${result}">
                    <div class="card" style="width: 23rem; margin:21px;">
                        <img class="card-img-top" src="${dto.image}" alt="Card image cap" width="280" height="350">
                        <div class="card-body">
                            <h5 class="card-title">${dto.name}</h5>
                            <p class="card-text">Color: ${dto.color}</p>
                            <p class="card-text">Using Date: ${dto.usingDate}</p>
                            <p class="card-text">Quantity: ${dto.quantity}</p>
                            <div class="card-footer">

                                <c:if test="${user.isManage eq true}">
                                    <c:url var="viewListRequestByID" value="ServletController">
                                        <c:param name="btAction" value="loadListRequestByID" />
                                        <c:param name="resourceID" value="${dto.id}" />
                                    </c:url>
                                    <c:if test="${dto.booking eq true}">
                                        <a href="${viewListRequestByID}" class="btn btn-primary">View List User Request</a>
                                    </c:if>
                                    <c:if test="${dto.booking eq false}">
                                        <a class="btn btn-primary">Don't have User Request</a>
                                    </c:if>
                                </c:if>
                                <c:if test="${user.isManage eq false}">
                                    <c:url var="urlBooking" value="ServletController">
                                        <c:param name="btAction" value="Booking" />
                                        <c:param name="resourceID" value="${dto.id}" />
                                        <c:param name="userID" value="${user.userID}" />
                                        <c:param name="status" value="${user.status}" />
                                        <c:param name="btActionSearch" value="${requestScope.action}"/>
                                        <c:param name="searchName" value="${param.searchName}"/>
                                        <c:param name="searchCate" value="${param.searchCate}"/>
                                        <c:param name="searchDate" value="${param.searchDate}"/>
                                    </c:url>
                                    <c:if test="${dto.booking eq true}">
                                        <a class="btn btn-primary">Request Processing</a>
                                    </c:if>
                                    <c:if test="${dto.booking eq false}">
                                        <a href="${urlBooking}" class="btn btn-primary">Booking</a>
                                    </c:if>
                                </c:if>



                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${result == null}">
                <h2 style="color: red;">No Record Matching</h2>
            </c:if>

        </div>

        <div class="mt-4"></div>

        <c:set var="totalPage" value="${requestScope.totalPage}"/>
        <c:if test="${totalPage != null}"> 
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <c:forEach var="page"  begin="1" end="${totalPage}">
                        <c:url var="pageUrlRewriting" value="ServletController">
                            <c:param name="btAction" value="${requestScope.action}"/>
                            <c:param name="pageIndex" value="${page}"/>
                            <c:param name="searchName" value="${param.searchName}"/>
                            <c:param name="searchCate" value="${param.searchCate}"/>
                            <c:param name="searchDate" value="${param.searchDate}"/>
                        </c:url>
                        <c:if test="${page eq requestScope.pageIndexActive}">
                            <li class="page-item  active"><a class="page-link" href="${pageUrlRewriting}">${page}</a></li>
                        </c:if>
                        <c:if test="${page ne requestScope.pageIndexActive}">
                            <li class="page-item"><a class="page-link" href="${pageUrlRewriting}">${page}</a></li>
                        </c:if>
                        
                        </c:forEach>
              
                </ul>
            </nav>
        </c:if>


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
