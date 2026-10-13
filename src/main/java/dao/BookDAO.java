package dao;


import model.BookBean;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;


public class BookDAO {



    public void addBook(BookBean b){
        try{
            Connection con = DBConnection.getConnection();
            String sql =
                    "INSERT INTO books(title,isbn,category_id,author_id,publisher_id,publish_year,description,quantity,available,image,status) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1,b.getTitle());

            ps.setString(2,b.getIsbn());

            ps.setInt(3,b.getCategory_id());

            ps.setInt(4,b.getAuthor_id());

            ps.setInt(5,b.getPublisher_id());

            ps.setInt(6,b.getPublish_year());

            ps.setString(7,b.getDescription());

            ps.setInt(8,b.getQuantity());

            ps.setInt(9,b.getAvailable());

            ps.setString(10,b.getImage());

            ps.setString(11,b.getStatus());



            ps.executeUpdate();



        }
        catch(Exception e){

            e.printStackTrace();

        }



    }

    public ArrayList<BookBean> getAllBooks(){

        ArrayList<BookBean> list = new ArrayList<>();

        try{

            Connection con = DBConnection.getConnection();

            String sql =
                    "SELECT * FROM books";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                BookBean b = new BookBean();

                b.setId(rs.getInt("id"));
                b.setTitle(rs.getString("title"));
                b.setIsbn(rs.getString("isbn"));
                b.setCategory_id(rs.getInt("category_id"));
                b.setAuthor_id(rs.getInt("author_id"));
                b.setPublisher_id(rs.getInt("publisher_id"));
                b.setPublish_year(rs.getInt("publish_year"));
                b.setDescription(rs.getString("description"));
                b.setQuantity(rs.getInt("quantity"));
                b.setAvailable(rs.getInt("available"));
                b.setImage(rs.getString("image"));
                b.setStatus(rs.getString("status"));

                list.add(b);

            }

        }catch(Exception e){

            e.printStackTrace();

        }

        return list;

    }

    public BookBean getBookById(int id){


        BookBean book = null;


        try{


            Connection con =
                    DBConnection.getConnection();



            String sql =
                    "SELECT b.*, " +
                            "c.category_name, " +
                            "a.author_name, " +
                            "p.publisher_name " +
                            "FROM books b " +
                            "LEFT JOIN categories c ON b.category_id=c.id " +
                            "LEFT JOIN authors a ON b.author_id=a.id " +
                            "LEFT JOIN publishers p ON b.publisher_id=p.id " +
                            "WHERE b.id=?";



            PreparedStatement ps =
                    con.prepareStatement(sql);



            ps.setInt(1,id);



            ResultSet rs =
                    ps.executeQuery();



            if(rs.next()){


                book = new BookBean();


                book.setId(
                        rs.getInt("id")
                );


                book.setTitle(
                        rs.getString("title")
                );


                book.setIsbn(
                        rs.getString("isbn")
                );


                book.setPublish_year(
                        rs.getInt("publish_year")
                );


                book.setDescription(
                        rs.getString("description")
                );


                book.setQuantity(
                        rs.getInt("quantity")
                );


                book.setAvailable(
                        rs.getInt("available")
                );


                book.setImage(
                        rs.getString("image")
                );


                book.setStatus(
                        rs.getString("status")
                );

            }



        }catch(Exception e){

            e.printStackTrace();

        }


        return book;

    }


    public boolean deleteBook(int id){

        boolean result=false;

        Connection con=null;

        try{

            con = DBConnection.getConnection();

            con.setAutoCommit(false);



            // 1. Delete favorites
            String sql1 =
                    "DELETE FROM favorites WHERE book_id=?";

            PreparedStatement ps1 =
                    con.prepareStatement(sql1);

            ps1.setInt(1,id);

            ps1.executeUpdate();



            // 2. Delete borrow records
            String sql2 =
                    "DELETE FROM borrow_records WHERE book_id=?";


            PreparedStatement ps2 =
                    con.prepareStatement(sql2);


            ps2.setInt(1,id);


            ps2.executeUpdate();



            // 3. Delete book
            String sql3 =
                    "DELETE FROM books WHERE id=?";


            PreparedStatement ps3 =
                    con.prepareStatement(sql3);


            ps3.setInt(1,id);


            int row =
                    ps3.executeUpdate();



            if(row>0){

                result=true;

            }


            con.commit();



        }catch(Exception e){

            e.printStackTrace();

            try{

                if(con!=null)
                    con.rollback();

            }catch(Exception ex){

                ex.printStackTrace();

            }


        }finally{

            try{

                if(con!=null)
                    con.close();

            }catch(Exception e){

                e.printStackTrace();

            }

        }


        return result;

    }

    public boolean updateBook(
            int id,
            String title,
            String isbn,
            int year,
            String description,
            int quantity,
            String status
    ){


        boolean result=false;


        try{


            Connection con =
                    DBConnection.getConnection();



            String sql =
                    "UPDATE books SET title=?,isbn=?,publish_year=?,description=?,quantity=?,status=? WHERE id=?";



            PreparedStatement ps =
                    con.prepareStatement(sql);



            ps.setString(1,title);

            ps.setString(2,isbn);

            ps.setInt(3,year);

            ps.setString(4,description);

            ps.setInt(5,quantity);

            ps.setString(6,status);

            ps.setInt(7,id);



            result =
                    ps.executeUpdate()>0;



        }catch(Exception e){

            e.printStackTrace();

        }



        return result;


    }

}