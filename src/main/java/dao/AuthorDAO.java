package dao;


import model.Author;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;



public class AuthorDAO {



    public ArrayList<Author> getAllAuthors(){


        ArrayList<Author> list =
                new ArrayList<>();


        try{


            Connection con =
                    DBConnection.getConnection();



            String sql =
                    "SELECT * FROM authors";



            PreparedStatement ps =
                    con.prepareStatement(sql);



            ResultSet rs =
                    ps.executeQuery();



            while(rs.next()){


                Author a =
                        new Author();



                a.setId(
                        rs.getInt("id")
                );



                a.setName(
                        rs.getString("author_name")
                );



                list.add(a);



            }


        }catch(Exception e){

            e.printStackTrace();

        }



        return list;


    }



}