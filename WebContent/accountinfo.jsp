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
<%response.setContentType("text/html");



  String q=request.getParameter("accno.");
  int i=5;

 try{

  Class.forName("com.mysql.jdbc.Driver");
  Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","root");
  PreparedStatement ps=conn.prepareStatement("select * from customer where acc_no=?");
  PreparedStatement ps1=conn.prepareStatement("select * from transaction where acc_no=? order by reg_no desc ");
  ps.setString(1, q);
  ResultSet rs=ps.executeQuery();
  boolean n=rs.next();
  if(!n)
  {out.print("Wrong account no.!!<br>Please enter a valid account no.");
  RequestDispatcher rd=request.getRequestDispatcher("/info.java.html");
    rd.include(request, response);

	  
  }
  out.print("");
  String new_status="";
  String status=rs.getString("status");
  if(status.equals("N"))
		  {new_status="New Account";
	  
		  }
  if(status.equals("O"))
		  {new_status="Old Account";
	  
		  }
  if(status.equals("C"))
		  {new_status="Seized Account";
	  
		  }
  if(status.equals("X"))
		  {new_status="Closed Account";
	  
		  }
  out.print("Account no. :"+rs.getString("acc_no")+"<br><br>Customer Name: "+rs.getString("customer_name") +"<br><br>Balance: "+rs.getInt("balance")+"<br><br>Address: "+rs.getString("address")+"<br><br>Current Account Status: "+new_status);
  out.print("<br><br>Last 5 Actions :<br><br>");
  ps1.setString(1, q);
  ResultSet rs1=ps1.executeQuery();
  int j=1;
  while(i>0 && rs1.next())
  {
   out.print("<br><br>"+j +". "+" Action: "+rs1.getString("action")+"<br><br>Amount: "+rs1.getString("balance")+"<br><br>Date & Time: "+rs1.getString("date"));
  j++;
  i--;
  }
 
}
 catch(Exception ex)
 {	
  ex.printStackTrace();
 }

%>
</body>
</html>