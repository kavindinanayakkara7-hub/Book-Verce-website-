package controller;


import dao.FavoriteDAO;
import model.UserBean;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;



@WebServlet("/favorite")
public class FavoriteServlet extends HttpServlet {



    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {



        response.setContentType("application/json");


        PrintWriter out =
                response.getWriter();



        HttpSession session =
                request.getSession();



        // GET LOGIN USER

        UserBean user =
                (UserBean) session.getAttribute("user");



        if(user == null){


            out.print(
                    "{\"status\":\"login\"}"
            );


            return;

        }




        int userId =
                user.getId();




        int bookId =
                Integer.parseInt(
                        request.getParameter("book_id")
                );




        FavoriteDAO dao =
                new FavoriteDAO();



        dao.toggleFavorite(
                userId,
                bookId
        );




        boolean favorite =
                dao.isFavorite(
                        userId,
                        bookId
                );




        out.print(
                "{ \"status\":\"success\", \"favorite\":"+favorite+" }"
        );


    }


}