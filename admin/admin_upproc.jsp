<%@ page language="java" contentType="text/html; charset=EUC-KR"
	info="수정날짜:11월 15일"
%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="bean" class="member_action.MemberBean"/>
<jsp:setProperty name="bean" property="*"/>

<jsp:useBean id="mgr" class="member_action.MemberMgr"/>
<%	
	String id = request.getParameter("mem_id");	//logID에 해당하는 세션값=mem_id 반환
	mgr.updateMember(bean, id);				//db연동하여 id에 해당하는 db정보 수정
%>


<script>
alert("수정완료");
location.replace("/Jsp-Auction/index.jsp"); 
</script>





  