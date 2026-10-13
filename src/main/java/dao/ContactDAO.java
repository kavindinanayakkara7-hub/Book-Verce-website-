package dao;


import model.ContactBean;
import model.ContactReplyBean;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;


public class ContactDAO {



    public boolean addContact(ContactBean c){


        boolean result=false;


        try{


            Connection con =
                    DBConnection.getConnection();



            String sql =
                    "INSERT INTO contact(user_id,name,email,subject,message) VALUES(?,?,?,?,?)";



            PreparedStatement ps =
                    con.prepareStatement(sql);



            ps.setInt(1,c.getUser_id());

            ps.setString(2,c.getName());

            ps.setString(3,c.getEmail());

            ps.setString(4,c.getSubject());

            ps.setString(5,c.getMessage());



            result =
                    ps.executeUpdate()>0;



        }catch(Exception e){

            e.printStackTrace();

        }


        return result;

    }



    public ArrayList<ContactBean> getAllContacts(){


        ArrayList<ContactBean> list=new ArrayList<>();


        try{


            Connection con =
                    DBConnection.getConnection();


            String sql =
                    "SELECT * FROM contact ORDER BY id DESC";


            PreparedStatement ps =
                    con.prepareStatement(sql);



            ResultSet rs =
                    ps.executeQuery();



            while(rs.next()){


                ContactBean c =
                        new ContactBean();



                c.setId(rs.getInt("id"));

                c.setUser_id(rs.getInt("user_id"));

                c.setName(rs.getString("name"));

                c.setEmail(rs.getString("email"));

                c.setSubject(rs.getString("subject"));

                c.setMessage(rs.getString("message"));

                c.setCreated_at(rs.getString("created_at"));



                list.add(c);


            }



        }catch(Exception e){

            e.printStackTrace();

        }


        return list;


    }

    public boolean addReply(int contactId,String reply){


        boolean result=false;


        try{


            Connection con =
                    DBConnection.getConnection();


            String sql =
                    "INSERT INTO contact_reply(contact_id,admin_reply) VALUES(?,?)";


            PreparedStatement ps =
                    con.prepareStatement(sql);


            ps.setInt(1,contactId);

            ps.setString(2,reply);



            result =
                    ps.executeUpdate()>0;



        }catch(Exception e){

            e.printStackTrace();

        }


        return result;


    }

    public ArrayList<ContactReplyBean> getUserReplies(int userId){

        ArrayList<ContactReplyBean> list =
                new ArrayList<>();


        try{


            Connection con =
                    DBConnection.getConnection();



            String sql =
                    "SELECT cr.id, cr.contact_id, cr.admin_reply, cr.reply_date " +
                            "FROM contact_reply cr " +
                            "INNER JOIN contact c ON cr.contact_id = c.id " +
                            "WHERE c.user_id=? " +
                            "ORDER BY cr.id DESC";



            PreparedStatement ps =
                    con.prepareStatement(sql);



            ps.setInt(1,userId);



            ResultSet rs =
                    ps.executeQuery();



            while(rs.next()){


                ContactReplyBean r =
                        new ContactReplyBean();



                r.setId(
                        rs.getInt("id")
                );


                r.setContact_id(
                        rs.getInt("contact_id")
                );


                r.setAdmin_reply(
                        rs.getString("admin_reply")
                );


                r.setReply_date(
                        rs.getString("reply_date")
                );



                list.add(r);


            }



        }catch(Exception e){

            e.printStackTrace();

        }



        return list;

    }


}