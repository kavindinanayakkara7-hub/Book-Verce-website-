package dao;


import model.BorrowRecordBean;
import util.DBConnection;


import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;



public class BorrowRecordDAO {



    // Get all borrow records

    public ArrayList<BorrowRecordBean> getAllRecords(){


        ArrayList<BorrowRecordBean> list =
                new ArrayList<>();


        try{


            Connection con =
                    DBConnection.getConnection();



            String sql =

                    "SELECT br.id, " +
                            "u.first_name, " +
                            "u.last_name, " +
                            "b.title, " +
                            "br.borrow_date, " +
                            "br.due_date, " +
                            "br.return_date, " +
                            "br.status " +

                            "FROM borrow_records br " +

                            "JOIN users u " +
                            "ON br.user_id=u.id " +

                            "JOIN books b " +
                            "ON br.book_id=b.id " +

                            "ORDER BY br.id DESC";



            PreparedStatement ps =
                    con.prepareStatement(sql);



            ResultSet rs =
                    ps.executeQuery();



            while(rs.next()){


                BorrowRecordBean br =
                        new BorrowRecordBean();



                br.setId(
                        rs.getInt("id")
                );


                br.setUsername(
                        rs.getString("first_name")
                                + " "
                                + rs.getString("last_name")
                );


                br.setBook_title(
                        rs.getString("title")
                );


                br.setBorrow_date(
                        rs.getString("borrow_date")
                );


                br.setDue_date(
                        rs.getString("due_date")
                );


                br.setReturn_date(
                        rs.getString("return_date")
                );


                br.setStatus(
                        rs.getString("status")
                );


                list.add(br);


            }


        }catch(Exception e){

            e.printStackTrace();

        }


        return list;

    }



    // Add borrow record

    public boolean addBorrowRecord(BorrowRecordBean br){


        boolean result=false;


        try{


            Connection con =
                    DBConnection.getConnection();



            String sql =

                    "INSERT INTO borrow_records" +
                            "(user_id,book_id,borrow_date,due_date,status)" +

                            " VALUES(?,?,?,?,?)";



            PreparedStatement ps =
                    con.prepareStatement(sql);



            ps.setInt(1, br.getUser_id());

            ps.setInt(2, br.getBook_id());

            ps.setString(3, br.getBorrow_date());

            ps.setString(4, br.getDue_date());

            ps.setString(5, br.getStatus());



            result =
                    ps.executeUpdate()>0;



        }catch(Exception e){

            e.printStackTrace();

        }



        return result;

    }





    // Return book

    public boolean returnBook(int id){


        boolean result=false;



        try{


            Connection con =
                    DBConnection.getConnection();



            String sql =

                    "UPDATE borrow_records " +

                            "SET return_date=CURRENT_DATE, " +

                            "status='RETURNED' " +

                            "WHERE id=?";



            PreparedStatement ps =
                    con.prepareStatement(sql);



            ps.setInt(1,id);



            result =
                    ps.executeUpdate()>0;



        }catch(Exception e){

            e.printStackTrace();

        }



        return result;

    }

    public boolean updateStatus(int id,String status){


        boolean result=false;


        try{


            Connection con =
                    DBConnection.getConnection();



            String sql =
                    "UPDATE borrow_records SET status=? WHERE id=?";



            PreparedStatement ps =
                    con.prepareStatement(sql);



            ps.setString(1,status);

            ps.setInt(2,id);



            result =
                    ps.executeUpdate()>0;



        }catch(Exception e){

            e.printStackTrace();

        }


        return result;

    }

    public boolean updateReturnDate(
            int id,
            String return_date){


        boolean result=false;


        try{


            Connection con =
                    DBConnection.getConnection();



            String sql =
                    "UPDATE borrow_records SET return_date=?, status='RETURNED' WHERE id=?";



            PreparedStatement ps =
                    con.prepareStatement(sql);



            ps.setDate(
                    1,
                    java.sql.Date.valueOf(return_date)
            );


            ps.setInt(
                    2,
                    id
            );



            result =
                    ps.executeUpdate()>0;



        }catch(Exception e){

            e.printStackTrace();

        }



        return result;


    }
}