<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*,java.sql.Connection, java.sql.DriverManager,java.sql.ResultSet, 
    java.sql.PreparedStatement, javax.servlet.ServletException,javax.servlet.RequestDispatcher, javax.servlet.* ,javax.servlet.http.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/jpg" href="file:///C:/Users/Amir/workspace/bank_jsp/SBI-logo.jpg" /> 
<title>Insert title here</title>
</head>
<body style="background-color:lightgrey"  background="file:///C:/Users/Amir/workspace/bank_jsp/piggybank.jpg">
<% response.setContentType("text/html");
         
         String p=request.getParameter("uname");
         String q=request.getParameter("upass");
         
        	try{ 
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","root");
         PreparedStatement ps=conn.prepareStatement("select * from employee where username=? and password=? ");
       
 
       
       ps.setString(1,p);
       ps.setString(2,q);
         ResultSet rs=ps.executeQuery();
         if(rs.next())
         {
         
          out.println("WELCOME "+p) ;
          RequestDispatcher rd=request.getRequestDispatcher("/main_menu.jsp");
          rd.include(request, response);
          
         
        
         
          }
         
         else{
        	 out.println("Please Register First Or Enter Correct Details!!!!");
        	RequestDispatcher rd=request.getRequestDispatcher("/home.jsp");
             rd.include(request, response);
             
        }
        	}
        	catch(Exception ex)
        	{ ex.printStackTrace();
        	}
  %>  	 
   
</body>
</html>