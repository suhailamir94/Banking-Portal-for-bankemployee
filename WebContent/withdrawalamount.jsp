
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*,java.sql.Connection, java.util.*,java.sql.DriverManager,java.sql.ResultSet, 
    java.sql.PreparedStatement, javax.servlet.ServletException,javax.servlet.RequestDispatcher,  java.sql.ResultSet,javax.servlet.* ,javax.servlet.http.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/jpg" href="file:///C:/Users/Amir/workspace/bank_jsp/SBI-logo.jpg" /> 
<title>Insert title here</title>
</head>
<body style="background-color:lightgrey"  background="file:///C:/Users/Amir/workspace/bank_jsp/piggybank.jpg">
<% response.setContentType("text/html");
	int n=0;

	String p=request.getParameter("accno.");
	String q=request.getParameter("amount");
	try{
		
		  Class.forName("com.mysql.jdbc.Driver");
		  Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","root");
		  PreparedStatement ps=conn.prepareStatement("update customer set balance=?,status=? where acc_no=?");
		  PreparedStatement pst=conn.prepareStatement("select * from customer where acc_no=? ");
		  PreparedStatement ps1=conn.prepareStatement("insert into transaction(balance,action,date,acc_no)values(?,?,?,?)");
		  
		  		pst.setString(1,p);
		  
		  
		  
		  ResultSet rs=pst.executeQuery();
		  boolean x=rs.next();
		  if(!x)
		  {out.print("Please enter valid account no.");
		   RequestDispatcher rd=request.getRequestDispatcher("/withdrawal.jsp");  
			 rd.include(request,response);
		  }
		  
		  
		 
		  int amount=Integer.parseInt(q.trim());
		  
		  n=rs.getInt("balance");
		     String 	status= rs.getString("status");
		 
		      if(status.equals("O") && n<amount)
			   {
			  out.print("The withdrwal amount is more than the balance!!<br>please deposite some amount first");
			   RequestDispatcher rd=request.getRequestDispatcher("/main_menu.jsp");  
				
			  rd.include(request,response);
			   
			   } 
		  
		   
		   if(status.equals("N"))
		   {
			   out.print("Please enter some ammount first!!!!");
			   RequestDispatcher rd=request.getRequestDispatcher("/main_menu.html");  
				 rd.include(request,response);
		  
		   }
		   if(status.equals("X"))
		   {
			   out.print("Sorry your account has been closed!!!!<br><br>Cant add money");
			   RequestDispatcher rd=request.getRequestDispatcher("/main_menu.jsp");  
				 rd.include(request,response);
		  
		   }
		   Date date=new Date();
			String time=date.toString(); 
		  
		  
		  if(status.equals("O") && ((n>amount)||(n==amount)))
		  {n =  n-amount;
		  
		  String value= Integer.toString(n);
			  ps.setString(1,value);
		   ps.setString(2, status);
		   ps.setString(3, p);
		  ps.executeUpdate();
		  ps1.setString(1,q );
		  ps1.setString(2,"Withdrawed" );
		  ps1.setString(3,time );
		  ps1.setString(4, p);
		  
		  ps1.executeUpdate();
		  out.print("Balance withdrwal successfully!!");
		   RequestDispatcher rd=request.getRequestDispatcher("/main_menu.jsp");  
			
		  rd.include(request,response);
		  }
		  
		  
		   
		   else if(status.equals("C"))
		   {
			   out.print("Sorry This Account Has Been Seized!!<br>Can't Withdrawl any money!!!");
			   RequestDispatcher rd=request.getRequestDispatcher("/main_menu.jsp");  
				 rd.include(request,response);
		   }
	
	}

	 catch(Exception ex)
	 {	
	  ex.printStackTrace();
	 }
	 %>
</body>
</html>