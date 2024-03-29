<%@ page import="vn.edu.hcmuaf.ttt.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.ttt.bean.User" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
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
    <jsp:include page="menu.jsp"></jsp:include>
    <!-- partial -->
    <div class="main-panel">
      <div class="content-wrapper">
        <div class="page-header">
          <h3 class="page-title">
                            <span class="page-title-icon bg-gradient-primary text-white me-2">
                  <i class="mdi mdi-home"></i>
                </span> Trang chủ
          </h3>
          <nav aria-label="breadcrumb">
            <ul class="breadcrumb">

            </ul>
          </nav>
        </div>
        <div class="row">
          <div class="col-md-4 stretch-card grid-margin">
            <div class="card bg-gradient-danger card-img-holder text-white">
              <div class="card-body">
                <img src="admin/assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                <h4 class="font-weight-normal mb-3"> Doanh thu <i class="mdi mdi-chart-line mdi-24px float-right"></i>
                </h4>
                <% List<String> listTongGia = (List<String>) request.getAttribute("listTongGia");
                  int total = 0;%>
                <%  for (String tg :listTongGia) {

                  int i = Integer.parseInt(tg);

                  total+=i;}
                %>
                <%
                  Locale locale = new Locale("vi");
                  NumberFormat format = NumberFormat.getCurrencyInstance(locale);
                  String t = format.format(total).split(",")[0];
                %>
                <h2 class="mb-5"><%= t %> đ</h2>

              </div>
            </div>
          </div>
          <div class="col-md-4 stretch-card grid-margin">
            <div class="card bg-gradient-info card-img-holder text-white">
              <div class="card-body">
                <img src="admin/assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                <h4 class="font-weight-normal mb-3">Số đơn <i class="mdi mdi-bookmark-outline mdi-24px float-right"></i>
                </h4>
                <% String countHD = (String) request.getAttribute("countHD"); %>
                <h2 class="mb-5"><%= countHD %></h2>

              </div>
            </div>
          </div>
          <div class="col-md-4 stretch-card grid-margin">
            <div class="card bg-gradient-success card-img-holder text-white">
              <div class="card-body">
                <img src="admin/assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image">
                <h4 class="font-weight-normal mb-3">Số lượng sản phẩm<i class="mdi mdi-diamond mdi-24px float-right"></i>
                </h4>
                <% String count = (String) request.getAttribute("countProduct"); %>
                <h2 class="mb-5"><%= count%></h2>
              </div>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-12 grid-margin">
            <div class="card">
              <div class="card-body">
                <div class="row1">
                  <h4 style="display:inline-block ;" class="card-title">Danh sách sản phẩm cần nhập</h4>
                </div>

                <div class="table-responsive">
                  <table class="table">
                    <thead>
                    <tr>
                      <th> Tên </th>
                      <th> Danh mục </th>
                      <th> Giá </th>
                      <th> ID </th>
                    </tr>
                    </thead>
                    <tbody>
                    <% List<Product> list = (List<Product>) request.getAttribute("needToAdd");
                      for (Product p: list) { %>
                    <tr>
                      <td>
                        <img src="<%= p.getImg()%>" class="me-2" alt="image"> <%= p.getName()%>
                      </td>
                      <td> <%= p.getClassify() %> </td>
                      <td>
                        <%Locale locale1 = new Locale("vi");
                          NumberFormat format1 = NumberFormat.getCurrencyInstance(locale1);
                          String g = format1.format(p.getPrice()).split(",")[0];
                        %>
                        <label class="badge badge-gradient-success"> <%=g%> đ</label>
                      </td>
                      <td> <%= p.getId() %> </td>
                    </tr>
                    <% };%>

                    </tbody>
                  </table>
                </div>
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