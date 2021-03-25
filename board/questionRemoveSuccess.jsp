<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="board.QuestionBean"%>
 <jsp:useBean id="bMgr" class="board.QuestionMgr" />
<%
		QuestionBean bean = (QuestionBean)session.getAttribute("bean");
	
		int num=bean.getNum();
		bMgr.deleteBoard(num);
%>	
<script>
location.href="/Jsp-Auction/index.jsp?PAGE=board/question"
</script>