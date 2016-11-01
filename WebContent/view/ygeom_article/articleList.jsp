<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.ResultSetMetaData" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>게시글 등록</title>
		<link rel="stylesheet" href="../css/common.css">
		<link rel="stylesheet" href="css/article.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
		<script src="http://code.jquery.com/jquery-2.2.3.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular.min.js"></script>
	</head>
	<body>
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
			<div class="jumbotron text-center" id="Listjumbotron">
				<h1>Article List page</h1>
				<p>자유로운 대화가 오가는 게시판</p>
			</div>
			<div class="container">

				<span id="span-left">Total :1</span> <span id="span_right">page :1</span>
				<hr>
				<table class="table table-hover">
					<thead>
						<tr>
						<th>선택</th>
						<%
						Class.forName("com.mysql.jdbc.Driver");
						System.out.println("driver loading success");

						Connection conn = null;
						Statement stmt = null;
						ResultSet rs = null;

						String url = "jdbc:mysql://localhost:3306/articledb";
						String user = "root";
						String password = "1234";

						try{

							conn = DriverManager.getConnection(url, user, password);
							System.out.println("드라이버 로딩 성공");

							stmt = conn.createStatement();
							String sql = "select num 번호, title 제목, writer 작성자, readCount 조회수 from articles";
							rs = stmt.executeQuery(sql);
							ResultSetMetaData rsm = rs.getMetaData();

							for(int i = 1; i <= rsm.getColumnCount(); i++) {
						%>
							<th class="th_title"><%= rsm.getColumnLabel(i) %></th>
						<%
							}
						%>
						</tr>
					</thead>
					<tbody>
					
					<% 
						while(rs.next()){ 
					%>
							<tr>
								<td class="check_title"><input type="checkbox" class="checked_"></td>
								<td class="num_title"><%= rs.getInt("번호") %></td>
								<td class="subject_title"><%= rs.getString("제목") %></td>
								<td class="writer_title"><%= rs.getString("작성자") %></td>
								<td class="readcount_title"><%= rs.getInt("조회수") %></td>
							</tr>

					<% } %>
					<%

						} catch(Exception e) {
							e.printStackTrace();
						} finally {
							if(rs != null){try{rs.close();}catch(Exception e){}}
							if(stmt != null){try{stmt.close();}catch(Exception e){}}
							if(conn != null){try{conn.close();}catch(Exception e){}}
						}

					%>

					</tbody>
				</table>
				<script>

					$(document).ready(function(){

						$('td').addClass(".title_td");
						$('.title_td').click(function(){
							alert("제목이 클릭되었습니다. 내용보기로 이동합니다");

						});

					});

				</script>
				<label for="all_check">
					<input type="checkbox" id="select_all" name="all_check"> 전체 선택
					
					<script>
						function checkAllCheckBox() {
						   if($('#select_all').is(':checked')){
						   		$(".check_").attr ( "checked" ,"checked" );
						    } else {
						        $(".check_").removeAttr('checked');
						    }
						 }
					</script>
					<hr>
					<div class="container text-center">

						<button type="button" id="delete_btn" class="btn btn-default" data-toggle="modal" data-target="#myModal">삭제</button>

						<ul class="pagination pagination-lg pager">
							<li><a href="#">Previous</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">Next</a></li>
						</ul>
						<button type="button" id="write_btn" class="btn btn-default">글쓰기</button>

						<script>
							$(document).ready(function(){

								$("#write_btn").click(function(){

									document.location = "articleWrite.jsp";

								})

							});
						</script>

					</div>
					<div class="container text-center">
						<input type="text" /> <input type="button" id="search_btn" value="검색" />
					</div> <!-- Modal -->
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
												type="button" class="form-control" id="delete_success_btn"
												value="네"> <input type="button" class="form-control"
												id="delete_false_btn" value="아니요">
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
						<p>가산디지털단지역 KOSTA 사무실 || 고객상담실 : 080 - 000 - 0000 || 대표이사 : 박성용</p>
						<p>통신판매업 신고번호 서울-11111호</p>
						<p>Copyright &copy; 2016 psy Co., ltd ALL RIGHTS RESERVED</p>
					</div>
					<div class="col-sm-2">
						<h4>Category</h4>
						<ul>
	            <li><a href="../board/boardList.html">board</a></li>
	            <li><a href="../aboutUs/aboutUs.html">About Us</a></li>
	            <li><a href="articleList.html">Article</a></li>
	            <li><a href="../qna/qnaList.html">QnA</a></li>
	            <li><a href="../login/signup.html">SignUp</a></li>
	            <li><a href="../login/login.html">Login</a></li>
						</ul>
					</div>
				</div>
			</div>
		</footer>
		<script>
		  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

		  ga('create', 'UA-86521502-1', 'auto');
		  ga('send', 'pageview');
		</script>
</body>
</html>
