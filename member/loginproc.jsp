
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	import="java.util.*"
	import="java.sql.*"
%>

<jsp:useBean id="mgr" class="member_action.MemberMgr"/>
<%
	String id=request.getParameter("mem_id");
	String passwd=request.getParameter("mem_password");
	
	int result = mgr.loginCheck(id, passwd);
	if(result==1)
	{
		session.setAttribute("logID", id);
		response.sendRedirect("/Jsp-Auction/index.jsp");
	}else if(result==2){
		%>
			<script>
				alert("�̸��� �����ϼ���");
				history.go(-1);
			</script>
		<%
	}else{
%>
	<script>
		alert("���̵�� ��й�ȣ�� Ȯ���ϼ���");
		history.go(-1);
	</script>
<%
}
%>








