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
<table border="1" cellspacing="0">
    <tr>
        <td>Number</td>
        <td>ID</td>
        <td>Name</td>
        <TD>삭제</TD>
        <TD>수정</TD>
    </tr>
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
<A href="input.jsp">등록</A>