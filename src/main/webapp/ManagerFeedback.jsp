

<%@page import="entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="dao.DAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>-->
        <!-- Required meta tags-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Title Page-->
        <title>Manager Feedback</title>
        <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <!-- Main CSS-->
        <link href="css/manager.css" rel="stylesheet" media="all">
        <style>
            img {
                width: 100px;
                height: 100px;
            }
        </style>
    </head>
    <body>

        <div class="page-wrapper">
            <!-- MAIN CONTENT-->
                       <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <jsp:include page="common/menu.jsp"></jsp:include>
                        </div>
                    </div>
                </div>
            <!-- END MAIN CONTENT-->




            <!-- list------------------------------------------------------------------- -->
         
                                      
                          
            <div class="container">
               
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Manage <b>Feedback</b></h2>
                            </div>
                            <div class="col-sm-6">
                            </div>
                        </div>
                    </div>
                     <div>
                    <form class="form-inline" action="ManagerFeedbackController" method="get" style="float: right; margin-bottom: 16px; margin-top: 10px">
                                            <input class="form-control mr-sm-2" type="search" placeholder="Search by Product" aria-label="Search" name="txtSearch" value="${txtSearch}">
                                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Tìm kiếm</button>
                                    </form>
                </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>User Name</th>
                                <th>Product</th>
                                <th>Rating</th>
                                <th>Content</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listP}" var="o"> 
                                <tr>
                                    <td>${o.id}</td>
                                    <td>${o.userName}</td>
                                    <td>
                                        ${o.productName}
                                    </td>
                                    <td>${o.rating}</td>
                                    <td>${o.feedbackContent}</td>
                                    <td>${o.feedbackDate}</td>

                                </tr>
                            </c:forEach> 
                        </tbody>
                    </table>
                    <div class="clearfix">
                        <ul class="pagination">
                            <c:forEach begin="1" end="${totalPage}" var="i">
                                <li class="page-item ${pageIndex == i ? "active":""}""><a href="ManagerFeedbackController?pageIndex=${i}&txtSearch=${txtSearch}" class="page-link">${i}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>

            <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>
