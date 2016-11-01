<%@ page import="java.sql.ResultSetMetaData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.ResultSetMetaData" %>


<!DOCTYPE html>
<html lang="ko" ng-app>

<head>
  <meta charset="UTF-8">
  <title>Default HTML</title>
  <link rel="stylesheet" href="css/board.css">
  <link rel="stylesheet" href="../css/common.css">

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


  <div class="jumbotron text-center">
    <h1 id="title_name">FREE BOARD</h1>
    <p>ë¹ì ì ì°½ìì ì¸ ìì´ëì´ë¥¼ ë§ìê» ì ì´ì£¼ì¸ì </p>
  </div>

  <section>
    <div class="container">


      <form action="" class="form-horizontal">
        <div class="form-group">
          <label for="title" class="col-sm-2">ì ëª©:</label>
          <!-- <input type="title" class="form-control" id="title"> -->
          <div class="col-sm-10">
            <!-- ê¸ ì ëª©ì´ ë¤ì´ ê°ëë¤. -->
          </div>
        </div>

        <div class="form-group">
          <label for="title" class="col-sm-2">ìì±ì:</label>
          <!-- <input type="title" class="form-control" id="title"> -->
          <div class="col-sm-10">
            <!-- ê¸ ìì±ìê° ë¤ì´ ê°ëë¤. -->
          </div>
        </div>

        <div class="form-group">
          <label for="title" class="col-sm-2">ìì±ì¼:</label>
          <!-- <input type="title" class="form-control" id="title"> -->
          <div class="col-sm-10">
            <!-- ê¸ ìì±ì¼ì´ ë¤ì´ ê°ëë¤. -->
          </div>
        </div>

        <div class="form-group">
          <label for="content" class="col-sm-2">ë´ì©:</label>
          <!-- <input type="content" class="form-control" id="content"> -->
          <div class="col-sm-10">
            <!-- ê¸ ë´ì©ì´ ë¤ì´ ê°ëë¤. -->
          </div>
        </div>

        <div class="buttons" align="right" id="buttons">
          <button type="submit" class="btn btn-warning">ìì </button>
          <button type="submit" class="btn btn-danger">ì­ì </button>
          <button type="button" class="btn btn-primary" onclick="location.href='boardList.html'">ëª©ë¡</button>
        </div>

      </form>
    </div>
  </section>

  <!-- footer -->
  <footer id="footer" class="container-fluid text-center">
    <div class="container">
      <div class="row">
        <div class="col-sm-2">
          <h2>BitCoin</h2>
        </div>
        <div class="col-sm-8">
          <p>ê°ì°ëì§í¸ë¨ì§ì­ KOSTA ì¬ë¬´ì¤ || ê³ ê°ìë´ì¤ : 080 - 000 - 0000 || ëíì´ì¬ : ë°ì±ì©</p>
          <p>íµì íë§¤ì ì ê³ ë²í¸ ìì¸-11111í¸</p>
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

</body>

</html>
