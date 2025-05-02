<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%><%@ page import="java.text.NumberFormat, java.util.Locale" %>
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
        <title>Revolt Athletics | Shop</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon2.ico">

        <!-- Core Style CSS -->
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/core-style.css">
        <!--<link rel="stylesheet" href="style.css">--> 
        <style>
            /* General Styles */
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f9f9f9; /* Lighter background for a cleaner look */
                color: #333; /* Dark gray text for readability */
            }

            .container-fluid {
                background-color: #ffffff; /* White background for containers */
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            /* Product Description */
            .product-description {
                display: flex;
                justify-content: space-between;
                align-items: flex-start;
                padding: 15px;
                background-color: #fafafa; /* Soft light grey for product description */
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease;
            }

            .product-description:hover {
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            }

            .product-meta-data {
                width: 70%;
                color: #333;
            }

            .product-price {
                font-size: 1.2rem;
                font-weight: bold;
                color: #2c3e50; /* Darker grey for price */
            }

            /* Search Bar */
            .searchbar {
                display: flex;
                align-items: center;
                background-color: #ffffff; /* White background for search bar */
                border-radius: 30px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                padding: 8px 20px;
                transition: all 0.3s ease;
            }

            .searchbar:hover {
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            }

            .search_input {
                width: 100%;
                padding: 10px;
                border: none;
                outline: none;
                font-size: 16px;
                background-color: #ecf0f1; /* Lighter grey for input background */
                border-radius: 30px;
                color: #333;
                transition: width 0.3s ease;
            }

            .search_input:focus {
                width: 85%;
            }

            .search_icon {
                background-color: #3498db; /* Bright blue for the search icon */
                color: #ffffff;
                padding: 10px;
                border-radius: 50%;
                cursor: pointer;
            }

            /* Sidebar */
            .widget {
                background-color: #ffffff; /* White background for sidebar widget */
                padding: 15px;
                border-radius: 8px;
                margin-bottom: 20px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            .widget-title {
                font-size: 1.2rem;
                font-weight: bold;
                color: #333;
                margin-bottom: 10px;
            }

            .form-check-label {
                color: #333;
            }

            .form-check-input:checked {
                background-color: #3498db; /* Blue color for selected radio buttons */
                border-color: #3498db;
            }

            /* Sold Out Overlay */
            .sold-out-overlay {
                position: absolute;
                top: 40%;
                left: 50%;
                transform: translate(-50%, -50%) rotate(-10deg);
                background-color: rgba(231, 76, 60, 0.8); /* Red background with transparency */
                color: #ffffff;
                font-size: 18px;
                font-weight: bold;
                padding: 8px 16px;
                border-radius: 8px;
                text-transform: uppercase;
                z-index: 2;
            }

            /* Pagination */
            .pagination .page-item.active .page-link {
                background-color: #3498db; /* Active page color */
                border-color: #3498db;
            }

            .pagination .page-link {
                color: #333;
            }

            /* Hover Effects */
            .product-img-wrapper:hover {
                transform: scale(1.05);
                transition: transform 0.3s ease;
            }

            /* Responsiveness */
            @media (max-width: 768px) {
                .product-description {
                    flex-direction: column;
                    align-items: center;
                    text-align: center;
                }

                .searchbar {
                    flex-direction: column;
                    align-items: center;
                }
            }

        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <body>

        <!-- ##### Main Content Wrapper Start ##### -->
        <jsp:include page="common/header.jsp"></jsp:include>
            <!-- Header Area End -->

            <div class="shop_sidebar_area">

                <div class="widget catagory mb-50">
                    <!-- Widget Title -->
                    <h6 class="widget-title mb-30" id="categoryMenuParent" onclick="toggleCategoryMenu()" style="cursor: pointer;">
                        Categories ▼
                    </h6>

                    <!-- Categories Dropdown -->
                    <div class="catagories-menu" id="categoryMenu">
                        <ul>
                            <li class="${tag == 0 ? "active":""}">
                            <a href="ShopControl?pageIndex=1&txtSearch=${searchValue}&cID=${o.id}&priceRange=${priceRange}">
                                All
                            </a>
                        </li>
                        <c:forEach items="${listC}" var="o">
                            <li class="${tag == o.id ? "active":""}">
                                <a href="ShopControl?pageIndex=1&txtSearch=${searchValue}&cID=${o.id}&priceRange=${priceRange}">
                                    ${o.name}
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>

            <!-- ##### Single Widget ##### -->
            <div class="widget brands mb-50">
                <!-- Widget Title -->
                <h6 class="widget-title mb-30">Price</h6>

                <div class="widget-desc">
                    <!-- Single Form Check -->
                    <div class="form-check">
                        <input class="form-check-input" type="radio" value="0" id="hi" name="price" checked="" onchange="searchByName()"/>
                        <label class="form-check-label" for="hi">All price</label>
                    </div>
                    <!-- Single Form Check -->
                    <div class="form-check">
                        <input class="form-check-input" type="radio" value="1" id="amado" name="price" onchange="searchByName()" <c:if test="${priceRange eq '1'}">checked</c:if>/>
                            <label class="form-check-label" for="amado">Under 300K</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="radio" value="2" id="furniture" name="price" onchange="searchByName()" <c:if test="${priceRange eq '2'}">checked</c:if>/>
                            <label class="form-check-label" for="furniture">300K - 500K</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="radio" value="3" id="factory" name="price" onchange="searchByName()" <c:if test="${priceRange eq '3'}">checked</c:if>/>
                            <label class="form-check-label" for="factory">500K - 1000K</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="radio" value="4" id="artdeco" name="price" onchange="searchByName()" <c:if test="${priceRange eq '4'}">checked</c:if>/>
                            <label class="form-check-label" for="artdeco">1000K +</label>
                        </div>
                    </div>
                </div>
            </div>
        <fmt:setLocale value="vi_VN"/>
        <div class="amado_product_area section-padding-100">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">
                        <div class="product-topbar d-xl-flex align-items-end justify-content-between">


                            <div class="container h-100 text-search">
                                <div class="d-flex justify-content-center h-50 mr-15">
                                    <div class="searchbar">
                                        <input oninput="searchByName()" class="search_input" type="text" name="txtSearch"
                                               placeholder="Search..." value="${searchValue}" id="txtSearch"> <a href="#"
                                               class="search_icon"><img src="img/core-img/search.png"
                                                                 alt="" /></a>
                                    </div>
                                </div>
                            </div>

                            <!-- Sorting -->
                            <div class="product-sorting d-flex">
                                <div class="sort-by-date d-flex align-items-center mr-15" id="formSort">
                                    <!--<p>Sort</p>-->
                                    <p>Price</p>
                                    <form action="#" method="get">
                                        <select name="select" id="sortByPrice" onchange="searchByName()">
                                            <option value="asc" ${sort eq "asc" ? "selected" : ""}>Asc</option>
                                            <option value="desc" ${sort eq "desc" ? "selected" : ""}>Desc</option>
                                        </select>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="content" class="row">
                    <c:forEach items="${listP}" var="o">
                        <!-- Single Product Area -->
                        <div class="col-12 col-sm-6 col-md-12 col-xl-6">
                            <div class="single-product-wrapper product-wrapper"> <!-- Thêm lớp product-wrapper -->
                                <!-- Product Image -->
                                <div class="product-img-wrapper">
                                    <div class="product-img">
                                        <img src="${o.image}" alt="">
                                        <c:if test="${o.amount == 0}">
                                            <div class="sold-out-overlay">SOLD OUT</div>
                                        </c:if>
                                    </div>
                                </div>

                                <!-- Product Description -->
                                <div class="product-description d-flex align-items-center justify-content-between">
                                    <!-- Product Meta Data -->
                                    <div class="product-meta-data">
                                        <div class="line"></div>
                                        <fmt:formatNumber value="${o.price}" type="number" groupingUsed="true" var="formattedPrice"/>
                                        <p class="product-price">${formattedPrice} VND</p>
                                        <a href="productDetail?productID=${o.id}&sizeId=${o.size.id}">
                                            <h6>${o.name}</h6>
                                        </a>
                                    </div>
                                    <!-- Ratings & Cart -->
                                    <div class="ratings-cart text-right">
                                        <div class="cart">
                                            <c:if test="${o.amount != 0}">
                                                <a href="productDetail?productID=${o.id}&sizeId=${o.size.id}" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                                </c:if>
                                                <c:if test="${o.amount == 0}">
                                                <a href="ShopControl" data-toggle="tooltip" data-placement="left">Sold out</a>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </c:forEach>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <!-- Pagination -->
                    <nav aria-label="navigation">
                        <ul class="pagination justify-content-end mt-50" id="paging">
                            <c:forEach begin="1" end="${totalPage}" var="i">
                                <li class="page-item ${pageIndex == i ? "active":""}"><a
                                        class="page-link"
                                        href="ShopControl?pageIndex=${i}&txtSearch=${searchValue}&cID=${cID}&sort=${sort}&priceRange=${priceRange}">${i}</a></li>
                                </c:forEach>
                        </ul>
                    </nav>
                </div>
            </div>
            <div>
                <div class="top-5-products mb-50">
                    <h2>Top 5 Best Sellers</h2>
                    <div id="content-top5" class="row d-flex justify-content-center">
                        <c:forEach items="${top5}" var="o">
                            <!-- Single Product Area for Top 5 (in a row) -->
                            <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                                <div class="single-product-wrapper">
                                    <!-- Product Image -->
                                    <div class="product-img-wrapper">
                                        <div class="product-img">
                                            <img src="${o.image}" alt="">
                                        </div>
                                    </div>
                                    <!-- Product Description -->
                                    <div class="product-description d-flex align-items-center justify-content-between">
                                        <!-- Product Meta Data -->
                                        <div class="product-meta-data">
                                            <div class="line"></div>
                                            <fmt:formatNumber value="${o.price}" type="number" groupingUsed="true" var="formattedPrice"/>
                                            <p class="product-price">${formattedPrice} VND</p>
                                            <a href="productDetail?productID=${o.id}&sizeId=${o.size.id}">
                                                <h6>${o.name}</h6>
                                            </a>

                                        </div>
                                        <!-- Ratings & Cart -->
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>


            <div>
                <div class="top-5-products mb-50">
                    <h2>Top 5 Newest Product</h2>
                    <div id="content-top5" class="row d-flex justify-content-center">
                        <c:forEach items="${top5Newest}" var="o">
                            <!-- Single Product Area for Top 5 (in a row) -->
                            <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                                <div class="single-product-wrapper">
                                    <!-- Product Image -->
                                    <div class="product-img-wrapper">
                                        <div class="product-img">
                                            <img src="${o.image}" alt="">
                                        </div>
                                    </div>
                                    <!-- Product Description -->
                                    <div class="product-description d-flex align-items-center justify-content-between">
                                        <!-- Product Meta Data -->
                                        <div class="product-meta-data">
                                            <div class="line"></div>
                                            <fmt:formatNumber value="${o.price}" type="number" groupingUsed="true" var="formattedPrice"/>
                                            <p class="product-price">${formattedPrice} VND</p>
                                            <a href="productDetail?productID=${o.id}&sizeId=${o.size.id}">
                                                <h6>${o.name}</h6>
                                            </a>

                                        </div>
                                        <!-- Ratings & Cart -->
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>


        </div>
    </div>

    <input type="hidden" id="categoryID" value="${cID}"/>
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
                                            function searchByName() {
                                                var txtSearch = document.getElementById("txtSearch").value;
                                                var cID = document.getElementById("categoryID").value;
                                                var sort = document.getElementById("sortByPrice").value;
                                                var priceRange = document.querySelector('input[name="price"]:checked').value;
                                                console.log(priceRange);
                                                $.ajax({
                                                    url: "/Project_Group6/search",
                                                    type: "get", //send it throung get method
                                                    data: {
                                                        txt: txtSearch,
                                                        cID: cID,
                                                        sort: sort,
                                                        priceRange: priceRange
                                                    },
                                                    success: function (data) {
                                                        var row = document.getElementById("content");
                                                        row.innerHTML = data.product;
                                                        var row2 = document.getElementById("paging");
                                                        row2.innerHTML = data.paging;
                                                        var row3 = document.getElementById("categoryMenu");
                                                        row3.innerHTML = data.categoryMenu;
//                                                        var row4 = document.getElementById("formSort");
//                                                        row4.innerHTML = data.sortJson;
                                                    },
                                                    error: function (xhr) {
                                                        //do something to handle error
                                                    }
                                                });
                                            }
</script>
<script>
    function toggleCategoryMenu() {
        var menu = document.getElementById("categoryMenu");
        if (menu.style.display === "none") {
            menu.style.display = "block";
        } else {
            menu.style.display = "none";
        }
    }
</script>
</script>
</body>
</html>
