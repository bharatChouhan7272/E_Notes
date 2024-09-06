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

@WebServlet(name = "EditNotesServlet", urlPatterns = {"/editnotes"})
public class EditNotesServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          int id = Integer.parseInt(request.getParameter("pid"));
         String title = request.getParameter("ptitle");
         String content = request.getParameter("pcontent");
         PrintWriter out = response.getWriter();
         PostDAO pDao = new PostDAO(DBConnect.getConnection());
        boolean f =  pDao.getDataWithId(title, content, id);
        if(f)
        {
           HttpSession session = request.getSession();
           session.setAttribute("UpdateSuccess", " Record Updated Successfully..............");
           response.sendRedirect("shownotes.jsp");
        }
         
    }


}
