package controller;


import dao.ReservationDAO;
import model.ReservationBean;
import model.UserBean;


import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.sql.Date;


@WebServlet("/reserveBook")
public class ReserveBookServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {


        HttpSession session = request.getSession();


        UserBean user =
                (UserBean) session.getAttribute("user");


        if(user == null){

            response.sendRedirect("login.jsp");
            return;

        }


        // Get book id
        String id = request.getParameter("id");


        System.out.println("BOOK ID = " + id);


        if(id == null || id.trim().isEmpty()){

            response.sendRedirect("books");
            return;

        }


        int bookId = Integer.parseInt(id);



        ReservationBean r =
                new ReservationBean();


        r.setUser_id(user.getId());

        r.setBook_id(bookId);

        r.setReserve_date(
                new Date(System.currentTimeMillis())
        );



        ReservationDAO dao =
                new ReservationDAO();



        if(dao.addReservation(r)){


            response.sendRedirect("myReservations");


        }else{


            response.sendRedirect("books.jsp");

        }


    }

}