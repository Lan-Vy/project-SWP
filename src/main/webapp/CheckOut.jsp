

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
        <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        <!-- Title  -->
        <title>Revolt Athletics | Checkout</title>

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
                            <div class="checkout_details_area mt-50 clearfix">

                                <div class="cart-title">
                                    <h2>Checkout</h2>
                                </div>

                                <form action="CheckOut" method="post">
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <input type="text" class="form-control" id="first_name" value="" placeholder="First Name" required name="firstname">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <input type="text" class="form-control" id="last_name" value="" placeholder="Last Name" required name="lastname">
                                        </div>
                                        <div class="col-12 mb-3">
                                            <input type="text" class="form-control" id="company" placeholder="Receiving Address" value="" required name="address">
                                        </div>
                                        <div class="col-12 mb-3">
                                          <input type="text" class="form-control" id="phone" placeholder="Phone Number" value="" required name="phone" pattern="^(03|05|07|08|09)[0-9]{8}$" title="Phone number must start with 03, 05, 07, 08, or 09 and have exactly 10 digits.">


                                        </div>

                                        <!--                                    <div class="col-12 mb-3">
                                                                                <textarea name="comment" class="form-control w-100" id="comment" cols="30" rows="10" placeholder="Leave a comment about your order"></textarea>
                                                                            </div>
                                        
                                                                            <div class="col-12">
                                                                                <div class="custom-control custom-checkbox d-block mb-2">
                                                                                    <input type="checkbox" class="custom-control-input" id="customCheck2">
                                                                                    <label class="custom-control-label" for="customCheck2">Create an accout</label>
                                                                                </div>
                                                                                <div class="custom-control custom-checkbox d-block">
                                                                                    <input type="checkbox" class="custom-control-input" id="customCheck3">
                                                                                    <label class="custom-control-label" for="customCheck3">Ship to a different address</label>
                                                                                </div>
                                                                            </div>-->
                                    </div>
                                    <!--                                    </form>-->
                            </div>
                        </div>
                        <div class="col-12 col-lg-4">
                            <div class="cart-summary">
                                <h5>Cart Total</h5><fmt:setLocale value="vi_VN"/>
                            <ul class="summary-table">

                                <li><span>Subtotal:</span> <span></span></li>
                                    <c:set var="totalPrice" value="0" />
                                    <c:forEach items="${cartItems}" var="o">
                                    <li>
                                        <span style="padding-left: 30px">${o.product.name} (${o.size.size})</span>
                                        <fmt:formatNumber value="${o.product.price * o.quantity}" type="number" groupingUsed="true" var="formattedPrice"/>
                                        <span>${formattedPrice}</span>
                                    </li>
                                    <c:set var="totalPrice" value="${totalPrice + (o.product.price * o.quantity)}" />
                                </c:forEach>

                                <li><span>delivery:</span> <span>Free</span></li>
                                    <fmt:formatNumber value="${totalPrice}" type="number" groupingUsed="true" var="formattedTotalPrice"/>
                                <li><span>total:</span> <span>${formattedTotalPrice}</span></li>
                            </ul>

                            <div class="payment-method">

                                <!--                                <div class="custom-control mr-sm-2">
                                                                    <input type="radio" name="cod" class="custom-control-input" id="cod" checked="">
                                                                    <label class="custom-control-label" for="cod">Cash on Delivery</label>
                                                                </div>
                                                              
                                                                <div class="custom-control mr-sm-2">
                                                                    <input type="radio" name="vnpay" class="custom-control-input" id="vnpay">
                                                                    <label class="custom-control-label" for="paypal">VNPay <img class="ml-15" src="img/core-img/paypal.png" alt=""></label>
                                                                </div>-->
                                <div>
                                    <input type="radio" name="payment" id="cod" value="cod" checked="" style="margin-right: 10px"><label for="cod">Cash on Delivery</label><br>
                                    <input type="radio" name="payment" id="vnpay" value="vnpay" style="margin-right: 10px"><label for="vnpay">VNPay <img class="ml-15" src="img/core-img/paypal.png" alt=""></label>
                                </div>
                            </div>

                            <div class="cart-btn mt-100">
                                <input class="btn amado-btn w-100" type="submit" value="Check Out">
                            </div>
                            </form>
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
        <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <c:if test="${message != null}">
        <script type="text/javascript">
            toastr.success(`${message}`, 'Success', {timeOut: 1000});
        </script>
    </c:if>
    <c:if test="${errorMessage != null}">
        <script type="text/javascript">
            toastr.error(`${errorMessage}`, 'Error', {timeOut: 3000});
        </script>
    </c:if>
</body>
</html>
