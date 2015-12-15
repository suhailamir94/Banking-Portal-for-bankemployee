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
<%
response.setContentType("text/html");
	
	
	String p=request.getParameter("accno.");
	 String q=request.getParameter("accno.1");
	String r=request.getParameter("amount");
	Date date=new Date();
	String time=date.toString(); 
	
	try{
		
		  Class.forName("com.mysql.jdbc.Driver");
		  Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","root");
		  PreparedStatement ps=conn.prepareStatement("update customer set balance=?,status=? where acc_no=?");
		 PreparedStatement ps1=conn.prepareStatement("update customer set balance=?, status=? where acc_no=?");
	  PreparedStatement pst=conn.prepareStatement("select * from customer where acc_no=? "); 
		  PreparedStatement pst1=conn.prepareStatement("select * from customer where acc_no=? ");
		  PreparedStatement ps2=conn.prepareStatement("insert into transaction(balance,action,date,acc_no)values(?,?,?,?)");
		int t=0;
		  if(p.equals("")||q.equals("")||r.equals(""))
		 {
			 out.print("Please enter valid  account no.s");
			   RequestDispatcher rd=request.getRequestDispatcher("/transfer.jsp");  
				 rd.include(request,response);
				 t=1;
		 }
		  pst.setString(1,p);
		  ResultSet rs=pst.executeQuery();
		  
		
		  boolean x=rs.next();
		  pst1.setString(1,q);
		  ResultSet rst=pst1.executeQuery();
		  boolean y=rst.next();
		  int i=0;
		
		  if(!x && !y && t==0)
		  { out.print("Please enter valid  account no.s");
		   RequestDispatcher rd=request.getRequestDispatcher("/transfer.jsp");  
			 rd.include(request,response);
		  }
		  
		  
		  String status= rs.getString("status");
		 
		 
		 
		  String 	status1= rst.getString("status");
		 
		  int balance=rs.getInt("balance");
		  int amount=Integer.parseInt(r.trim());
		  int balance1=rst.getInt("balance");
		  if (status.equals("X") || status1.equals("X") )
		  {out.print("Sorry!! Either The Source Account has been Closed<br><br>OR<br><br> The Destination Account Has Been Closed<br><br>Can't transfer money");
		   RequestDispatcher rd=request.getRequestDispatcher("/main_menu.jsp");  
			 rd.include(request,response);
		  i=1;
		  }
		  if((amount>balance) && (i==0))
		  {out.print("Sorry Source account balance is less than the entered amount<br>please add some money to your account");
		   RequestDispatcher rd=request.getRequestDispatcher("/main_menu.jsp");  
			 rd.include(request,response);
		  }
		  if(status.equals("N"))
		  {out.print("your balance is Rs 0<br>please add some money to your account");
		   RequestDispatcher rd=request.getRequestDispatcher("/main_menu.jsp");  
			 rd.include(request,response);
		  }
		 
		  
		 int n =balance - Integer.parseInt(r.trim()) ;
		   String value= Integer.toString(n);
		  int m=balance1 + Integer.parseInt(r.trim()) ;
		  String value1= Integer.toString(m);
		  if(status.equals("O") && status1.equals("N"))
		  {
			  ps.setString(1,value);
		  
		   ps.setString(2, status);
		   ps.setString(3, p);
		  ps.executeUpdate();
		  ps1.setString(1,value1);
		  
		   ps1.setString(2, "O");
		   ps1.setString(3, q);
		  ps1.executeUpdate();
		  ps2.setString(1,r);
		  ps2.setString(2,"Transfered to acccount no."+q );
		  ps2.setString(3,time );
		  ps2.setString(4, p);
		  ps2.executeUpdate();
		  ps2.setString(1,r);
		  ps2.setString(2,"transfered by acccount no."+p );
		  ps2.setString(3,time );
		  ps2.setString(4, q);
		  ps2.executeUpdate();
		  out.print("Amount Transfered successfully!!");
		   RequestDispatcher rd=request.getRequestDispatcher("/main_menu.jsp");  
			
		  rd.include(request,response);
		  }
		  if(status.equals("C"))
		  {out.print("The source Account is Seized<br>Cant Transfer any amount");
		  RequestDispatcher rd=request.getRequestDispatcher("/main_menu.jsp");  
			
		  rd.include(request,response);  
		  }
				 if( status1.equals("C"))
				 {
					 out.print("The Destination Account is Seized<br>Cant Transfer any amount");
					  RequestDispatcher rd=request.getRequestDispatcher("/main_menu.jsp");  
						
					  rd.include(request,response);
				 }
		  if(status.equals("O") && status1.equals("O"))
		  {
			  ps.setString(1,value);
		  
		   ps.setString(2, status);
		   ps.setString(3, p);
		  ps.executeUpdate();
		  ps1.setString(1,value1);
		  
		   ps1.setString(2, "O");
		   ps1.setString(3, q);
		  ps1.executeUpdate();
		  ps2.setString(1,r);
		  ps2.setString(2,"Transfered to acccount no. "+q );
		  ps2.setString(3,time );
		  ps2.setString(4, p);
		  ps2.executeUpdate();
		  ps2.setString(1,r);
		  ps2.setString(2,"transfered by acccount no. "+p );
		  ps2.setString(3,time );
		  ps2.setString(4, q);
		  ps2.executeUpdate();
		  out.print("Amount Transfered successfully!!");
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