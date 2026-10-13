package controller;


import dao.BookDAO;
import model.BookBean;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;



@WebServlet("/manageBooks")
public class ManageBooksServlet extends HttpServlet {



    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {



        BookDAO dao = new BookDAO();



        ArrayList<BookBean> books =
                dao.getAllBooks();



        System.out.println(
                "BOOK COUNT : " + books.size()
        );



        request.setAttribute(
                "books",
                books
        );



        request.getRequestDispatcher(
                        "manageBooks.jsp"
                )
                .forward(request,response);



    }


}