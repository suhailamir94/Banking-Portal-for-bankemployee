<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE h PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/jpg" href="file:///C:/Users/Amir/workspace/bank_jsp/SBI-logo.jpg" /> 
<title>Insert title here</title>
</head>
<body style="background-color:lightgrey"  background="file:///C:/Users/Amir/workspace/bank_jsp/piggybank.jpg">
<div align="center">
<form action="add_account.jsp">
<input type="submit" value="Open New Account">
<br><br>
</form>
<form action="info.jsp">
<input type="submit" value="Get Account Info">
<br><br>
</form>
<form action="deposite.jsp">
<input type="submit" value="Deposite Amount"><br><br>
</form>
<form action="withdrawal.jsp">
<input type="submit" value="Withdrawal Amount"><br><br>
</form>
<form action="transfer.jsp">
<input type="submit" value="Transfer Amount"><br><br></form>
<form action="ceise.jsp" >
<input type="submit" value="Seize Account"><br><br>
</form>
<form action="unceise.jsp">
<input type="submit" value="Unseize Account"><br><br>
</form>
<form action="close.jsp" >
<input type="submit" value="Close Account">
</form>
</div>
</body>
</html>