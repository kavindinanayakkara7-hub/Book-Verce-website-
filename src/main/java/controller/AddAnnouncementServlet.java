package controller;

import dao.AnnouncementDAO;
import model.AnnouncementBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.sql.Date;

@WebServlet("/addAnnouncement")
public class AddAnnouncementServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("addAnnouncement.jsp")
                .forward(request, response);
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        AnnouncementBean announcement = new AnnouncementBean();

        announcement.setTitle(request.getParameter("title"));
        announcement.setMessage(request.getParameter("message"));
        announcement.setPublishDate(Date.valueOf(request.getParameter("publish_date")));

        AnnouncementDAO dao = new AnnouncementDAO();

        if (dao.addAnnouncement(announcement)) {

            response.sendRedirect("viewAnnouncements");

        } else {

            response.sendRedirect("addAnnouncement.jsp");

        }

    }



}