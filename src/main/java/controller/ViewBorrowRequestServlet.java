package controller;


import dao.BorrowRecordDAO;
import model.BorrowRecordBean;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;



@WebServlet("/borrowRecords")
public class ViewBorrowRequestServlet extends HttpServlet {



    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException, IOException {



        BorrowRecordDAO dao =
                new BorrowRecordDAO();



        ArrayList<BorrowRecordBean> list =
                dao.getAllRecords();



        request.setAttribute(
                "records",
                list
        );



        RequestDispatcher rd =
                request.getRequestDispatcher(
                        "borrow_record_view.jsp"
                );



        rd.forward(request,response);



    }


}