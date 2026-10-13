package controller;


import dao.ContactDAO;
import model.ContactReplyBean;
import model.UserBean;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;



@WebServlet("/myMessages")
public class MyMessagesServlet extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {



        HttpSession session =
                request.getSession(false);



        // Session check
        if(session == null){


            response.sendRedirect("login.jsp");

            return;

        }




        UserBean user =
                (UserBean)
                        session.getAttribute("user");




        // Login check
        if(user == null){


            response.sendRedirect("login.jsp");

            return;

        }




        ContactDAO dao =
                new ContactDAO();




        ArrayList<ContactReplyBean> list =
                dao.getUserReplies(
                        user.getId()
                );




        request.setAttribute(
                "replies",
                list
        );




        request.getRequestDispatcher(
                "myMessages.jsp"
        ).forward(request,response);



    }


}