
package com.servlet;

import com.DAO.PostDAO;
import com.db.DBConnect;
import com.user.Post;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "AddNotesServlet", urlPatterns = {"/addnotes"})
public class AddNotesServlet extends HttpServlet {

 
   
   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int uid = Integer.parseInt(request.getParameter("uid"));
       String title = request.getParameter("ptitle");
       String content = request.getParameter("pcontent");
       
       PrintWriter out = response.getWriter();
       
      PostDAO pdao = new PostDAO(DBConnect.getConnection());
      boolean f = pdao.addNotes(title, content, uid);
      if(f)
      {
          HttpSession session = request.getSession();
          session.setAttribute("addnotessuccess", "Note Successfully Add....................");
          response.sendRedirect("addNotes.jsp");
      }
     
      
    }

}