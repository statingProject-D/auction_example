<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*" import="java.sql.*"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@page import="notice.NoticeBean"%>
<jsp:useBean id="nMgr" class="notice.NoticeMgr" />
<%
	  request.setCharacterEncoding("EUC-KR");
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  String keyField = request.getParameter("keyField");
	  String keyWord = request.getParameter("keyWord");
	  nMgr.upCount(num);//��ȸ�� ����
	  NoticeBean bean = nMgr.getnotice(num);//�Խù� ��������
	  String subject = bean.getSubject();
	  String content = bean.getContent();
	  String name = bean.getName();
	  bean.setName(name);
	  int count = bean.getCount();
	  bean.setNum(num);
	  session.setAttribute("bean", bean);
%>
 
 <div class="section">
      <div class="container col-lg-offset-2">
        <form class="form-horizontal">
          <div class="row">
            <div class="col-md-3 col-lg-offset-6">
              <h1>��������</h1>
            </div>
          </div>
          <div class="form-group">
            <label for="inputEmail" class="col-lg-1 control-label">����</label>
            <div class="col-lg-10">
              <input readonly type="text" class="form-control" id="inputEmail" value="<%=subject %>">
              
            </div>
          </div>
          <div class="form-group">
            <label for="textArea" class="col-lg-1 control-label">����</label>
            <div class="col-lg-10">
              <textarea readonly class="form-control" rows="10" cols="30" id="textArea" style="margin-top: 0px; margin-bottom: 0px; height: 250px;">
<%=content %>
              </textarea>
            </div>
          </div>	
		
          <div class="form-group">
            <div class="col-lg-10 col-lg-offset-6">
<% String sessionID = (String)session.getAttribute("logID"); 


	if(sessionID!=null && sessionID.equals("admin"))
	{
%>
              <a class="btn btn-default" href="/Jsp-Auction/index.jsp?PAGE=board/noticeUpdate">����</a>
              <a class="btn btn-default" href="/Jsp-Auction/index.jsp?PAGE=board/noticeRemove">����</a>
<%} %>
            </div>
          </div>

        </form>
      </div>
    </div>
    <form name="listFrm" method="post">
	<input type="hidden" name="num" value="<%=num%>">
	</form>
