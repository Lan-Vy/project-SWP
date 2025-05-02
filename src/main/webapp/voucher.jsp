<%@page import="dao.VoucherDAO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Revolt Athletics | Available Vouchers</title>
        <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        <link rel="icon" href="img/core-img/favicon2.ico">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/core-style.css">
        <style>
            body {
                background-color: #f8f9fa;
            }
            .section-padding-100 {
                padding: 50px;
            }
            .cart-title h2 {
                font-weight: 600;
                margin-bottom: 30px;
                color: #333;
                text-align: center;
            }
            table {
                background: #ffffff;
                border-radius: 10px;
                overflow: hidden;
                box-shadow: 0 4px 8px rgba(0,0,0,0.05);
            }
            thead {
                background-color: #343a40;
                color: #ffffff;
            }
            .badge-success {
                background-color: #28a745;
            }
            .badge-danger {
                background-color: #dc3545;
            }
        </style>
    </head>
    <body>
        <jsp:include page="common/header.jsp"/>

        <div class="section-padding-100 container">
            <div class="cart-title mt-50">
                <h2>Available Vouchers</h2>
            </div>

            <fmt:setLocale value="vi_VN"/>

            <!-- Error Message -->
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger text-center">${errorMessage}</div>
            </c:if>

            <!-- Load voucher data -->
            <c:set var="voucherDAO" value="<%= new VoucherDAO()%>" />
            <c:set var="vouchers" value="${voucherDAO.getAllVouchers()}" />

            <table class="table table-bordered table-hover mt-3">
                <thead>
                    <tr>
                        <th>Code</th>
                        <th>Discount (%)</th>
                        <th>Min Order Value</th>
                        <th>Start Date</th>
                        <th>Expiry Date</th>
                        <th>Quantity</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="v" items="${vouchers}">
                        <c:if test="${v.active}">
                            <tr>
                                <td>${v.code}</td>
                                <td>${v.discountPercent}</td>
                                <td><fmt:formatNumber value="${v.minOrderValue}" type="currency"/></td>
                                <td><fmt:formatDate value="${v.startDate}" pattern="yyyy-MM-dd"/></td>
                                <td><fmt:formatDate value="${v.expiryDate}" pattern="yyyy-MM-dd"/></td>
                                <td>${v.quantity}</td>
                                <td>
                                    <span class="badge badge-success">Active</span>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>

                </tbody>
            </table>
        </div>

        <jsp:include page="common/footer.jsp"></jsp:include>
        <!-- ##### Footer Area End ##### -->

        <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <!-- Popper js -->
        <script src="js/popper.min.js"></script>
        <!-- Bootstrap js -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Plugins js -->
        <script src="js/plugins.js"></script>
        <!-- Active js -->
        <script src="js/active.js"></script>
    </body>
</html>
