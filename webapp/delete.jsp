<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%--delete data from database --%>
<%   

   String id=request.getParameter("id");
   Connection con;
   PreparedStatement pst;
   Class.forName("com.mysql.jdbc.Driver");
   con=DriverManager.getConnection("jdbc:mysql://localhost/college","root","");
   
   pst=con.prepareStatement("delete from records where id=? ");
   pst.setString(1,id);
   pst.executeUpdate();
   
   %>

   <script>
      alert("record deleted");
   </script>
   
   
