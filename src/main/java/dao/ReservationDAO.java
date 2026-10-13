package dao;

import model.ReservationBean;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;


public class ReservationDAO {


    // Add Reservation

    public boolean addReservation(ReservationBean reservation){

        boolean result=false;


        try{

            Connection con = DBConnection.getConnection();


            String sql =
                    "INSERT INTO reservations(user_id,book_id,reserve_date,status) VALUES(?,?,?,?)";


            PreparedStatement ps =
                    con.prepareStatement(sql);


            ps.setInt(1, reservation.getUser_id());

            ps.setInt(2, reservation.getBook_id());

            ps.setDate(3, reservation.getReserve_date());

            ps.setString(4, "PENDING");


            result = ps.executeUpdate() > 0;


        }catch(Exception e){

            e.printStackTrace();

        }


        return result;

    }




    // Admin View All Reservations

    public ArrayList<ReservationBean> getAllReservations(){


        ArrayList<ReservationBean> list =
                new ArrayList<>();


        try{


            Connection con =
                    DBConnection.getConnection();



            String sql =
                    "SELECT * FROM reservations ORDER BY id DESC";



            PreparedStatement ps =
                    con.prepareStatement(sql);



            ResultSet rs =
                    ps.executeQuery();



            while(rs.next()){


                ReservationBean r =
                        new ReservationBean();


                r.setId(rs.getInt("id"));

                r.setUser_id(rs.getInt("user_id"));

                r.setBook_id(rs.getInt("book_id"));

                r.setReserve_date(
                        rs.getDate("reserve_date")
                );

                r.setStatus(
                        rs.getString("status")
                );


                list.add(r);


            }


        }catch(Exception e){

            e.printStackTrace();

        }


        return list;

    }



    // Update Status

    public void updateStatus(int id, String status){

        try{

            Connection con = DBConnection.getConnection();

            String sql =
                    "UPDATE reservations SET status=? WHERE id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, status);
            ps.setInt(2, id);

            ps.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }

    }

    public ArrayList<ReservationBean> getUserReservations(int userId){

        ArrayList<ReservationBean> list = new ArrayList<>();


        try{

            Connection con = DBConnection.getConnection();


            String sql =
                    "SELECT r.id, r.user_id, r.book_id, r.reserve_date, r.status, " +
                            "b.title, b.image " +
                            "FROM reservations r " +
                            "JOIN books b ON r.book_id = b.id " +
                            "WHERE r.user_id=? " +
                            "ORDER BY r.id DESC";


            PreparedStatement ps =
                    con.prepareStatement(sql);


            ps.setInt(1,userId);


            ResultSet rs =
                    ps.executeQuery();



            while(rs.next()){


                ReservationBean r =
                        new ReservationBean();


                r.setId(rs.getInt("id"));

                r.setUser_id(
                        rs.getInt("user_id")
                );


                r.setBook_id(
                        rs.getInt("book_id")
                );


                r.setReserve_date(
                        rs.getDate("reserve_date")
                );


                r.setStatus(
                        rs.getString("status")
                );


                // Extra book details

                r.setBookTitle(
                        rs.getString("title")
                );


                r.setBookImage(
                        rs.getString("image")
                );



                list.add(r);


            }


        }catch(Exception e){

            e.printStackTrace();

        }


        return list;

    }





}