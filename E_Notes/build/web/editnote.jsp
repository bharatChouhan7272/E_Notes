<%@page import="com.DAO.PostDAO"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.user.Post"%>
<%@page import="com.user.UserDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
UserDetails user2 = (UserDetails)session.getAttribute("ulog");
if(user2==null)
{
    response.sendRedirect("login.jsp");
    session.setAttribute("loginn-error", "please login first............");
   
}

%>
  <%
                       Integer id =Integer.parseInt( request.getParameter("note_id"));
                       PostDAO pst = new PostDAO(DBConnect.getConnection());
                       Post ps = pst.getDataThroughId(id);
                       %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit page </title>
       <%@include file="All_Content/allcss.jsp"%>
    </head>
    <body>
        
       <div class="container-fluid">
           <%@include  file="All_Content/navbar.jsp"%>
               
           <h1 class="text-center mt-4">Add Your Notes</h1>
          
           <div class="container">
               
               <div class="row">
               <div class="col-md-12">
                 
                 
                   <form action="editnotes" method="post">
  <div class="form-group">
      <input type="hidden" name="pid" value="<%=id%>">
    <label for="Inputtitle">Enter Title</label>
    <input type="text" name="ptitle" class="form-control" id="Inputtitle" required="required" value="<%=ps.getTitle() %>">
  </div>
     <div class="form-group">
           <label for="InputNote">Enter Content</label>
           <textarea rows="11" cols="30" name="pcontent" id="InputNote" class="form-control"  required="required"  ><%=ps.getContent()%></textarea>
     </div> 
                       <div class="container text-center ">
                            <button type="submit" class="btn btn-primary">Add Notes</button>
                       </div>
 
</form>
               </div>
           </div>
               
           </div>
           
          <div class="container-fluid mt-4">
              
               <%@include file="footer.jsp" %>
          </div>
              
              
       </div>
          
    </body>
</html>
