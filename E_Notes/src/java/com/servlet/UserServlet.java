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

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      String name = req.getParameter("fname");
      String email = req.getParameter("uemail");
      String password = req.getParameter("upassword");
       PrintWriter out = resp.getWriter();
      UserDetails us = new UserDetails();
      us.setName(name);
      us.setEmail(email);
      us.setPassword(password);
      
      UserDAO dao = new UserDAO(DBConnect.getConnection());
    boolean f=  dao.addUser(us);
    HttpSession session ;
    
    if(f)
    {
        session = req.getSession();
        session.setAttribute("register-success", "Registration Successfull....");
        resp.sendRedirect("register.jsp");
    }
    else
    {
        session = req.getSession();
        session.setAttribute("register-error", "Something went wrong......");
        resp.sendRedirect("register.jsp");
    }
    }

}
