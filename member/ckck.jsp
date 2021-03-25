<%@page import="com.project.market.vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.sql.*,java.util.Vector"%>
<%
	String id = request.getParameter("mem_id");
%>

<jsp:useBean id="mgr" class="member_action.MemberMgr" />

<%
	int result = mgr.checkId(id);
	if(result>0){
		  out.print(false);
	}else {
	    out.print(true);
	}
%>