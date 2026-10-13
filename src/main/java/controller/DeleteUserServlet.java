package controller;


import dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;



@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {


    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)

            throws IOException{


        int id =
                Integer.parseInt(
                        request.getParameter("id")
                );



        UserDAO dao =
                new UserDAO();



        dao.deleteUser(id);



        response.sendRedirect(
                "manageUsers"
        );



    }


}