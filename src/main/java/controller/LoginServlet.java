package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.NguoiDung;

import java.io.IOException;

import dao.NguoiDungDAO;

/**
 * Servlet implementation class LoginServlet
 */
@SuppressWarnings("serial")
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private NguoiDungDAO nguoiDungDAO = new NguoiDungDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/View/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String matKhau = request.getParameter("matkhau");

        NguoiDung user = nguoiDungDAO.checkLogin(email, matKhau);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("userLogin", user);  

            if ("quan_tri".equalsIgnoreCase(user.getVaiTro())) {
                response.sendRedirect(request.getContextPath() + "#");  
            } else {
                
                response.sendRedirect(request.getContextPath() + "/index");  
            }
        } else {
            
            request.setAttribute("errorMsg", "Email hoặc mật khẩu không đúng.");
            request.getRequestDispatcher("/View/login.jsp").forward(request, response);
        }
    }
}
