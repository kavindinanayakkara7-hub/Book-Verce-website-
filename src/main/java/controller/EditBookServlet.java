package controller;


import dao.BookDAO;
import model.BookBean;


import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;



@WebServlet("/editBook")
public class EditBookServlet extends HttpServlet {



    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    )
            throws ServletException, IOException {



        int id =
                Integer.parseInt(
                        request.getParameter("id")
                );



        BookDAO dao =
                new BookDAO();



        BookBean book =
                dao.getBookById(id);



        request.setAttribute(
                "book",
                book
        );



        request.getRequestDispatcher(
                "editBook.jsp"
        ).forward(
                request,
                response
        );



    }


}