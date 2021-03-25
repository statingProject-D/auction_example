<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% String ce_id = request.getParameter("id");
	int idx = ce_id.indexOf(".");
	String ce = ce_id.substring(0,idx);
%>
<div class="section">
	<div class="container">
		<div class="col-md-4  col-md-offset-4">
			<form  method="post" action="/Jsp-Auction/member/certify_proc.jsp">
				<div class="form-group">
					<label>ID</label> <input type="text" class="form-control" name="mem_id" value="<%=ce%>" readonly="readonly">
				</div>
				<div class="form-group">
					<label>인증번호</label> <input type="text" class="form-control" name="mem_key" >
				</div>
				<span style="margin-left: 40%"></span>
				<button type="submit" class="btn btn-default">인증</button>
			</form>
		</div>
	</div>
</div>
  