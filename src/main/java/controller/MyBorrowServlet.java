package controller;


import dao.BorrowDAO;
import model.BorrowBean;


import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


import java.io.IOException;
import java.util.ArrayList;



@WebServlet("/myborrow")
public class MyBorrowServlet extends HttpServlet {



    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    )
            throws ServletException, IOException {



        HttpSession session =
                request.getSession();



        Integer userId =
                (Integer)
                        session.getAttribute("user_id");



        if(userId==null){


            response.sendRedirect(
                    "login.jsp"
            );

            return;

        }




        BorrowDAO dao =
                new BorrowDAO();



        ArrayList<BorrowBean> list =
                dao.getUserBorrowBooks(userId);



        request.setAttribute(
                "borrowList",
                list
        );



        request.getRequestDispatcher(
                "myborrow.jsp"
        ).forward(
                request,
                response
        );



    }



}