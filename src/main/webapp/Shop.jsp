<%-- 
    Document   : Shop
    Created on : Jan 13, 2021, 2:10:09 PM
    Author     : Admin
--%>

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
        <title>Aloha Space Shop - Be good, Be bad, Be yourself | Shop</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon2.ico">

        <!-- Core Style CSS -->
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/core-style.css">
        <!--<link rel="stylesheet" href="style.css">--> 
        <style>
            .searchbar{
                margin-bottom: auto;
                margin-top: auto;
                height: 50px;
                background-color: #f5f7fa;
                border-radius: 30px;
                padding: 8px;
            }

            .search_input{
                color: black;
                border: 0;
                outline: 0;
                background: none;
                width: 0;
                caret-color:transparent;
                line-height: 40px;
                transition: width 0.4s linear;
            }

            .searchbar > .search_input{
                padding: 0 10px;
                width: 360px;
                caret-color:red;
                transition: width 0.4s linear;
            }

            .searchbar > .search_icon{
                background: #f5f7fa;
                color: #e74c3c;
            }

            .search_icon{
                height: 40px;
                width: 40px;
                float: right;
                display: flex;
                justify-content: center;
                align-items: center;
                border-radius: 50%;
                color:white;
                text-decoration:none;
            }
            .custom-icon::before {
                font-family: 'Your Custom Icon Font'; /* Specify your custom icon font family */
                content: '\e254'; /* Unicode character for your custom icon */
                margin-right: 5px; /* Adjust spacing between icon and text */
            }
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <body>
        <jsp:include page="common/header.jsp"></jsp:include>
            Shop
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
    </script>
</body>
</html>
