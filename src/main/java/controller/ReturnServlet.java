package controller;

import dao.BorrowDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/ReturnServlet")
public class ReturnServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int borrowId=Integer.parseInt(request.getParameter("borrow_id"));

        int bookId=Integer.parseInt(request.getParameter("book_id"));

        String returnDate= LocalDate.now().toString();

        BorrowDAO dao=new BorrowDAO();

        dao.returnBook(borrowId,bookId,returnDate);

        response.sendRedirect("MyBorrowBooksServlet");

    }

}
