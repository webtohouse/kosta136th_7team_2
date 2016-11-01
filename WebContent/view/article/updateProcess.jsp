<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>

<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");


	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:mysql://localhost:3306/articledb";
	String user = "root";
	String password = "1234";
	
	try {
		conn = DriverManager.getConnection(url, user, password);
		String sql = "update articles set title = ?, content = ?, writer = ? where num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, writer);
		pstmt.setInt(4, num);
		pstmt.execute();
		
		response.sendRedirect("articleList.jsp");
	} catch(Exception e) {
		e.printStackTrace();
	}
%>