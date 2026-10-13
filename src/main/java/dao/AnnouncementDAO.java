package dao;

import model.AnnouncementBean;
import java.sql.*;
import java.util.ArrayList;
import util.DBConnection;

public class AnnouncementDAO {

    public boolean addAnnouncement(AnnouncementBean announcement) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO announcements(title,message,publish_date) VALUES(?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, announcement.getTitle());
            ps.setString(2, announcement.getMessage());
            ps.setDate(3, announcement.getPublishDate());

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public ArrayList<AnnouncementBean> getAllAnnouncements() {

        ArrayList<AnnouncementBean> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM announcements ORDER BY publish_date DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                AnnouncementBean a = new AnnouncementBean();

                a.setId(rs.getInt("id"));
                a.setTitle(rs.getString("title"));
                a.setMessage(rs.getString("message"));
                a.setPublishDate(rs.getDate("publish_date"));

                list.add(a);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}