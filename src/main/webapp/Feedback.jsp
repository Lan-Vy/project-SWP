<%@page import="entity.Size"%>
<%@page import="java.util.List"%>
<%@page import="dao.SizeDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Title  -->
        <title>Revolt Athletics | Product Details</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon2.ico">

        <!-- Core Style CSS -->
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/core-style.css">
        <!-- <link rel="stylesheet" href="style.css"> -->
        <style>
            .product-stock {
                font-weight: 500;
                color: #333;
                margin-top: 5px;
            }

            #sizeContainer {
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
            }

            .size-option {
                padding: 10px 15px;
                border: 1px solid #000;
                cursor: pointer;
                border-radius: 5px;
                transition: 0.3s;
            }

            .size-option:hover {
                background-color: #ddd;
            }

            .size-option.selected {
                background-color: #fbb710; /* Màu cam khi chọn */
                color: white;
                border-color: #fbb710;
            }
            .size-option.disabled {
                opacity: 0.5;
                pointer-events: none;
                cursor: not-allowed;
                background-color: grey
            }

        </style>
    </head>
    <body>

        <!-- ##### Main Content Wrapper Start ##### -->
        <jsp:include page="common/header.jsp"></jsp:include>
            <!-- Header Area End -->
        <!-- Product Details Area Start -->
        <div class="single-product-area section-padding-100 clearfix">



            <div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab" style="margin-top: 30px">
                <div class="row">


                    <!-- Add a New Review Section -->
                    <div class="col-lg-12">
                        <div class="review_box">
                            <h4>Add A Review</h4>
                            <form action="add-feedback" class="form-contact form-review mt-3" method="post">
                                <input class="form-control" name="orderId" type="hidden" value="${orderId}">
                                <div class="form-group">
                                    <p>Your Rating:</p>
                                    <select style="margin-bottom: 16px" class="form-group" name="rating">
                                        <option value="5">5 stars</option>
                                        <option value="4">4 stars</option>
                                        <option value="3">3 stars</option>
                                        <option value="2">2 stars</option>
                                        <option value="1">1 star</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <textarea class="form-control different-control w-100" name="messageContent" cols="30" rows="5" placeholder="Enter Message" required></textarea>
                                </div>
                                <div class="form-group text-center text-md-right mt-3">
                                    <button type="submit" class="btn amado-btn">Submit Now</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>       


        </div>



        <!-- Product Details Area End -->
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


