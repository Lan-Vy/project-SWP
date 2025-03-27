<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Aloha Space Shop - Be good, Be bad, Be yourself | About Us</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon2.ico">

        <!-- Core Style CSS -->
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="css/core-style.css">
    </head>
    <body>
            <!-- ##### Main Content Wrapper Start ##### -->
        <jsp:include page="common/header.jsp"></jsp:include>
            <!-- Header Area End -->

            <div class="single-product-area section-padding-100 clearfix">
                <div class="container-fluid">

                </div>

                <div >

                    <div class="about-section">
                        <h1>About Us</h1>
                        <p>Welcome to Aloha Space Shop, where style meets comfort. Since our founding in [Year], we’ve been dedicated to providing high-quality footwear for every occasion. Our carefully curated collection features the latest trends alongside timeless classics, ensuring that you find the perfect pair every time. At Step Ahead Shoes, we believe that the right shoes can transform your day.</p>
                    </div>
                    <h2 style="text-align:center; margin-top: 16px;">Our Team</h2>
                    <div class="row">
                        <div class="column">
                            <div class="card">
                                <div class="container">
                                    <h2>Tran Minh That</h2>
                                    <p class="title">CE181070</p>
                                    <p>Manager</p>
                                    <p>@fpt.edu.vn</p>
                                    <!--<p><button class="button">Contact</button></p>-->
                                </div>
                            </div>
                        </div>

                        <div class="column">
                            <div class="card">
                                <div class="container">
                                    <h2>Nguyen Thi Lan Vy</h2>
                                    <p class="title">CE181347</p>
                                    <p>Manager</p>
                                    <p>vyntlce180757@fpt.edu.vn</p>
                                    <!--<p><button class="button">Contact</button></p>-->
                                </div>
                            </div>
                        </div>

                        <div class="column">
                            <div class="card">
                                <div class="container">
                                    <h2>Tran Quoc Vinh</h2>
                                    <p class="title">CE181347</p>
                                    <p>Manager</p>
                                    <p>VinhTQCE181347@fpt.edu.vn</p>
                                    <!--<p><button class="button">Contact</button></p>-->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="column">
                            <div class="card">
                                <div class="container">
                                    <h2>Nguyen Tan Trieu</h2>
                                    <p class="title">CE181198</p>
                                    <p>Manager</p>
                                    <p>@fpt.edu.vn</p>
                                    <!--<p><button class="button">Contact</button></p>-->
                                </div>
                            </div>
                        </div>

                        <div class="column">
                            <div class="card">
                                <div class="container">
                                    <h2>Vo Thanh Hieu</h2>
                                    <p class="title">CE180452</p>
                                    <p>Manager</p>
                                    <p>HieuVTCE180452@fpt.edu.vn</p>
                                    <!--<p><button class="button">Contact</button></p>-->
                                </div>
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
    body {
        margin: 0;
    }

    html {
        box-sizing: border-box;
    }

    *, *:before, *:after {
        box-sizing: inherit;
    }
    .column {
        float: left;
        width: 33.3%;
        margin-bottom: 16px;
        padding: 0 8px;
    }
    .card {
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        margin: 8px;
    }

    .about-section {
        padding: 50px;
        text-align: center;
        background-color: #fbb710;
        color: white;
        width: 100%;
    }

    .about-section h1, .about-section p{
        color: white !important;
    }

    .container {
        padding: 0 16px;
    }

    .container::after, .row::after {
        content: "";
        clear: both;
        display: table;
    }
    .title {
        color: grey;
    }

    .button {
        border: none;
        outline: 0;
        display: inline-block;
        padding: 8px;
        color: white;
        background-color: #000;
        text-align: center;
        cursor: pointer;
        width: 100%;
    }
    button:hover {
        background-color: #555;
    }

    @media screen and (max-width: 650px) {
        .column {
            width: 100%;
            display: block;
        }
    }
</style>
</body>
</html>
