package controller;

import dao.ReservationDAO;
import model.ReservationBean;
import model.UserBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/myReservations")
public class MyReservationsServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {



        HttpSession session =
                request.getSession();



        UserBean user =
                (UserBean)session.getAttribute("user");



        if(user == null){

            response.sendRedirect("login.jsp");

            return;

        }



        ReservationDAO dao =
                new ReservationDAO();



        ArrayList<ReservationBean> list =
                dao.getUserReservations(user.getId());



        request.setAttribute(
                "reservations",
                list
        );



        request.getRequestDispatcher(
                "myReservations.jsp"
        ).forward(request,response);



    }

}