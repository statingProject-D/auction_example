<%@page import="notice.NoticeBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.sql.*, java.util.Vector"%>
<%
	request.setCharacterEncoding("euc-kr");
	Timestamp time = new Timestamp(System.currentTimeMillis());
%>
<jsp:useBean id="bean" class="notice.NoticeBean" />
<jsp:setProperty name="bean" property="*" />
<jsp:useBean id="mgr" class="notice.NoticeMgr" />

<%
	String id= (String)session.getAttribute("logID");
	bean.setName(id);
	bean.setRegdate(time.toString());
	mgr.insertNotice(bean);
	response.sendRedirect("/Jsp-Auction/index.jsp?PAGE=board/notice");
%>
