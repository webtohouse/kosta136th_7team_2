<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>

<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:mysql://localhost:3306/articledb";
	String user = "root";
	String password = "1234";
	
	try {
		conn = DriverManager.getConnection(url, user, password);
		String sql = "delete from articles where num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.execute();
		
		response.sendRedirect("articleList.jsp");
	} catch(Exception e) {
		e.printStackTrace();
	}
%>