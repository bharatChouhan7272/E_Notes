<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="All_Content/allcss.jsp"%>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body>
	<%@include file="All_Content/navbar.jsp"%>
	<div class="div-color-custom container-fluid ">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card-header text-center text-white bg-custom">
					<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
					<h4>Registration</h4>
					</div>
                                    
                                    
                                    <%
                                        String regmsg = (String)session.getAttribute("register-success");
                                        if(regmsg!=null){
                                    
                                      %>  <div class="alert alert-success" role="alert">
                                          <%=regmsg%>login<a href="login.jsp">click here</a>
                                      </div> <%
                                          
                                          session.removeAttribute("register-success");
                                        }
                                       %>
                                       
                                       
                                      <%
                                        String errmsg = (String)session.getAttribute("register-error");
                                        if(errmsg!=null){
                                    
                                      %>     <div class="alert alert-danger" role="alert">
                                                  <%=errmsg%>
                                                                     </div> <%
                                                      session.removeAttribute("register-error");
                                                  }
                                       %>
                                    
                                    
					<div class="card-body">
                                            <form action="UserServlet" method="post">
							<div class="form-group">
							
							<label for="EnterFullName">Enter Full Name</label>
                                                        <input type="text" name="fname" class="form-control" id="EnterFullName" required="required">
							
								<label for="exampleInputEmail1">Email address</label>
                                                                <input type="email" name="uemail" class="form-control" id="exampleInputEmail1" required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
                                                                    type="password" name="upassword" class="form-control" id="exampleInputPassword1" required="required">
							</div>
							<button type="submit" class="btn btn-primary badge-pill btn-block">Registration</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>