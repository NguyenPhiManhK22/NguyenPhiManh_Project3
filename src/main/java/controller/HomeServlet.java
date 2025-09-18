package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.NguoiDung;
import model.SanPham;

import java.io.IOException;
import java.util.List;

import dao.SanPhamDAO;

/**
 * Servlet implementation class HomeServlet
 */
@SuppressWarnings("serial")
@WebServlet("/index")
public class HomeServlet extends HttpServlet {
    private SanPhamDAO sanPhamDAO = new SanPhamDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        NguoiDung userLogin = (NguoiDung) session.getAttribute("userLogin");
    
        List<SanPham> listSanPham = sanPhamDAO.getAllSanPham();
        request.setAttribute("listSanPham", listSanPham);
        request.getRequestDispatcher("/View/index.jsp").forward(request, response);
    }
}