<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	String sessionID = (String)session.getAttribute("logID");
	if(sessionID!=null)
	{
%>
				
<%
	}else{
%>
	<script>
		alert("�α��κ��� �ϼ���");
		history.go(-1);
	</script>
<%
	}
%>
<div class="m-y-3 p-y-3 section">
    <div class="container">
      <div class="m-y-3 p-y-3 row">
        <div class="col-lg-4"></div>
        <div class="col-lg-2"><a href="./index.jsp?PAGE=member/update" class="btn btn-block btn-default btn-lg">��������</a></div>
        <div class="col-lg-2 col-md-offset-1"><a href="./index.jsp?PAGE=member/mypage_product" class="btn btn-block btn-default btn-lg">�����Ȳ</a></div>
      </div>
    </div>
  </div>