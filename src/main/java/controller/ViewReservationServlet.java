package controller;

import dao.ReservationDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/viewReservations")
public class ViewReservationServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {


        ReservationDAO dao =
                new ReservationDAO();


        request.setAttribute(
                "reservations",
                dao.getAllReservations()
        );


        request.getRequestDispatcher(
                        "reservations.jsp")
                .forward(request,response);


    }

}
