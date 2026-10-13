package controller;


import dao.BookDAO;


import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;



@WebServlet("/updateBook")
public class UpdateBookServlet extends HttpServlet {



    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    )
            throws IOException {



        int id =
                Integer.parseInt(
                        request.getParameter("id")
                );



        String title =
                request.getParameter("title");



        String isbn =
                request.getParameter("isbn");



        int year =
                Integer.parseInt(
                        request.getParameter("publish_year")
                );



        String description =
                request.getParameter("description");



        int quantity =
                Integer.parseInt(
                        request.getParameter("quantity")
                );



        String status =
                request.getParameter("status");




        BookDAO dao =
                new BookDAO();



        dao.updateBook(
                id,
                title,
                isbn,
                year,
                description,
                quantity,
                status
        );



        response.sendRedirect(
                "manageBooks"
        );



    }



}