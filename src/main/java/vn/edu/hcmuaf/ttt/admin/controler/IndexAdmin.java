package vn.edu.hcmuaf.ttt.admin.controler;

import vn.edu.hcmuaf.ttt.admin.service.HoaDon;
import vn.edu.hcmuaf.ttt.admin.service.IndexService;
import vn.edu.hcmuaf.ttt.bean.Log;
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.db.DB;
import vn.edu.hcmuaf.ttt.model.Product;
import vn.edu.hcmuaf.ttt.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "IndexAdmin", value = "/IndexAdmin")
public class IndexAdmin extends HttpServlet { // đã phân quyền
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("auth");
        boolean isLoggedIn = user != null;
        boolean isNormalUser = isLoggedIn && user.getUser_admin() == 0;
        if (!isLoggedIn || isNormalUser) {
            response.sendRedirect("admin/login.jsp");
        } else {
            List<Product> list = ProductService.getData();
            List<Product> listn = ProductService.getLast();
            List<Product> needToAdd = IndexService.needToAdd();


            String countProduct;
            try {
                countProduct = ProductService.CountProducts();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            String countHD;
            try {
                countHD = HoaDon.CountHD();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            List<String> listTongGia = HoaDon.getTienHH();

            // phân trang
            int count = ProductService.countProduct(); // số lượng sp trong database
            int endPage = count / 10; // mỗi trang có 10 sản phẩm
            if (count % 10 != 0) {
                endPage++;
            }

            request.setAttribute("countProduct", countProduct);
            request.setAttribute("countHD", countHD);
            request.setAttribute("listTongGia", listTongGia);
            request.setAttribute("listn", listn);
            request.setAttribute("needToAdd", needToAdd);
            request.setAttribute("endP", endPage);

            request.getRequestDispatcher("admin/index.jsp").forward(request, response);

            //Log
            String user_id = user.getUser_id();
            int id_u = Integer.parseInt(user_id);
            DB.me().insert(new Log(Log.INFO, id_u, "/IndexAdmin" ,"truy cập vào admin"+listn.toString(), 1));
            //


        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
