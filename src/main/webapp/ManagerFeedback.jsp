

<%@page import="entity.Category"%>
<%@page import="java.util.List"%>
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
                                <th>Order ID</th>
                                <th>Rating</th>
                                <th>Content</th>
                                <th>Reply Content</th>
                                <th>Date</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listP}" var="o"> 
                                <tr>
                                    <td>${o.id}</td>
                                    <td>${o.userName}</td>
                                    <td>
                                        ${o.orderId}
                                    </td>
                                    <td>${o.rating}</td>
                                    <td>${o.feedbackContent}</td>
                                    <td>${o.replyFeedbackContent}</td>
                                    <td>${o.feedbackDate}</td>
                                    <td>
                                        <c:if test="${o.replyUserId == 0}">
                                            <a href="#addEmployeeModal" class="edit reply-btn btn btn-sm btn-success"
                                               data-toggle="modal" data-feedback-id="${o.id}">
                                                Reply
                                            </a>
                                        </c:if>
                                    </td>

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
            <div id="addEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="add-reply" method="post">
                            <div class="modal-header">
                                <h4 class="modal-title">Add Reply</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <input type="hidden" name="feedbackId" id="feedbackId"> 
                                <div class="form-group">
                                    <label>Reply Message</label>
                                    <textarea name="replyMessage" class="form-control" required></textarea>
                                </div>


                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-success" value="Add">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <script src="js/manager.js" type="text/javascript"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    const replyButtons = document.querySelectorAll(".reply-btn"); // Chọn tất cả nút Reply
                    const feedbackIdInput = document.getElementById("feedbackId"); // Lấy input hidden

                    replyButtons.forEach(button => {
                        button.addEventListener("click", function () {
                            const feedbackId = this.getAttribute("data-feedback-id"); // Lấy feedbackId từ attribute
                            feedbackIdInput.value = feedbackId; // Gán vào input hidden
                        });
                    });
                });
            </script>

            <c:if test="${message != null}">
                <script type="text/javascript">
                    toastr.success(`${message}`, 'Success', {timeOut: 1000});
                </script>
            </c:if>
            <c:if test="${errorMessage != null}">
                <script type="text/javascript">
                    toastr.error(`${errorMessage}`, 'Error', {timeOut: 1000});
                </script>
            </c:if>
    </body>
</html>
