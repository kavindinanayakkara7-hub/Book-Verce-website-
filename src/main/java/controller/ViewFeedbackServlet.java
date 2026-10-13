package controller;

import dao.FeedbackDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/viewFeedback")
public class ViewFeedbackServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        FeedbackDAO dao=new FeedbackDAO();

        request.setAttribute("feedbacks",
                dao.getAllFeedback());

        request.getRequestDispatcher("feedbacks.jsp")
                .forward(request,response);

    }

}