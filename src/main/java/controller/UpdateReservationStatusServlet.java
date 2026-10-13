package controller;

import dao.ReservationDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/updateReservationStatus")
public class UpdateReservationStatusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");

        ReservationDAO dao = new ReservationDAO();
        dao.updateStatus(id, status);

        response.sendRedirect("adminDashboard");
    }
}