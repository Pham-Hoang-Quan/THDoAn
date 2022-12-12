<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.Product" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.Category" %>
<%@ page import="vn.edu.hcmuaf.ttt.bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<meta http-equiv="Content-Type" charset="UTF-8">

<head>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Drill Technology</title>
    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="css/slick.css" />
    <link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css/style.css" />

    <!-- update the version number as needed -->
    <script defer src="/__/firebase/9.5.0/firebase-app-compat.js"></script>
    <!-- include only the Firebase features as you need -->
    <script defer src="/__/firebase/9.5.0/firebase-auth-compat.js"></script>
    <script defer src="/__/firebase/9.5.0/firebase-database-compat.js"></script>
    <script defer src="/__/firebase/9.5.0/firebase-firestore-compat.js"></script>
    <script defer src="/__/firebase/9.5.0/firebase-functions-compat.js"></script>
    <script defer src="/__/firebase/9.5.0/firebase-messaging-compat.js"></script>
    <script defer src="/__/firebase/9.5.0/firebase-storage-compat.js"></script>
    <script defer src="/__/firebase/9.5.0/firebase-analytics-compat.js"></script>
    <script defer src="/__/firebase/9.5.0/firebase-remote-config-compat.js"></script>
    <script defer src="/__/firebase/9.5.0/firebase-performance-compat.js"></script>
    <!-- 
      initialize the SDK after all desired features are loaded, set useEmulator to false
      to avoid connecting the SDK to running emulators.
    -->
    <script defer src="/__/firebase/init.js?useEmulator=true"></script>

    <style media="screen">
        body {
            background: #ffffff;
            color: rgba(0, 0, 0, 0.87);
            font-family: Roboto, Helvetica, Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        
        #message {
            background: white;
            max-width: 360px;
            margin: 100px auto 16px;
            padding: 32px 24px;
            border-radius: 3px;
        }
        
        #message h2 {
            color: #ffa100;
            font-weight: bold;
            font-size: 16px;
            margin: 0 0 8px;
        }
        
        #message h1 {
            font-size: 22px;
            font-weight: 300;
            color: rgba(0, 0, 0, 0.6);
            margin: 0 0 16px;
        }
        
        #message p {
            line-height: 140%;
            margin: 16px 0 24px;
            font-size: 14px;
        }
        
        #message a {
            display: block;
            text-align: center;
            background: #039be5;
            text-transform: uppercase;
            text-decoration: none;
            color: white;
            padding: 16px;
            border-radius: 4px;
        }
        
        #message,
        #message a {
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
        }
        
        #load {
            color: rgba(0, 0, 0, 0.4);
            text-align: center;
            font-size: 13px;
        }
        
        @media (max-width: 600px) {
            body,
            #message {
                margin-top: 0;
                background: white;
                box-shadow: none;
            }
            body {
                border-top: 16px solid #ffa100;
            }
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
</head>

<body>
    <header>
        <!-- TOP HEADER -->
        <div id="top-header">
            <div class="container">
                <ul class="header-links pull-left">
                    <li><a href="tel:0929831012"><i class="fa fa-phone"></i>0989839121</a></li>
                    <li><a href="mailto: abc@example.com"><i class="fa fa-envelope-o"></i> DH20DT@email.com</a></li>
                    <li>
                        <a target="_blank" href="https://www.google.com/maps/place/C%C3%B4ng+ty+Cu%E1%BB%99c+S%E1%BB%91ng+Xanh+(GLAB)/@10.8712764,106.7891868,17z/data=!4m12!1m6!3m5!1s0x3175276398969f7b:0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRwLiBI4buTIENow60gTWluaA!8m2!3d10.8712764!4d106.7917617!3m4!1s0x3174d89ddbf832ab:0xedd62ee42a254940!8m2!3d10.8730978!4d106.787919"><i class="fa fa-map-marker"></i>TP.Hồ Chí Minh</a>
                    </li>
                </ul>
                <ul class="header-links pull-right">
                    <li><a href="login.jsp" target="_blank"><i class="fa fa-user-o"></i>
                        <% User auth= (User) session.getAttribute("auth");%>
                        <% if(auth==null){ %>
                        Bạn chưa đăng nhập
                        <% }else {%>
                        Chào bạn: <%= auth.getUser_fullname()%></p>
                        <% } %>

                    </a></li>
                    <li>
                        <a href="form_dk.jsp" target="_blank"> <i class="fa fa-dollar"></i>Đăng Ký</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /TOP HEADER -->

        <!-- /TOP HEADER -->

        <!-- MAIN HEADER -->
        <div id="header">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- LOGO -->
                    <div class="col-md-3">
                        <div class="header-logo">
                            <a href="/THDoAn_war/" class="logo">
                                <img src="./img/Logo250px.png" alt="">
                            </a>
                        </div>
                    </div>
                    <!-- /LOGO -->

                    <!-- SEARCH BAR -->
                    <div class="col-md-6">
                        <div class="header-search">
                            <form>

                                <input class="input" placeholder="Tìm Sản Phẩm">
                                <button class="search-btn"><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                    </div>
                    <!-- /SEARCH BAR -->

                    <!-- ACCOUNT -->
                    <div class="col-md-3 clearfix">
                        <div class="header-ctn">
                            <!-- Wishlist -->
                            <div>
                                <a href="heart.html">
                                    <i class="fa fa-heart-o"></i>
                                    <span>Yêu Thích</span>
                                    <div class="qty">5</div>
                                </a>
                            </div>
                            <!-- /Wishlist -->

                            <!-- Cart -->
                            <div class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                    <i class="fa fa-shopping-cart"></i>
                                    <span>Giỏ Hàng</span>
                                    <div class="qty">2</div>
                                </a>
                                <div class="cart-dropdown">
                                    <div class="cart-list">
                                        <div class="product-widget">
                                            <div class="product-img">
                                                <img src="./img/180-LI(Q).jpg" alt="">
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-name"><a href="product.html">Máy khoan 180-LI</a></h3>
                                                <h4 class="product-price"><span class="qty">1x</span>980.000</h4>
                                            </div>
                                            <button class="delete"><i class="fa fa-close"></i></button>
                                        </div>

                                        <div class="product-widget">
                                            <div class="product-img">
                                                <img src="./img/may-khoan-bosch-gbm-320(1q).jpg" alt="">
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-name"><a href="product.html">Máy khoan Bosch GBM-320</a></h3>
                                                <h4 class="product-price"><span class="qty">1x</span>900.000</h4>
                                            </div>
                                            <button class="delete"><i class="fa fa-close"></i></button>
                                        </div>
                                    </div>
                                    <div class="cart-summary">
                                        <small>2 Sản Phẩm</small>
                                        <h5>Tổng: 1.880.000</h5>
                                    </div>
                                    <div class="cart-btns">
                                        <a href="cart.html">Xem</a>
                                        <a href="checkout.html">Thanh Toán<i class="fa fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>
                            </div>
                            <!-- /Cart -->

                            <!-- Menu Toogle -->
                            <div class="menu-toggle">
                                <a href="#">
                                    <i class="fa fa-bars"></i>
                                    <span>Menu</span>
                                </a>
                            </div>
                            <!-- /Menu Toogle -->
                        </div>
                    </div>
                    <!-- /ACCOUNT -->
                </div>
                <!-- row -->
            </div>
            <!-- container -->
        </div>
        <!-- /MAIN HEADER -->
    </header>
    <!-- /HEADER -->
    <!-- NAVIGATION -->
    <nav id="navigation">
        <!-- container -->
        <div class="container">
            <!-- responsive-nav -->
            <div id="responsive-nav">
                <!-- NAV -->
                <ul class="main-nav nav navbar-nav">

                    <li><a href="/THDoAn_war/">Trang chủ</a></li>
                    <li><a href="/THDoAn_war//List-Product">Sản Phẩm</a></li>
                    <% List<Category> lista = (List<Category>) request.getAttribute("listc");
                        for (Category p:lista) { %>




                    <li> <a  href="<%= "/THDoAn_war/category?cName=" + p.getcName()%>"><%= p.getcName()%></a></li>


<%--                    <li><a href="khoan-dong-luc.html">Khoan động lực</a></li>--%>
<%--                    <li><a href="khoan-be-tong.html">Khoan bê tông</a></li>--%>
<%--                    <li><a href="khoan-ban.html">Khoan bàn</a></li>--%>
<%--                    <li><a href="phukien.html">Phụ Kiện</a></li>--%>

                    <% } %>
                    <li><a href="support.html">Hỗ Trợ</a></li>
                </ul>
                <!-- /NAV -->
            </div>
            <!-- /responsive-nav -->
        </div>
        <!-- /container -->
    </nav>
    <!-- /NAVIGATION -->

    <!-- BREADCRUMB -->
    <div id="breadcrumb" class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">

                <div class="col-md-12">

                    <ul class="breadcrumb-tree">
                        <li><a href="index.jsp">Trang chủ</a></li>

                        <li><a href="/THDoAn_war//List-Product">Sản Phẩm</a></li>


                    </ul>


                </div>
            </div>
            <!-- /row -->

        </div>
        <!-- /container -->
    </div>
    <!-- /BREADCRUMB -->

    <!-- SECTION -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- ASIDE -->
                <div id="aside" class="col-md-3">
                    <!-- aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">Sản Phẩm</h3>
                        <div class="checkbox-filter">
                            <% List<Category> list3 = (List<Category>) request.getAttribute("listc");
                                for (Category p:list3) { %>

                            <div class="input-checkbox">
                                <input type="checkbox" name="categoryCheck" id="category-<%=p.getCid()%>">
                                <label for="category-<%=p.getCid()%>">
										<span></span>
										<%= p.getcName()%>
										<small>(120)</small>
									</label>
                            </div>



<% } %>
                        </div>
                    </div>
                    <!-- /aside Widget -->

                    <!-- aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">Giá</h3>
                        <div class="price-filter">
                            <div id="price-slider"></div>
                            <div class="input-number price-min">
                                <input id="price-min" type="number">
                                <span class="qty-up">+</span>
                                <span class="qty-down">-</span>
                            </div>
                            <span>-</span>
                            <div class="input-number price-max">
                                <input id="price-max" type="number">
                                <span class="qty-up">+</span>
                                <span class="qty-down">-</span>
                            </div>
                        </div>
                    </div>
                    <!-- /aside Widget -->

                    <!-- aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">Nhãn Hiệu</h3>
                        <div class="checkbox-filter">
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-1">
                                <label for="brand-1">
										<span></span>
										Bosch
										<small>(578)</small>
									</label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-2">
                                <label for="brand-2">
										<span></span>
										CFCooper
										<small>(125)</small>
									</label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-3">
                                <label for="brand-3">
										<span></span>
										DeWalt
										<small>(755)</small>
									</label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-4">
                                <label for="brand-4">
										<span></span>
                                        DongCheng
										<small>(578)</small>
									</label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-5">
                                <label for="brand-5">
										<span></span>
										YATO
										<small>(125)</small>
									</label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-6">
                                <label for="brand-6">
										<span></span>
										Makita
										<small>(755)</small>
									</label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-7">
                                <label for="brand-6">
										<span></span>
										Stanley
										<small>(755)</small>
									</label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-8">
                                <label for="brand-6">
										<span></span>
										Trung Quốc
										<small>(755)</small>
									</label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-9">
                                <label for="brand-6">
										<span></span>
										INGCO
										<small>(755)</small>
									</label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-10">
                                <label for="brand-6">
										<span></span>
                                    VAC
										<small>(755)</small>
									</label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="">
                                <label for="brand-6">
										<span></span>
										Khác
										<small>(755)</small>
									</label>
                            </div>

                        </div>
                    </div>
                    <!-- /aside Widget -->

                    <!-- aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">Sản Phẩm Tương Tự</h3>
                        <% List<Product> list1 = (List<Product>) request.getAttribute("listsptt");
                            for (Product p:list1) { %>
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<%= p.getImg()%>" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category"><%= p.getClassify()%></p>
                                <h3 class="product-name"><a href="<%= "/THDoAn_war/detail?id=" + p.getId()%>"><%= p.getName()%> </a></h3>
                                <h4 class="product-price"><%= p.getPrice()%> <del class="product-old-price"><%= p.getOldPrice()%></del></h4>
                            </div>
                        </div>
                        <% } %>
                        <!-- /product widget -->

                        <!-- product widget -->
<%--                        <div class="product-widget">--%>
<%--                            <div class="product-img">--%>
<%--                                <img src="./img/product14.jpg" alt="">--%>
<%--                            </div>--%>
<%--                            <div class="product-body">--%>
<%--                                <p class="product-category">Khoan bàn</p>--%>
<%--                                <h3 class="product-name"><a href="product.html"> Máy khoan bàn 13mm Hồng Ký KD600</a></h3>--%>
<%--                                <h4 class="product-price">2.590.000đ<del class="product-old-price"></del></h4>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                        <!-- /product widget -->

                        <!-- product widget -->
<%--                        <div class="product-widget">--%>
<%--                            <div class="product-img">--%>
<%--                                <img src="./img_khoan_dong_luc/product15.jpg" alt="">--%>
<%--                            </div>--%>
<%--                            <div class="product-body">--%>
<%--                                <p class="product-category">Khoan động lực</p>--%>
<%--                                <h3 class="product-name"><a href="product.html"> Máy khoan động lực Bosch GSB 550</a></h3>--%>
<%--                                <h4 class="product-price">1.200.000đ<del class="product-old-price"></del></h4>--%>

<%--                            </div>--%>
<%--                        </div>--%>
                        <!-- product widget -->
                    </div>

                    <div>
                        <!-- product widget -->
<%--                        <div class="product-widget">--%>
<%--                            <div class="product-img">--%>
<%--                                <img src="./img_khoan_mini/product17.jpg" alt="">--%>
<%--                            </div>--%>
<%--                            <div class="product-body">--%>
<%--                                <p class="product-category">Khoan mini</p>--%>
<%--                                <h3 class="product-name"><a href="product.html"> Máy khoan bắn vít Benyu BY6113</a></h3>--%>
<%--                                <h4 class="product-price">590.000đ<del class="product-old-price">690.000đ</del></h4>--%>

<%--                            </div>--%>
<%--                        </div>--%>
                        <!-- /product widget -->

                        <!-- product widget -->
<%--                        <div class="product-widget">--%>
<%--                            <div class="product-img">--%>
<%--                                <img src="./img/product09.jpg" alt="">--%>
<%--                            </div>--%>
<%--                            <div class="product-body">--%>

<%--                                <p class="product-category">Khoan bàn</p>--%>
<%--                                <h3 class="product-name"><a href="product.html">Máy khoan phay phi 16 WDDM ZX7016</a></h3>--%>
<%--                                <h4 class="product-price">18.000.000đ <del class="product-old-price"></del></h4>--%>

<%--                            </div>--%>
<%--                        </div>--%>
                        <!-- /product widget -->

                        <!-- product widget -->
<%--                        <div class="product-widget">--%>
<%--                            <div class="product-img">--%>
<%--                                <img src="./img_khoan_be_tong/product19.jpg" alt="">--%>
<%--                            </div>--%>
<%--                            <div class="product-body">--%>
<%--                                <p class="product-category">Khoan bê tông</p>--%>
<%--                                <h3 class="product-name"><a href="product.html"> Máy khoan bê tông Ken 2826BS</a></h3>--%>
<%--                                <h4 class="product-price">1.380.000đ<del class="product-old-price">1.950.000đ</del></h4>--%>
<%--                            </div>--%>
<%--                        </div>--%>





                    </div>
                    <!-- /aside Widget -->
                </div>
                <!-- /ASIDE -->

                <!-- STORE -->
                <div id="store" class="col-md-9">
                    <!-- store top filter -->
                    <!-- <div class="store-filter clearfix">
                        
                        <ul class="store-grid">
                            <li class="active"><i class="fa fa-th"></i></li>
                            <li><a href="#"><i class="fa fa-th-list"></i></a></li>
                        </ul>
                    </div> -->
                    <!-- /store top filter -->

                    <!-- store products -->
                    <div class="row" id="product">
                        <!-- product -->
                        <% List<Product> list = (List<Product>) request.getAttribute("list");
                            for (Product p:list) { %>
                        <div class="col-md-4 col-xs-6">
                            <div class="product">
                                <a href="<%= "/THDoAn_war/detail?id=" + p.getId()%>">
                                <div class="product-img">

                                    <img src="<%= p.getImg()%>">


                                    <% if(p.isNew() ){ %>
                                    <div class="product-label">
                                        <span class="new">New</span>
                                    </div>
                                    <% }%>
                                    <% if(!p.isNew() ){ %>
                                    <div class="product-label">
                                        <span class="sale"><%= p.getPercent()%></span>
                                    </div>
                                    <% }%>

                                </div>
                                </a>
                                <div class="product-body">
                                    <p class="product-category"><%= p.getClassify()%></p>
                                    <h3 class="product-name"><a href="<%= "/THDoAn_war/detail?id=" + p.getId()%>"><%= p.getName()%></a></h3>
                                    <h4 class="product-price"><%= p.getPrice()%>đ
                                        <% if(!p.isNew() ){ %>
                                        <del class="product-old-price"><%= p.getOldPrice()%></del>
                                        <% }%>
                                    </h4>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-btns">
                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">Thích</span></button>
                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp"> so sách</span></button>
                                        <button class="quick-view"><a href="<%= "/THDoAn_war/detail?id=" + p.getId()%>" class=""> <i class="fa fa-eye"></i><span class="tooltipp">xem</span></a></button>
                                    </div>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                </div>
                            </div>
                        </div>
                        <% } %>
                        <!-- /product -->


                    </div>
                    <!-- /store products -->

                    <!-- store bottom filter -->
                    <div class="store-filter clearfix">
                        <span class="store-qty">HIỂN THỊ 20-100 SẢN PHẨM</span>
                        <ul class="store-pagination">


                            <li class="active">
                                <a>1</a></li>
                            <li><a>2</a></li>
                            <li><a>3</a></li>
                            <li><a>4</a></li>


                            <!-- <li><a href="#"><i class="fa fa-angle-right"></i></a></li> -->
                            <li class="btn-next fa fa-angle-right"></li>
                        </ul>
                    </div>
                    <!-- /store bottom filter -->
                </div>
                <!-- /STORE -->
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /SECTION -->

    <!-- NEWSLETTER -->
    <div id="newsletter" class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="newsletter">
                        <p>Đăng Ký <strong>Bản Tin</strong></p>
                        <form>
                            <input class="input" type="email" placeholder="Nhập Email của bạn">
                            <button class="newsletter-btn"><i class="fa fa-envelope"></i> Đăng ký</button>
                        </form>
                        <ul class="newsletter-follow">
                            <li>
                                <a href="#"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-pinterest"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /NEWSLETTER -->

    <!-- FOOTER -->
    <footer id="footer">
        <!-- top footer -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-3 col-xs-6">
                        <div class="footer">
                            <h3 class="footer-title">About </h3>
                            <p>Địa Chỉ Thông Tin Liên Lạc</p>
                            <ul class="footer-links">
                                <li>
                                    <a target="_blank" href="https://www.google.com/maps/place/C%C3%B4ng+ty+Cu%E1%BB%99c+S%E1%BB%91ng+Xanh+(GLAB)/@10.8712764,106.7891868,17z/data=!4m12!1m6!3m5!1s0x3175276398969f7b:0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRwLiBI4buTIENow60gTWluaA!8m2!3d10.8712764!4d106.7917617!3m4!1s0x3174d89ddbf832ab:0xedd62ee42a254940!8m2!3d10.8730978!4d106.787919"><i class="fa fa-map-marker"></i>TP.Hồ Chí Minh</a>
                                </li>
                                <li><a href="tel:0929831012"><i class="fa fa-phone"></i>0929831012</a></li>
                                <li><a href="mailto: abc@example.com"><i class="fa fa-envelope-o"></i>DH20DT@email.com</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-3 col-xs-6">
                        <div class="footer">
                            <h3 class="footer-title">Sản Phảm</h3>
                            <ul class="footer-links">
                                <li><a href="khoan-mini.html">Khoan mini</a></li>
                                <li><a href="khoan-dong-luc.html">Khoan động lực</a></li>
                                <li><a href="khoan-be-tong.html">Khoan bê tông</a></li>
                                <li><a href="khoan-ban.html">Khoan bàn</a></li>
                                <li><a href="phukien.html">Phụ kiện</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="clearfix visible-xs"></div>

                    <div class="col-md-3 col-xs-6">
                        <div class="footer">
                            <h3 class="footer-title">Thông Tin</h3>
                            <ul class="footer-links">
                                <li><a href="about.html">Giới thiệu</a></li>
                                <li><a href="lien_he.html">Liên hệ chúng tôi</a></li>
                                <li><a href="Cs_bao_mat.html">Chính sách bảo mật</a></li>
                                <li><a href="Cs_trahang.html">Đơn hàng và Trả hàng</a></li>
                                <li><a href="đk_đk.html">Điều khoản và điều kiện</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-3 col-xs-6">
                        <div class="footer">
                            <h3 class="footer-title">Dịch Vụ</h3>
                            <ul class="footer-links">
                                <li><a href="login.jsp">Tài Khoản Của Tôi</a></li>
                                <li><a href="cart.html">Xem Giỏ Hàng</a></li>
                                <li><a href="heart.html">Danh Sách Yêu Thích</a></li>
                                <li><a href="support.html">Hổ Trợ</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /top footer -->

        <!-- bottom footer -->
        <div id="bottom-footer" class="section">
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12 text-center">
                        <ul class="footer-payments">
                            <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                            <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                            <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                            <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                            <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                            <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                        </ul>

                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /bottom footer -->
    </footer>
    <!-- /FOOTER -->

    <!-- jQuery Plugins -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/nouislider.min.js"></script>
    <script src="js/jquery.zoom.min.js"></script>
    <script src="js/main.js"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const loadEl = document.querySelector('#load');
            // // 🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥
            // // The Firebase SDK is initialized and available here!
            //
            // firebase.auth().onAuthStateChanged(user => { });
            // firebase.database().ref('/path/to/ref').on('value', snapshot => { });
            // firebase.firestore().doc('/foo/bar').get().then(() => { });
            // firebase.functions().httpsCallable('yourFunction')().then(() => { });
            // firebase.messaging().requestPermission().then(() => { });
            // firebase.storage().ref('/path/to/ref').getDownloadURL().then(() => { });
            // firebase.analytics(); // call to activate
            // firebase.analytics().logEvent('tutorial_completed');
            // firebase.performance(); // call to activate
            //
            // // 🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥

            try {
                let app = firebase.app();
                let features = [
                    'auth',
                    'database',
                    'firestore',
                    'functions',
                    'messaging',
                    'storage',
                    'analytics',
                    'remoteConfig',
                    'performance',
                ].filter(feature => typeof app[feature] === 'function');
                loadEl.textContent = `Firebase SDK loaded with ${features.join(', ')}`;
            } catch (e) {
                console.error(e);
                loadEl.textContent = 'Error loading the Firebase SDK, check the console.';
            }
        });
    </script>

</body>

</html>