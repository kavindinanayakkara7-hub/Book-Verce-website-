package controller;


import dao.DashboardDAO;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;



@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {



    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException,IOException{


        DashboardDAO dao =
                new DashboardDAO();



        request.setAttribute(
                "totalBooks",
                dao.getTotalBooks()
        );



        request.setAttribute(
                "totalUsers",
                dao.getTotalUsers()
        );



        request.setAttribute(
                "totalBorrowed",
                dao.getTotalBorrowedBooks()
        );




        RequestDispatcher rd =
                request.getRequestDispatcher(
                        "admin.jsp"
                );



        rd.forward(request,response);



    }



}