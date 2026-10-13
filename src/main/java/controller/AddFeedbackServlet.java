package controller;

import dao.FeedbackDAO;
import model.FeedbackBean;
import model.UserBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet("/addFeedback")
public class AddFeedbackServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // Open feedback form
        request.getRequestDispatcher("feedback.jsp")
                .forward(request, response);
    }


    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session=request.getSession();

        UserBean user=(UserBean)session.getAttribute("user");

        FeedbackBean feedback=new FeedbackBean();

        feedback.setUserId(user.getId());

        feedback.setSubject(request.getParameter("subject"));

        feedback.setMessage(request.getParameter("message"));

        FeedbackDAO dao=new FeedbackDAO();

        if(dao.addFeedback(feedback)){

            response.sendRedirect("feedback.jsp?success=1");

        }else{

            response.sendRedirect("feedback.jsp?error=1");

        }

    }

}