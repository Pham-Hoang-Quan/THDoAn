<%@ page import="vn.edu.hcmuaf.ttt.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.ttt.bean.User" %>
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
        <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
            <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
                <a class="navbar-brand brand-logo" href="index.jsp"><img src="admin/assets/images/LogoWeb.png" alt="logo" /></a>
                <a class="navbar-brand brand-logo-mini" href="index.jsp"><img src="assets/images/LogoWeb.png" alt="logo" /></a>
            </div>
            <div class="navbar-menu-wrapper d-flex align-items-stretch">
                <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="mdi mdi-menu"></span>
          </button>
                <div class="search-field d-none d-md-block">
                    <form class="d-flex align-items-center h-100" action="#">
                        <div class="input-group">
                            <div class="input-group-prepend bg-transparent">
                                <i class="input-group-text border-0 mdi mdi-magnify"></i>
                            </div>
                            <input type="text" class="form-control bg-transparent border-0" placeholder="Tìm kiếm">
                        </div>
                    </form>
                </div>
                <ul class="navbar-nav navbar-nav-right">
                    <li class="nav-item nav-profile dropdown">
                        <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                            <div class="nav-profile-img">
                                <img src="assets/images/faces/face1.jpg" alt="image">
                                <span class="availability-status online"></span>
                            </div>
                            <div class="nav-profile-text">
                                <p class="mb-1 text-black">Hoàng Quân</p>
                            </div>
                        </a>
                        <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">
                                <i class="mdi mdi-logout me-2 text-primary"></i> Đăng xuất </a>
                        </div>
                    </li>


                    <li class="nav-item dropdown">

                        <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
                            <h6 class="p-3 mb-0">Notifications</h6>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item preview-item">
                                <div class="preview-thumbnail">
                                    <div class="preview-icon bg-success">
                                        <i class="mdi mdi-calendar"></i>
                                    </div>
                                </div>
                                <div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
                                    <h6 class="preview-subject font-weight-normal mb-1">Event today</h6>
                                    <p class="text-gray ellipsis mb-0"> Just a reminder that you have an event today </p>
                                </div>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item preview-item">
                                <div class="preview-thumbnail">
                                    <div class="preview-icon bg-warning">
                                        <i class="mdi mdi-settings"></i>
                                    </div>
                                </div>
                                <div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
                                    <h6 class="preview-subject font-weight-normal mb-1">Settings</h6>
                                    <p class="text-gray ellipsis mb-0"> Update dashboard </p>
                                </div>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item preview-item">
                                <div class="preview-thumbnail">
                                    <div class="preview-icon bg-info">
                                        <i class="mdi mdi-link-variant"></i>
                                    </div>
                                </div>
                                <div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
                                    <h6 class="preview-subject font-weight-normal mb-1">Launch Admin</h6>
                                    <p class="text-gray ellipsis mb-0"> New admin wow! </p>
                                </div>
                            </a>
                            <div class="dropdown-divider"></div>
                            <h6 class="p-3 mb-0 text-center">See all notifications</h6>
                        </div>
                    </li>

                </ul>
                <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="mdi mdi-menu"></span>
          </button>
            </div>
        </nav>
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
                        <a class="nav-link" href="index.jsp">
                            <span class="menu-title">Trang chủ</span>
                            <i class="mdi mdi-home menu-icon"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="oder-manage.html">
                            <span class="menu-title">Quản lý đơn hàng</span>

                            <i class="mdi mdi-crosshairs-gps menu-icon"></i>
                        </a>

                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="user-manage.html">
                            <span class="menu-title">Quản lý người dùng</span>
                            <i class="mdi mdi-contacts menu-icon"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="product-manage.html">
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
                                    <h4 class="font-weight-normal mb-3"> Doanh thu trong tháng <i class="mdi mdi-chart-line mdi-24px float-right"></i>
                                    </h4>
                                    <h2 class="mb-5">19.280.000 đ</h2>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 stretch-card grid-margin">
                            <div class="card bg-gradient-info card-img-holder text-white">
                                <div class="card-body">
                                    <img src="admin/assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                                    <h4 class="font-weight-normal mb-3">Số đơn hàng trong tháng <i class="mdi mdi-bookmark-outline mdi-24px float-right"></i>
                                    </h4>
                                    <h2 class="mb-5">28</h2>

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
                                        <h4 style="display:inline-block ;" class="card-title">Danh sách sản phẩm mới nhất</h4>
                                        <a href="product-manage.html">
                                            <button style="margin-left: 680px ;" class="btn btn-block btn-lg btn-gradient-primary mt-4">Xem chi tiết <i class="mdi mdi-chevron-double-right"></i></button>
                                        </a>
                                    </div>

                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th> Tên </th>
                                                    <th> Danh mục </th>
                                                    <th> Giá </th>
                                                    <th> Ngày thêm </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <% List<Product> list = (List<Product>) request.getAttribute("listn");
                                                for (Product p: list) { %>
                                            <tr>
                                                <td>
                                                    <img src="<%= p.getImg()%>" class="me-2" alt="image"> <%= p.getName()%>
                                                </td>
                                                <td> <%= p.getClassify() %> </td>
                                                <td>
                                                    <label class="badge badge-gradient-success"> <%= p.getPrice()%> đ</label>
                                                </td>
                                                <td> WD-12345 </td>
                                            </tr>
                                                <% };%>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-7 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Danh sách Admin</h4>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th> # </th>
                                                    <th> Tên </th>
                                                    <th> Ngày tạo </th>
                                                    <th> Chức vụ </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td> 1 </td>
                                                    <td> Hoàng Quân </td>
                                                    <td> 28-8-2020</td>
                                                    <td>
                                                        Admin
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td> 2 </td>
                                                    <td> Thị Tiên </td>
                                                    <td> 18-8-2020 </td>
                                                    <td>
                                                        Admin
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td> 3 </td>
                                                    <td> Hoài Thu </td>
                                                    <td> 19-8-2020 </td>
                                                    <td>
                                                        Admin
                                                    </td>
                                                </tr>

                                                <!-- <tr>
                                                    <td> 5 </td>
                                                    <td> Ronald </td>
                                                    <td> Jun 05, 2015 </td>
                                                    <td>
                                                        <div class="progress">
                                                            <div class="progress-bar bg-gradient-info" role="progressbar" style="width: 65%" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
                                                        </div>
                                                    </td>
                                                </tr> -->
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title text-white">Todo</h4>
                                    <div class="add-items d-flex">
                                        <input type="text" class="form-control todo-list-input" placeholder="Nhứng việc cần làm hôm nay">
                                        <button class="add btn btn-gradient-primary font-weight-bold todo-list-add-btn" id="add-task">Thêm</button>
                                    </div>
                                    <div class="list-wrapper">
                                        <ul class="d-flex flex-column-reverse todo-list todo-list-custom">
                                            <li>
                                                <div class="form-check">
                                                    <label class="form-check-label">
                              <input class="checkbox" type="checkbox"> Họp với team Sale </label>
                                                </div>
                                                <i class="remove mdi mdi-close-circle-outline"></i>
                                            </li>
                                            <li class="completed">
                                                <div class="form-check">
                                                    <label class="form-check-label">
                              <input class="checkbox" type="checkbox" checked> Chuẩn bị sản phẩm mới </label>
                                                </div>
                                                <i class="remove mdi mdi-close-circle-outline"></i>
                                            </li>

                                        </ul>
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