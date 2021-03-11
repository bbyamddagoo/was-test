<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*,java.util.*"%>
<%@page import="java.net.*"%>
<%@ page  contentType="text/html;charset=utf-8" import="java.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
//String DB_URL = "jdbc:mysql://localhost:3306/web01?useUnicode=true&characterEncoding=utf8";
//String DB_USER = "admin"; 
//String DB_PASSWORD= "1234";



Connection conn= null;
Statement stmt = null;
ResultSet rs   = null;

try {
    Context init = new InitialContext();
    Context env = (Context)init.lookup("java:comp/env");
    DataSource ds = (DataSource) env.lookup("jdbc/mysql");
    conn = ds.getConnection();
    //conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    stmt = conn.createStatement(); 
    String query = "SELECT idx, id, name FROM member"; 
    rs = stmt.executeQuery(query); 
%>

<style>
  table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
    text-align: center;
  }
  thead tr {
    background-color: #0d47a1;
    color: #ffffff;
  }
  tbody tr:nth-child(2n) {
    background-color: #bbdefb;
  }
  tbody tr:nth-child(2n+1) {
    background-color: #e3f2fd;
  }
</style>

<table border="1" cellspacing="0">
  <thead>
    <tr>
        <th>Number</th>
        <th>ID</th>
        <th>Name</th>
        <th>삭제</th>
        <th>수정</th>
    </tr>
  </thead>

    <%
        while(rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("idx") %></td>
        <td><%=rs.getString(2)%></td>
        <td><%= rs.getString(3) %></td>

        <TD>
            <A href="delete_do.jsp?idx=<%=rs.getInt("idx")%>">삭제</A>
        </TD>
        <TD>
            <A href="modify.jsp?idx=<%=rs.getInt("idx")%>">수정</A>
        </TD>

    </tr>
    <%
    } 
%>
</table>
<%
	rs.close();     
    stmt.close();     
    conn.close(); 	
} catch (SQLException e) { 
      out.println("err:"+e.toString());
} 
%>
<html>

<head>
  <meta charset="UTF-8">
  <title>WAS</title>
</head>

<body>
  <A href="input.jsp">등록</A>
</body>

</html>