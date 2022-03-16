<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<!--모바일,PC등 다른 기기에서도 디자인 최적화-->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- css폴더>bootstrap.css파일을 참조해서 홈페이지 기본 디자인으로 지정 -->
<title>JSP 게시판 웹 사이트</title>
<!-- 게시글 클릭해도 밑줄안뜨게하기 + 검은색글씨 유지 -->
<style type="text/css">
	a, a:hover {
		color : #000000;
		text-decoration : none;
	}
</style>
</head>
<body>
	<%
		String userID = null;
	if(session.getAttribute("userID") !=null){
		userID = (String)session.getAttribute("userID");
	}
	int pageNumber = 1;
	if(request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="bbs.jsp">게시판</a></li>
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
					</ul></li>
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
					</ul></li>
			</ul>
			<%
				}
			%>

		</div>
	</nav>

	<!--  게시판 부분은 테이블 형태로 구현 -->
	<div class="container">
		<div class="row">
			<!-- 홀수 짝수 게시글의 색깔을 다르게 해서 가독성을 높임 -->
			<table class="table table-striped" style="text-align: center; border : 1px solid #dddddd">
				<!-- 테이블의 머리부분 -->
				<thead>
					<!-- 테이블의 하나의 행 -->
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<!-- 테이블의 몸통부분 -->
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for(int i=0;i<list.size();i++){
					%>
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11,13)+"시"+list.get(i).getBbsDate().substring(14,16)+"분"%></td>
					</tr>
					
					<%		
						}
					%>
				
					
				</tbody>
			</table>
			
			<%
				if(pageNumber!=1){
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber-1%>" class = "btn btn-success btn-arrow-left">이전</a>
			<%
				} if(bbsDAO.nextPage(pageNumber+1)){
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber+1%>" class = "btn btn-success btn-arrow-left">다음</a>
			<%
				}
			%>
				
			
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>