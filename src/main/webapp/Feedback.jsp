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
        <title>Revolt Athletics | Product Feedback</title>

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
            
            .product-review {
                margin-bottom: 30px;
                border: 1px solid #eee;
                padding: 20px;
                border-radius: 5px;
                background-color: #fafafa;
            }
            
            .product-review img {
                max-width: 120px;
                max-height: 120px;
                object-fit: cover;
            }
            
            .product-info {
                margin-bottom: 15px;
            }
            
            .star-rating {
                margin-bottom: 15px;
            }
            
            .already-reviewed {
                background-color: #e9ecef;
                color: #888;
                padding: 10px;
                border-radius: 5px;
                text-align: center;
                margin-top: 10px;
            }
            
            h4.section-title {
                margin-bottom: 20px;
                border-bottom: 2px solid #fbb710;
                padding-bottom: 10px;
                font-weight: 600;
            }
            
            .alert-success {
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>

        <!-- ##### Main Content Wrapper Start ##### -->
        <jsp:include page="common/header.jsp"></jsp:include>
            <!-- Header Area End -->
        <!-- Product Details Area Start -->
        <div class="single-product-area section-padding-100 clearfix">
            <div class="container">
                <h2 class="mb-4">Review Products from Order #${orderId}</h2>
                
                <c:if test="${message != null}">
                    <div class="alert alert-success">
                        ${message}
                    </div>
                </c:if>
                
                <c:if test="${errorMessage != null}">
                    <div class="alert alert-danger">
                        ${errorMessage}
                    </div>
                </c:if>
                
                <h4 class="section-title">Products in Your Order</h4>
                
                <c:set var="allReviewed" value="true"/>
                <c:forEach items="${orderProducts}" var="product">
                    <c:if test="${!product.reviewed}">
                        <c:set var="allReviewed" value="false"/>
                    </c:if>
                </c:forEach>
                
                <c:if test="${allReviewed}">
                    <div class="alert alert-info text-center">
                        <i class="fa fa-check-circle fa-2x mb-2"></i>
                        <h4>Thank you for reviewing all products!</h4>
                        <p>You have successfully reviewed all products in this order. Your feedback helps us improve our services.</p>
                        <a href="OrderHistoryControl" class="btn amado-btn mt-3">Return to Order History</a>
                    </div>
                </c:if>
                
                <c:if test="${!allReviewed}">
                    <div class="row">
                        <c:forEach items="${orderProducts}" var="product">
                            <div class="col-md-6">
                                <div class="product-review">
                                    <div class="product-info d-flex">
                                        <div class="mr-3">
                                            <img src="${product.image}" alt="${product.productName}" class="img-thumbnail">
                                        </div>
                                        <div>
                                            <h5>${product.productName}</h5>
                                            <p class="mb-1">Size: ${product.size.size}</p>
                                            <p class="mb-1">Quantity: ${product.quantity}</p>
                                            <fmt:formatNumber value="${product.price}" type="number" groupingUsed="true" var="formattedPrice"/>
                                            <p>Price: ${formattedPrice}</p>
                                        </div>
                                    </div>
                                    
                                    <c:choose>
                                        <c:when test="${product.reviewed}">
                                            <div class="already-reviewed">
                                                <i class="fa fa-check-circle"></i> You have already reviewed this product
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <form action="add-feedback" class="form-contact form-review mt-3" method="post">
                                                <input type="hidden" name="orderId" value="${orderId}">
                                                <input type="hidden" name="productId" value="${product.productID}">
                                                <input type="hidden" name="sizeId" value="${product.sizeId}">
                                                
                                                <div class="form-group star-rating">
                                                    <label>Your Rating:</label>
                                                    <select class="form-control" name="rating">
                                                        <option value="5">5 stars (Excellent)</option>
                                                        <option value="4">4 stars (Very Good)</option>
                                                        <option value="3">3 stars (Good)</option>
                                                        <option value="2">2 stars (Fair)</option>
                                                        <option value="1">1 star (Poor)</option>
                                                    </select>
                                                </div>
                                                
                                                <div class="form-group">
                                                    <label>Your Review:</label>
                                                    <textarea class="form-control" name="messageContent" rows="3" placeholder="Share your experience with this product..." required></textarea>
                                                </div>
                                                
                                                <div class="form-group">
                                                    <button type="submit" class="btn amado-btn">Submit Review</button>
                                                </div>
                                            </form>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
                
                <div class="text-center mt-4">
                    <a href="OrderHistoryControl" class="btn amado-btn active">Back to Order History</a>
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
