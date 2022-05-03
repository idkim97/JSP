<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1"> <!--모바일,PC등 다른 기기에서도 디자인 최적화-->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- css폴더>bootstrap.css파일을 참조해서 홈페이지 기본 디자인으로 지정 --> 
<link rel="stylesheet" href="css/custom.css"> <!-- 내가 설정하고 싶은 글씨체를 넣기위해 -->
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class = "navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <!-- 네비게이션바 짝대기1 -->
				<span class="icon-bar"></span> <!-- 네비게이션바 짝대기2 -->
				<span class="icon-bar"></span> <!-- 네비게이션바 짝대기3 -->
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		
		<div class = "collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown=toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li class="active"> <a href="login.jsp">로그인</a></li>
							<li> <a href="join.jsp">회원가입</a></li>
						</ul>
					</li>
			</ul>
		</div>
	</nav>
	
	<!--  로그인화면  -->
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="passing-top :20px;">
				<form method="post" action="loginAction.jsp">
					<h3 style="text-align : center:">로그인 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
					</div>
					
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
					
					<input type="submit" class="btn btn-primary form-control" value="로그인">
				</form>
				
			
		</div>
	</div>
	<!--  애니메이션을 담당하게될 자바스크립트 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>