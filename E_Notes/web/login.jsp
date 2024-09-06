<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="All_Content/allcss.jsp"%>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<%@include file="All_Content/navbar.jsp"%>
	<div class="div-color-custom container-fluid ">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card-header text-center text-white bg-custom">
					<i class="fa fa-user-circle fa-3x" aria-hidden="true"></i>
					<h4>Login</h4>
					</div>
                                    
                                      <%
                                        String errmsg = (String)session.getAttribute("login-error");
                                        if(errmsg!=null){
                                    
                                      %>     <div class="alert alert-danger" role="alert">
                                                  <%=errmsg%>
                                                                     </div> <%
                                                      session.removeAttribute("login-error");
                                                  }
                                       %>
                                       
                                       
                                       
                                       
                                       
                                       <%
                                           
                                         String logerror = (String)session.getAttribute("loginn-error");
                                         if(logerror != null ){
                                             
                                             %><div class="alert alert-danger" role="alert">
                                                  <%=logerror%>
                                                </div> <%
                                                      session.removeAttribute("loginn-error");
                                         }  
                                           %>
                                       
                                       
                                       
                                           <%
                                               String logouterror = (String)session.getAttribute("logoutMsg");
                                               if(logouterror!= null){
                                                   %><div class="alert alert-success" role="alert">
                                                  <%=logouterror%>
                                                </div> <%
                                                      session.removeAttribute("logoutMsg");
                                         }
                                               %>
                                           
                                           
                                       
                                       
                                       
                                       
                                       
                                    
					<div class="card-body">
                                            <form action="LoginServlet" method="post">
							<div class="form-group">
							
								<label for="exampleInputEmail1">Email address</label>
                                                                <input type="email" name ="uemail" class="form-control" id="exampleInputEmail1" required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
                                                                    type="password" name="upassword" class="form-control" id="exampleInputPassword1" required="required">
							</div >
							<button type="submit" class="btn btn-primary badge-pill btn-block mt-5">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>