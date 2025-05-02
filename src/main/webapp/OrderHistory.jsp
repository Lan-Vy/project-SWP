<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>-->
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Title  -->
        <title>Revolt Athletics | Order History</title>
        <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon2.ico">

        <!-- Core Style CSS -->
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/core-style.css">
        <!-- <link rel="stylesheet" href="style.css"> -->
        <style>
            thead{
                background-color: #f5f7fa;
            }
            table {
                width: 100%;
            }
        </style>
    </head>
    <body>

        <!-- ##### Main Content Wrapper Start ##### -->
        <jsp:include page="common/header.jsp"></jsp:include>
            <!-- Header Area End -->

            <div class="section-padding-100">
                <!--<div class="container-fluid">-->
                <!--<div class="row">-->
                <!--<div class="col-12">-->
                <div class="cart-title mt-50">
                    <h2>Order History</h2>
                </div>
            <fmt:setLocale value="vi_VN"/>
            <div>
                <table style="width:1100px">
                    <thead style="background-color: #f5f7fa">
                        <tr>
                            <th >Order ID</th>
                            <th >Recipient's Name</th>
                            <th>Order Date</th>
                            <th >Address Receive</th>
                            <th >Phone Number</th>
                            <th >Total Price</th>
                            <th >Status</th>
                            <th >Shipper</th>
                            <th style="text-align: center">Detail</th>
                            <th style="text-align: center">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${lstOrder}" var="o">
                            <tr>

                                <td class="id" >
                                    <span>${o.id}</span>
                                </td>
                                <td class="name" >
                                    <span>${o.name}</span>
                                </td>
                                <td class="date" >
                                    <span>${o.date}</span>
                                </td>
                                <td class="address" >
                                    <span>${o.address}</span>
                                </td>
                                <td class="sdt" >
                                    <span>${o.sdt}</span>
                                </td>
                                <td class="totalPrice" >
                                    <fmt:formatNumber value="${o.totalPrice}" type="number" groupingUsed="true" var="formattedPrice"/>
                                    <span>${formattedPrice}</span>
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
                                        <c:when test="${o.status == 4}">
                                            <span class="badge bg-success" style="background-color: green">Cancel</span>
                                        </c:when>
                                        <c:when test="${o.status == 5}">
                                            <span class="badge bg-danger" style="background-color: red">Fail</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-secondary">Unknown</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>

                                <td>
                                    ${o.shipper.userName}
                                </td>  
                                <td style="text-align: center">
                                    <a href="OrderDetailControl?orderId=${o.id}"><i class="material-icons" data-toggle="tooltip" title="Detail">&#xe24c;</i>
                                </td>
                                <td style="text-align: center">
                                    <c:if test="${o.status == 3}">
                                        <a href="add-feedback?orderId=${o.id}" class="btn btn-sm btn-success">Review Products</a>
                                    </c:if>
                                    <c:if test="${o.status == 0}">
                                        <form action="OrderHistoryControl" method="post" style="display:inline;" onsubmit="return confirmCancel(this)">
                                            <input type="hidden" name="orderId" value="${o.id}">
                                            <input type="hidden" name="status" value="${o.status}">
                                            <input type="hidden" name="action" value="cancel">
                                            <input type="hidden" name="reason" value="">
                                            <button type="submit" class="btn btn-sm btn-success">Cancel</button>
                                        </form>

                                    </c:if>
                                    <div id="reasonModal" style="display:none; position:fixed; top:30%; left:50%; transform:translate(-50%,-30%); background:#fff; padding:20px; border-radius:8px; box-shadow:0 2px 8px rgba(0,0,0,0.3); z-index:9999;">
                                        <h5>Enter Cancellation Reason</h5>
                                        <textarea id="reasonInput" rows="4" style="width:100%;" maxlength="50"></textarea>
                                        <p id="charCount" style="font-size:12px; color:gray;">0 / 50 characters</p>
                                        <button onclick="submitReason()" class="btn btn-sm btn-primary">Confirm</button>
                                        <button onclick="closeReasonModal()" class="btn btn-sm btn-secondary">Cancel</button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <!--</div>-->

            <!--</div>-->
            <!--</div>-->
        </div>
    </div>
    <!-- ##### Main Content Wrapper End ##### -->

    <!-- ##### Newsletter Area Start ##### -->

    <!-- ##### Newsletter Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <jsp:include page="common/footer.jsp"></jsp:include>
        <!-- ##### Footer Area End ##### -->

        <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

        <!-- Toastr Notifications -->
    <c:if test="${sessionScope.message != null}">
        <script type="text/javascript">
        toastr.success("${sessionScope.message}", 'Success', {timeOut: 3000});
            ${sessionScope.message = null}<!-- Xóa message khỏi session sau khi hiển thị -->
        </script>
    </c:if>

<c:if test="${sessionScope.errorMessage != null}">
        <script type="text/javascript">
            toastr.error("${sessionScope.errorMessage}", 'Error', {timeOut: 3000});
            ${sessionScope.errorMessage = null}<!-- Xóa errorMessage khỏi session sau khi hiển thị -->
        </script>
    </c:if>
        <script>
    let currentForm = null;
    function confirmCancel(form) {
        currentForm = form;
        document.getElementById('reasonInput').value = '';
        document.getElementById('charCount').innerText = '0 / 50 characters';
        document.getElementById('reasonModal').style.display = 'block';
        return false;
    }

    function closeReasonModal() {
        document.getElementById('reasonModal').style.display = 'none';
    }
    function submitReason() {
        const reason = document.getElementById('reasonInput').value.trim();
        if (reason.length === 0) {
            alert("Please enter a reason.");
            return;
        }
        currentForm.reason.value = reason;
        currentForm.submit();
    }
    document.getElementById('reasonInput').addEventListener('input', function () {
        document.getElementById('charCount').innerText = this.value.length + ' / 50 characters';
    });


    </script>

</body>
</html>
