<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/jpg" href="file:///C:/Users/Amir/workspace/bank_jsp/SBI-logo.jpg" /> 
<title>Insert title here</title>
</head>
<body style="background-color:lightgrey"  background="file:///C:/Users/Amir/workspace/bank_jsp/piggybank.jpg">
<div align="right">
<form action="Signup.jsp">
New Users Please Signup Before Login<br><br>
<input type="submit" value="Signup"></form>
</div>
<div align="center">

<fieldset>
<legend align="top"> Please Login To Enter </legend>

<form action="Login.jsp" >

Username:
<input type="text" name="uname">
<br><br>
Password:
<input type="password" name="upass">
<br><br>
<input type="submit" value="Submit">

</form>
</fieldset>
</div>
</body>
</html>