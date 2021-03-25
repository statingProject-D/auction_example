<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="section">
	<div class="container">
		<div class="col-md-4  col-md-offset-4">
			<form  method="post" action="/Jsp-Auction/member/loginproc.jsp">
				<div class="form-group">
					<label>ID</label> <input type="text" class="form-control"
						placeholder="아이디를 입력하세요" name="mem_id">
				</div>
				<div class="form-group">
					<label>Password</label> <input type="password" class="form-control" name="mem_password"
						placeholder="비밀번호를 입력하세요">
				</div>
				<span style="margin-left: 33%"></span>
				<button type="submit" class="btn btn-default">Login</button>
				<a href="/Jsp-Auction/index.jsp?PAGE=member/join"><button type="button" class="btn btn-default">Join</button></a>
			</form>
		</div>
	</div>
</div>