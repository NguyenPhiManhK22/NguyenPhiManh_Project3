<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.NguoiDung" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <title>NoBiStore</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>

<header class="top-header">
    <div class="header-container">
        <div class="logo">
            <a href="index"><img src="${pageContext.request.contextPath}/images/Logo.jpg" alt="NoBi Logo" /></a>
        </div>

        <div class="search-bar">
    		<form action="#" method="get">
        		<input type="text" name="keyword" placeholder="Bạn đang tìm kiếm cây gì..." required />
        		<button type="submit"><i class="fas fa-search"></i></button>
    		</form>
		</div>

        <div class="header-icons">     
        	<%
                NguoiDung userLogin = (NguoiDung) session.getAttribute("userLogin");
                if (userLogin != null) {
            %>
                <span>Xin chào, <%= userLogin.getHoTen() %>!</span>
                <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
            <%
                } else {
            %>
                <a href="login"><i class="fas fa-user"></i><span>Đăng nhập</span></a>
            <%
                }
            %>   
            <a href="#"><i class="fas fa-shopping-cart"></i><span>Giỏ hàng</span></a>
        </div>
    </div>
</header>

<nav class="main-nav">
    <ul>
        <li><a href="index"><i class="fa fa-home"></i>TRANG CHỦ</a></li>
        <li><a href="sanpham">SẢN PHẨM</a></li>
        <li><a href="#"> CHĂM CÂY <i class="fas fa-bolt"></i></a></li>
        <li><a href="#"> ĐƠN HÀNG </a></li>
    </ul>
</nav>

<div class="container">
    <h1 >Chào mừng đến với NoBiStore</h1>
    <h3>Khám phá các cây cảnh đầy sắc màu</h3>
</div>


	
	
<footer>
   <p> &copy; 2025 Website Bán cây cảnh . All rights reserved.</p>
</footer>

</body>
</html>