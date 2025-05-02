<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.AccountDAO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Dashboard</title>

        <!-- CSS & JS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="css/manager.css" rel="stylesheet" media="all">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>

        <style>
            /* Thêm kiểu dáng và hiệu ứng cho các card */
            .overview-item {
                background-color: #fff;
                border-radius: 12px;
                padding: 20px;
                min-height: 160px;
                display: flex;
                align-items: center;
                justify-content: space-between;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                margin-bottom: 20px;
            }

            .overview-item:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 15px rgba(0, 0, 0, 0.15);
            }

            .overview-box {
                display: flex;
                align-items: center;
                gap: 20px;
            }

            .overview-box .icon {
                font-size: 40px;
                color: #4e73df;
                transition: color 0.3s ease;
            }

            .overview-box .icon:hover {
                color: #2e59d9;
            }

            .overview-box .text {
                text-align: center;
                width: 100%;
            }

            .overview-box .text span {
                font-size: 35px;
                font-weight: bold;
                color: #333;
            }

            .overview-box .text h2 {
                font-size: 28px;
                font-weight: 600;
                color: #333;
            }

            /* Tạo một kiểu "highlight" cho tổng số lượt xem */
            .overview-item--c1 .overview-box .icon {
                color: #28a745;
            }

            .overview-item--c2 .overview-box .icon {
                color: #ffc107;
            }

            .overview-item--c3 .overview-box .icon {
                color: #007bff;
            }

            .overview-item--c4 .overview-box .icon {
                color: #dc3545;
            }

            .row.m-t-25 > .col-lg-3 {
                margin-bottom: 30px;
            }

            .product-list {
                text-align: left;
                overflow-y: auto;
                height: 100px;
                max-width: 250px;
                margin: 0 auto;
                border: 1px solid #e0e0e0;
                padding: 5px;
                border-radius: 5px;
            }
            /* Căn giữa chữ trong bảng */
            table {
                width: 100%;
                text-align: center;
            }

            /* Đặt padding cho các cột */
            th, td {
                padding: 15px;
            }

            /* Cột "Sold Products" rộng hơn và căn trái để dễ dàng hiển thị danh sách sản phẩm */
            .sold-products {
                width: 70%; /* Tăng chiều rộng của cột này */
                word-wrap: break-word;
                white-space: normal;
                text-align: left; /* Căn trái để hiển thị danh sách sản phẩm đẹp */
                max-height: 150px; /* Giới hạn chiều cao của cột */
                overflow-y: auto; /* Hiển thị thanh cuộn nếu nội dung dài */
                padding: 5px;
                border: 1px solid #e0e0e0;
                border-radius: 5px;
            }

            /* Căn giữa cho các cột còn lại */
            th, td:not(.sold-products) {
                text-align: center;
            }

            /* Đảm bảo cột "Sold Products" có thanh cuộn nếu quá dài */
            .sold-products div {
                max-height: 150px;
                overflow-y: auto;
                padding: 5px;
                border-radius: 5px;
            }

            /* Thêm màu nền cho các dòng lẻ */
            tbody tr:nth-child(odd) {
                background-color: #f9f9f9;
            }

            /* Thêm hiệu ứng hover cho các dòng trong bảng */
            tbody tr:hover {
                background-color: #f1f1f1;
                cursor: pointer;
            }

        </style>
    </head>

    <body>
        <div class="page-wrapper">
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <jsp:include page="common/menu.jsp"></jsp:include>

                            <!-- Overview -->
                            <div class="row m-t-25">
                                <!-- View -->
                                <div class="col-sm-6 col-lg-3">
                                    <div class="overview-item overview-item--c1">
                                        <div class="overview__inner">
                                            <div class="overview-box clearfix">
                                                <div class="icon"><i class="zmdi zmdi-account-o"></i></div>
                                                <div class="text">
                                                <%
                                                    AccountDAO dao = new AccountDAO();
                                                    int viewed = dao.getViewed();
                                                %>
                                                <span>View</span>
                                                <h2><%= viewed%></h2>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Items sold -->
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c2">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon"><i class="zmdi zmdi-shopping-cart"></i></div>
                                            <div class="text">
                                                <span>Items sold</span>
                                                <h2>${numberI}</h2>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Product -->
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c3">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon"><i class="zmdi zmdi-calendar-note"></i></div>
                                            <div class="text">
                                                <span>Product</span>
                                                <h2>${numberP}</h2>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Total earnings -->
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c4">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon"><i class="zmdi zmdi-money"></i></div>
                                            <div class="text">
                                                <%
                                                    Double totalE = (Double) request.getAttribute("totalE");
                                                    if (totalE == null) {
                                                        totalE = 0.0;
                                                    }
                                                    DecimalFormat df = new DecimalFormat("#,###");
                                                    String formattedTotalE = df.format(totalE);
                                                %>
                                                <span>Total earnings</span>
                                                <h2><%= formattedTotalE%> VND</h2>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- End overview -->

                    </div>
                </div>
            </div>
        </div>

        <!-- CHARTS -->
        <div class="container" style="margin-top: 50px;">
            <h3>View, Product, category and customer statistics by month</h3>
            <div class="month-selector">
                <form action="dashboard" method="get">
                    <label for="month">Select Month:</label>
                    <select name="month" id="month" onchange="this.form.submit()">
                        <c:forEach begin="1" end="12" var="m">
                            <option value="${m}" <c:if test="${selectedMonth == m}">selected</c:if>>${m}</option>
                        </c:forEach>
                    </select>

                    <label for="year">Select Year:</label>
                    <select name="year" id="year" onchange="this.form.submit()">
                        <c:forEach begin="2020" end="2025" var="year">
                            <option value="${year}" <c:if test="${selectedYear == year}">selected</c:if>>${year}</option>
                        </c:forEach>
                    </select>
                </form>
                <h5>Total views for month ${selectedMonth} in year ${selectedYear}: ${totalViewByMonth}</h5>
            </div>

            <canvas id="myChart" style="width:100%; margin-bottom: 50px;"></canvas>
            <canvas id="myChart2" style="width:100%; margin-bottom: 50px;"></canvas>
            <canvas id="myChart3" style="width:100%; margin-bottom: 50px;"></canvas>

            <!-- Bảng thể loại đã bán -->
            <h3>List of sold genres and products by month</h3>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Month</th>
                        <th>Sold Category</th>
                        <th class="sold-products">Sold Products</th> <!-- Cột này sẽ rộng hơn -->
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="entry" items="${soldCategories}">
                        <tr>
                            <td>Month ${entry.key}</td>
                            <td>${entry.value}</td>
                            <td class="sold-products">
                                <div>
                                    <c:choose>
                                        <c:when test="${not empty soldProducts[entry.key]}">
                                            <ol>
                                                <c:forEach var="productEntry" items="${soldProducts[entry.key]}" varStatus="status">
                                                    <li>
                                                        ${status.index + 1}. ${productEntry}
                                                    </li>
                                                </c:forEach>
                                            </ol>
                                        </c:when>
                                        <c:otherwise>
                                            <span>No products sold</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>

        </div>

        <!-- CHART SCRIPT -->
        <script type="text/javascript">
            const xValues = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"];
            const barColors = ["red", "green", "blue", "orange", "brown", "gray", "purple", "yellow", "pink", "black", "teal", "cyan"];

            // Chart 1: Products sold
            var yValues1 = [];
            <c:forEach items="${totalProductBoughtByMonth}" var="t">
            yValues1.push(${t});
            </c:forEach>

            new Chart("myChart", {
                type: "bar",
                data: {
                    labels: xValues,
                    datasets: [{
                            label: "Products sold",
                            data: yValues1,
                            backgroundColor: barColors
                        }]
                },
                options: {
                    title: {
                        display: true,
                        text: "Statistics of number of products sold by month"
                    },
                    legend: {display: false}
                }
            });

            // Chart 2: Categories sold
            var yValues2 = [];
            <c:forEach items="${totalCategoryBoughtByMonth}" var="t">
            yValues2.push(${t});
            </c:forEach>

            new Chart("myChart2", {
                type: "bar",
                data: {
                    labels: xValues,
                    datasets: [{
                            label: "Number of genres sold",
                            data: yValues2,
                            backgroundColor: barColors
                        }]
                },
                options: {
                    title: {
                        display: true,
                        text: "Statistics on number of genres sold by month"
                    },
                    legend: {display: false}
                }
            });

            // Chart 3: Customers
            var yValues3 = [];
            <c:forEach items="${totalCustomerBoughtByMonth}" var="t">
            yValues3.push(${t});
            </c:forEach>

            new Chart("myChart3", {
                type: "bar",
                data: {
                    labels: xValues,
                    datasets: [{
                            label: "Number of customers purchasing",
                            data: yValues3,
                            backgroundColor: barColors
                        }]
                },
                options: {
                    title: {
                        display: true,
                        text: "Statistics of customers by month"
                    },
                    legend: {display: false}
                }
            });
        </script>
    </body>
</html>
