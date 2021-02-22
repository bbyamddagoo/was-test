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
<%@ page contentType="text/html;charset=utf-8"
	import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String idx = request.getParameter("idx");

	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		//String DB_URL = "jdbc:mysql://localhost:3306/web01?useUnicode=true&characterEncoding=utf8";
		//Connection con = DriverManager.getConnection(DB_URL, "admin", "1234");
        
        Connection con= null;

        Context init = new InitialContext();
        Context env = (Context)init.lookup("java:comp/env");
        DataSource ds = (DataSource) env.lookup("jdbc/mysql");
        con = ds.getConnection();

		String sql = "DELETE FROM member WHERE idx=?";

		PreparedStatement pstmt = con.prepareStatement(sql); // 쿼리를 이용해 delete 실행!!
		pstmt.setInt(1,Integer.parseInt(idx));
		pstmt.executeUpdate();
		pstmt.close();
		con.close();
	}
	catch(ClassNotFoundException e)
	{
		out.println(e);
	}
	catch(SQLException e)
	{
		out.println(e);
	}
	response.sendRedirect("list.jsp");
%>