package controller;

import dao.BookDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;

@WebServlet("/books")
public class ViewBooksServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        BookDAO dao = new BookDAO();

        request.setAttribute(
                "books",
                dao.getAllBooks()
        );

        request.getRequestDispatcher(
                "userBooks.jsp"
        ).forward(request,response);

    }

}