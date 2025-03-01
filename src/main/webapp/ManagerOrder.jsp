

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
        <title>Manager Order</title>
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
                                    <h2>Manage <b>Order</b></h2>
                                </div>
                                <div class="col-sm-6">
                                    <!--<a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>-->
                                    <!--<a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>-->
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <!--                                <th>
                                                                        <span class="custom-checkbox">
                                                                            <input type="checkbox" id="selectAll">
                                                                            <label for="selectAll"></label>
                                                                        </span>
                                                                    </th>-->
                                    <th >Order ID</th>
                                    <th >Recipient's Name</th>
                                    <th>Order Date</th>
                                    <th >Address Receive</th>
                                    <th >Phone Number</th>
                                    <th >Total Price</th>
                                    <th >Status</th>
                                    <c:if test="${sessionScope.acc.role == 2}">
                                    <th >Shipper</th>
                                    </c:if>
                                    <c:if test="${sessionScope.acc.role == 3}">
                                    <th >Action</th>
                                    </c:if>
                                <th style="text-align: center">Detail</th>

                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${orders}" var="o"> 
                                <tr>
                                    <td>${o.id}</td>
                                    <td>${o.name}</td>
                                    <td>
                                        ${o.date}
                                    </td>
                                    <td>${o.address}</td>
                                    <td>
                                        ${o.sdt}
                                    </td>
                                    <td>
                                        ${o.totalPrice}
                                    </td>  
                                    <td>
                                        <c:choose>
                                            <c:when test="${o.status == 0}">
                                                <span class="badge bg-warning text-dark" style="background-color: #fc466b">Pending</span>
                                            </c:when>
                                            <c:when test="${o.status == 1}">
                                                <span class="badge bg-primary" style="background-color: blue">Processing</span>
                                            </c:when>
                                            <c:when test="${o.status == 2}">
                                                <span class="badge bg-info text-dark" style="background-color: orange">Shipping</span>
                                            </c:when>
                                            <c:when test="${o.status == 3}">
                                                <span class="badge bg-success" style="background-color: green">Completed</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-secondary">Unknown</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>

                                    <c:if test="${sessionScope.acc.role == 2}">
                                        <td>
                                            <select class="shipper-select" data-order-id="${o.id}" <c:if test="${o.status > 1}">disabled</c:if>>
                                                <c:if test="${o.shipper.id == 0}">
                                                    <option value=""></option></c:if>
                                                <c:forEach items="${shippers}" var="s">
                                                    <option value="${s.id}" <c:if test="${o.shipper != null && o.shipper.id == s.id}">selected</c:if>>${s.userName}</option>
                                                </c:forEach>
                                            </select>
                                        </td>  
                                    </c:if>
                                    <c:if test="${sessionScope.acc.role == 3}">
                                        <td style="text-align: center">
                                            <c:choose>
                                                <c:when test="${o.status == 1}">
                                                    <button class="btn btn-warning update-status" data-order-id="${o.id}" data-status="2">Start Delivery</button>
                                                </c:when>
                                                <c:when test="${o.status == 2}">
                                                    <button class="btn btn-success update-status" data-order-id="${o.id}" data-status="3">Completed</button>
                                                </c:when>
                                            </c:choose>
                                        </td>

                                    </c:if>
                                    <td style="text-align: center">
                                        <a href="ManagerOrderDetail?orderId=${o.id}"><i class="material-icons" data-toggle="tooltip" title="Detail">&#xe24c;</i></a>
                                    </td>

                                </tr>
                            </c:forEach> 
                        </tbody>
                    </table>
                    <div class="clearfix">
                        <ul class="pagination">
                            <c:forEach begin="1" end="${totalPage}" var="i">
                                <li class="page-item ${pageIndex == i ? "active":""}""><a href="ManagerOrder?pageIndex=${i}" class="page-link">${i}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script src="js/manager.js" type="text/javascript"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
            <script>
                $(document).ready(function () {
                    $(".shipper-select").change(function () {
                        var orderId = $(this).data("order-id");  // Lấy ID đơn hàng từ select
                        var shipperId = $(this).val(); // Lấy giá trị shipper được chọn

                        $.ajax({
                            url: "AssignShipper", // Servlet xử lý cập nhật
                            type: "POST",
                            data: {orderId: orderId, shipperId: shipperId},
                            success: function (response) {
                                toastr.success('Updated status successfully!', 'Success', {timeOut: 1000});

                                // Chờ 1 giây sau khi toastr hiển thị xong mới reload trang
                                setTimeout(function () {
                                    location.reload();
                                }, 1000);
                            },
                            error: function () {
                                alert("Update failed. Please try again.");
                            }
                        });
                    });
                });

                $(document).ready(function () {
                    $(".update-status").click(function () {
                        var orderId = $(this).data("order-id");
                        var newStatus = $(this).data("status");

                        $.ajax({
                            url: "UpdateStatusOrder",
                            type: "POST",
                            data: {orderId: orderId, status: newStatus},
                            success: function (response) {
                                toastr.success('Order status updated successfully!', 'Success', {timeOut: 1000});

                                // Chờ 1 giây rồi reload trang để cập nhật UI
                                setTimeout(function () {
                                    location.reload();
                                }, 1000);
                            },
                            error: function () {
                                toastr.error('Failed to update order status!', 'Error');
                            }
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
