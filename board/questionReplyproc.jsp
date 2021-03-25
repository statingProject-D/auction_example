<%@ page contentType="text/html; charset=EUC-KR" import="board.QuestionBean"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="bMgr" class="board.QuestionMgr"/>
<jsp:useBean id="reBean" class="board.QuestionBean"/>
<jsp:setProperty property="*" name="reBean"/>
<%
	QuestionBean bean = (QuestionBean)session.getAttribute("bean");
	String name= bean.getName();
	String sessionID = (String)session.getAttribute("logID");
	reBean.setName(name);
	reBean.setWriter(sessionID);
	bMgr.replyUpQuestion(reBean.getRef(), reBean.getPos());
	bMgr.replyQuestion(reBean);
	int num = Integer.parseInt(request.getParameter("num"));
	response.sendRedirect("/Jsp-Auction/index.jsp?PAGE=board/question");
%>
