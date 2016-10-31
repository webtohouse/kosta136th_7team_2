<%@page import="java.sql.ResultSetMetaData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.ResultSetMetaData" %>

<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Default HTML</title>
   <link rel="stylesheet" href="../css/common.css">
   <link rel="stylesheet" href="css/board.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
   <script src="http://code.jquery.com/jquery-2.2.3.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular.min.js"></script>

   <!-- <!-- 글조회 이벤트 핸들링 -->
   <!-- <script>
      $(document).ready(function() {

         $('.title_td').click(function() {

            var num = parseInt($(this).prev().text());
            var board = Controllers.getBoardController().requestSelectOne(num);

         });

      });
   </script>  -->

   <!-- 글쓰기 버튼 이벤트 핸들링 -->
   <script>
      $(document).ready(function() {

         $('#write_btn').click(function() {

        	 document.location = "boardWrite.jsp";
        	 
         });

      });
   </script>

   <!-- 체크박스 전체 선택 이벤트 핸들링 -->
   <script>
   $(document).ready(function() {

      $('#all_check').click(function(){

         var trs = $('tbody').children();

         if (this.checked) {
            for(var i = 0 ; i < trs.length ; i++) {
               trs.eq(i).children().first().children().prop('checked', true);
            }
            } else {
            for(var i = 0 ; i < trs.length ; i++) {
               trs.eq(i).children().first().children().prop('checked', false);
            }
            }

      });

   });
   </script>

</head>

<body>




   <!-- 상단 메뉴바 -->
   <header>

      <nav class="navbar navbar-inverse">
         <div class="container-fluid">
            <div class="navbar-header">
               <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
             <span class="icon-bar"></span>
             <span class="icon-bar"></span>
             <span class="icon-bar"></span>
           </button>
               <a href="../index.html" id="logo" class="navbar-brand">7team</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
               <ul class="nav navbar-nav">
                  <li class="active"><a href="../index.html">Home</a></li>
                  <li><a href="../aboutUs/aboutUs.html">About Us</a></li>
                  <li><a href="../article/articleList.html">Article</a></li>
                  <li><a href="boardList.html">board</a></li>
                  <li><a href="../qna/qnaList.html">QnA</a></li>
                  <li><a href="../login/signup.html">SignUp</a></li>
               </ul>
               <ul class="nav navbar-nav navbar-right">
                  <li><a href="../login/login.html"><span class="glyphicon glyphicon-log-in"> Login</span></a></li>
               </ul>
            </div>
         </div>
      </nav>

   </header>

   <!-- 페이지 타이틀 -->
   <div class="jumbotron text-center">
      <h1 id="title_name">FREE BOARD</h1>
      <p>당신의 창의적인 아이디어를 마음껏 적어주세요 </p>
   </div>


   <!-- 페이지 타이틀 -->
   <section>

   </section>



   <div class="container" id="first_section">
      <div class="row content">


         <!-- center side article -->
         <div id="first_board">
            <br>
            <table class="table table-hover">
               <thead>
                  <tr>
                     <th>선택</th>
                     <th>글번호</th>
                     <th>글제목</th>
                     <th>작성자</th>
                     <th>조회수</th>
                  </tr>
               </thead>
               <tbody>
<%
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:mysql://localhost:3306/articledb";
	String user = "root";
	String password = "1234";
	
	try {
		conn = DriverManager.getConnection(url, user, password);		
		stmt = conn.createStatement();
		String sql = "select num 번호, title 제목, writer 작성자, readCount 조회수 from articles";
		rs = stmt.executeQuery(sql);
		ResultSetMetaData rsm = rs.getMetaData();		

            while(rs.next()) {
%>
                  <tr>
                     <td><input type="checkbox"></td>
                     <td><%= rs.getInt("번호") %></td>
                     <!-- a태그는 링크를 걸어주기위해서 존재한다. -->
                     <td>
                    	 <a href=boardRead.jsp?num=<%= rs.getInt("번호") %>><%= rs.getString("제목")  %> </a>
                     </td>
                     <td><%= rs.getString("작성자") %></td>
                     <td><%= rs.getInt("조회수") %></td>
                  </tr>
<%
            }
%>                  
<%
            } catch (Exception e) {
            	
            } finally {
            	
            }
%>  
               </tbody>
            </table>

            <div class="row" align="left">
               <label for="all_check"> <input type="checkbox" id="all_check"
                  name="all_check"> 전체 선택
            </div>

            <div class="row">
               <div class="col-sm-6">
                  <button class="btn btn-danger" type="submit" id="delete_btn">선택한 글삭제</a></button>
               </div>
               <div class="col-sm-6" align="right">

                  <input class="btn btn-primary" type="button" id="write_btn" value="글쓰기">
               </div>
            </div>


            <!-- pagination -->
            <div class="row text-center">
               <!-- <button class="btn btn-primary btn-left pull-left" type="submit"><a href="#first_article" class="submit_btn">목록</a></button> -->

               <ul class="pagination">
                  <li class="previous"><a href="#">Previous</a></li>
                  <li class="active"><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#">4</a></li>
                  <li><a href="#">5</a></li>
                  <li class="next"><a href="#">Next</a></li>
               </ul>
            </div>
            <!-- 찾기 -->

            <!-- write btn -->
            <div class="row text-center">
               <div class="col-sm-4">
                  <form class="form-inline">

                     <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                           <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        글쓴이<span class="caret"></span>
                      </a>
                           <ul class="dropdown-menu">
                              <li><a href="#">글제목</a></li>
                              <li><a href="#">글내용</a></li>
                              <li><a href="#">글쓴이+글제목</a></li>
                           </ul>
                        </li>
                     </ul>
               </div>
               <div class="col-sm-4">
                  <input type="text" class="form-control text-left" size="50" placeholder="찾으시는 글 또는 작성자를 입력해주세요." required>
               </div>
               <div class="col-sm-4 suchedbutton">
                  <a href="#" class="btn btn-default btn-lg pull-left">
                     <span class="glyphicon glyphicon-search"></span> 찾기
                  </a>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>


   <!-- footer -->
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

   <!--############################# SCRIPT CODE #############################-->
   <script src="http://code.jquery.com/jquery-2.2.3.min.js"></script>
   <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
   <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

   <script>
      (function(i, s, o, g, r, a, m) {
         i['GoogleAnalyticsObject'] = r;
         i[r] = i[r] || function() {
            (i[r].q = i[r].q || []).push(arguments)
         }, i[r].l = 1 * new Date();
         a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
         a.async = 1;
         a.src = g;
         m.parentNode.insertBefore(a, m)
      })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');
      ga('create', 'UA-86493020-1', 'auto');
      ga('send', 'pageview');
   </script>

</body>

</html>