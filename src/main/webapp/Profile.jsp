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
        <title>Revolt Athletics | Profile</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon2.ico">

        <!-- Core Style CSS -->
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <!--<link href="css/login.css" rel="stylesheet" type="text/css" />-->
        <title>Revolt Athletics | Login</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
        <script type="text/javascript" src="http://dev.jquery.com/view/trunk/plugins/validate/jquery.validate.js"></script>
        <link rel="stylesheet" href="css/core-style.css">
        <!-- <link rel="stylesheet" href="style.css"> -->

    </head>
    <style>
        .profile-box {
            border: 2px solid #fbb710;
            border-radius: 15px;
            padding: 30px;
            background-color: #fffef5;
            box-shadow: 0 4px 20px rgba(251, 183, 16, 0.2);
            margin-top: 20px;
        }

        .profile-image {
            max-width: 100%;
            border-radius: 10px;
        }

        .profile-label {
            font-weight: bold;
            width: 100px;
        }

        .change-password-link {
            color: #fbb710;
            font-weight: bold;
            text-decoration: none;
        }

        .change-password-link:hover {
            text-decoration: underline;
        }
    </style>


    <body>

       <c:choose>
    <c:when test="${sessionScope.acc.role == 1}">
        <jsp:include page="common/header.jsp" />
    </c:when>
    <c:when test="${sessionScope.acc.role == 3}">
        <jsp:include page="common/menu.jsp" />
    </c:when>
</c:choose>

            <div class="cart-table-area section-padding-100">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12 col-lg-8">
                            <div class="checkout_details_area mt-50 clearfix">

                                <div class="container">
                                    <div class="profile-box row">
                                        <div class="col-md-4 text-center mb-3">
                                            <img src="img/profile.jpg" alt="Profile Image" class="profile-image" />
                                        </div>
                                        <div class="col-md-8">
                                            <h3 class="mb-4">👤 User Profile</h3>
                                            <div class="row mb-2">
                                                <div class="col-sm-4 profile-label">Username:</div>
                                                <div class="col-sm-8">${user.userName}</div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-4 profile-label">Email:</div>
                                            <div class="col-sm-8">${user.email}</div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-4 profile-label">Password:</div>
                                            <div class="col-sm-8">********</div>
                                        </div>
                                        <div class="mt-4">
                                            <a href="ChangePassword.jsp" class="change-password-link">
                                                <i class="fas fa-lock"></i> Change password?
                                            </a>
                                        </div>
                                    </div>
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
