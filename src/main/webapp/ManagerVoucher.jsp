<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Voucher</title>
    <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="css/manager.css" rel="stylesheet" media="all">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
<div class="container">
    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-6">
                    <h2>Manage <b>Vouchers</b></h2>
                </div>
                <div class="col-sm-6 text-right">
                    <button class="btn btn-success" data-toggle="modal" data-target="#addVoucherModal">
                        <i class="material-icons">&#xE147;</i> <span>Add New Voucher</span>
                    </button>
                    
                </div>
            </div>
        </div>

        <!-- Error Message -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">${errorMessage}</div>
        </c:if>

        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>Code</th>
                    <th>Discount (%)</th>
                    <th>Min Order Value</th>
                    <th>Start Date</th>
                    <th>Expiry Date</th>
                    <th>Quantity</th>
                    <th>Status</th>
                    <th style="text-align:center;">Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="v" items="${vouchers}">
                    <tr>
                        <td>${v.code}</td>
                        <td>${v.discountPercent}</td>
                        <td>${v.minOrderValue}</td>
                        <td><fmt:formatDate value="${v.startDate}" pattern="yyyy-MM-dd"/></td>
                        <td><fmt:formatDate value="${v.expiryDate}" pattern="yyyy-MM-dd"/></td>
                        <td>${v.quantity}</td>
                        <td>
                            <c:choose>
                                <c:when test="${v.active}">
                                    <span class="label label-success">Active</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="label label-danger">Inactive</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td style="text-align:center;">
                            <form action="ManagerVoucher" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="delete"/>
                                <input type="hidden" name="id" value="${v.id}"/>
                                <button type="submit" class="btn btn-danger btn-sm"
                                    onclick="return confirm('Are you sure you want to delete this voucher?');">
                                    <i class="material-icons">&#xE872;</i>
                                </button>
                            </form>
                            <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#updateVoucherModal"
                                data-id="${v.id}" data-code="${v.code}" data-discount="${v.discountPercent}" 
                                data-min-order="${v.minOrderValue}" data-start-date="${v.startDate}" 
                                data-expiry-date="${v.expiryDate}" data-quantity="${v.quantity}" 
                                data-active="${v.active}">
                                <i class="material-icons">&#xE254;</i> Update
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Add Voucher Modal -->
<div id="addVoucherModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="addVoucherModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form action="ManagerVoucher" method="post">
                <input type="hidden" name="action" value="add" />
                <div class="modal-header">
                    <h4 class="modal-title" id="addVoucherModalLabel">Add New Voucher</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Voucher Code</label>
                        <input type="text" name="code" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Discount Percent (%)</label>
                        <input type="number" name="discountPercent" class="form-control" min="1" max="100" required>
                    </div>
                    <div class="form-group">
                        <label>Min Order Value</label>
                        <input type="number" name="minOrderValue" class="form-control" min="0" step="0.01" required>
                    </div>
                    <div class="form-group">
                        <label>Start Date</label>
                        <input type="date" name="startDate" class="form-control" min="<%= java.time.LocalDate.now() %>"required>
                    </div>
                    <div class="form-group">
                        <label>Expiry Date</label>
                        <input type="date" name="expiryDate" class="form-control" min="<%= java.time.LocalDate.now() %>"required>
                    </div>
                    <div class="form-group">
                        <label>Quantity</label>
                        <input type="number" name="quantity" class="form-control" min="1" required>
                    </div>
                    <div class="form-group">
                        <label>Status</label>
                        <select name="active" class="form-control">
                            <option value="true">Active</option>
                            <option value="false">Inactive</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Add Voucher</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Update Voucher Modal -->
<div id="updateVoucherModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="updateVoucherModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form action="ManagerVoucher" method="post">
                <input type="hidden" name="action" value="update" />
                <input type="hidden" name="id" id="voucherId" />
                <div class="modal-header">
                    <h4 class="modal-title" id="updateVoucherModalLabel">Update Voucher</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Voucher Code</label>
                        <input type="text" name="code" id="voucherCode" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Discount Percent (%)</label>
                        <input type="number" name="discountPercent" id="voucherDiscount" class="form-control" min="1" max="100" required>
                    </div>
                    <div class="form-group">
                        <label>Min Order Value</label>
                        <input type="number" name="minOrderValue" id="voucherMinOrder" class="form-control" min="0" step="0.01" required>
                    </div>
                    <div class="form-group">
                        <label>Start Date</label>
                        <input type="date" name="startDate" id="voucherStartDate" class="form-control" min="<%= java.time.LocalDate.now() %>"required>
                    </div>
                    <div class="form-group">
                        <label>Expiry Date</label>
                        <input type="date" name="expiryDate" id="voucherExpiryDate" class="form-control" min="<%= java.time.LocalDate.now() %>"required>
                    </div>
                    <div class="form-group">
                        <label>Quantity</label>
                        <input type="number" name="quantity" id="voucherQuantity" class="form-control" min="1" required>
                    </div>
                    <div class="form-group">
                        <label>Status</label>
                        <select name="active" id="voucherStatus" class="form-control">
                            <option value="true">Active</option>
                            <option value="false">Inactive</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Update Voucher</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<script>
    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();

        // Pass the voucher details into the update modal
        $('#updateVoucherModal').on('show.bs.modal', function (e) {
            var button = $(e.relatedTarget); // Button that triggered the modal
            $('#voucherId').val(button.data('id'));
            $('#voucherCode').val(button.data('code'));
            $('#voucherDiscount').val(button.data('discount'));
            $('#voucherMinOrder').val(button.data('min-order'));
            $('#voucherStartDate').val(button.data('start-date'));
            $('#voucherExpiryDate').val(button.data('expiry-date'));
            $('#voucherQuantity').val(button.data('quantity'));
            $('#voucherStatus').val(button.data('active') === "true" ? "true" : "false");
        });
    });
</script>
</body>
</html>
