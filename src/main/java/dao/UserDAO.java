package dao;

import model.UserBean;
import util.DBConnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.ArrayList;

public class UserDAO {

    public boolean register(UserBean user) {

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO users(first_name,last_name,email,password,phone,address,role,status) VALUES(?,?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getPhone());
            ps.setString(6, user.getAddress());
            ps.setString(7, "MEMBER");
            ps.setString(8, "ACTIVE");

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();

        }

        return false;

    }

    //login method
    public UserBean login(String email, String password) {

        UserBean user = null;

        try {

            Connection con = DBConnection.getConnection();


            String sql =
                    "SELECT * FROM users WHERE email=? AND password=?";


            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);


            ResultSet rs = ps.executeQuery();


            if (rs.next()) {


                user = new UserBean();


                user.setId(
                        rs.getInt("id")
                );


                user.setFirstName(
                        rs.getString("first_name")
                );


                user.setLastName(
                        rs.getString("last_name")
                );


                user.setEmail(
                        rs.getString("email")
                );


                user.setPassword(
                        rs.getString("password")
                );


                user.setPhone(
                        rs.getString("phone")
                );


                user.setAddress(
                        rs.getString("address")
                );


            }


        } catch (Exception e) {

            e.printStackTrace();

        }


        return user;

    }

    public ArrayList<UserBean> getAllUsers() {


        ArrayList<UserBean> list =
                new ArrayList<>();


        try {


            Connection con =
                    DBConnection.getConnection();


            String sql =
                    "SELECT * FROM users ORDER BY id DESC";


            PreparedStatement ps =
                    con.prepareStatement(sql);


            ResultSet rs =
                    ps.executeQuery();


            while (rs.next()) {


                UserBean u =
                        new UserBean();


                u.setId(
                        rs.getInt("id")
                );


                u.setFirstName(
                        rs.getString("first_name")
                );


                u.setLastName(
                        rs.getString("last_name")
                );


                u.setEmail(
                        rs.getString("email")
                );


                u.setPhone(
                        rs.getString("phone")
                );


                u.setAddress(
                        rs.getString("address")
                );


                u.setRole(
                        rs.getString("role")
                );


                u.setStatus(
                        rs.getString("status")
                );


                list.add(u);


            }


        } catch (Exception e) {

            e.printStackTrace();

        }


        return list;


    }


    public boolean updateStatus(int id, String status) {


        boolean result = false;


        try {


            Connection con =
                    DBConnection.getConnection();


            String sql =
                    "UPDATE users SET status=? WHERE id=?";


            PreparedStatement ps =
                    con.prepareStatement(sql);


            ps.setString(1, status);

            ps.setInt(2, id);


            result =
                    ps.executeUpdate() > 0;


        } catch (Exception e) {

            e.printStackTrace();

        }


        return result;


    }


    public boolean deleteUser(int id) {

        boolean result = false;

        try {

            Connection con =
                    DBConnection.getConnection();


            con.setAutoCommit(false);


            // Delete related borrow records first
            String sql1 =
                    "DELETE FROM borrow_records WHERE user_id=?";


            PreparedStatement ps1 =
                    con.prepareStatement(sql1);


            ps1.setInt(1, id);

            ps1.executeUpdate();


            // Delete favorites if table exists
            String sql2 =
                    "DELETE FROM favorites WHERE user_id=?";


            PreparedStatement ps2 =
                    con.prepareStatement(sql2);


            ps2.setInt(1, id);

            ps2.executeUpdate();


            // Delete user
            String sql3 =
                    "DELETE FROM users WHERE id=?";


            PreparedStatement ps3 =
                    con.prepareStatement(sql3);


            ps3.setInt(1, id);


            result =
                    ps3.executeUpdate() > 0;


            con.commit();


        } catch (Exception e) {

            e.printStackTrace();

        }


        return result;

    }
}