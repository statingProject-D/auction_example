<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String sessionID = (String)session.getAttribute("logID"); %>
<div class="navbar navbar-default navbar-static-top">
	<div class="container">
		<div class="navbar-header">

			<a class="navbar-brand" href="./index.jsp"><span>Auction</span></a>
		</div>

		<div class="collapse navbar-collapse" id="navbar-ex-collapse">
			<ul class="nav navbar-nav navbar-right">

				<%if(sessionID==null){ %>
				<li><a href="./index.jsp?PAGE=member/login">Login</a></li>
				<li><a href="./index.jsp?PAGE=member/join">Join</a></li>

				<%}else if(sessionID.equals("admin")) {%>
				<li><a href="./index.jsp?PAGE=admin/admin_member">雀盔包府</a></li>
				<li><a href="./index.jsp?PAGE=admin/admin_product">版概包府</a></li>
				<li><a href="./index.jsp?PAGE=member/logout">Logout</a></li>
				<%}else{%>
				<li><a href="./index.jsp?PAGE=member/mypage">Mypage</a></li>
				<li><a href="./index.jsp?PAGE=member/logout">Logout</a></li>
				<%}%>
			</ul>
		</div>
	</div>
</div>
