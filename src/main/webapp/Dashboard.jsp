
<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.AccountDAO"%>
<%@page import="entity.Category"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Title Page-->
        <title>Dashboard</title>
        <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <!-- Main CSS-->
        <link href="css/manager.css" rel="stylesheet" media="all">
        <style>
            img {
                width: 100px;
                height: 100px;
            }
         .overview-item {
        background-color: #fff;
        border-radius: 12px;
        padding: 20px;
        min-height: 160px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
        transition: all 0.3s ease-in-out;
    }

    .overview-box {
        display: flex;
        align-items: center;
        gap: 15px;
    }

    .overview-box .icon {
        font-size: 36px;
        color: #666;
    }

    .overview-box .text h2 {
        font-size: 25px;
        font-weight: 600;
        color: #333;
      
    }
.overview-box .text {
    text-align: center;
    width: 100%;
}
    .overview-box .text span {
        font-size: 35px;
        color: #333;
    }

    .overview-item:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    }

    .row.m-t-25 > .col-lg-3 {
        margin-bottom: 30px;
    }
        </style>
    </head>
    <body>

        <div class="page-wrapper">
            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <jsp:include page="common/menu.jsp"></jsp:include>
                        
                            <div class="row m-t-25">
                                <div class="col-sm-6 col-lg-3">
                                    <div class="overview-item overview-item--c1">
                                        <div class="overview__inner">
                                            <div class="overview-box clearfix">
                                                <div class="icon">
                                                    <i class="zmdi zmdi-account-o"></i>
                                                </div>
                                                <div class="text">
                                                <%
                                                    AccountDAO dao = new AccountDAO();
                                                    int viewed = dao.getViewed();
                                                %>
                                                
                                                <span>View</span>
                                                <h2><%= viewed%></h2>
                                            </div>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart1"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c2">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-shopping-cart"></i>
                                            </div>
                                            <div class="text">
                                                
                                                <span>Items solid</span>
                                                <h2>${numberI}</h2>
                                            </div>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart2"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c3">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-calendar-note"></i>
                                            </div>
                                            <div class="text">
                                                
                                                <span>Product</span>
                                                <h2>${numberP}</h2>
                                            </div>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart3"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c4">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-money"></i>
                                            </div>
                                            <div class="text">
                                                <%
                                                    // Ensure totalE is a number, for example, Double or Integer
                                                    Double totalE = (Double) request.getAttribute("totalE"); // Assuming totalE is passed as an attribute
                                                    if (totalE == null) {
                                                        totalE = 0.0;  // Default value if totalE is null
                                                    }

                                                    // Format the totalE to include commas as thousands separators
                                                    DecimalFormat df = new DecimalFormat("#,###");
                                                    String formattedTotalE = df.format(totalE);
                                                %>
                                                
                                                <span>Total earnings</span>
                                                <h2><%= formattedTotalE%> VND</h2>
                                            </div>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart4"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
               </div>                               
            <!-- END MAIN CONTENT-->




            <!-- list------------------------------------------------------------------- -->
            <div class="container">
                <canvas id="myChart" style="width:100%;"></canvas>

                <canvas id="myChart2" style="width:100%;margin-top: 60px"></canvas>
                <canvas id="myChart3" style="width:100%;margin-top: 60px"></canvas>
            </div>

            <script src="js/manager.js" type="text/javascript"></script>
            <script
                src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
            </script>
            <script type="text/javascript">
                const xValues = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"];
                var yValues = [];
                <c:forEach items="${totalProductBoughtByMonth}" var="t">
                yValues.push(`${t}`);
                </c:forEach>
                const barColors = ["red", "green", "blue", "orange", "brown", "gray", "purple", "yellow", "pink", "black", "red", "green"];

                new Chart("myChart", {
                    type: "bar",
                    data: {
                        labels: xValues,
                        datasets: [{
                                backgroundColor: barColors,
                                data: yValues
                            }]
                    },
                    options: {
                        legend: {display: false},
                        title: {
                            display: true,
                            text: "Statistics of products sold by month of the current year"
                        }
                    }
                });
                var yValues2 = [];
                <c:forEach items="${totalCategoryBoughtByMonth}" var="t">
                yValues2.push(`${t}`);
                </c:forEach>
                new Chart("myChart2", {
                    type: "bar",
                    data: {
                        labels: xValues,
                        datasets: [{
                                backgroundColor: barColors,
                                data: yValues2
                            }]
                    },
                    options: {
                        legend: {display: false},
                        title: {
                            display: true,
                            text: "Statistics of categories sold by month of the current year"
                        }
                    }
                });

                var yValues3 = [];
                <c:forEach items="${totalCustomerBoughtByMonth}" var="t">
                yValues3.push(`${t}`);
                </c:forEach>
                new Chart("myChart3", {
                    type: "bar",
                    data: {
                        labels: xValues,
                        datasets: [{
                                backgroundColor: barColors,
                                data: yValues3
                            }]
                    },
                    options: {
                        legend: {display: false},
                        title: {
                            display: true,
                            text: "Statistics of number of customers purchasing by month of current year"
                        }
                    }
                });
            </script>
    </body>
</html>
