<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
        Date nowTime = new Date();
        SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tomcat connection pool</title>
</head>
<body>
<br>-------------------------------------------------------------------<br>
<h1>Hyunbae HAN's 3-Tier Sample WAS v2</h1>
<br>-------------------------------------------------------------------<br>
Recent Time : <%= sf.format(nowTime) %>
<br>-------------------------------------------------------------------<br>
<br>
<%
  Connection conn = null;

 try {
    Context init = new InitialContext();
    Context env = (Context)init.lookup("java:comp/env");
    DataSource ds = (DataSource) env.lookup("jdbc/mysql");
    conn = ds.getConnection();

    out.println("<h3>DB Connection Success.</h3>");
 }catch(Exception e){
  out.println("<h3>DB Connection Failed.</h3>");
  e.printStackTrace();
  }
%>
</body>
</html>
