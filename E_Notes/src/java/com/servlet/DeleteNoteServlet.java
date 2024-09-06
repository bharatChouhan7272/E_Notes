
package com.servlet;

import com.DAO.PostDAO;
import com.db.DBConnect;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "DeleteNoteServlet", urlPatterns = {"/DeleteNoteServlet"})
public class DeleteNoteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       int id = Integer.parseInt(req.getParameter("note_id"));
            
            PostDAO pdao = new PostDAO(DBConnect.getConnection());
           boolean f =  pdao.deleteDataWithId(id);
           if(f){
               HttpSession session = req.getSession();
               session.setAttribute("DeleteSuccess", "Record Deleted Succefully..............................");
             resp.sendRedirect("shownotes.jsp");
           }
            
    }

   
}
