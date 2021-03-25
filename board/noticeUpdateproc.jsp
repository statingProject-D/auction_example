<%@ page contentType="text/html; charset=EUC-KR" import="notice.NoticeBean"%>
<jsp:useBean id="upMgr" class="notice.NoticeMgr"/>
<jsp:useBean id="upBean" class="notice.NoticeBean"/>
<%
 	request.setCharacterEncoding("EUC-KR");
	String sessionID = (String)session.getAttribute("logID");
	NoticeBean bean = (NoticeBean)session.getAttribute("bean");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	int num=bean.getNum();
	upBean.setName(sessionID);
	upBean.setSubject(subject);
	upBean.setContent(content);
	upBean.setNum(num);
	
	upMgr.updateNotice(upBean);
	request.setCharacterEncoding("euc-kr");
	response.sendRedirect("/Jsp-Auction/index.jsp?PAGE=board/notice");
%>