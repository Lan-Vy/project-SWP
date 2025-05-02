<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content=""/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        <title>Revolt Athletics | Checkout</title>
        <link rel="icon" href="img/core-img/favicon2.ico">
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/core-style.css">
    </head>
    <body>
        <jsp:include page="common/header.jsp" />

        <div class="cart-table-area section-padding-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <div class="checkout_details_area mt-50 clearfix">
                            <div class="cart-title">
                                <h2>Checkout</h2>
                            </div>

                            <!-- Apply Voucher Form -->
                            <form action="CheckOut" method="post">
                                <div class="col-12 mb-3">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="voucher" placeholder="Voucher Code" name="voucherCode" value="${voucherCode}">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="submit" name="action" value="applyVoucher">Apply</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- Keep user input when applying voucher -->
                                <input type="hidden" name="firstname" value="${firstname}" />
                                <input type="hidden" name="lastname" value="${lastname}" />
                                <input type="hidden" name="address" value="${address}" />
                                <input type="hidden" name="phone" value="${phone}" />
                            </form>

                            <!-- Checkout Form -->
                            <form action="CheckOut" method="post">
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <input type="text" class="form-control" name="firstname" value="${firstname}" placeholder="First Name" required>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <input type="text" class="form-control" name="lastname" value="${lastname}" placeholder="Last Name" required>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input type="text" class="form-control" name="address" value="${address}" placeholder="Receiving Address" required>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input type="text" class="form-control" name="phone" value="${phone}" placeholder="Phone Number" required pattern="^(03|05|07|08|09)[0-9]{8}$" title="Phone number must start with 03, 05, 07, 08, or 09 and have exactly 10 digits.">
                                    </div>

                                    <div class="col-12 col-lg-4">
                                        <div class="cart-summary">
                                            <h5>Cart Total</h5>
                                            <fmt:setLocale value="vi_VN"/>
                                            <ul class="summary-table">
                                                <li><span>Subtotal:</span> <span></span></li>

                                                <c:set var="totalPrice" value="0" />
                                                <c:forEach items="${cartItems}" var="o">
                                                    <li>
                                                        <span style="padding-left: 30px">${o.product.name} (${o.size.size}) x ${o.quantity}</span>
                                                        <fmt:formatNumber value="${o.product.price * o.quantity}" type="number" groupingUsed="true" var="formattedPrice"/>
                                                        <span>${formattedPrice}</span>
                                                    </li>
                                                    <c:set var="totalPrice" value="${totalPrice + (o.product.price * o.quantity)}" />
                                                </c:forEach>

                                                <li><span>Delivery:</span> <span>Free</span></li>

                                                <fmt:formatNumber value="${totalPrice}" type="number" groupingUsed="true" var="formattedTotalPrice"/>
                                                <li><span>Total:</span> <span>${formattedTotalPrice}</span></li>

                                                <c:if test="${voucherCode != null && discountAmount != null && discountAmount > 0}">
                                                    <fmt:formatNumber value="${discountAmount}" type="number" groupingUsed="true" var="formattedDiscount"/>
                                                    <fmt:formatNumber value="${finalPrice}" type="number" groupingUsed="true" var="formattedFinal"/>
                                                    <li><span>Voucher Applied (${voucherCode}):</span>
                                                        <span class="text-success">- ${formattedDiscount} VND</span></li>
                                                    <li><strong>Final Total:</strong>
                                                        <strong class="text-danger">${formattedFinal} VND</strong></li>
                                                    </c:if>
                                            </ul>

                                            <div class="payment-method">
                                                <input type="radio" name="payment" id="cod" value="cod" ${payment == 'cod' || payment == null ? 'checked' : ''} style="margin-right: 10px">
                                                <label for="cod">Cash on Delivery</label><br>
                                                <input type="radio" name="payment" id="vnpay" value="vnpay" ${payment == 'vnpay' ? 'checked' : ''} style="margin-right: 10px">
                                                <label for="vnpay">VNPay <img class="ml-15" src="img/core-img/paypal.png" alt=""></label>
                                            </div>

                                            <!-- Hidden voucher fields -->
                                            <input type="hidden" name="voucherCode" value="${voucherCode}" />
                                            <input type="hidden" name="discountAmount" value="${discountAmount}" />

                                            <div class="cart-btn mt-100">
                                                <input class="btn amado-btn w-100" type="submit" value="Check Out">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="common/footer.jsp" />

        <!-- Scripts -->
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/active.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

        <!-- Toastr Notifications -->
        <c:if test="${message != null}">
            <script type="text/javascript">
                toastr.success('${message}', 'Success', {timeOut: 1000});
            </script>
        </c:if>
        <c:if test="${errorMessage != null}">
            <script type="text/javascript">
                toastr.error('${errorMessage}', 'Error', {timeOut: 3000});
            </script>
        </c:if>


    </body>
</html>
