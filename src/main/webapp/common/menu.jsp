<%-- 
    Document   : menu
    Created on : Feb 19, 2025, 10:15:35 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String currentPage = request.getRequestURI(); %>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="ShopControl">Aloha Space Shop</a>
        </div>
        <ul class="nav navbar-nav">
            <li class="<%= currentPage.contains("ShopControl") ? "active" : ""%>">
                <a href="ShopControl">Shop</a>
                </li>
            <c:if test="${sessionScope.acc != null && (sessionScope.acc.role == 2)}">
                <li class="<%= currentPage.contains("dashboard") ? "active" : ""%>">
                    <a href="dashboard">Dashboard</a>
                </li>
                <li class="<%= currentPage.contains("ManagerControl") ? "active" : ""%>">
                    <a href="ManagerControl">Manage Product</a>
                </li>
                <li class="<%= currentPage.contains("ManagerCategoryControl") ? "active" : ""%>">
                    <a href="ManagerCategoryControl">Manage Category</a>
                </li>
                <li class="<%= currentPage.contains("ManagerFeedbackController") ? "active" : ""%>">
                    <a href="ManagerFeedbackController">Manage Feedback</a>
                </li>
                <li class="<%= currentPage.contains("ManagerAccount") ? "active" : ""%>">
                    <a href="ManagerAccount">Manage Account</a>
                </li>
            </c:if>
            <li class="<%= currentPage.contains("ManagerOrder") ? "active" : ""%>">
                <a href="ManagerOrder">Manage Order</a>
            </li>
        </ul>
    </div>
</nav>

