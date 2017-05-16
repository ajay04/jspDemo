<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="javax.sql.*" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String displayname=request.getParameter("DsiplayName");
try
{
	 
	Class.forName("org.mariadb.jdbc.Driver").newInstance();
	//Connection conn = DriverManager.getConnection("jdbc:mysql://"+ip+":"+port+"/ln_cloudadmindb",name,password);
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ln_cloudadmindb","root","linguanext");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select ProjectName,DisplayName from projectadmin where IsMaster='false' and DisplayName='"+displayname+"'");
%>
<table align=center border=1>
<tr>

<th>ProjectName</th>
<th>DisplayName</th>
</tr>
<% 
while(rs.next())
{
	out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td></tr>");
}


}
catch(Exception e)
{
	out.println(e);
}
%>
</table>

</body>
</html>