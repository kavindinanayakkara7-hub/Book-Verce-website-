package controller;

import dao.AnnouncementDAO;
import model.AnnouncementBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/viewAnnouncements")
public class ViewAnnouncementServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        AnnouncementDAO dao = new AnnouncementDAO();

        ArrayList<AnnouncementBean> list = dao.getAllAnnouncements();

        request.setAttribute("announcements", list);

        request.getRequestDispatcher("announcements.jsp")
                .forward(request, response);

    }

}