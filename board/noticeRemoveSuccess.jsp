<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="notice.NoticeBean"%>
 <jsp:useBean id="nMgr" class="notice.NoticeMgr" />
<%
		NoticeBean bean = (NoticeBean)session.getAttribute("bean");
		int num=bean.getNum();
		nMgr.deletNotice(num);
%>	
<script>
location.href="/Jsp-Auction/index.jsp?PAGE=board/notice"
</script>