package controller;


import dao.BorrowRecordDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;



@WebServlet("/updateBorrow")
public class UpdateBorrowRequestServlet extends HttpServlet {


    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)

            throws IOException {



        int id =
                Integer.parseInt(
                        request.getParameter("id")
                );



        String status =
                request.getParameter("status");



        BorrowRecordDAO dao =
                new BorrowRecordDAO();



        dao.updateStatus(id,status);



        response.sendRedirect(
                "borrowRecords"
        );



    }


}