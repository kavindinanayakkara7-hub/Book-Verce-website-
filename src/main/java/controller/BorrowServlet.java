package controller;

import dao.BorrowDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/borrow")
public class BorrowServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Integer userId = (Integer) session.getAttribute("user_id");

        // User not logged in
        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {

            int bookId = Integer.parseInt(request.getParameter("book_id"));
            int period = Integer.parseInt(request.getParameter("period"));

            LocalDate borrowDate = LocalDate.now();
            LocalDate dueDate = borrowDate.plusDays(period);

            BorrowDAO dao = new BorrowDAO();

            boolean result = dao.borrowBook(
                    userId,
                    bookId,
                    borrowDate.toString(),
                    dueDate.toString()
            );

            if (result) {

                // Borrow Success
                response.sendRedirect("myborrow?msg=borrow_success");

            } else {

                // No available books or borrow failed
                response.sendRedirect("home.jsp?msg=borrow_failed");

            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect("home.jsp?msg=error");

        }

    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws IOException {

        response.sendRedirect("home.jsp");

    }

}