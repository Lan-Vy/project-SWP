
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Revolt Athletics | Contact</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon2.ico">

        <!-- Core Style CSS -->
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/core-style.css">
    </head>
    <body>
        <!-- Search Wrapper Area Start -->
        <%--<jsp:include page="common/search.jsp"></jsp:include>--%>
            <!-- Search Wrapper Area End -->

            <!-- ##### Main Content Wrapper Start ##### -->
        <jsp:include page="common/header.jsp"></jsp:include>
            <!-- Header Area End -->

            <div class="single-product-area section-padding-100 clearfix">
                <div class="container-fluid">

                </div>

                <div >

                    <div class="container-fluid container1">
                        <div class="content">
                            <div class="left-side">
                                <div class="address details">
                                    <!--<i class="fas fa-map-marker-alt"></i>-->
                                    <div class="topic">Address</div>
                                    <div class="text-one">Surkhet, NP12</div>
                                    <div class="text-two">Birendranagar 06</div>
                                </div>
                                <div class="phone details">
                                    <!--<i class="fas fa-phone-alt"></i>-->
                                    <div class="topic">Phone</div>
                                    <div class="text-one">+0098 9893 5647</div>
                                    <div class="text-two">+0096 3434 5678</div>
                                </div>
                                <div class="email details">
                                    <!--<i class="fas fa-envelope"></i>-->
                                    <div class="topic">Email</div>
                                    <div class="text-one">codinglab@gmail.com</div>
                                    <div class="text-two">info.codinglab@gmail.com</div>
                                </div>
                            </div>
                            <div class="right-side">
                                <div class="topic-text">Send us a message</div>
                                <p>If you have any types of quries related to my shop, you can send me message from here. It's my pleasure to help you.</p>
                                <form action="Contact" method="post">
                                    <div class="input-box">
                                        <input type="text" placeholder="Enter your name" value="${sessionScope.acc.userName}" name="name" required="">
                                </div>
                                <div class="input-box">
                                    <input type="email" placeholder="Enter your email" name="email" required="">
                                </div>
                                <div class="input-box message-box">
                                    <textarea placeholder="Enter your message" name="message" required=""></textarea>
                                </div>
                                <div class="button">
                                    <input type="submit" value="Send Now" >
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- Product Details Area End -->
</div>

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
<style>
    /* Google Font CDN Link */

    .container1{
        width: 85%;
        background: #fff;
        border-radius: 6px;
        padding: 20px 60px 30px 40px;
        box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
    }
    .container1 .content{
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    .container1 .content .left-side{
        width: 25%;
        height: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        margin-top: 15px;
        position: relative;
    }
    .content .left-side::before{
        content: '';
        position: absolute;
        height: 70%;
        width: 2px;
        right: -15px;
        top: 50%;
        transform: translateY(-50%);
        background: #afafb6;
    }
    .content .left-side .details{
        margin: 14px;
        text-align: center;
    }
    .content .left-side .details i{
        font-size: 30px;
        color: #fbb710;
        margin-bottom: 10px;
    }
    .content .left-side .details .topic{
        font-size: 18px;
        font-weight: 500;
    }
    .content .left-side .details .text-one,
    .content .left-side .details .text-two{
        font-size: 14px;
        color: #afafb6;
    }
    .container1 .content .right-side{
        width: 75%;
        margin-left: 75px;
    }
    .content .right-side .topic-text{
        font-size: 23px;
        font-weight: 600;
        color: #fbb710;
    }
    .right-side .input-box{
        height: 50px;
        width: 100%;
        margin: 12px 0;
    }
    .right-side .input-box input,
    .right-side .input-box textarea{
        height: 100%;
        width: 100%;
        border: none;
        outline: none;
        font-size: 16px;
        background: #F0F1F8;
        border-radius: 6px;
        padding: 0 15px;
        resize: none;
    }
    .right-side .message-box{
        min-height: 110px;
    }
    .right-side .input-box textarea{
        padding-top: 6px;
    }
    .right-side .button{
        display: inline-block;
        margin-top: 12px;
    }
    .right-side .button input[type="submit"]{
        color: #fff;
        font-size: 18px;
        outline: none;
        border: none;
        padding: 8px 16px;
        border-radius: 6px;
        background: #fbb710;
        cursor: pointer;
        transition: all 0.3s ease;
    }
    .button input[type="submit"]:hover{
        background: #5029bc;
    }
    @media (max-width: 950px) {
        .container1{
            width: 90%;
            padding: 30px 40px 40px 35px ;
        }
        .container1 .content .right-side{
            width: 75%;
            margin-left: 55px;
        }
    }
    @media (max-width: 820px) {
        .container1{
            margin: 40px 0;
            height: 100%;
        }
        .container1 .content{
            flex-direction: column-reverse;
        }
        .container1 .content .left-side{
            width: 100%;
            flex-direction: row;
            margin-top: 40px;
            justify-content: center;
            flex-wrap: wrap;
        }
        .container1 .content .left-side::before{
            display: none;
        }
        .container1 .content .right-side{
            width: 100%;
            margin-left: 0;
        }
    }
</style>
<script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<c:if test="${message != null}">
    <script type="text/javascript">
        toastr.success(`${message}`, 'Success', {timeOut: 1000});
    </script>
</c:if>
</body>
</html>
