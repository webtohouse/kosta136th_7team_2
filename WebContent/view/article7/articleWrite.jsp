<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.ResultSetMetaData" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="../css/common.css">
		<link rel="stylesheet" href="css/article.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
		<script src="http://code.jquery.com/jquery-2.2.3.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular.min.js"></script>
	</head>
	<body class="writeview">
		<header>
			<nav class="navbar navbar-inverse">
				<div class="container-fluid">
	
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
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
							<li>
								<a href="../login/login.html"><span class="glyphicon glyphicon-log-in"> Login</span></a>
							</li>
						</ul>
	
					</div>
				</div>
			</nav>
		</header>
	
		<section>
			<div class="container">
				<h1 class="title">Article register Page</h1>
				<hr>
				<form method="post" action="writeProdcess.jsp" class="form-horizontal">
	
					<div class="form-group" id="writetitle">
						<label for="title" class="control-label col-sm-2 font-sizeup">Title : </label>
						<div class="col-sm-10 ">
							<input type="text" class="form-control" name="title" id="title" placeholder="Title input" />
						</div>
					</div>
	
					<div class="form-group" id="writecontent">
						<label for="content" class="control-label col-sm-2 font-sizeup">Content : </label>
						<div class="col-sm-10 ">
							<textarea class="form-control" name="content" id="content" rows="10" placeholder="Content input" /></textarea>
						</div>
					</div>
	
					<div class="form-group" id="writewriter">
						<label for="writer" class="control-label col-sm-2 font-sizeup">Writer : </label>
						<div class="col-sm-10 ">
							<input type="text" class="form-control" name="writer" id="writer" placeholder="Writer Input" />
						</div>
					</div>
	
					<hr>
	
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10" id="registe_btns">
							<input type="button" id="cancel_btn" value="Cancel" />
							<button type="submit" id="save_btn" value="Save">저장하기</button>
						</div>
					</div>
					
				</form>
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
							<li><a href="shop.html">Q&amp;A</a></li>
							<li><a href="join.html">Join</a></li>
							<li><a href="login.html">Login</a></li>
						</ul>
					</div>
				</div>
			</div>
		</footer>
	</body>
</html>