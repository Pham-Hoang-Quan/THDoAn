<%@ page import="vn.edu.hcmuaf.ttt.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.ttt.bean.User" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.Category" %>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Drill Admin</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="admin/assets/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="admin/assets/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <!-- endinject -->
  <!-- Layout styles -->
  <link rel="stylesheet" href="admin/assets/css/style.css">
  <!-- End layout styles -->
  <link rel="shortcut icon" href="admin/assets/images/favicon.ico" />
</head>

<body>
<div class="container-scroller">

  <!-- partial:partials/_navbar.html -->
  <jsp:include page="nav.jsp"></jsp:include>
  <!-- partial -->
  <div class="container-fluid page-body-wrapper">
    <!-- partial:partials/_sidebar.html -->
    <nav class="sidebar sidebar-offcanvas" id="sidebar">
      <ul class="nav">
        <li class="nav-item nav-profile">
          <a href="#" class="nav-link">

            <div class="nav-profile-text d-flex flex-column">
              <% User auth= (User) session.getAttribute("auth");%>
              <% if(auth==null){ %>
              <span class="font-weight-bold mb-2">Chưa đăng nhập</span>
              <% }else {%>
              <span class="font-weight-bold mb-2"><%= auth.getUser_fullname()%></span>
              <% } %>
              <span class="text-secondary text-small">Admin</span>
            </div>
            <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/IndexAdmin">
            <span class="menu-title">Trang chủ</span>
            <i class="mdi mdi-home menu-icon"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="order-manage.jsp">
            <span class="menu-title">Quản lý đơn hàng</span>

            <i class="mdi mdi-crosshairs-gps menu-icon"></i>
          </a>

        </li>
        <li class="nav-item">
          <a class="nav-link" href="user-manage.jsp">
            <span class="menu-title">Quản lý người dùng</span>
            <i class="mdi mdi-contacts menu-icon"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="http://localhost:8080/ProAdmin">
            <span class="menu-title">Quản lý sản phẩm</span>
            <i class="mdi mdi-format-list-bulleted menu-icon"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="statistical.html">
            <span class="menu-title">Thống kê</span>
            <i class="mdi mdi-chart-bar menu-icon"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="admin-manage.html">
            <span class="menu-title">Quản lý quản trị viên</span>
            <i class="mdi mdi-table-large menu-icon"></i>
          </a>
        </li>

        <li class="nav-item sidebar-actions">
                        <span class="nav-link">
                
                

              </span>
        </li>
      </ul>
    </nav>
    <!-- partial -->
    <div class="main-panel">
      <div class="content-wrapper">
        <div  class="modal1">
          <% Product p= (Product) request.getAttribute("product"); %>
          <div style="margin:20px auto ; width: 100%" class="col-md-6 grid-margin stretch-card">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">Chỉnh sửa sản phẩm</h4>
                <form action="EditProducts" method="post" class="forms-sample" >
                  <div class="form-group row">
                    <label for="exampleInputUsername2" class="col-sm-3 col-form-label">Mã sản phẩm</label>
                    <div class="col-sm-9">
                      <input name="id" type="text" class="form-control"  placeholder="0001" value="<%=p.getId()%>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="exampleInputUsername2" class="col-sm-3 col-form-label">Tên</label>
                    <div class="col-sm-9">
                      <input name="name" value="<%=p.getName()%>" type="text" class="form-control" id="exampleInputUsername2" placeholder="Tên sản phẩm">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="" class="col-sm-3 col-form-label">Danh mục</label>
                    <div class="col-sm-9">
                      <select name="classify" class="form-control" id="browsers">
                        <%@ page import="vn.edu.hcmuaf.ttt.model.Category" %>
                        <% List<Category> lista = (List<Category>) request.getAttribute("listc");
                          for (Category c :lista) { %>
                            <option value="<%=c.getcName()%>"><%=c.getcName()%></option>
                        <%}%>
                      </select>
                    </div>
                  </div>
<%--                  <div class="form-group row">--%>
<%--                    <label for="exampleInputMobile" class="col-sm-3 col-form-label">Ảnh</label>--%>
<%--                    <div class="col-sm-9">--%>
<%--                      <input value="<%= p.getImg()%>" type="file" class="form-control"  placeholder="Url ảnh">--%>
<%--                      <input type="file" class="form-control"  placeholder="Url ảnh">--%>
<%--                      <input type="file" class="form-control"  placeholder="Url ảnh">--%>
<%--                      <input type="file" class="form-control"  placeholder="Url ảnh">--%>
<%--                    </div>--%>
<%--                  </div>--%>
                  <div class="form-group row">
                    <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Giảm giá (%)</label>
                    <div class="col-sm-9">
                      <input name="percent" value="<%= p.getPercent()%>" type="number" class="form-control"  placeholder="0">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Số lượng</label>
                    <div class="col-sm-9">
                      <input name="qty" value="<%=p.getQuantily()%>" type="number" class="form-control" id="exampleInputPassword2" placeholder="0">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Giá</label>
                    <div class="col-sm-9">
                      <input name="price" value="<%= p.getPrice()%>" type="number" class="form-control" id="exampleInputConfirmPassword2" placeholder="Đơn giá">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="exampleInputMobile" class="col-sm-3 col-form-label">Mô tả</label>
                    <div class="col-sm-9">
                      <input name="content" value="<%=p.getContent()%>" type="text" class="form-control" id="" placeholder="Mô tả sản phẩm">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="exampleInputMobile" class="col-sm-3 col-form-label">Thông tin</label>
                    <div class="col-sm-9">
                      <input name="info" value="<%=p.getInfo()%>" type="text" class="form-control" id="exampleInputMobile" placeholder="Thông tin về sản phẩm">
                    </div>
                  </div>
                  <button type="submit" class="btn btn-gradient-primary me-2 close">Lưu</button>
                  <button href="/ProAdmin" class="btn btn-light close">Quay Lại</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
      <!-- partial:partials/_footer.html -->
      <footer class="footer">

      </footer>
      <!-- partial -->
    </div>
    <!-- main-panel ends -->
  </div>
  <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<!-- plugins:js -->
<script src="admin/assets/vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<script src="admin/assets/vendors/chart.js/Chart.min.js"></script>
<script src="admin/assets/js/jquery.cookie.js" type="text/javascript"></script>
<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="admin/assets/js/off-canvas.js"></script>
<script src="admin/assets/js/hoverable-collapse.js"></script>
<script src="admin/assets/js/misc.js"></script>
<!-- endinject -->
<!-- Custom js for this page -->
<script src="admin/assets/js/dashboard.js"></script>
<script src="admin/assets/js/todolist.js"></script>
<!-- End custom js for this page -->
</body>

</html>