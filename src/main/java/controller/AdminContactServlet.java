package controller;

import dao.ContactDAO;
import model.ContactBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/adminContacts")
public class AdminContactServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {


        ContactDAO dao =
                new ContactDAO();



        ArrayList<ContactBean> list =
                dao.getAllContacts();



        request.setAttribute(
                "contacts",
                list
        );


        request.getRequestDispatcher(
                "adminContacts.jsp"
        ).forward(request,response);



    }


}
