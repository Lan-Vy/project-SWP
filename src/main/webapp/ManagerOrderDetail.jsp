

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
        <title>Manager Order Detail</title>
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
                                    <h2>Manage <b>Order Detail</b></h2>
                                </div>
                                <div class="col-sm-6">
                                    <a href="ManagerOrder" class="btn btn-success"><span>Back</span></a>
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 100px">Product ID</th>
                                    <th >Image</th>
                                    <th >Product Name</th>
                                    <th>Unit Price</th>
                                    <th >Category</th>
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
                                    <td class="price" >
                                        <span>${o.price}</span>
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
                    <div class="clearfix">
                        <ul class="pagination">

                        </ul>
                    </div>
                </div>
            </div>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script src="js/manager.js" type="text/javascript"></script>

    </body>
</html>
