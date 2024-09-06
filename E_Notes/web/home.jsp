<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
UserDetails user3 = (UserDetails)session.getAttribute("ulog");
if(user3==null)
{
    response.sendRedirect("login.jsp");
    session.setAttribute("loginn-error", "please login first............");
}



%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="All_Content/allcss.jsp"%>
    </head>
    <body>
       
       
       <div class="container-fluid">
           <%@include  file="All_Content/navbar.jsp"%>
           <div class="card mt-4 ">
               <div class="card-body text-center">
                   <img alt="" src="images/note.png" class=" img-fluid mx-auto" width="400px">
                   <h1>Start Taking Your Notes </h1>
                   <a href="addNotes.jsp" class="btn btn-outline-primary">Start Here</a>
               </div>
           </div>
           
           <%@include file="footer.jsp" %>
       </div>
          
    </body>
</html>
