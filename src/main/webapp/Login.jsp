<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!------ Include the above in your HEAD tag ---------->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/login.css" rel="stylesheet" type="text/css" />
        <title>Aloha Space Shop - Be good, Be bad, Be yourself | Login</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
        <script type="text/javascript" src="http://dev.jquery.com/view/trunk/plugins/validate/jquery.validate.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#formlogin").validate({
                    rules: {
                        user: {
                            required: true,
                            email: true
                        },
                        pass: {
                            required: true,
                            maxlength: 20,
                            minlength: 3
                        }
                    }
                });

                $("#formregister").validate({
                    rules: {
                        user: {
                            required: true,
                            maxlength: 20,
                            minlength: 3
                        },
                        email: {
                            required: true,
                            email: true
                        },
                        pass: {
                            required: true,
                            maxlength: 20,
                            minlength: 3
                        },
                        repass: {
                            required: true,
                            maxlength: 20,
                            minlength: 3,
                            equalTo: "#pass"
                        }
                    }
                });
            });
        </script>
        <style>
            .error{
                color: red;
            }
        </style>
        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon2.ico">
    </head>
    <body>
        <div class="wel">
            <h1>Welcome to Aloha Space Shop</h1>
            <p>Be good, Be bad, Be yourself</p>
        </div>
        <div id="logreg-forms">
            <form class="form-signin" action="login" method="post" id="formlogin">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Sign in</h1>

                <input name="user" type="email" id="inputEmail" class="form-control" placeholder="Email" autofocus="">
                <input name="pass" type="password" id="inputPassword" class="form-control" placeholder="Password">

                <div class="form-group form-check">
                    <!--<input name="remember" value="1" type="checkbox" class="form-check-input" id="exampleCheck1">-->
                    <!--<a href="ForgotPassword.jsp"><label class="form-check-label" for="exampleCheck1"><i class="fas fa-question-circle"></i> Forgot password?</label></a>-->
                </div>

                <button class="btn btn-warning btn-block" type="submit"><i class="fas fa-sign-in-alt"></i> Sign in</button>
                <hr>
                <button class="btn btn-dark btn-block" type="button" id="btn-signup"><i class="fas fa-user-plus"></i> Sign up New Account</button>
            </form>

            <form action="signup" method="post" class="form-signup" id="formregister">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Sign up</h1>
                <input name="user" type="text" id="user-name" class="form-control" placeholder="User name" required="" autofocus="">
                <input name="email" type="email" id="user-email" class="form-control" placeholder="Email" required="" autofocus="">
                <input name="pass" type="password" id="pass" class="form-control" placeholder="Password" required autofocus="">
                <input name="repass" type="password" id="repass" class="form-control" placeholder="Repeat Password" required autofocus="">

                <button class="btn btn-warning btn-block" type="submit"><i class="fas fa-user-plus"></i> Sign Up</button>
                <a href="#" id="cancel_signup"><i class="fas fa-angle-left"></i> Back</a>
            </form>
            <br>

        </div>

        <script>
            function toggleResetPswd(e) {
                e.preventDefault();
                $('#logreg-forms .form-signin').toggle(); // display:block or none
                $('#logreg-forms .form-reset').toggle(); // display:block or none
            }

            function toggleSignUp(e) {
                e.preventDefault();
                $('#logreg-forms .form-signin').toggle(); // display:block or none
                $('#logreg-forms .form-signup').toggle(); // display:block or none
            }

            $(() => {
                // Login Register Form
                $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
                $('#logreg-forms #cancel_reset').click(toggleResetPswd);
                $('#logreg-forms #btn-signup').click(toggleSignUp);
                $('#logreg-forms #cancel_signup').click(toggleSignUp);
            })
        </script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
        <c:if test="${message != null}">
            <script type="text/javascript">
            toastr.success(`${message}`, 'Success', {timeOut: 1000});
            </script>
        </c:if>
        <c:if test="${errorMessage != null}">
            <script type="text/javascript">
            toastr.error(`${errorMessage}`, 'Error', {timeOut: 1000});
            </script>
        </c:if>
    </body>
</html>
