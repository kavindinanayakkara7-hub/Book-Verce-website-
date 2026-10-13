package dao;


import model.Category;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;



public class CategoryDAO {



    public ArrayList<Category> getAllCategories(){


        ArrayList<Category> list =
                new ArrayList<>();


        try{


            Connection con =
                    DBConnection.getConnection();



            String sql =
                    "SELECT * FROM categories";



            PreparedStatement ps =
                    con.prepareStatement(sql);



            ResultSet rs =
                    ps.executeQuery();



            while(rs.next()){


                Category c =
                        new Category();



                c.setId(
                        rs.getInt("id")
                );



                c.setName(
                        rs.getString("category_name")
                );



                list.add(c);



            }



        }catch(Exception e){

            e.printStackTrace();

        }



        return list;


    }



}