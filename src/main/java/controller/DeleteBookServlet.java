package controller;


import dao.BookDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;



@WebServlet("/deleteBook")
public class DeleteBookServlet extends HttpServlet {


    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {



        try{


            int id =
                    Integer.parseInt(
                            request.getParameter("id")
                    );



            BookDAO dao =
                    new BookDAO();



            boolean result =
                    dao.deleteBook(id);



            if(result){


                response.sendRedirect(
                        "manageBooks"
                );


            }else{


                response.sendRedirect(
                        "manageBooks?error=delete"
                );


            }



        }
        catch(Exception e){

            e.printStackTrace();

            response.sendRedirect(
                    "manageBooks"
            );

        }


    }


}