<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Assignment</title>
	<!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="assets/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="assets/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="assets/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="assets/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="assets/css/style.css" type="text/css">
</head>
<body>
	<!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <%@include file="Header.jsp"%>
    <!-- Header Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Shop</h4>
                        <div class="breadcrumb__links">
                            <a href="/">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shop Section Begin -->
    <section class="shop spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="shop__sidebar">
                        <div class="shop__sidebar__search">
                            <form action="/shop" method="get">
                                <input type="text" name="name" value="${searchShop}" placeholder="Search...">
                                <button type="submit"><span class="icon_search"></span></button>
                            </form>
                        </div>
                        <div class="shop__sidebar__accordion">
                            <div class="accordion" id="accordionExample">
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseOne">Categories</a>
                                    </div>
                                    <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__categories">
                                                <ul class="nice-scroll">
                                                	<c:forEach items="${categories}" var="item">
                                                		<li><a href="/shop?category=${item.id}">${item.name}</a></li>
                                                	</c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseThree">Filter Price</a>
                                    </div>
                                    <div id="collapseThree" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__price">
                                                <ul>
                                                    <li><a href="/shop?price=0">0.00 - 100.000</a></li>
                                                    <li><a href="/shop?price=1">100.000 - 200.000</a></li>
                                                    <li><a href="/shop?price=2">200.000+</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="shop__product__option">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__product__option__left">
                                    <p>Showing 1–12 of ${page.totalElements} results</p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__product__option__right">
                                    <p>Sort by Price:</p>
                                    <select class="form-select border-0" id="sortSelect">
                                        <option value="true"><a href="/shop?sort=true">Low To High</a></option>
                                        <option value="false"><a href="/shop?sort=false">High To Low</a></option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <c:forEach items="${products}" var="item">
                        	<div class="col-lg-4 col-md-6 col-sm-6">
	                            <div class="product__item">
	                                <div class="product__item__pic set-bg" onclick="detail(${item.key})" data-setbg="assets/img/product/${item.value[3][0]}">
	                                    <ul class="product__hover">
	                                        <li><a href="#"><img src="assets/img/icon/heart.png" alt=""></a></li>
	                                        <li><a href="#"><img src="assets/img/icon/compare.png" alt=""> <span>Compare</span></a>
	                                        </li>
	                                        <li><a href="#"><img src="assets/img/icon/search.png" alt=""></a></li>
	                                    </ul>
	                                </div>
	                                <div class="product__item__text">
	                                    <h6>${item.value[0]}</h6>
	                                    <div onclick="addToCartOne(${item.key})" class="add-cart">+ Add To Cart</div>
	                                    <div class="rating">
	                                        <i class="fa fa-star-o"></i>
	                                        <i class="fa fa-star-o"></i>
	                                        <i class="fa fa-star-o"></i>
	                                        <i class="fa fa-star-o"></i>
	                                        <i class="fa fa-star-o"></i>
	                                    </div>
	                                    <h5><fmt:formatNumber value="${item.value[1]}" pattern="#,###"/> &#8363;</h5>
	                                </div>
	                            </div>
	                        </div>
                        </c:forEach>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div id="div_page" class="product__pagination">
                            	
                            </div>
                        </div>
                    </div>
                    
                    <!--Page-->
                    <script type="text/javascript">
                    	if(${page.totalPages} > 1){
							for(var i=0;i<${page.totalPages};i++){
						        const box = document.getElementById('div_page');
								const el = document.createElement('a');
								if(i==${page.number}){
						        	el.classList.add('active');
								}
						        el.setAttribute('id', 'page'+i);
						        el.setAttribute('href', '?p='+i);
						        el.textContent = i+1;
						        box.appendChild(el);
							}
                        }
                    </script>
                    
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Section End -->

    <!-- Footer Section Begin -->
    <%@include file="Footer.jsp"%>
    <!-- Footer Section End -->

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
    
    <c:if test="${sortShop == true}">
    	<script type="text/javascript">
    		document.getElementById("sortSelect").value = true;
    	</script>
    </c:if>
    <c:if test="${sortShop == false}">
    	<script type="text/javascript">
    		document.getElementById("sortSelect").value = false;
    	</script>
    </c:if>
    
    <script type="text/javascript">
	    document.getElementById("sortSelect").addEventListener("change", function(){
	        location.assign("http://localhost:8080/shop?sort="+document.getElementById("sortSelect").value);
	    });

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
    </script>

    <!-- Js Plugins -->
    <script src="assets/js/jquery-3.3.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.nicescroll.min.js"></script>
    <script src="assets/js/jquery.magnific-popup.min.js"></script>
    <script src="assets/js/jquery.countdown.min.js"></script>
    <script src="assets/js/jquery.slicknav.js"></script>
    <script src="assets/js/mixitup.min.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>