<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.SanPham" %>
<%@ page import="model.NguoiDung" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <title>Danh sách sản phẩm - NoBiStore</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>

<header class="top-header">
    <div class="header-container">
        <div class="logo">
            <img src="${pageContext.request.contextPath}/images/Logo.jpg" alt="Logo" />
        </div>

        <div class="search-bar">
            <input type="text" placeholder="Bạn đang tìm kiếm cây gì..." />
            <button><i class="fas fa-search"></i></button>
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
        <li><a href="<%= request.getContextPath() %>/index"><i class="fa fa-home"></i>TRANG CHỦ</a></li>
        <li><a href="<%= request.getContextPath() %>/sanpham">SẢN PHẨM</a></li>
        <li><a href="#"> CHĂM CÂY <i class="fas fa-bolt"></i></a></li>
        <li><a href="#"> ĐƠN HÀNG </a></li>
    </ul>
</nav>


<div class="products-wrapper">
    <%
        List<SanPham> listSanPham = (List<SanPham>) request.getAttribute("listSanPham");
        if (listSanPham != null && !listSanPham.isEmpty()) {
            for (SanPham sp : listSanPham) {
    %>
    <div class="product-card">
        <img src="<%=request.getContextPath() + "/" + sp.getDuongDanAnh()%>" alt="<%=sp.getTenSanPham()%>" />
        <h3><%=sp.getTenSanPham()%></h3>
        <p><%= sp.getMoTa().replaceAll(",", "<br>") %></p>
        <p>Giá: <%=String.format("%,.0f", sp.getGia())%> VNĐ</p>
        
    </div>
    <%
            }
        } else {
    %>
    <p>Không có sản phẩm nào</p>
    <%
        }
    %>
</div>

<footer>
   <p> &copy; 2025 Website Bán Cây Cảnh. All rights reserved.</p>
</footer>

</body>
</html>