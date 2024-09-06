<%@page import="java.util.List"%>
<%@page import="com.user.Post"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.DAO.PostDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
UserDetails user3 = (UserDetails)session.getAttribute("ulog");
if(user3 == null)
{
    response.sendRedirect("login.jsp");
    session.setAttribute("loginn-error", "please login first............");
}
else {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Notes </title>
          <%@include file="All_Content/allcss.jsp"%>
    </head>
    <body> <%@include  file="All_Content/navbar.jsp"%>
        <%
            
            String update = (String)session.getAttribute("UpdateSuccess");
             String delete = (String)session.getAttribute("DeleteSuccess");
            if(update !=null)
            {
                {
                                                   %><div class="alert alert-success" role="alert">
                                                  <%=update%>
                                                </div> <%
                                                      session.removeAttribute("UpdateSuccess");
                                         }
            }
             if(delete !=null)
            {
                {
                                                   %><div class="alert alert-success" role="alert">
                                                  <%=delete%>
                                                </div> <%
                                                      session.removeAttribute("DeleteSuccess");
                                         }
            }
            %>
           
        
      <div class="container">
          
           <h2 class="text-center">All Notes </h2>
           
           
           <%
                    PostDAO pstDao = new PostDAO(DBConnect.getConnection());
                   List<Post> lstpst = pstDao.getData(user3.getId() );
                  
                   
                   for(Post ps : lstpst){
                       %>
                       
                         <div class="card mt-3">
                   
                   <img alt="" src="images/note.png" class=" card-img-top mt-2 mx-auto" style="max-width: 100px">
                   <div class="card-body p-4 ">
                       <h5 class="card-title "><%=ps.getTitle() %></h5>
                       <p><%=ps.getContent() %>.</p>
                       
                       <p>
                           <b class="text-success">Published By: <%=user3.getName() %></br></b><b
                               class="text-primary"></b>
                       </p>
                       
                          <p>
                           <b class="text-success">Published Date: <%=ps.getPdate() %></br></b><b
                               class="text-primary"></b>
                       </p>
                       
                       
                       <div class="container text-center mt-2">
                         <a href="DeleteNoteServlet?note_id=<%=ps.getId()%>" class="btn btn-danger">Delete</a>
                         <a href="editnote.jsp?note_id=<%=ps.getId()%>" class="btn btn-primary">Edit</a>
                   </div>
                   </div>
               </div>
                       
                       <%
                   }

               %>
           
           </div>
           
           <%@include file="footer.jsp" %>
    </body>
</html>
<%
    }
%>