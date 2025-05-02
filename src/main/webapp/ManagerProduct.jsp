

<%@page import="entity.Size"%>
<%@page import="dao.SizeDAO"%>
<%@page import="entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoryDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>-->
        <!-- Required meta tags-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Title Page-->
        <title>Manager Product</title>
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
        </style>
    </head>
    <body>

        <div class="page-wrapper">
            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <jsp:include page="common/menu.jsp"></jsp:include>
                        </div>
                    </div>
                </div>
                <!-- END MAIN CONTENT-->




                <!-- list------------------------------------------------------------------- -->
                <div class="container">
                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-6">
                                    <h2>Manage <b>Product</b></h2>
                                </div>
                                <div class="col-sm-6">
                                    <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                                    <!--<a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>-->
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>

                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Image</th>
                                    <!--<th></th>-->
                                    <!--<th>Price</th>-->
                                    <th>Quantity</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listP}" var="o" varStatus="loop"> 
                                <tr>
                                    <td>${o.id}</td>
                                    <td>${o.name}</td>
                                    <td>
                                        <img src="${o.image}">
                                    </td>
                                    <!--<td>${o.price} VND</td>-->
                                    <!-- Hiển thị số lượng và giá theo kích thước -->
                                    <td>${o.isDeleted}   |   ${detailQuantityAndSize.get(loop.index)}</td>
                                    <td>
                                        <a onclick="editProduct(${o.id})" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit"></i></a>
                                        <a href="delete?deletePID=${o.id}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete"></i></a>
                                    </td>
                                </tr>
                            </c:forEach> 
                        </tbody>
                    </table>
                    <div class="clearfix">
                        <ul class="pagination">
                            <c:forEach begin="1" end="${totalPage}" var="i">
                                <li class="page-item ${pageIndex == i ? "active":""}""><a href="ManagerControl?pageIndex=${i}" class="page-link">${i}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Edit Modal HTML -->
            <div id="addEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="addProduct" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                            <div class="modal-header">
                                <h4 class="modal-title">Add Product</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Name</label>
                                    <input name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Image</label>
                                    <input name="image" type="file" class="form-control" accept="images/*" required>
                                </div>
                                <div class="form-group">
                                    <label>SubImage1</label>
                                    <input name="subImage1" type="file" class="form-control" accept="images/*" required>
                                </div>
                                <div class="form-group">
                                    <label>SubImage2</label>
                                    <input name="subImage2" type="file" class="form-control" accept="images/*" required>
                                </div>
                                <div class="form-group">
                                    <label>SubImage3</label>
                                    <input name="subImage3" type="file" class="form-control" accept="images/*" required>
                                </div>
                                <div class="form-group">
                                    <label>SubImage4</label>
                                    <input name="subImage4" type="file" class="form-control" accept="images/*" required>
                                </div>

                                <div class="form-group">
                                    <label>Title</label>
                                    <textarea name="title" class="form-control" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="description" class="form-control" required></textarea>
                                </div>
<!--                                <div class="form-group">
                                    <label>Amount</label>
                                    <input name="amount" type="number" class="form-control" required min="0">
                                </div>-->
                                <%
                                    CategoryDAO dao = new CategoryDAO();
                                    List<Category> listC = dao.getAllCategory();
                                %>
                                <div class="form-group">
                                    <label>Category</label>
                                    <select name="category" class="form-control" aria-label="Default select example">
                                        <c:forEach items="<%= listC%>" var="o">
                                            <option value="${o.id}">${o.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <%
                                    SizeDAO sizeDAO = new SizeDAO();
                                    List<Size> listSize = sizeDAO.getAllSize();
                                %>
                                <div class="form-group">
                                    <label>Size</label>
                                    <select name="size" class="form-control" multiple id="sizeSelect">
                                        <c:forEach items="<%= listSize%>" var="o">
                                            <option value="${o.id}">${o.size}</option>
                                        </c:forEach>
                                    </select>
                                    <small style="color: red; display: none;" id="sizeError">Please select at least one size.</small>
                                </div>
                                <div id="sizeDetailsContainer"></div>

                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-success" value="Add">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Edit Modal HTML -->
            <div id="editEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form>
                            <div class="modal-header">
                                <h4 class="modal-title">Edit Product</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">

                                <div class="form-group">
                                    <label>Name</label>
                                    <input name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Image</label>
                                    <input name="image" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>SubImage1</label>
                                    <input name="subImage1" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>SubImage2</label>
                                    <input name="subImage2" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>SubImage3</label>
                                    <input name="subImage3" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>SubImage4</label>
                                    <input name="subImage4" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Price</label>
                                    <input name="price" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Title</label>
                                    <textarea name="title" class="form-control" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="description" class="form-control" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Amount</label>
                                    <input name="amount" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Category</label>
                                    <select name="category" class="form-control" aria-label="Default select example">
                                        <c:forEach items="<%= listC%>" var="o">
                                            <option value="${o.id}">${o.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-info" value="Save">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <script src="js/manager.js" type="text/javascript"></script>
            <script>
                function editProduct(param, sizeId) {
                    var id = param;
                    console.log(id);
                    $.ajax({
                        url: "/Project_Group6/UpdateProductControl",
                        type: "get", //send it throung get method
                        data: {
                            id: id,
                            sizeId: sizeId
                        },
                        success: function (data) {
                            var row = document.getElementById("editEmployeeModal");
                            row.innerHTML = data;
                            $("#editEmployeeModal").modal('show');

                        },
                        error: function (xhr) {
                            //do something to handle error
                        }
                    });
                }
            </script>
            <script>
                function validateForm() {
                    let sizeSelect = document.getElementById("sizeSelect");
                    let errorMsg = document.getElementById("sizeError");

                    if (sizeSelect.selectedOptions.length === 0) {
                        errorMsg.style.display = "block"; // Hiển thị lỗi
                        return false; // Ngăn submit form
                    }
                    errorMsg.style.display = "none";
                    return true;
                }
            </script>
<script>
    const sizeSelect = document.getElementById("sizeSelect");
    const sizeDetailsContainer = document.getElementById("sizeDetailsContainer");

    sizeSelect.addEventListener("change", function () {
        const selectedOptions = Array.from(sizeSelect.selectedOptions).map(function(option) {
            return {
                id: option.value,
                text: option.text
            };
        });

        // Xóa các size-detail không còn được chọn
        const currentDetails = document.querySelectorAll(".size-detail-group");
        currentDetails.forEach(function(group) {
            const sizeId = group.getAttribute("data-size-id");
            var stillSelected = selectedOptions.find(function(o) {
                return o.id === sizeId;
            });
            if (!stillSelected) {
                group.remove();
            }
        });

        // Thêm các size mới được chọn
        selectedOptions.forEach(function(item) {
            var id = item.id;
            var text = item.text;
            if (!document.querySelector('.size-detail-group[data-size-id="' + id + '"]')) {
                var div = document.createElement("div");
                div.className = "form-group size-detail-group";
                div.setAttribute("data-size-id", id);

                div.innerHTML =
                    "<label>" + text + " - Price & Amount</label>" +
                    "<div class='row'>" +
                        "<div class='col'>" +
                            "<input type='number' name='sizePrice_" + id + "' class='form-control' placeholder='Price for size " + text + "' required min='0'>" +
                        "</div>" +
                        "<div class='col'>" +
                            "<input type='number' name='sizeAmount_" + id + "' class='form-control' placeholder='Amount for size " + text + "' required min='0'>" +
                        "</div>" +
                    "</div>";
                
                sizeDetailsContainer.appendChild(div);
            }
        });
    });
</script>

<script>
document.addEventListener("DOMContentLoaded", function () {
    // Sự kiện cho sizeSelectEdit (như đã làm trước đó)
    document.addEventListener("change", function (event) {
        // Kiểm tra nếu sự kiện là của #sizeSelectEdit
        if (event.target && event.target.id === "sizeSelectEdit") {
            var sizeSelectEdit = event.target;
            var sizeDetailsContainerEdit = document.getElementById("sizeDetailsContainerEdit");

            if (!sizeDetailsContainerEdit) return;

            // Lấy các options đã chọn
            var selectedOptions = Array.from(sizeSelectEdit.selectedOptions).map(function(option) {
                return {
                    id: option.value,
                    text: option.text
                };
            });

            // Lọc các nhóm size đã chọn và hiển thị lại
            var currentDetails = document.querySelectorAll(".size-detail-group-edit");
            currentDetails.forEach(function(group) {
                var sizeId = group.getAttribute("data-size-id");
                if (!selectedOptions.find(function(o) { return o.id === sizeId; })) {
                    group.remove();
                }
            });

            selectedOptions.forEach(function(obj) {
                var id = obj.id;
                var text = obj.text;
                if (!document.querySelector(".size-detail-group-edit[data-size-id='" + id + "']")) {
                    var div = document.createElement("div");
                    div.className = "form-group size-detail-group-edit";
                    div.setAttribute("data-size-id", id);

                    div.innerHTML =
                        "<label>" + text + " - Price & Amount</label>" +
                        "<div class='row'>" +
                        "  <div class='col'>" +
                        "    <input type='number' name='sizePrice_" + id + "' class='form-control' placeholder='Price for size " + text + "' required min='0'>" +
                        "  </div>" +
                        "  <div class='col'>" +
                        "    <input type='number' name='sizeAmount_" + id + "' class='form-control' placeholder='Amount for size " + text + "' required min='0'>" +
                        "  </div>" +
                        "</div>";

                    sizeDetailsContainerEdit.appendChild(div);
                }
            });
        }

        // Kiểm tra nếu sự kiện là của các input file (để preview ảnh)
//        if (event.target && event.target.type === "file") {
//            var fileInput = event.target;
//            var previewId = fileInput.getAttribute("data-preview-id");
//
//            if (previewId) {
//                previewImage(fileInput, previewId);
//            }
//        }
    });

    // Hàm để preview ảnh
    function previewImage(input, previewId) {
        var file = input.files[0];
        var preview = document.getElementById(previewId);
        if (file && preview) {
            var reader = new FileReader();
            reader.onload = function (e) {
                preview.src = e.target.result;
            };
            reader.readAsDataURL(file);
        }
    }
});

</script>


            <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
            <c:if test="${message != null}">
                <script type="text/javascript">
                toastr.success(`${message}`, 'Success', {timeOut: 1000});
                </script>
            </c:if>
            <c:if test="${errorMessage != null}">
                <script type="text/javascript">
                    toastr.error(`${errorMessage}`, 'Error', {timeOut: 1000});
                </script>
            </c:if>
    </body>
</html>
