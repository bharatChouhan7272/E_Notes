<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
UserDetails user2 = (UserDetails)session.getAttribute("ulog");
if(user2==null)
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
            
           <%
              String addser= (String)session.getAttribute("addnotessuccess");
              if(addser!=null){
                    %><div class="alert alert-success" role="alert">
                                                  <%=addser%>
                                                </div> <%
                                                      session.removeAttribute("addnotessuccess");
                                         }
              
               %>
               
           <h1 class="text-center mt-4">Add Your Notes</h1>
          
           <div class="container">
               
               <div class="row">
               <div class="col-md-12">
                   <form action="addnotes" method="post">
  <div class="form-group">
      
      
      
      
      
      
      
      
      <%
          
          
          
         UserDetails userp= (UserDetails)session.getAttribute("ulog");
          
          if(userp!=null){
      %><input type="hidden" value="<%=userp.getId() %>" name="uid" ><br><%}
          
          
          
          %>
      
          
      
      
      
      
      
      
      
      
    <label for="Inputtitle">Enter Title</label>
    <input type="text" name="ptitle" class="form-control" id="Inputtitle" required="required">
  </div>
     <div class="form-group">
           <label for="InputNote">Enter Content</label>
           <textarea rows="11" cols="30" name="pcontent" id="InputNote" class="form-control" required="required"></textarea>
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
