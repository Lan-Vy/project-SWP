


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
        <title>Revolt Athletics | Order Detail</title>

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
        <!-- Search Wrapper Area Start -->
        <%--<jsp:include page="common/search.jsp"></jsp:include>--%>
        <!-- Search Wrapper Area End -->

        <!-- ##### Main Content Wrapper Start ##### -->
        <jsp:include page="common/header.jsp"></jsp:include>
            <!-- Header Area End -->

            <div class="section-padding-100">
                <!--<div class="container-fluid">-->
                <!--<div class="row">-->
                <!--<div class="col-12">-->
                <div class="cart-title mt-50">
                    <h2>Order Detail</h2>
                </div>
            <fmt:setLocale value="vi_VN"/>
            <div >
                <table style="width:1100px">
                    <thead style="background-color: #f5f7fa">
                        <tr>
                            <th style="width: 100px">Product ID</th>
                            <th >Image</th>
                            <th >Product Name</th>
                            <th >Size</th>
                            <th>Unit Price</th>
                            <th>Category</th>
                            <th style="text-align: center">Quantity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${lstOrderDetail}" var="o">
                            <tr>

                                <td class="id" >
                                    <span>${o.productID}</span>
                                </td>
                                <td class="image" >
                                    <a href="#"><img src="${o.image}" alt="Product" style="width: 150px"></a>
                                </td>
                                <td class="productName" >
                                    <span>${o.productName}</span>
                                </td>
                                <td class="productName" >
                                    <span>${o.size.size}</span>
                                </td>
                                <td class="price" >
                                    <fmt:formatNumber value="${o.price}" type="number" groupingUsed="true" var="formattedPrice"/>
                                    <span>${formattedPrice}</span>
                                </td>
                                <td class="categoryName" >
                                    <span>${o.categoryName}</span>
                                </td>
                                <td class="quantity" style="text-align: center">
                                    <span>${o.quantity}</span>
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
