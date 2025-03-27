
<%@page import="entity.Size"%>
<%@page import="java.util.List"%>
<%@page import="dao.SizeDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        <title>Aloha Space Shop - Be good, Be bad, Be yourself | Product Details</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon2.ico">

        <!-- Core Style CSS -->
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/core-style.css">
        <!-- <link rel="stylesheet" href="style.css"> -->
        <style>
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

        </style>
    </head>
    <body>

        <!-- ##### Main Content Wrapper Start ##### -->
        <jsp:include page="common/header.jsp"></jsp:include>
            <!-- Header Area End -->

            <!-- Product Details Area Start -->
            <div class="single-product-area section-padding-100 clearfix">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-12">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb mt-50">
                                    <li class="breadcrumb-item"><a href="ShopControl">Shop</a></li>
                                    <li class="breadcrumb-item"><a href="ShopControl?pageIndex=1&cID=${o.cid}">${cateName}</a></li>
                                <li class="breadcrumb-item active" aria-current="page">${detail.name}</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 col-lg-7">
                        <div class="single_product_thumb">
                            <div id="product_details_slider" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li class="active" data-target="#product_details_slider" data-slide-to="0" style="background-image: url(${image0}); background-repeat: no-repeat; background-size: 100% 100%;">
                                    </li>
                                    <li data-target="#product_details_slider" data-slide-to="1" style="background-image: url(${image1}); background-repeat: no-repeat; background-size: 100% 100%;">
                                    </li>
                                    <li data-target="#product_details_slider" data-slide-to="2" style="background-image: url(${image2}); background-repeat: no-repeat; background-size: 100% 100%;">
                                    </li>
                                    <li data-target="#product_details_slider" data-slide-to="3" style="background-image: url(${image3}); background-repeat: no-repeat; background-size: 100% 100%;">
                                    </li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <a class="gallery_img" href="${image0}">
                                            <img class="d-block w-100" src="${image0}" alt="First slide">
                                        </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a class="gallery_img" href="${image1}">
                                            <img class="d-block w-100" src="${image1}" alt="Second slide">
                                        </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a class="gallery_img" href="${image2}">
                                            <img class="d-block w-100" src="${image2}" alt="Third slide">
                                        </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a class="gallery_img" href="${image3}">
                                            <img class="d-block w-100" src="${image3}" alt="Fourth slide">
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-5">
                        <div class="single_product_desc">
                            <!-- Product Meta Data -->
                            <div class="product-meta-data">
                                <div class="line"></div>
                                <p class="product-price">$${detail.price}</p>
                                <a href="#">
                                    <h6>${detail.name}</h6>
                                </a>
                                <!-- Ratings & Review -->
                                <div class="ratings-review mb-15 d-flex align-items-center justify-content-between">
                                    <div class="ratings">
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                    </div>
                                    <div class="review">
                                        <a href="#">Write A Review</a>
                                    </div>
                                </div>
                                <!-- Avaiable -->
                                <c:if test="${o.detail != 0}">
                                    <p class="avaibility"><i class="fa fa-circle"></i> In Stock</p></c:if>
                                <c:if test="${o.detail == 0}">
                                    <p class="avaibility"><i class="fa fa-circle" style="color: red"></i> Out Stock</p></c:if>
                                </div>

                                <div class="short_overview my-5">
                                    <p>${detail.description}</p>
                            </div>


                            <!-- Add to Cart Form -->
                            <!--                            <form class="cart clearfix" method="post" action="">
                                                            <div class="form-group">
                                                                <label>Size</label>
                                                                <select name="size" class="form-control" id="sizeSelect">
                            <%--<c:forEach items="${listSize}" var="o">--%>
                                <option value="${o.id}">${o.size}</option>
                            <%--</c:forEach>--%>
                        </select>
                        <small style="color: red; display: none;" id="sizeError">Please select at least one size.</small>
                    </div>
                    <a href="cart?id=${detail.id}&action=add"><button type="button" name="addtocart" value="${detail.id}" class="btn amado-btn">Add to cart</button></a>
                </form>-->
                            <c:if test="${o.detail != 0}">
                                <form class="cart clearfix" method="post" action="cart">
                                    <div class="form-group">
                                        <label>Size</label>
                                        <div id="sizeContainer">
                                            <c:forEach items="${listSize}" var="o">
                                                <div class="size-option" data-size="${o.id}">${o.size}</div>
                                            </c:forEach>
                                        </div>
                                        <input type="hidden" name="selectedSizes" id="selectedSizes">
                                        <input type="hidden" name="action" value="add">
                                        <input type="hidden" name="id" value="${detail.id}">
                                        <small style="color: red; display: none;" id="sizeError">Please select at least one size.</small>
                                    </div>
                                    <button type="submit" name="addtocart" value="${detail.id}" class="btn amado-btn">Add to cart</button>
                                </form>
                            </c:if>

                        </div>
                    </div>
                </div>
            </div>


            <div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab" style="margin-top: 30px">
                <div class="row">
                    <div class="col-lg-6">
                        <h4>Feedbacks</h4>
                        <div class="review_list">
                            <c:forEach items="${feedbacks}" var="f">
                                <div class="review_item" style="border-bottom: 1px solid black; margin-bottom: 30px">
                                    <div class="media">
                                        <div class="media-body">
                                            <div style="display: flex">
                                                <h4>${f.userName}</h4> <!-- Edit Button -->
                                                <c:if test="${sessionScope.acc != null && sessionScope.acc.id == f.userId}">

                                                    <button class="btn btn-link" onclick="toggleEditForm(${f.id})"><i style="font-size: 16px; color: #fbb710" class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></button>
                                                </c:if></div>
                                            <p style="padding-top: 0px"><fmt:formatDate value="${f.feedbackDate}" pattern="yyyy-MM-dd HH:mm:ss" timeZone="Asia/Ho_Chi_Minh" /></p>
                                            <c:forEach var="i" begin="1" end="5">
                                                <i class="fa fa-star star-grey" <c:if test="${i <= f.rating}">style="color: gold !important"</c:if>></i>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <p id="content-${f.id}">${f.feedbackContent}</p>



                                    <!-- Edit Form (Hidden by default) -->
                                    <div id="editForm-${f.id}" style="display: none;">
                                        <form action="update-feedback" method="post">
                                            <input type="hidden" name="feedbackId" value="${f.id}">
                                            <input class="form-control" name="productId" type="hidden" value="${detail.id}">
                                            <!-- Rating Dropdown -->
                                            <div class="form-group">
                                                <p>Edit Your Rating:</p>
                                                <select class="form-group" name="rating">
                                                    <option value="5" <c:if test="${f.rating == 5}">selected</c:if>>5 stars</option>
                                                    <option value="4" <c:if test="${f.rating == 4}">selected</c:if>>4 stars</option>
                                                    <option value="3" <c:if test="${f.rating == 3}">selected</c:if>>3 stars</option>
                                                    <option value="2" <c:if test="${f.rating == 2}">selected</c:if>>2 stars</option>
                                                    <option value="1" <c:if test="${f.rating == 1}">selected</c:if>>1 star</option>
                                                    </select>
                                                </div>

                                                <!-- Feedback Content -->
                                                <div class="form-group">
                                                    <textarea class="form-control" name="message" rows="3" required>${f.feedbackContent}</textarea>
                                            </div>

                                            <!-- Submit and Cancel Buttons -->
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-primary">Update</button>
                                                <button type="button" class="btn btn-secondary" onclick="toggleEditForm(${f.id})">Cancel</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <!-- Add a New Review Section -->
                    <div class="col-lg-6">
                        <div class="review_box">
                            <h4>Add a Review</h4>
                            <p style="color: red">*Only people who have purchased this product can review it.</p>
                            <form action="add-feedback" class="form-contact form-review mt-3" method="post">
                                <input class="form-control" name="productId" type="hidden" value="${detail.id}">
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
                                    <textarea class="form-control different-control w-100" name="message" cols="30" rows="5" placeholder="Enter Message" required></textarea>
                                </div>
                                <div class="form-group text-center text-md-right mt-3">
                                    <c:if test="${canFeedback != null && canFeedback == true}">
                                        <button type="submit" class="btn amado-btn">Submit Now</button>
                                    </c:if>
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

        <script>
                                                    function toggleEditForm(feedbackId) {
                                                        const editForm = document.getElementById("editForm-" + feedbackId);
                                                        const content = document.getElementById("content-" + feedbackId);

                                                        // Check if elements exist before accessing their style
                                                        if (editForm && content) {
                                                            if (editForm.style.display === 'none') {
                                                                editForm.style.display = 'block';
                                                                content.style.display = 'none';
                                                            } else {
                                                                editForm.style.display = 'none';
                                                                content.style.display = 'block';
                                                            }
                                                        } else {
                                                            console.error(`Element not found for feedback ID: ${feedbackId}`);
                                                        }
                                                    }

                                                    document.addEventListener("DOMContentLoaded", function () {
                                                        const sizeOptions = document.querySelectorAll(".size-option");
                                                        const selectedSizesInput = document.getElementById("selectedSizes");
                                                        const sizeError = document.getElementById("sizeError");
                                                        let selectedSizes = [];

                                                        sizeOptions.forEach(option => {
                                                            option.addEventListener("click", function () {
                                                                const sizeId = this.getAttribute("data-size");

                                                                if (selectedSizes.includes(sizeId)) {
                                                                    // Nếu đã chọn, bỏ chọn
                                                                    selectedSizes = selectedSizes.filter(id => id !== sizeId);
                                                                    this.classList.remove("selected");
                                                                } else {
                                                                    // Nếu chưa chọn, thêm vào danh sách
                                                                    selectedSizes.push(sizeId);
                                                                    this.classList.add("selected");
                                                                }

                                                                // Cập nhật input ẩn
                                                                selectedSizesInput.value = selectedSizes.join(",");

                                                                // Ẩn lỗi nếu có size được chọn
                                                                if (selectedSizes.length > 0) {
                                                                    sizeError.style.display = "none";
                                                                }
                                                            });
                                                        });

                                                        document.querySelector("form").addEventListener("submit", function (event) {
                                                            if (selectedSizes.length === 0) {
                                                                sizeError.style.display = "block";
                                                                event.preventDefault(); // Ngăn form submit nếu chưa chọn size
                                                            }
                                                        });
                                                    });


    </script>
</body>
</html>
