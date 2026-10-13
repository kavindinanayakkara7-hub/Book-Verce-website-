package dao;


import util.DBConnection;
import model.BorrowBean;


import java.sql.*;
import java.util.ArrayList;



public class BorrowDAO {



    // INSERT BORROW

    public boolean borrowBook(int userId,
                              int bookId,
                              String borrowDate,
                              String dueDate) {

        boolean result = false;

        Connection con = null;

        try {

            con = DBConnection.getConnection();
            con.setAutoCommit(false);

            // Check available copies
            String checkSql = "SELECT available FROM books WHERE id=?";
            PreparedStatement checkPs = con.prepareStatement(checkSql);
            checkPs.setInt(1, bookId);

            ResultSet rs = checkPs.executeQuery();

            if (rs.next()) {

                int available = rs.getInt("available");

                if (available <= 0) {

                    con.rollback();
                    return false;

                }

            } else {

                con.rollback();
                return false;

            }

            // Insert borrow record

            String insertSql =
                    "INSERT INTO borrow_records(user_id,book_id,borrow_date,due_date,status) " +
                            "VALUES(?,?,?,?,?)";

            PreparedStatement insertPs = con.prepareStatement(insertSql);

            insertPs.setInt(1, userId);
            insertPs.setInt(2, bookId);
            insertPs.setString(3, borrowDate);
            insertPs.setString(4, dueDate);
            insertPs.setString(5, "BORROWED");

            int row = insertPs.executeUpdate();

            if (row > 0) {

                // decrease available

                String updateSql =
                        "UPDATE books " +
                                "SET available=available-1, " +
                                "status=CASE WHEN available-1=0 THEN 'NOT_AVAILABLE' ELSE 'AVAILABLE' END " +
                                "WHERE id=?";

                PreparedStatement updatePs =
                        con.prepareStatement(updateSql);

                updatePs.setInt(1, bookId);

                updatePs.executeUpdate();

                con.commit();

                result = true;

            } else {

                con.rollback();

            }

        } catch (Exception e) {

            try {

                if (con != null)
                    con.rollback();

            } catch (Exception ex) {
                ex.printStackTrace();
            }

            e.printStackTrace();

        } finally {

            try {

                if (con != null) {

                    con.setAutoCommit(true);

                }

            } catch (Exception e) {

                e.printStackTrace();

            }

        }

        return result;
    }




    // GET USER BORROW BOOKS


    public ArrayList<BorrowBean> getUserBorrowBooks(
            int userId
    ){


        ArrayList<BorrowBean> list =
                new ArrayList<>();



        try{


            Connection con =
                    DBConnection.getConnection();



            String sql =

                    "SELECT br.*, b.title "
                            +"FROM borrow_records br "
                            +"INNER JOIN books b "
                            +"ON br.book_id=b.id "
                            +"WHERE br.user_id=?";



            PreparedStatement ps =
                    con.prepareStatement(sql);



            ps.setInt(1,userId);



            ResultSet rs =
                    ps.executeQuery();



            while(rs.next()){



                BorrowBean b =
                        new BorrowBean();



                b.setId(
                        rs.getInt("id")
                );


                b.setBookId(
                        rs.getInt("book_id")
                );


                b.setBookTitle(
                        rs.getString("title")
                );


                b.setBorrowDate(
                        rs.getString("borrow_date")
                );


                b.setDueDate(
                        rs.getString("due_date")
                );


                b.setStatus(
                        rs.getString("status")
                );



                list.add(b);


            }



        }catch(Exception e){

            e.printStackTrace();

        }



        return list;


    }


    public boolean returnBook(int borrowId, int bookId, String returnDate) {

        boolean result = false;

        Connection con = null;

        try {

            con = DBConnection.getConnection();
            con.setAutoCommit(false);

            // Update borrow record

            String sql =
                    "UPDATE borrow_records " +
                            "SET return_date=?, status='RETURNED' " +
                            "WHERE id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, returnDate);
            ps.setInt(2, borrowId);

            int row = ps.executeUpdate();

            if (row > 0) {

                // Increase available

                String updateBook =
                        "UPDATE books " +
                                "SET available=available+1, status='AVAILABLE' " +
                                "WHERE id=?";

                PreparedStatement ps2 =
                        con.prepareStatement(updateBook);

                ps2.setInt(1, bookId);

                ps2.executeUpdate();

                con.commit();

                result = true;

            } else {

                con.rollback();

            }

        } catch (Exception e) {

            try {

                if (con != null)
                    con.rollback();

            } catch (Exception ex) {
                ex.printStackTrace();
            }

            e.printStackTrace();

        } finally {

            try {

                if (con != null)
                    con.setAutoCommit(true);

            } catch (Exception e) {

                e.printStackTrace();

            }

        }

        return result;
    }


}