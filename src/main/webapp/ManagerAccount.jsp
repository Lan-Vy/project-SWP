<%-- 
    Document   : ManagerProduct
    Created on : Jan 13, 2021, 2:08:03 PM
    Author     : Admin
--%>

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
        <title>Manager Account</title>
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
                                    <h2>Manage <b>Product</b></h2>
                                </div>
                                <div class="col-sm-6">
                                    <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Account</span></a>
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Role</th>

                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${accounts}" var="o"> 
                                <tr>
                                    <td>${o.id}</td>
                                    <td>${o.userName}</td>
                                    <td>
                                        ${o.email}
                                    </td>
                                    <td> <c:choose>
                                            <c:when test="${o.role == 1}">
                                                <span class="badge bg-primary" style="background-color: #f1a899">User</span>
                                            </c:when>
                                            <c:when test="${o.role == 2}">
                                                <span class="badge bg-info text-dark" style="background-color: orange">Admin</span>
                                            </c:when>
                                            <c:when test="${o.role == 3}">
                                                <span class="badge bg-success" style="background-color: green">Shipper</span>
                                            </c:when>
                                        </c:choose></td>

                                </tr>
                            </c:forEach> 
                        </tbody>
                    </table>
                    <div class="clearfix">
                        <ul class="pagination">
                            <c:forEach begin="1" end="${totalPage}" var="i">
                                <li class="page-item ${pageIndex == i ? "active":""}""><a href="ManagerAccount?pageIndex=${i}" class="page-link">${i}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Edit Modal HTML -->
            <div id="addEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="addAccount" method="post">
                            <div class="modal-header">
                                <h4 class="modal-title">Add Account</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Name</label>
                                    <input name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input name="email" type="email" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label>Role</label>
                                    <select name="role" class="form-control" aria-label="Default select example">
                                        <option value="2">Admin</option>
                                        <option value="3">Shipper</option>
                                    </select>
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
