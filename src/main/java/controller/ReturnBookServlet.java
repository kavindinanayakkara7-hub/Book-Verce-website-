package controller;


import dao.BorrowRecordDAO;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;



@WebServlet("/returnBook")
public class ReturnBookServlet extends HttpServlet {



    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)

            throws IOException {



        int id =
                Integer.parseInt(
                        request.getParameter("id")
                );



        String return_date =
                request.getParameter("return_date");



        BorrowRecordDAO dao =
                new BorrowRecordDAO();



        dao.updateReturnDate(
                id,
                return_date
        );



        response.sendRedirect(
                "borrowRecords"
        );



    }


}