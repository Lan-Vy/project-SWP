<%@page import="entity.CartItem"%>
<%@page import="dao.CartDAO"%>
<%@page import="dao.ProductDAO"%>

<%@page import="entity.Product"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div class="main-content-wrapper d-flex clearfix">
    <!-- Mobile Nav (max width 767px)-->
    <div class="mobile-nav">
        <!-- Navbar Brand -->
        <div class="amado-navbar-brand">
            <a href="ShopControl"><img src="img/core-img/logo3.png" alt=""></a>
        </div>
        <!-- Navbar Toggler -->
        <div class="amado-navbar-toggler">
            <span></span><span></span><span></span>
        </div>
    </div>

    <!-- Header Area Start -->
    <header class="header-area clearfix">
        <!-- Close Icon -->
        <div class="nav-close">
            <i class="fa fa-close" aria-hidden="true"></i>
        </div>
        <!-- Logo -->
        <div class="logo">
            <a href="ShopControl"><img src="img/core-img/logo3.png" alt=""></a>
        </div>
        <!-- Amado Nav -->
        <nav class="amado-nav">
            <ul>
                <!--<li><a href="HomeControl">Home</a></li>-->
                <li><a href="ShopControl">Shop</a></li>
                    <%--<c:if test="${sessionScope.acc != null && (sessionScope.acc.role == 2 || sessionScope.acc.role == 3)}">--%>
                    <!--<li><a href="dashboard"> Dashboard</a></li>-->
                    <%--</c:if>--%>
                <!--<li><a href="ProductDetail.jsp">Product</a></li>-->
                <li><a href="cart">Cart</a></li>
                    <c:if test="${sessionScope.acc != null}">
                    <li><a href="OrderHistoryControl">Order History</a></li>
                    </c:if>
                <!--<li><a href="CheckOut.jsp">Checkout</a></li>-->
                <%--<c:if test="${sessionScope.acc == null}">--%>
                    <!--<li><a href="Login.jsp">Checkout</a></li>-->
                    <%--</c:if>--%>
                    <%--<c:if test="${sessionScope.acc != null}">--%>
                    <!--<li><a href="CheckOut.jsp">Checkout</a></li>-->
                    <%--</c:if>--%>


                <li><a href="AboutUs.jsp">About Us</a></li>
                <li><a href="Contact.jsp">Contact</a></li>
                    <c:if test="${sessionScope.acc == null}">
                    <li><a href="Login.jsp">Login</a></li>
                    </c:if>
                    <c:if test="${sessionScope.acc != null}">
                    <li><a href="Profile">Hi, ${sessionScope.acc.userName}</a></li>
                    <li><a href="logout">Logout</a></li>
                    </c:if>
            </ul>
        </nav>
        <!-- Button Group -->

       <!-- Button Group -->
        <%
            ProductDAO dao = new ProductDAO(); // Get the newest product
            Product pNew = dao.getNewestProduct();// ID of the newest product
            int idNew = pNew.getId();// Get the best-selling product
            int idBest = dao.getBestSeller();// Retrieve the cart from session
        %>
        <!-- Button for Bestselling Product -->
        <div class="amado-btn-group mt-30 mb-100">
            <a href="productDetail?productID=<%= idBest%>" class="btn amado-btn mb-15">Bestseller</a>
            <a href="productDetail?productID=<%= idNew%>" class="btn amado-btn active">Newest Product</a>
        </div>
        <!-- Cart Menu -->
        <div class="cart-fav-search mb-100">
            <a href="cart" class="cart-nav"><img src="img/core-img/cart.png" alt=""> Cart</a>
            <a href="#" class="fav-nav"><img src="img/core-img/favorites.png" alt=""> Favourite</a>
            <!--<a href="#" class=""><img src="img/core-img/search.png" alt=""> Search</a>-->
        </div>
        <!-- Social Button -->
        <div class="social-info d-flex justify-content-between">
            <a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
            <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
            <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
            <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
        </div>
    </header>