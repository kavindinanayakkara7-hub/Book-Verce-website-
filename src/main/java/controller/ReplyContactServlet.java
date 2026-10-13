package controller;

import dao.ContactDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/replyContact")
public class ReplyContactServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {


        int contactId =
                Integer.parseInt(
                        request.getParameter("contact_id")
                );



        String reply =
                request.getParameter("reply");



        ContactDAO dao =
                new ContactDAO();



        dao.addReply(
                contactId,
                reply
        );



        response.sendRedirect(
                "adminContacts"
        );


    }


}
