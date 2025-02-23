<%-- 
    Document   : CheckOut
    Created on : Jan 13, 2021, 2:05:49 PM
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
        <title>Aloha Space Shop - Be good, Be bad, Be yourself | Profile</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon2.ico">

        <!-- Core Style CSS -->
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <!--<link href="css/login.css" rel="stylesheet" type="text/css" />-->
        <title>Aloha Space Shop - Be good, Be bad, Be yourself | Login</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
        <script type="text/javascript" src="http://dev.jquery.com/view/trunk/plugins/validate/jquery.validate.js"></script>
        <link rel="stylesheet" href="css/core-style.css">
        <!-- <link rel="stylesheet" href="style.css"> -->

    </head>
    <body>

            <!-- ##### Main Content Wrapper Start ##### -->
        <jsp:include page="common/header.jsp"></jsp:include>
            <!-- Header Area End -->

            <div class="cart-table-area section-padding-100">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12 col-lg-8">
                            <div class="checkout_details_area mt-50 clearfix">

                                <div class="cart-title">
                                    <h2>Profile</h2>
                                </div>
                                <div class="content" style="display: flex">
                                    <div class="left" style="margin-right: 30px">
                                        <img src="img/profile.jpg" alt="alt" width="300px"/>
                                    </div>
                                    <div class="right">
                                        <div>
                                            <div style="display: flex">
                                                <div style="width: 100px">Username: </div>
                                                <div>${user.userName}</div>
                                        </div>
                                        <div>
                                            <div style="display: flex">
                                                <div style="width: 100px">Email: </div>
                                                <div>${user.email}</div>
                                            </div>
                                            <div>
                                                <div style="display: flex">
                                                    <div style="width: 100px">Password: </div>
                                                    <div>${user.passWord}</div>
                                                </div>
                                            </div>
                                            <div>
                                                <div style="display: flex">
                                                    <div style="width: 100px">Role: </div>
                                                    <div>
                                                        <c:if test="${user.role == 1}">
                                                            Customer
                                                        </c:if>
                                                        <c:if test="${user.role == 2}">
                                                            Admin
                                                        </c:if>
                                                        <c:if test="${user.role == 3}">
                                                            Shipper
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div style="margin-top: 20px">
                                            <a href="ChangePassword.jsp" style="color: #fbb710"><label class="form-check-label" for="exampleCheck1"><i class="fas fa-question-circle"></i> Change password?</label></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ##### Main Content Wrapper End ##### -->
        </div>

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
