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
        <!--        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>-->
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
        <fmt:setLocale value="vi_VN"/>
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
                            <input class="form-control" id="productId" type="hidden" value="${detail.id}">
                            <!-- Product Meta Data -->
                            <div class="product-meta-data">
                                <div class="line"></div>
                                <fmt:formatNumber value="${detail.price}" type="number" groupingUsed="true" var="formattedPrice"/>
                                <p class="product-price">${formattedPrice} VND</p>

                                <a href="#">
                                    <h6>${detail.name}</h6>
                                </a>
                                <!-- Ratings & Review -->
                                <div class=" mb-15 d-flex margin">

                                    <div class="review">
                                        <a href="#review">Write A Review</a>
                                    </div>
                                </div>
                                <div class=" mb-15 d-flex align-items-center ">
                                    <p style="font-size: 14px; margin-top: -10px;">Average rating: 
                                        <fmt:formatNumber value="${avgRating}" type="number" maxFractionDigits="1" /> / 5
                                        <c:forEach var="i" begin="1" end="1">
                                            <i class="fa fa-star" <c:if test="${i <= avgRating}">style="color: gold !important"</c:if>></i>
                                        </c:forEach>
                                    </p>



                                </div>

                                <!-- Avaiable -->
                                <c:if test="${detail.amount > 0}">
                                    <p class="avaibility"><i class="fa fa-circle"></i> In Stock</p></c:if>
                                <c:if test="${detail.amount == 0}">
                                    <p class="avaibility"><i class="fa fa-circle" style="color: red"></i> Out Stock</p></c:if>
                                </div>

                                <div class="short_overview my-5">
                                    <p>${detail.description}</p>
                            </div>
                            <form class="cart clearfix" method="post" action="cart" id="cartForm">
                                <c:if test="${not empty cartSuccess}">
                                    <div class="alert alert-success" role="alert" id="alert-success">
                                        ${cartSuccess}
                                    </div>
                                </c:if>

                                <c:if test="${not empty cartFail}">
                                    <div class="alert alert-danger" role="alert" id="alert-fail">
                                        ${cartFail}
                                    </div>
                                </c:if>

                                <div class="form-group">
                                    <label>Size</label>  <p> quantity ${pSize.amount}</p>
                                    <div id="sizeContainer">
                                        <c:forEach items="${listSize}" var="o">
                                            <div class="size-option
                                                 ${o.id == detail.size.id && detail.amount > 0 ? 'selected' : ''}
                                                 ${o.quantity == 0 ? 'disabled' : ''}"
                                                 data-size="${o.id}" 
                                                 data-quantity="${o.quantity}">${o.size}
                                            </div>
                                        </c:forEach>

                                    </div>
                                    <input type="hidden" name="sizeId" id="sizeId" value="${detail.size.id}">
                                    <input type="hidden" name="action" value="add">
                                    <input type="hidden" name="id" value="${detail.id}">
                                    <small style="color: red; display: none;" id="sizeError">Please select at least one size.</small>
                                </div>
                                <div class="form-group">
                                    <label for="quantity">Quantity</label>
                                    <div class="input-group" style="max-width: 120px;">
                                        <div class="input-group-prepend">
                                            <button class="btn btn-outline-secondary" type="button" id="btn-minus">-</button>
                                        </div>
                                        <input type="number" name="quantity" id="quantity" class="form-control text-center"
                                               value="${selectedQuantity != null ? selectedQuantity : 1}" min="1">
                                        <div class="input-group-append">
                                            <button class="btn btn-outline-secondary" type="button" id="btn-plus">+</button>
                                        </div>
                                    </div>
                                </div>


                                <c:if test="${detail.amount > 0}">
                                    <button type="submit" name="addtocart" value="${detail.id}" class="btn amado-btn">Add to cart</button>
                                </c:if>
                            </form>

                            <script>
                                document.addEventListener("DOMContentLoaded", function () {
                                    const btnPlus = document.getElementById("btn-plus");
                                    const btnMinus = document.getElementById("btn-minus");
                                    const inputQty = document.getElementById("quantity");
                                    const sizeOptions = document.querySelectorAll(".size-option");
                                    const sizeIdInput = document.getElementById("sizeId");
                                    const productId = document.getElementById("productId").value;

                                    let maxQuantity = parseInt(document.querySelector(".size-option.selected")?.getAttribute("data-quantity")) || 1000;

                                    // Tăng giảm quantity theo maxQuantity
                                    btnPlus.addEventListener("click", () => {
                                        let current = parseInt(inputQty.value);
                                        if (current < maxQuantity) {
                                            inputQty.value = current + 1;
                                        } else {
                                            alert("⚠️ Số lượng vượt quá tồn kho!");
                                        }
                                    });

                                    btnMinus.addEventListener("click", () => {
                                        let current = parseInt(inputQty.value);
                                        if (current > 1) {
                                            inputQty.value = current - 1;
                                        }
                                    });

                                    // Highlight size ban đầu
                                    sizeOptions.forEach(option => {
                                        if (option.getAttribute("data-size") === sizeIdInput.value && option.getAttribute("data-quantity") !== '0') {
                                            option.classList.add("selected");
                                        }
                                    });

                                    // Xử lý click size
                                    sizeOptions.forEach(option => {
                                        option.addEventListener("click", function () {
                                            const selectedSizeId = this.getAttribute("data-size");
                                            const newMax = parseInt(this.getAttribute("data-quantity")) || 1000;
                                            const currentQty = parseInt(inputQty.value) || 1;

                                            // Nếu chọn lại size cũ => bỏ chọn
                                            if (selectedSizeId === sizeIdInput.value) {
                                                this.classList.remove("selected");
                                                sizeIdInput.value = "";
                                            } else {
                                                sizeOptions.forEach(opt => opt.classList.remove("selected"));
                                                this.classList.add("selected");
                                                sizeIdInput.value = selectedSizeId;

                                                // Nếu số lượng đang chọn lớn hơn tồn kho size mới
                                                if (currentQty > newMax) {
                                                    inputQty.value = newMax;
                                                }

                                                // Gán lại maxQuantity mới
                                                maxQuantity = newMax;

                                                // Redirect giữ lại quantity
                                                window.location.href = "productDetail?productID=" + productId +
                                                        "&sizeId=" + selectedSizeId + "&quantity=" + inputQty.value;
                                            }
                                        });
                                    });

                                    // Check chọn size trước khi submit
                                    document.getElementById('cartForm').addEventListener('submit', function (e) {
                                        const sizeId = sizeIdInput.value;
                                        if (!sizeId) {
                                            document.getElementById('sizeError').style.display = 'block';
                                            e.preventDefault();
                                        } else {
                                            document.getElementById('sizeError').style.display = 'none';
                                        }
                                    });
                                });
                                setTimeout(function () {
                                    const success = document.getElementById("alert-success");
                                    const fail = document.getElementById("alert-fail");

                                    if (success)
                                        success.style.display = "none";
                                    if (fail)
                                        fail.style.display = "none";
                                }, 3000); // 3 giây
                            </script>
                            <style>
                                .alert {
                                    padding: 12px 20px;
                                    border-radius: 5px;
                                    margin-top: 15px;
                                    font-weight: 500;
                                    font-size: 15px;
                                    animation: fadein 0.5s ease;
                                }

                                .alert-success {
                                    background-color: #d4edda;
                                    color: #155724;
                                    border: 1px solid #c3e6cb;
                                }

                                .alert-danger {
                                    background-color: #f8d7da;
                                    color: #721c24;
                                    border: 1px solid #f5c6cb;
                                }

                                @keyframes fadein {
                                    from {
                                        opacity: 0;
                                    }
                                    to {
                                        opacity: 1;
                                    }
                                }
                            </style>


                        </div>
                    </div>
                </div>
            </div>


            <div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab" style="margin-top: 30px">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <h4>Customer Reviews</h4>
                            
                            <!-- Average Rating Section -->
                            <div class="average-rating" style="margin-bottom: 20px;">
                                <p style="font-size: 16px; margin-bottom: 10px;">Average Rating: 
                                    <span style="font-weight: bold; font-size: 18px;"><fmt:formatNumber value="${avgRating}" type="number" maxFractionDigits="1" /> / 5.0</span>
                                </p>
                                <div class="rating-stars" style="font-size: 20px; margin-bottom: 15px;">
                                    <c:forEach var="i" begin="1" end="5">
                                        <i class="fa fa-star" <c:if test="${i <= avgRating}">style="color: gold !important"</c:if> <c:if test="${i > avgRating}">style="color: #ddd !important"</c:if>></i>
                                    </c:forEach>
                                    <span style="margin-left: 10px; font-size: 14px; color: #666;">(${feedbacks.size()} reviews)</span>
                                </div>
                            </div>
                            
                            <hr style="margin-bottom: 20px;">
                            
                            <div class="review_list">
                                <c:if test="${empty feedbacks}">
                                    <div class="alert alert-info" role="alert">
                                        This product doesn't have any reviews yet. Be the first to review it!
                                    </div>
                                </c:if>
                                
                                <c:forEach items="${feedbacks}" var="f">
                                    <div class="review_item" style="border-bottom: 1px solid #eee; margin-bottom: 30px; padding-bottom: 20px;">
                                        <div class="media">
                                            <div class="media-body">
                                                <div style="display: flex; justify-content: space-between;">
                                                    <h4>${f.userName}</h4>
                                                    <!-- Edit Button -->
                                                    <c:if test="${sessionScope.acc != null && sessionScope.acc.id == f.userId} ">
                                                        <button class="btn btn-link" onclick="toggleEditForm(${f.id})">
                                                            <i style="font-size: 16px; color: #fbb710" class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
                                                        </button>
                                                    </c:if>
                                                </div>
                                                <p style="padding-top: 0px; color: #888; font-size: 14px;">
                                                    <fmt:formatDate value="${f.feedbackDate}" pattern="yyyy-MM-dd HH:mm:ss" timeZone="Asia/Ho_Chi_Minh" />
                                                    <c:if test="${not empty f.sizeName}">
                                                        <span style="margin-left: 10px; color: #333;">• Size: ${f.sizeName}</span>
                                                    </c:if>
                                                </p>
                                                <div style="margin-bottom: 10px; font-size: 16px;">
                                                    <c:forEach var="i" begin="1" end="5">
                                                        <i class="fa fa-star star-grey" <c:if test="${i <= f.rating}">style="color: gold !important"</c:if>></i>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                        <p id="content-${f.id}" style="margin-bottom: 15px;">${f.feedbackContent}</p>

                                        <!-- Hiển thị reply của feedback này -->
                                        <c:if test="${f.replyUserId > 0}">
                                            <div class="replies" style="margin-left: 30px; border-left: 3px solid #fbb710; padding-left: 15px; background-color: #f8f9fa;">
                                                <div class="reply_item" style="padding: 10px;">
                                                    <p style="margin-bottom: 0;"><strong style="color: #fbb710;">Revolt Athletics Response:</strong> ${f.replyFeedbackContent}</p>
                                                </div>
                                            </div>
                                        </c:if>

                                        <!-- Edit Form (Hidden by default) -->
                                        <div id="editForm-${f.id}" style="display: none; margin-top: 15px; padding: 15px; background-color: #f8f9fa; border-radius: 5px;">
                                            <form action="update-feedback" method="post">
                                                <input type="hidden" name="feedbackId" value="${f.id}">
                                                <input class="form-control" name="productId" type="hidden" value="${detail.id}">
                                                <input class="form-control" name="sizeId" type="hidden" value="${detail.size.id}">
                                                <!-- Rating Dropdown -->
                                                <div class="form-group">
                                                    <label>Update Your Rating:</label>
                                                    <select class="form-control" name="rating">
                                                        <option value="5" <c:if test="${f.rating == 5}">selected</c:if>>5 stars (Excellent)</option>
                                                        <option value="4" <c:if test="${f.rating == 4}">selected</c:if>>4 stars (Very Good)</option>
                                                        <option value="3" <c:if test="${f.rating == 3}">selected</c:if>>3 stars (Good)</option>
                                                        <option value="2" <c:if test="${f.rating == 2}">selected</c:if>>2 stars (Fair)</option>
                                                        <option value="1" <c:if test="${f.rating == 1}">selected</c:if>>1 star (Poor)</option>
                                                    </select>
                                                </div>

                                                <!-- Feedback Content -->
                                                <div class="form-group">
                                                    <label>Update Your Review:</label>
                                                    <textarea class="form-control" name="message" rows="3" required>${f.feedbackContent}</textarea>
                                                </div>

                                                <!-- Submit and Cancel Buttons -->
                                                <div class="form-group">
                                                    <button type="submit" class="btn amado-btn">Update</button>
                                                    <button type="button" class="btn amado-btn active" onclick="toggleEditForm(${f.id})">Cancel</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
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
                                                        const productId = document.getElementById("productId").value; // Input chứa productId
                                                        const sizeIdInput = document.getElementById("sizeId"); // Input ẩn để lưu sizeId
                                                        let selectedSize = sizeIdInput.value; // Giá trị mặc định từ server

                                                        // Highlight size ban đầu (nếu có)
                                                        sizeOptions.forEach(option => {
                                                            if (option.getAttribute("data-size") === selectedSize && option.getAttribute("data-quantity") !== '0') {
                                                                option.classList.add("selected");
                                                            }
                                                        });

                                                        sizeOptions.forEach(option => {
                                                            option.addEventListener("click", function () {
                                                                const sizeId = this.getAttribute("data-size");

                                                                // Nếu đã chọn trước đó, bỏ chọn
                                                                if (selectedSize === sizeId) {
                                                                    this.classList.remove("selected");
                                                                    selectedSize = null;
                                                                    sizeIdInput.value = ""; // Xóa giá trị input
                                                                } else {
                                                                    // Bỏ chọn tất cả trước khi chọn mới
                                                                    sizeOptions.forEach(opt => opt.classList.remove("selected"));
                                                                    this.classList.add("selected");
                                                                    selectedSize = sizeId;
                                                                    sizeIdInput.value = selectedSize; // Gán giá trị mới vào input

                                                                    // Chuyển hướng trang (dùng href)
                                                                    window.location.href = "productDetail?productID=" + productId + "&sizeId=" + selectedSize;
                                                                }
                                                            });
                                                        });
                                                    });

    </script>
</body>
</html>
