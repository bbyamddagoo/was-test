<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tomcat connection pool</title>
</head>
<body>
<%
  Connection conn = null;

 try {
    Context init = new InitialContext();
    Context env = (Context)init.lookup("java:comp/env");
    DataSource ds = (DataSource) env.lookup("jdbc/mysql");
    conn = ds.getConnection();

    out.println("<h3>연결되었습니다.</h3>");
 }catch(Exception e){
  out.println("<h3>연결에 실패하였습니다.</h3>");
  e.printStackTrace();
  }
%>
</body>
</html>
