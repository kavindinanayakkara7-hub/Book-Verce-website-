package dao;


import model.Publisher;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;



public class PublisherDAO {



    public ArrayList<Publisher> getAllPublishers(){


        ArrayList<Publisher> list =
                new ArrayList<>();



        try{


            Connection con =
                    DBConnection.getConnection();



            String sql =
                    "SELECT * FROM publishers";



            PreparedStatement ps =
                    con.prepareStatement(sql);



            ResultSet rs =
                    ps.executeQuery();



            while(rs.next()){


                Publisher p =
                        new Publisher();



                p.setId(
                        rs.getInt("id")
                );



                p.setName(
                        rs.getString("publisher_name")
                );



                list.add(p);



            }


        }catch(Exception e){

            e.printStackTrace();

        }



        return list;


    }



}