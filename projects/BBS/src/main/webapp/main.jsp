<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<!--모바일,PC등 다른 기기에서도 디자인 최적화-->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css"> <!-- 내가 설정하고 싶은 글씨체를 넣기위해 -->
<!-- css폴더>bootstrap.css파일을 참조해서 홈페이지 기본 디자인으로 지정 -->
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = null;
	if(session.getAttribute("userID") !=null){
		userID = (String)session.getAttribute("userID");
	}
		
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<!-- 네비게이션바 짝대기1 -->
				<span class="icon-bar"></span>
				<!-- 네비게이션바 짝대기2 -->
				<span class="icon-bar"></span>
				<!-- 네비게이션바 짝대기3 -->
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			
			<%
				if(userID == null){
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown=toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<%		
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown=toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			<%
				}
			%>

		</div>
	</nav>
	
	<div class="container">
		<div class = "jumbotron">
			<div class="container">
				<h1> JSP 게시판 웹페이지 </h1>
				<p> JSP를 활용한 간단한 게시판 웹페이지를 제작해봤습니다. MYSQL을 이용해 DB를 처리했고 디자인 템플릿으로는 부트스트랩을 사용했습니다.
				회원가입, 로그인 기능이 구현되었고 회원정보에 기반하여 게시판에 게시글을 작성할 수 있습니다! 추가적으로 Cross-site scripting 공격에 대한
				대비 장치도 마련되어 있습니다! </p>
				<p> <a class ="btn btn-primary btn-pull" href="#" role="button">자세히 알아보기</a></p>
			</div>
		</div>
	</div>
	
	<!-- 이미지를 넣기위해 carousel을 사용 -->
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/1.jpg">
				</div>
				<div class="item">
					<img src="images/2.jpg">
				</div>
				<div class="item">
					<img src="images/3.jpg">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
	

	
	
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
</body>
</html>