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
            <input type="text" class="form-control bg-transparent border-0" placeholder="T??m ki???m">
          </div>
        </form>
      </div>
      <ul class="navbar-nav navbar-nav-right">



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
              <span class="font-weight-bold mb-2">Ch??a ????ng nh???p</span>
              <% }else {%>
              <span class="font-weight-bold mb-2"><%= auth.getUser_fullname()%></span>
              <% } %>
              <span class="text-secondary text-small">Admin</span>
            </div>
            <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="http://localhost:8080/THDoAn_war/IndexAdmin">
            <span class="menu-title">Trang ch???</span>
            <i class="mdi mdi-home menu-icon"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="order-manage.jsp">
            <span class="menu-title">Qu???n l?? ????n h??ng</span>

            <i class="mdi mdi-crosshairs-gps menu-icon"></i>
          </a>

        </li>
        <li class="nav-item">
          <a class="nav-link" href="user-manage.jsp">
            <span class="menu-title">Qu???n l?? ng?????i d??ng</span>
            <i class="mdi mdi-contacts menu-icon"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="http://localhost:8080/THDoAn_war/ProAdmin">
            <span class="menu-title">Qu???n l?? s???n ph???m</span>
            <i class="mdi mdi-format-list-bulleted menu-icon"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="statistical.html">
            <span class="menu-title">Th???ng k??</span>
            <i class="mdi mdi-chart-bar menu-icon"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="admin-manage.html">
            <span class="menu-title">Qu???n l?? qu???n tr??? vi??n</span>
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
                <h4 class="card-title">Ch???nh s???a s???n ph???m</h4>
                <form action="EditProducts" method="post" class="forms-sample" >
                  <div class="form-group row">
                    <label for="exampleInputUsername2" class="col-sm-3 col-form-label">M?? s???n ph???m</label>
                    <div class="col-sm-9">
                      <input name="id" type="text" class="form-control"  placeholder="0001" value="<%=p.getId()%>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="exampleInputUsername2" class="col-sm-3 col-form-label">T??n</label>
                    <div class="col-sm-9">
                      <input name="name" value="<%=p.getName()%>" type="text" class="form-control" id="exampleInputUsername2" placeholder="T??n s???n ph???m">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="" class="col-sm-3 col-form-label">Danh m???c</label>
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
<%--                    <label for="exampleInputMobile" class="col-sm-3 col-form-label">???nh</label>--%>
<%--                    <div class="col-sm-9">--%>
<%--                      <input value="<%= p.getImg()%>" type="file" class="form-control"  placeholder="Url ???nh">--%>
<%--                      <input type="file" class="form-control"  placeholder="Url ???nh">--%>
<%--                      <input type="file" class="form-control"  placeholder="Url ???nh">--%>
<%--                      <input type="file" class="form-control"  placeholder="Url ???nh">--%>
<%--                    </div>--%>
<%--                  </div>--%>
                  <div class="form-group row">
                    <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Gi???m gi?? (%)</label>
                    <div class="col-sm-9">
                      <input name="percent" value="<%= p.getPercent()%>" type="number" class="form-control"  placeholder="0">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="exampleInputPassword2" class="col-sm-3 col-form-label">S??? l?????ng</label>
                    <div class="col-sm-9">
                      <input name="qty" value="<%=p.getQuantily()%>" type="number" class="form-control" id="exampleInputPassword2" placeholder="0">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Gi??</label>
                    <div class="col-sm-9">
                      <input name="price" value="<%= p.getPrice()%>" type="number" class="form-control" id="exampleInputConfirmPassword2" placeholder="????n gi??">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="exampleInputMobile" class="col-sm-3 col-form-label">M?? t???</label>
                    <div class="col-sm-9">
                      <input name="content" value="<%=p.getContent()%>" type="text" class="form-control" id="" placeholder="M?? t??? s???n ph???m">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="exampleInputMobile" class="col-sm-3 col-form-label">Th??ng tin</label>
                    <div class="col-sm-9">
                      <input name="info" value="<%=p.getInfo()%>" type="text" class="form-control" id="exampleInputMobile" placeholder="Th??ng tin v??? s???n ph???m">
                    </div>
                  </div>
                  <button type="submit" class="btn btn-gradient-primary me-2 close">L??u</button>
                  <button href="/ProAdmin" class="btn btn-light close">Quay L???i</button>
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