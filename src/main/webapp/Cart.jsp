

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        <title>Revolt Athletics | Cart</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon2.ico">

        <!-- Core Style CSS -->
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="css/core-style.css">
        <!-- <link rel="stylesheet" href="style.css"> -->

    </head>
    <body>
        <!-- Search Wrapper Area Start -->
        <%--<jsp:include page="common/search.jsp"></jsp:include>--%>
        <!-- Search Wrapper Area End -->

        <!-- ##### Main Content Wrapper Start ##### -->
        <jsp:include page="common/header.jsp"></jsp:include>
            <!-- Header Area End -->

            <div class="cart-table-area section-padding-100">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12 col-lg-8">
                            <div class="cart-title mt-50">
                                <h2>Shopping Cart</h2>
                            </div>
                        <fmt:setLocale value="vi_VN"/>
                        <div class="cart-table clearfix">
                            <table class="table table-responsive">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${cartItems}" var="o">
                                        <tr>

                                            <td class="cart_product_img">
                                                <a href="#"><img src="${o.product.image}" alt="Product"></a>
                                            </td>
                                            <td class="cart_product_desc">
                                                <h5>${o.product.name} - Size ${o.size.size}</h5>
                                            </td>
                                            <td class="price">
                                                <fmt:formatNumber value="${o.product.price}" type="number" groupingUsed="true" var="formattedPrice"/>
                                                <span>${formattedPrice}</span>
                                            </td>
                                            <td class="qty">
                                                <a href="cart?id=${o.product.id}&action=minus&sizeId=${o.size.id}"><button class="btnSub">-</button></a> 
                                                <strong>${o.quantity}</strong>
                                                <a href="cart?id=${o.product.id}&action=add&sizeId=${o.size.id}"><button class="btnAdd">+</button></a>
                                                <a href="cart?id=${o.product.id}&action=delete&sizeId=${o.size.id}" style="margin-left: 100px;"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
                                                    <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                                                    </svg></a>
                                            </td>

                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-12 col-lg-4">
                        <div class="cart-summary">
                            <h5>Cart Total</h5>
                            <ul class="summary-table">
                                <li><span>Subtotal:</span> <span></span></li>
                                    <c:set var="totalPrice" value="0" />
                                    <c:forEach items="${cartItems}" var="o">
                                    <li>
                                        <span style="padding-left: 20px">${o.product.name} (${o.size.size}) </span>
                                        <fmt:formatNumber value="${o.product.price}" type="number" groupingUsed="true" var="formattedPrice"/>
                                        <span style="white-space: nowrap;">${formattedPrice} <span style="font-size: smaller; display: inline;">x${o.quantity}</span></span>

                                    </li>
                                    <c:set var="totalPrice" value="${totalPrice + (o.product.price * o.quantity)}" />
                                </c:forEach>

                                <li><span>delivery:</span> <span>Free</span></li>
                                    <fmt:formatNumber value="${totalPrice}" type="number" groupingUsed="true" var="formattedTotalPrice"/>
                                <li><span>total:</span> <span>${formattedTotalPrice}</span></li>
                            </ul>
                            <div class="cart-btn mt-100">
                                <a href="CheckOut" class="btn amado-btn w-100">Checkout</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
