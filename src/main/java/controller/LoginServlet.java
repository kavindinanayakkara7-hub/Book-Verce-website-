package controller;


import dao.UserDAO;
import model.UserBean;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;



@WebServlet("/login")
public class LoginServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {



        String email =
                request.getParameter("email");


        String password =
                request.getParameter("password");



        UserDAO dao =
                new UserDAO();



        UserBean user =
                dao.login(email,password);




        if(user != null){


            System.out.println("LOGIN SUCCESS");
            System.out.println("ID : "+user.getId());
            System.out.println("NAME : "+user.getFirstName());
            System.out.println("ROLE : "+user.getRole());



            HttpSession session =
                    request.getSession();



            session.setAttribute(
                    "user",
                    user
            );



            session.setAttribute(
                    "user_id",
                    user.getId()
            );



            session.setAttribute(
                    "user_name",
                    user.getFirstName()
            );




            if("ADMIN".equals(user.getRole())){


                response.sendRedirect(
                        "admin.jsp"
                );


            }else{


                response.sendRedirect(
                        "home.jsp"
                );


            }



        }else{


            response.sendRedirect(
                    "login.jsp?error=1"
            );


        }



    }


}