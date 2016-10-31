<%@page import="java.sql.ResultSetMetaData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.ResultSetMetaData" %>
<%@ page import="java.sql.PreparedStatement" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>readArticle Page</title>
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="css/article.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-2.2.3.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular.min.js"></script>



<!-- ListReturn btn 핸들링 -->
<script>
	$(document).ready(function() {

		$('#Listreturn_btn').click(function() {

			document.location = "articleList.jsp";

		});
	});
</script>

<!-- update_btn 핸들링 -->
<script>
	$(document).ready(function() {

		$('#update_btn').click(function() {

			document.location = "articleUpload.jsp?num=" + $('#readNum').text();
			
		});
	});
</script>

<script>
	$(document).ready(function() {

		$('#delete_false_btn').click(function() {

			document.location = "articleRead.jsp?num=" + $('#readNum').text();

		});
	});
</script>

<!-- delete_btn 핸들링 -->
<script>

	$(document).ready(function(){

		$('#delete_success_btn').click(function() {
			
			document.location = "deleteProcess.jsp?num=" + $('#readNum').text();

		});

	});

</script>

</script>

</head>
<body class="readbody">


	<header>
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a href="../index.html" id="logo" class="navbar-brand">7team</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li class="active"><a href="../index.html">Home</a></li>
						<li><a href="../aboutUs/aboutUs.html">About Us</a></li>
						<li><a href="articleList.html">Article</a></li>
						<li><a href="../board/boardList.html">board</a></li>
						<li><a href="../qna/qnaList.html">QnA</a></li>
						<li><a href="../login/signup.html">SignUp</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="../login/login.html"><span
								class="glyphicon glyphicon-log-in"> Login</span></a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<section>
	
	<%
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection conn = null;
	PreparedStatement pstmt =null;
	ResultSet rs = null;
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	String url = "jdbc:mysql://localhost:3306/articledb";
	String user = "root";
	String password = "1234";
	
	try {
		conn = DriverManager.getConnection(url, user, password);
		
		String sql = "select num 번호, title 제목, content 내용, writer 작성자, readCount 조회수 from articles where num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);		
		rs = pstmt.executeQuery();
		ResultSetMetaData rsm = rs.getMetaData();
		%>
		

		<div class="container">

			<span class="text-center"><h3>Search Article Info Page</h3></span> <span
				id="selectspan_right">글이 조회되었습니다.</span>
			<hr>
	<%
		if(rs.next()) {
	%>
			<form action="" class="form-horizontal">

				<div class="form-group">
					<label for="number" class="control-label col-sm-2 font-sizeup">Number : </label>
					<div class="col-sm-10 " id="readNum" name="num">
						<%= rs.getInt("번호") %>
					</div>
				</div>

				<div class="form-group">
					<label for="title" class="control-label col-sm-2 font-sizeup">Title : </label>
					<div class="col-sm-10 " id="readTitle" name="title">
						<%= rs.getString("제목") %>
					</div>
				</div>

				<div class="form-group">
					<label for="content" class="control-label col-sm-2 font-sizeup">Content : </label>
					<div class="col-sm-10 " id="readContent" name="content">
						<%= rs.getString("내용") %>
					</div>
				</div>

				<div class="form-group">
					<label for="writer" class="control-label col-sm-2 font-sizeup">Writer : </label>
					<div class="col-sm-10 " id="readWriter" name="writer">
						<%= rs.getString("작성자") %>
					</div>
				</div>

				<div class="form-group">
					<label for="readCount" class="control-label col-sm-2 font-sizeup">ReadCount : </label>
					<div class="col-sm-10 " id="readCount" name="readCount">
						<%= rs.getInt("조회수") %>
					</div>
				</div>
				<hr>
<% 
		}
%>		
<%		
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10" id="selectOne_btns">
						<input type="button" id="Listreturn_btn" value="List" /> <input
							type="button" id="onedelete_btn" data-toggle="modal"
							data-target="#myModal" value="Delete" /> <input type="button"
							id="update_btn" value="Update" />
					</div>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">×</button>
								<h4>
									<span class="glyphicon glyphicon-lock"></span> Delete
								</h4>
							</div>
							<div class="modal-body">
								<form role="form">
									<div class="form-group">
										<label for="deletequestion"><span
											class="glyphicon glyphicon-user"></span>삭제 하시겠습니까?</label> <input
											type="button" class="form-control" id="delete_success_btn" value="네">
											<input type="button" class="form-control" id="delete_false_btn" value="아니요">
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="submit"
									class="btn btn-danger btn-default pull-left"
									data-dismiss="modal">
									<span class="glyphicon glyphicon-remove"></span> Cancel
								</button>
							</div>
						</div>
					</div>
				</div>
		</div>

	</section>
	<footer id="footer" class="container-fluid text-center">
		<div class="container">
			<div class="row">
				<div class="col-sm-2">
					<h2>BitCoin</h2>
				</div>
				<div class="col-sm-8">
					<p>가산디지털단지역 KOSTA 사무실 || 고객상담실 : 080 - 000 - 0000 || 대표이 : 박성용</p>
					<p>통신판매업 신고번호 서울-11111호</p>
					<p>Copyright &copy; 2016 psy Co., ltd ALL RIGHTS RESERVED</p>
				</div>
				<div class="col-sm-2">
					<h4>Category</h4>
					<ul>
						<li><a href="skills.html">Board</a></li>
						<li><a href="gallery.html">Article</a></li>
						<li><a href="board.html">Board</a></li>
						<li><a href="shop.html">Q&A</a></li>
						<li><a href="join.html">Join</a></li>
						<li><a href="login.html">Login</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>