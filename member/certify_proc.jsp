<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="mgr" class="member_action.MemberMgr"/>
<%
	String id=request.getParameter("mem_id");
	String key=request.getParameter("mem_key");
	
	boolean result = mgr.mailck(id, key);
	if(result)
	{
		mgr.upvalue(id);
		%>
		<script>
			alert("�����Ǿ����ϴ�.");
			location.replace("/Jsp-Auction/index.jsp"); 
		</script>	
		<%
	}else{
%>
	<script>
		alert("�����ڵ带 �ٽ� �Է��ϼ���");
		history.go(-1);
	</script>
<%
}
%>

