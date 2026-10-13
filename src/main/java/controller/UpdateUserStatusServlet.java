package controller;


import dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;



@WebServlet("/updateUserStatus")
public class UpdateUserStatusServlet extends HttpServlet {



    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)

            throws IOException{


        int id =
                Integer.parseInt(
                        request.getParameter("id")
                );


        String status =
                request.getParameter("status");



        UserDAO dao =
                new UserDAO();



        dao.updateStatus(id,status);



        response.sendRedirect(
                "manageUsers"
        );



    }


}