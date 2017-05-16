
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
try
{
	Class.forName("org.mariadb.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","linguanext");

}
catch(Exception e)
{
	out.println(e);
}
    	
%>