<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.ResultSetMetaData" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSetMetaData"%>
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");
	  			
	Class.forName("com.mysql.jdbc.Driver");
	  			
	Connection conn = null;
	Statement stmt =null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	 			
	String url = "jdbc:mysql://localhost:3306/articledb";
	String user = "root";
	String password = "1234";
	
		try {
			conn = DriverManager.getConnection(url, user, password);
			String sql = "insert into articles(title, content, writer) values(?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, writer);
			pstmt.execute();
	  				
			response.sendRedirect("articleList.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
%>


</body>
</html>