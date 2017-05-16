<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="javax.sql.*" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
$("#header").load("header.html");
});


</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid">
    <div id="header">
    </div>
<% 
String name=request.getParameter("uname");
String password=request.getParameter("password");
String ip=request.getParameter("ip");
String port=request.getParameter("port");
//name=name.trim();
//password=password.trim();
//out.println(name); 
//out.println(port); 
//out.println(password);
//out.println(ip); 
try
{
	 
	Class.forName("org.mariadb.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://"+ip+":"+port+"/ln_cloudadmindb",name,password);
	//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ln_cloudadmindb","root","linguanext");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select ProjectName,DisplayName from projectadmin where IsMaster='true'");
%>
<div class="container">
<div class="table-responsive">
<table align=center class="table">
<thead>
<tr>

<th>ProjectName</th>
<th>DisplayName</th>
</tr>
</thead>
<tbody>
<% 
while(rs.next())
{
	out.println("<tr><a href=chid_db.jsp?DsiplayName="+rs.getString(2)+"><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</a></td></tr>");
}


}
catch(Exception e)
{
	out.println(e);
}
%>
</tbody>
</table>
</div>
</div>
<br><br>
<p id="error"></p>
</div>
</body>
</html>