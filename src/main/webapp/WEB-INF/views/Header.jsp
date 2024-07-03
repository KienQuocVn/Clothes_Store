<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Assignment</title>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="assets/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="assets/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet" href="assets/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="assets/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="assets/css/style.css" type="text/css">
</head>
<body>
	<header class="header">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3">
					<div class="header__logo">
						<a href="/"><img src="assets/img/logo1.svg" alt=""></a>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<nav class="header__menu mobile-menu">
						<ul>
							<fmt:setLocale value="${sessionScope.lang}" scope="request"/>
							<fmt:setBundle basename="global" scope="request"/>
							<c:url var="home" value="/"/>
							<li class="active"><a href="/">Trang chủ</a></li>
							<li><a href="/shop">Cửa hàng</a></li>
							<c:if test="${not empty user}">
								<li><a href="/account/index">${user.fullname}</a></li>
							</c:if>
							<c:if test="${user.admin}">
								<li><a href="/admin/product">Quản lý</a></li>
							</c:if>
							<c:if test="${empty user}">
								<li><a href="/sign-in">Đăng nhập</a></li>
							</c:if>
<!-- 							<li><a href="?lang=vi"><img src="assets/img/icon.png" width="20px"> VN </a></li>
							<li><a href="?lang=en"><img src="assets/img/iconEN.jpg" width="15px"> EN </a></li> -->
						</ul>
					</nav>
				</div>
				<div class="col-lg-3 col-md-3">
					<div class="header__nav__option">
						<a href="#" class="search-switch"><img
							src="assets/img/icon/search.png" alt=""></a> <a
							href="shop/cart"><img src="assets/img/icon/cart.png" alt="">
							<span>${numberCart}</span></a>
						<div class="price">
							<fmt:formatNumber value="${totalCart}" pattern="#,###" />
							&#8363;
						</div>
					</div>
				</div>
			</div>
			<div class="canvas__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Search Begin -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">+</div>
			<form class="search-model-form">
				<input type="text" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>
	<!-- Search End -->

	<script type="text/javascript">
	    function detail(id) {
	    	location.assign("http://localhost:8080/shop/detail/"+id);
		}
	    async function addToCartOne(id) {
		    if(${not empty user}){
	    	  const response = await fetch("http://localhost:8080/shop/cart/add?id="+id+"&qty=1");
			}
		    else {
	    	  location.assign("http://localhost:8080/sign-in");
			}
	    }
	    $(document).ready(function(){
	    	$("a[href*=lang]").on("click",function(){
	    		var param = $(this).attr("href");
	    		$.ajax({
	    			url: "/" + param,
	    			success:function(){
	    				location.reload();
	    			}
	    		});
	    		return false;
	    	})
	    })
    </script>

	<!-- Js Plugins -->
	<script src="assets/js/jquery-3.3.1.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.nice-select.min.js"></script>
	<script src="assets/js/jquery.nicescroll.min.js"></script>
	<script src="assets/js/jquery.magnific-popup.min.js"></script>
	<script src="assets/js/jquery.countdown.min.js"></script>
	<script src="assets/js/jquery.slicknav.js"></script>
	<script src="assets/js/mixitup.min.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>