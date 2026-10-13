package controller;


import dao.UserDAO;
import model.UserBean;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;



@WebServlet("/manageUsers")
public class ManageUsersServlet extends HttpServlet {



    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException,IOException{


        UserDAO dao =
                new UserDAO();



        ArrayList<UserBean> list =
                dao.getAllUsers();



        request.setAttribute(
                "users",
                list
        );



        RequestDispatcher rd =
                request.getRequestDispatcher(
                        "users_manage.jsp"
                );



        rd.forward(request,response);



    }


}