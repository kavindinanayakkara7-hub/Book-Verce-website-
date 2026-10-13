package controller;


import dao.ContactDAO;
import model.ContactBean;
import model.UserBean;


import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;



@WebServlet("/contact")
public class ContactServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {


        request.getRequestDispatcher(
                "contact.jsp"
        ).forward(request, response);


    }


    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException,IOException{


        HttpSession session =
                request.getSession();



        UserBean user =
                (UserBean)session.getAttribute("user");



        ContactBean c =
                new ContactBean();



        if(user!=null){

            c.setUser_id(user.getId());

        }else{

            c.setUser_id(0);

        }



        c.setName(
                request.getParameter("name")
        );


        c.setEmail(
                request.getParameter("email")
        );


        c.setSubject(
                request.getParameter("subject")
        );


        c.setMessage(
                request.getParameter("message")
        );



        ContactDAO dao =
                new ContactDAO();



        if(dao.addContact(c)){


            response.sendRedirect("contact.jsp?success=true");


        }else{


            response.sendRedirect("contact.jsp?error=true");


        }



    }



}