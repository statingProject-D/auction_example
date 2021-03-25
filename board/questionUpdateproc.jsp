<%@ page contentType="text/html; charset=EUC-KR" import="board.QuestionBean"%>
<jsp:useBean id="upMgr" class="board.QuestionMgr"/>
<jsp:useBean id="upBean" class="board.QuestionBean"/>
<%
 	request.setCharacterEncoding("EUC-KR");
	String sessionID = (String)session.getAttribute("logID");
	QuestionBean bean = (QuestionBean)session.getAttribute("bean");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	int num=bean.getNum();
	upBean.setName(sessionID);
	upBean.setSubject(subject);
	upBean.setContent(content);
	upBean.setNum(num);
	
	upMgr.updateBoard(upBean);
	request.setCharacterEncoding("euc-kr");
	response.sendRedirect("/Jsp-Auction/index.jsp?PAGE=board/question");
%>