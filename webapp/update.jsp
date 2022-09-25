
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
 <%-- update the userdata --%>
<%   
if(request.getParameter("submit")!=null){
   String id=request.getParameter("id");
   String studentname=request.getParameter("studentname");
   String studentemail=request.getParameter("studentemail");
   String fees=request.getParameter("fees");
   
   Connection con;
   PreparedStatement pst;
   Class.forName("com.mysql.jdbc.Driver");
   con=DriverManager.getConnection("jdbc:mysql://localhost/college","root","");   
   pst=con.prepareStatement("update records set studentname=?,studentemail=?,fees=? where id=?");
   pst.setString(1,studentname);
   pst.setString(2,studentemail);
   pst.setString(3,fees);
   pst.setString(4,id);
   pst.executeUpdate();
   
   %>
   
   <script>
      alert("record updated");
   </script>
   
   
   <%
    }

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-5.0.2-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
          </head>
    <body>
        <div class="row">
         <div class="col-sm-4"></div>
                  <div class="col-sm-4">
                      <h1 class="text-center text-info">Update Details</h1>
                     </br> </br>
                 
                <form class="form-group text-center" method="POST" action="#" >
                    <%-- display the userdata --%>
                    <%
                     Connection con;
                     PreparedStatement pst;
                     ResultSet rs;
                     Class.forName("com.mysql.jdbc.Driver");
                     con=DriverManager.getConnection("jdbc:mysql://localhost/college","root","");
                     String id=request.getParameter("id");
                     
                     pst =con.prepareStatement("select * from records where id=?");
                     pst.setString(1,id);
                     rs=pst.executeQuery();
                     
                    while(rs.next()){
                    %>
                <div align="left">
                    <div class="form-group">
                        <label class="form-label">Student Name :</label>
                        <input type="text" class="form-control" placeholder="Enter Your Name" value="<%=rs.getString("studentname")%>"required name="studentname" id="name"/>
                    </div>   
                    <div class="form-group">
                        <label class="form-label">Email :</label>
                        <input type="email" class="form-control" placeholder=" Enter Your Email" value="<%=rs.getString("studentemail")%>"required name="studentemail" id="email"/>
                    </div>
                   
                     <div class="form-group">
                        <label class="form-label">Fees :</label>
                        <input type="number" class="form-control" value="<%=rs.getString("fees")%>"required name="fees" id="dep"/>
                    </div>
                    <% } %>
                    </br>
                    
                    <button type="submit"class="btn btn-info m-auto" name="submit" value="submit">Update</button>
                    <button type="reset" class="btn btn-warning"  name="reset" value="reset">Reset</button>
            </div>
                    <div class="align-right">
                        <p> <a href="index.jsp">Go Back</a></p>
                    </div>
              </form>  
                 </div>
        <div class="col-sm-4"></div>
    </div>  
    </body>
</html>
