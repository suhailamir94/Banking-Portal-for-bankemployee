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
<%
response.setContentType("text/html");
int i=0;



  String r=request.getParameter("customer_name");
  String s=request.getParameter("address");
  
  String p=(String)pageContext.getAttribute("option",PageContext.SESSION_SCOPE );
  
  
  String t=request.getParameter("password");
  

 try{

  Class.forName("com.mysql.jdbc.Driver");
  Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","root");
  PreparedStatement ps=conn.prepareStatement("insert into customer(customer_name,address,balance,status)values(?,?,?,?)");
 PreparedStatement ps1=conn.prepareStatement("insert into net_banking(acc_no,password)values(?,?)");
//  PreparedStatement ps2=conn.prepareStatement("select * from customer" );
  int o=0;
  if( r.equals("") || s.equals(""))
 { out.print("Please Enter All the Details Correctly!!!!");
  RequestDispatcher rd=request.getRequestDispatcher("/add_account.jsp");
  rd.include(request, response); 
  o=1;
 }
  
  else if((p.equals("yes") && t.equals(""))&&o==0)
  {out.print("Please Enter  the password Correctly!!!!");
  out.print("<div align='center'><form action='addaccount.jsp' >Customer Name:<input type='text' name='customer_name' value="+r);
  out.print("><br><br>Local Address:<input type='text' name='address' value="+s);
  		out.print("><br><br>Net Banking:<br><input type='radio' name='net_banking' value='yes' checked>Yes<br><input type='radio' name='net_banking' value='no' unchecked>No<br><br>Password:<input type='password' name='password'><br><br><input type='submit' value='Submit'></form</div>");
  
  }
  else
  {
  ps.setString(1,r);
  ps.setString(2,s);
 ps.setString(3, "0");
 ps.setString(4, "N");
 //ps.setString(5, p);
 //ps.setString(6, "");
  i=ps.executeUpdate();
  ResultSet rs= ps.getGeneratedKeys();
	 boolean x=true;
	  if(t.equals(""))
	  {   x=false;
	  }
	  rs.next();
	  int  n=rs.getInt(1);
	
	   if (x)
	 {
	 ps1.setInt(1, n);

	 ps1.setString(2,t);
	 ps1.executeUpdate();
	 } 
	

  }
	  
	  
 
 if(i>0 )
  {
  out.print(" Account Has Been Created Successfully!!!<br>Please Add SOme Balance To The Account!!!!");
  RequestDispatcher rde=request.getRequestDispatcher("/main_menu.jsp");
  rde.include(request, response);
  
}
 
 }
 catch(Exception ex)
 {	
  ex.printStackTrace();
 }


%>
</body>
</html>