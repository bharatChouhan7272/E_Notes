
package com.servlet;
import com.DAO.UserDAO;
import com.db.DBConnect;
import com.user.UserDetails;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String email = request.getParameter("uemail");
       String password = request.getParameter("upassword");
       
       UserDetails us = new UserDetails();
       us.setEmail(email);
       us.setPassword(password);
       
         PrintWriter out = response.getWriter();
       
       UserDAO dao = new UserDAO(DBConnect.getConnection());
      UserDetails user = dao.loginUser(us);
       if(user.getEmail()!=null){
           HttpSession session = request.getSession();
           session.setAttribute("ulog", user);
           response.sendRedirect("home.jsp");
          
       }
       else{
           HttpSession session = request.getSession();
           session.setAttribute("login-error", "Invalid user & password........");
           response.sendRedirect("login.jsp");
       }
    }

}
