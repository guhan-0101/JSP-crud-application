<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 

<%--Register the data to database --%>
<%   
if(request.getParameter("submit")!=null){ 
// get values from the user
   String studentname=request.getParameter("studentname");
   String studentemail=request.getParameter("studentemail");
   String fees=request.getParameter("fees");
   

//   mysql driverclass
   Class.forName("com.mysql.jdbc.Driver");  
   Connection con;
   PreparedStatement pst; 
//   database connection
   con=DriverManager.getConnection("jdbc:mysql://localhost/college","root","");
//   create statment 
   pst=con.prepareStatement("insert into records(studentname,studentemail,fees)values(?,?,?)");
   pst.setString(1,studentname);
   pst.setString(2,studentemail);
   pst.setString(3,fees);
   pst.executeUpdate(); 
   
   %>
   
   <script>
      alert("record added");
   </script>
   
   
   <%
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CRUD</title>
        <link href="bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-5.0.2-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
      
    </head>  
    <body>
      
        <h1 class="text-success">CRUD</h1>
               <div class="row">
                   
 <%--        Create register page    --%>
 
            <div class="col-sm-4">
                 <h5 class="text-center">Register Form</h5>
                <form class="form-group text-center" method="POST" action="#" >
                <div align="left">
                    <div class="form-group">
                        <label class="form-label">Student Name :</label>
                        <input type="text" class="form-control" placeholder=" Enter Your Name" required name="studentname" id="name"/>
                    </div>   
                    <div class="form-group">
                        <label class="form-label">Email :</label>
                        <input type="email" class="form-control" placeholder=" Enter Your Email" required name="studentemail" id="email"/>
                    </div>
                   
                     <div class="form-group">
                        <label class="form-label">Fees :</label>
                        <input type="number" class="form-control" required name="fees" id="dep"/>
                    </div>
                    </br>
                    
                    <button type="submit"class="btn btn-info" name="submit" style="margin-left:8vw;">Register</button>
                    <button type="reset" class="btn btn-warning"  name="reset" value="reset">Reset</button>
            </div>
              </form>  
                 </div>
            
                 <div class="col-sm-8">
                     <div class="panel-body">
                         <table class="table table-responsive table-bordered" cellpadding="0" width="100%">
                             <thead>
                                 <tr>
                                 <th>Student name</th>
                                  <th>Student Email</th>
                                  <th>Course fees</th>
                                  <th>Edit</th>
                                  <th>Delete</th>
                                 <tr>
                             </thead>   
                             <%--view  the recods into the table--%>     
                             <%
                         Connection con;
                         ResultSet rs;
                         Class.forName("com.mysql.jdbc.Driver");         
                         con=DriverManager.getConnection("jdbc:mysql://localhost/college","root","");
                         String query="select * from records";
                         Statement st =con.createStatement();
                         rs=st.executeQuery(query);
                         while(rs.next()){
                         String id=rs.getString("id");     
                             %>
                             <tr>
                                  <td><%=rs.getString("studentname")%></td>
                                  <td><%=rs.getString("studentemail")%></td>
                                  <td><%=rs.getString("fees")%></td>
                                  <td><a class="text-primary" style="text-decoration:none;"href="update.jsp?id=<%=id%>">edit</a></td>
                                  <td><a class="text-danger"  style="text-decoration:none;" href="delete.jsp?id=<%=id%>">delete</a></td> 
                             </tr>
                            <%}%> 
                             
                         </table>
                     </div>
                 </div>
        </div>
    </body>
</html>
