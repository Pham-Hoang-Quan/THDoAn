<%@ page import="vn.edu.hcmuaf.ttt.bean.User" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.Cart" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.Product" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.Category" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<meta http-equiv="Content-Type" charset="UTF-8">
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

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
                    <a target="_blank" href="https://www.google.com/maps/place/C%C3%B4ng+ty+Cu%E1%BB%99c+S%E1%BB%91ng+Xanh+(GLAB)/@10.8712764,106.7891868,17z/data=!4m12!1m6!3m5!1s0x3175276398969f7b:0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRwLiBI4buTIENow60gTWluaA!8m2!3d10.8712764!4d106.7917617!3m4!1s0x3174d89ddbf832ab:0xedd62ee42a254940!8m2!3d10.8730978!4d106.787919"><i class="fa fa-map-marker"></i>TP.H??? Ch?? Minh</a>
                </li>
            </ul>
            <ul class="header-links pull-right">>
                <% User auth= (User) session.getAttribute("auth");%>
                <% if(auth==null){ %>
                <li><a href="login.jsp" target="_blank"><i class="fa fa-user-o"></i> B???n ch??a ????ng nh???p</a></li>
                <% }else {%>
                <li><a target="_blank"><i class="fa fa-user-o"></i>Ch??o b???n: <%= auth.getUser_fullname()%></a>
                    <a href="/THDoAn_war/logOut" target="_blank">  : ????ng xu???t</a></li>
                <% if(auth.getUser_admin() == 1){%>
                <li><a href="/THDoAn_war/IndexAdmin" target="_blank"> <i class="fa fa-cog"></i>Qu???n L??</a></li>
                <%}%>
                <% } %>
                <li>
                    <a href="form_dk.jsp" target="_blank"> <i class="fa fa-dollar"></i>????ng K??</a>
                </li>
            </ul>
        </div>
    </div>
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
                        <form action="search" method="post">

                            <input name="s" class="input" placeholder="T??m S???n Ph???m">
                            <button type="submit" class="search-btn"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <!-- Wishlist -->

                        <!-- /Wishlist -->

                        <!-- Cart -->
                        <div>
                            <a href="cart.jsp">
                                <i class="fa fa-shopping-cart"></i>
                                <span>Gi??? H??ng</span>
                                <div class="qty">${cart.quantily}</div>
                            </a>
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
            <%--                <ul class="main-nav nav navbar-nav">--%>
            <%--                    <ul class="main-nav nav navbar-nav">--%>
            <%--                        <li><a href="/THDoAn_war/">Trang ch???</a></li>--%>
            <%--                        <li><a href="/THDoAn_war//List-Product">S???n Ph???m</a></li>--%>
            <%--                        <% List<Category> lista = (List<Category>) request.getAttribute("listc");--%>
            <%--                            for (Category p:lista) { %>--%>
            <%--                        <li> <a  href="<%= "/THDoAn_war/category?cName=" + p.getcName()%>"><%= p.getcName()%></a></li>--%>
            <%--                        <% } %>--%>
            <%--                        <li><a href="support.html">H??? Tr???</a></li>--%>
            <%--                    </ul>--%>
            <%--                </ul>--%>
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
                    <li><a href="/THDoAn_war/">Trang Ch???</a></li>
                    <li><a href="#">Gi??? H??ng</a></li>

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

                <!-- /aside Widget -->

                <!-- aside Widget -->

                <!-- /aside Widget -->

                <!-- aside Widget -->

                <!-- /aside Widget -->

                <!-- aside Widget -->

                <!-- /product widget -->

                <!-- product widget -->

                <!-- /product widget -->

                <!-- product widget -->

                <!-- product widget -->
            </div>

            <div>
                <!-- product widget -->

                <!-- /product widget -->

                <!-- product widget -->

                <!-- /product widget -->

                <!-- product widget -->

                <!-- /product widget -->

            </div>
            <!-- /aside Widget -->
        </div>
        <!-- /ASIDE -->

        <!-- STORE -->
        <div id="store" class="col-md-9">
            <!-- store top filter -->
            <!-- <div class="store-filter clearfix">
                <div class="store-sort">
                    <label>
                        L???c:
                        <select class="input-select">
                            <option value="0">New</option>
                            <option value="1">Sale</option>
                            <option value="1">Gi?? Cao</option>
                            <option value="1">Gi??o Th???p</option>
                        </select>
                    </label>
                    <label>
                        Hi???n Th??? S???n Ph???m:
                        <select class="input-select">
                            <option value="0">20</option>
                            <option value="1">50</option>
                        </select>
                    </label>
                </div>
                <ul class="store-grid">
                    <li class="active"><i class="fa fa-th"></i></li>
                    <li><a href="#"><i class="fa fa-th-list"></i></a></li>
                </ul>
            </div> -->
            <!-- /store top filter -->

            <!-- store products -->
            <div class="cart-table-area section-padding-100">
                <div class="container-fluid">
                    <form method="post" action="/THDoAn_war/doSoLuong">
                        <div class="row">
                            <div class="col-12 col-lg-8">
                                <div class="cart-title mt-50">
                                    <h2>Gi??? H??ng</h2>
                                </div>

                                <div class="cart-table clearfix">
                                    <table class="table table-responsive">
                                        <thead>
                                        <tr>
                                            <th></th>
                                            <th>T??n</th>
                                            <th>Gi??</th>
                                            <th>S??? L?????ng</th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%Cart cart =(Cart) session.getAttribute("cart");
                                            double tongtien = 0;
                                            int i = 0;
                                        %>
                                        <%for (Product c:cart.getListproduct()) {
                                            tongtien+=(c.getPrice()*c.getQuantily());
                                            i++;
                                        %>
                                        <%Locale locale = new Locale("vi");
                                            NumberFormat format = NumberFormat.getCurrencyInstance(locale);
                                            String tn = format.format(c.getPrice()).split(",")[0];
                                        %>
                                        <tr>
                                            <td class="cart_product_img">
                                                <a href="#"><img src="<%= c.getImg()%>" alt="Product"></a>
                                            </td>
                                            <td class="cart_product_desc">
                                                <h5><%= c.getName()%></h5>
                                            </td>
                                            <td class="price">
                                                <span><%=tn%> ?? </span>
                                            </td>
                                            <td class="qty">
                                                <div class="qty-btn d-flex">
                                                    <p>SL</p>
                                                    <div class="quantity">
                                                                <span class="qty-minus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i
                                                                        class="fa fa-minus"
                                                                        aria-hidden="true"></i></span>
                                                        <input type="number"  class="qty-text" id="qty" step="1" min="1" max="300" name="quantity<%=i%>" value="<%=c.getQuantily()%>">
                                                        <input type="text"  style="display: none" name="productId<%=i%>" value="<%=c.getId()%>">

                                                        <span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i
                                                                class="fa fa-plus"
                                                                aria-hidden="true"></i></span>
                                                    </div>
                                                </div>

                                            </td>
                                            <td>
                                                <a class="delete-product" href="/THDoAn_war/deleteProduct?id=<%=c.getId()%>">
                                                    <i class="fa-solid fa-trash-can"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        <%}%>
<%--                                        <input type="number" name="countSP" style="display:none" value="<%=cart.getListproduct().size()%>" id="">--%>
                                        <input type="number" name="countSP" style="display:none" value="1" id="">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="col-12 col-lg-4">
                                <div class="cart-summary">
                                    <h4>T???NG</h4>
                                    <ul class="summary-table">
                                        <%Locale locale = new Locale("vi");
                                            NumberFormat format = NumberFormat.getCurrencyInstance(locale);
                                            String tt = format.format(tongtien).split(",")[0];
                                        %>
                                        <input type="number" style="display: none" name="tongtien" value="<%=tongtien%>">
                                        <li><span>Ti???n H??ng:</span> <span><%=tt%>??</span></li>
                                        <li><span>V???n Chuy???n:</span> <span>Free</span></li>
                                        <li><span>T???ng Ti???n:</span> <span><%=tt%>??</span></li>
                                    </ul>
                                    <div class="cart-btn mt-100">
                                        <button type="submit" style="background: #d10024; color: honeydew; align-content: center;   " class="btn amado-btn w-100">Thanh To??n</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- /store products -->

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
                    <p>????ng K?? <strong>B???n Tin</strong></p>
                    <form>
                        <input class="input" type="email" placeholder="Nh???p Email C???a B???n">
                        <button class="newsletter-btn"><i class="fa fa-envelope"></i> ????ng K??</button>
                    </form>
                    <ul class="newsletter-follow">
                        <li>
                            <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa-brands fa-twitter"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa-brands fa-instagram"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa-brands fa-pinterest"></i></a>
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
                        <p>?????a Ch??? Th??ng Tin Li??n L???c</p>
                        <ul class="footer-links">
                            <li>
                                <a target="_blank" href="https://www.google.com/maps/place/C%C3%B4ng+ty+Cu%E1%BB%99c+S%E1%BB%91ng+Xanh+(GLAB)/@10.8712764,106.7891868,17z/data=!4m12!1m6!3m5!1s0x3175276398969f7b:0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRwLiBI4buTIENow60gTWluaA!8m2!3d10.8712764!4d106.7917617!3m4!1s0x3174d89ddbf832ab:0xedd62ee42a254940!8m2!3d10.8730978!4d106.787919"><i class="fa fa-map-marker"></i>TP.H??? Ch?? Minh</a>
                            </li>
                            <li><a href="tel:0929831012"><i class="fa fa-phone"></i>0929831012</a></li>
                            <li><a href="mailto: abc@example.com"><i class="fa fa-envelope-o"></i>DH20DT@email.com</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">S???n Ph???m</h3>
                        <ul class="footer-links">
                            <li><a href="khoan-mini.html">Khoan mini</a></li>
                            <li><a href="khoan-dong-luc.html">Khoan ?????ng l???c</a></li>
                            <li><a href="khoan-be-tong.html">Khoan b?? t??ng</a></li>
                            <li><a href="khoan-ban.html">Khoan b??n</a></li>
                            <li><a href="phukien.html">Ph??? ki???n</a></li>
                        </ul>
                    </div>
                </div>

                <div class="clearfix visible-xs"></div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Th??ng Tin</h3>
                        <ul class="footer-links">
                            <li><a href="about.jsp">Gi???i thi???u</a></li>
                            <li><a href="lien_he.jsp">Li??n h??? ch??ng t??i</a></li>
                            <li><a href="Cs_bao_mat.jsp">Ch??nh s??ch b???o m???t</a></li>
                            <li><a href="Cs_trahang.jsp">????n h??ng v?? Tr??? h??ng</a></li>
                            <li><a href="dk_dk.jsp">??i???u kho???n v?? ??i???u ki???n</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">D???ch V???</h3>
                        <ul class="footer-links">
                            <li><a href="login.jsp">T??i Kho???n C???a T??i</a></li>
                            <li><a href="cart.jsp">Xem Gi??? H??ng</a></li>
                            <li><a href="heart.html">Danh S??ch Y??u Th??ch</a></li>
                            <li><a href="support.html">H??? Tr???</a></li>
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
        // // ????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
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
        // // ????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
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