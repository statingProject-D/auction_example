<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="memberAction.*" %>

<jsp:useBean id="mgr" class="member_action.MemberMgr"/>
<%	

	String get_id = request.getParameter("id");
	int idx = get_id.indexOf(".");
	String id = get_id.substring(0,idx);
	boolean result = mgr.memberDelete(id);
	if(result==true){
		%>
		<script>
		alert("삭제되었습니다.");
		location.replace("/Jsp-Auction/index.jsp?PAGE=admin/admin_member"); 
		</script>
	<%}else{%>
		<script>
		alert("삭제실패");
		history.go(-1);
		</script>
	<%}
	
%>