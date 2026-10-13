package dao;


import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class DashboardDAO {


    public int getTotalBooks(){

        int count = 0;


        try{

            Connection con =
                    DBConnection.getConnection();


            String sql =
                    "SELECT COUNT(*) FROM books";


            PreparedStatement ps =
                    con.prepareStatement(sql);


            ResultSet rs =
                    ps.executeQuery();


            if(rs.next()){

                count = rs.getInt(1);

            }


        }catch(Exception e){

            e.printStackTrace();

        }


        return count;

    }






    public int getTotalUsers(){

        int count = 0;


        try{

            Connection con =
                    DBConnection.getConnection();


            String sql =
                    "SELECT COUNT(*) FROM users";


            PreparedStatement ps =
                    con.prepareStatement(sql);


            ResultSet rs =
                    ps.executeQuery();


            if(rs.next()){

                count = rs.getInt(1);

            }


        }catch(Exception e){

            e.printStackTrace();

        }


        return count;

    }






    public int getTotalBorrowedBooks(){

        int count = 0;


        try{

            Connection con =
                    DBConnection.getConnection();


            String sql =
                    "SELECT COUNT(*) FROM borrow_records WHERE status='BORROWED'";


            PreparedStatement ps =
                    con.prepareStatement(sql);


            ResultSet rs =
                    ps.executeQuery();


            if(rs.next()){

                count = rs.getInt(1);

            }


        }catch(Exception e){

            e.printStackTrace();

        }


        return count;

    }


}