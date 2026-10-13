package controller;


import dao.*;
import model.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import java.io.*;
import java.nio.file.*;


@WebServlet("/addBook")
@MultipartConfig
public class AddBookServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {


        CategoryDAO cdao = new CategoryDAO();
        AuthorDAO adao = new AuthorDAO();
        PublisherDAO pdao = new PublisherDAO();


        var categories = cdao.getAllCategories();
        var authors = adao.getAllAuthors();
        var publishers = pdao.getAllPublishers();



        System.out.println("CATEGORY SIZE : " + categories.size());
        System.out.println("AUTHOR SIZE : " + authors.size());
        System.out.println("PUBLISHER SIZE : " + publishers.size());



        request.setAttribute("categories", categories);
        request.setAttribute("authors", authors);
        request.setAttribute("publishers", publishers);



        request.getRequestDispatcher("addBook.jsp")
                .forward(request,response);

    }




    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {


        try {


            String title =
                    request.getParameter("title");


            String isbn =
                    request.getParameter("isbn");



            int category_id =
                    Integer.parseInt(
                            request.getParameter("category_id")
                    );


            int author_id =
                    Integer.parseInt(
                            request.getParameter("author_id")
                    );


            int publisher_id =
                    Integer.parseInt(
                            request.getParameter("publisher_id")
                    );


            int publish_year =
                    Integer.parseInt(
                            request.getParameter("publish_year")
                    );


            int quantity =
                    Integer.parseInt(
                            request.getParameter("quantity")
                    );


            String description =
                    request.getParameter("description");





// ==========================
// IMAGE UPLOAD
// ==========================


            Part imagePart = request.getPart("image");


            String fileName = null;


            if(imagePart != null && imagePart.getSize() > 0){


                fileName = Paths.get(
                                imagePart.getSubmittedFileName()
                        )
                        .getFileName()
                        .toString();



                // REAL PROJECT PATH
                String uploadPath =
                        "C:\\Users\\user\\idealProject\\book_verse\\src\\main\\webapp\\images";



                File uploadDir =
                        new File(uploadPath);



                if(!uploadDir.exists()){

                    uploadDir.mkdirs();

                }



                imagePart.write(
                        uploadPath
                                + File.separator
                                + fileName
                );



                System.out.println(
                        "IMAGE SAVED : "
                                + uploadPath
                                + File.separator
                                + fileName
                );


            }



            String image="";


            if(fileName != null){

                image = "images/" + fileName;

            }


            // ==========================
            // CREATE BOOK OBJECT
            // ==========================


            BookBean book =
                    new BookBean();



            book.setTitle(title);

            book.setIsbn(isbn);

            book.setCategory_id(category_id);

            book.setAuthor_id(author_id);

            book.setPublisher_id(publisher_id);

            book.setPublish_year(publish_year);

            book.setDescription(description);

            book.setQuantity(quantity);

            book.setAvailable(quantity);

            book.setImage(image);

            book.setStatus("AVAILABLE");





            // ==========================
            // SAVE DATABASE
            // ==========================


            BookDAO dao =
                    new BookDAO();



            dao.addBook(book);




            response.sendRedirect(
                    "admin.jsp"
            );



        }
        catch(Exception e){

            e.printStackTrace();

            response.sendRedirect(
                    "addBook.jsp?error=1"
            );

        }


    }


}