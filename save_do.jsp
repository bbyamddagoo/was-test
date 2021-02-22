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
	String id = request.getParameter("id"); // input.jsp에서 입력받은 값들을 받아옵니다.
	String name = request.getParameter("name");
	//String pwd = request.getParameter("pwd");

	try
	{
		Class.forName("com.mysql.jdbc.Driver");
        
		//String DB_URL = "jdbc:mysql://localhost:3306/web01?useUnicode=true&characterEncoding=utf8"; // 아까 예제에서와 마찬가지로 url을 설정하죠
		//Connection con = DriverManager.getConnection(DB_URL, "admin", "1234");

        Connection con= null;

        Context init = new InitialContext();
        Context env = (Context)init.lookup("java:comp/env");
        DataSource ds = (DataSource) env.lookup("jdbc/mysql");
        con = ds.getConnection();

		//String sql = "INSERT INTO member(id,name,pwd) VALUES(?,?,?)"; // sql문 작성(id와 name, pwd값들을 보내기위한 작업)
		String sql = "INSERT INTO member(id,name) VALUES(?,?)"; // sql문 작성(id와 name, pwd값들을 보내기위한 작업)

		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1,id); // values에 들어갈 각각의 id, name, pwd 설정
		pstmt.setString(2,name);
		//pstmt.setString(3,pwd);

		pstmt.executeUpdate(); // sql문 실행(회원추가 실행)
		pstmt.close();
		con.close();
	}
	catch(ClassNotFoundException e) // 예외처리
	{
		out.println(e);
	}
	catch(SQLException e)
	{
		out.println(e);
	}
	response.sendRedirect("list.jsp"); // 다시 list.jsp를 실행시켜 새로운 정보를 업데이트 시킵니다.
%>