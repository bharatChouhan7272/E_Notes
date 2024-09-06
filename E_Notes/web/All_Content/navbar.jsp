<%@page import="com.user.UserDetails"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom ">
  <a class="navbar-brand" href="index.jsp"><i class="fa fa-book" aria-hidden="true"></i>ENotes</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="home.jsp"><i class="fa fa-home" aria-hidden="true"></i>Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="addNotes.jsp"><i class="fa fa-plus-circle" aria-hidden="true"></i>Add Notes</a>
      </li>
     
      <li class="nav-item">
        <a class="nav-link" href="shownotes.jsp"><i class="fa fa-address-book" aria-hidden="true"></i>Show Notes</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
        
        <%
            UserDetails user = (UserDetails)session.getAttribute("ulog");
            if(user!=null)
            {
                %>
                <a class="btn btn-light my-2 my-sm-0 mr-3" type="submit" href="#exampleModalCenter" data-toggle="modal" data-target="#exampleModalCenter" ><i class="fa fa-user-circle" aria-hidden="true"></i>
                    <%=user.getName()%>
                </a>
                 <a class="btn btn-light my-2 my-sm-0" type="submit" href="LogoutServlet"><i class="fa fa-user-plus" aria-hidden="true" ></i>Logout</a>
  
               
                 
                 
                 
                 
                 
                 
                 
                 <!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-center" id="exampleModalLongTitle">User Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       
          <div class="container text-center">
              <i class="fa fa-user fa-3x"></i>
              <table class="table">
                  <tbody>
                      <tr>
                          <th>User Id : </th>
                          <td><%=user.getId() %></td>
                      </tr>
                      <tr>
                          <th>Name : </th>
                           <td><%=user.getName() %></td>
                      </tr>
                      <tr>
                          <th>Email Id : </th>
                           <td><%=user.getEmail() %></td>
                      </tr>
                  </tbody>
                  
              </table>
              
              <div>
                   <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
          </div>
          
      </div>
    </div>
  </div>
</div>
          
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 <%
            }
            else
            {
               %>
               <a class="btn btn-light my-2 my-sm-0 mr-3" type="submit" href="login.jsp"><i class="fa fa-user-circle" aria-hidden="true"></i>Login</a>
      <a class="btn btn-light my-2 my-sm-0" type="submit" href="register.jsp"><i class="fa fa-user-plus" aria-hidden="true" >Register</i></a>
               <%
            }
          %>
        
      
      
      
    </form>
  </div>
          
          
          
          
          
          
          <!-- Button trigger modal -->


          
          
          
          
</nav>