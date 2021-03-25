<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*" import="java.sql.*"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@page import="board.QuestionBean"%>
<jsp:useBean id="bMgr" class="board.QuestionMgr" />
<%
	  request.setCharacterEncoding("EUC-KR");
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  String keyField = request.getParameter("keyField");
	  String keyWord = request.getParameter("keyWord");
	  bMgr.upCount(num);//조회수 증가
	  QuestionBean bean = bMgr.getBoard(num);//게시물 가져오기
	  String subject = bean.getSubject();
	  String content = bean.getContent();
	  String name = bean.getName();
	  bean.setName(name);
	  int count = bean.getCount();
	  bean.setNum(num);
	  session.setAttribute("bean", bean);
	  Vector<QuestionBean> plist = null;
	  plist=bMgr.getQuestionReplyList(num);
	  int listSize=plist.size();

%>
 
 <div class="section">
      <div class="container col-lg-offset-2">
        <form class="form-horizontal">
          <div class="row">
            <div class="col-md-3 col-lg-offset-6">
              <h1>질의응답</h1>
            </div>
          </div>
          <div class="form-group">
            <label for="inputEmail" class="col-lg-1 control-label">제목</label>
            <div class="col-lg-10">
              <input readonly type="text" class="form-control" id="inputEmail" value="<%=subject %>">
              
            </div>
          </div>
          <div class="form-group">
            <label for="textArea" class="col-lg-1 control-label">내용</label>
            <div class="col-lg-10">
              <textarea readonly class="form-control" rows="10" cols="30" id="textArea" style="margin-top: 0px; margin-bottom: 0px; height: 250px;">
<%=content %>
              </textarea>
            </div>
          </div>	
          <div class="form-group">
            <label for="textArea" class="col-lg-1 control-label">댓글</label>
            <div class="col-lg-10">
    
    <%
              for(int i=0;i<listSize;i++)
			  {
					if(i==listSize)break;
				
					QuestionBean nbean=plist.get(i);
					String writer=nbean.getWriter(); // 댓글 작성자
					String content2=nbean.getContent();  // 댓글 내용
					String regdate=nbean.getRegdate(); // 댓글 단 시간
	%> <table><tr><td width=500><%=content2%></td><td width=200>작성자 :<%=writer%></td><td> 작성시간 : <%=regdate%></td></tr></table>
<%} %>
            
            </div>
          </div>
          
<% String sessionID = (String)session.getAttribute("logID"); 
	if(sessionID!=null && (sessionID.equals(sessionID) || sessionID.equals("admin")))
	{
%>
		
          <div class="form-group">
            <div class="col-lg-10 col-lg-offset-6">
				<a class="btn btn-default" href="/Jsp-Auction/index.jsp?PAGE=board/questionReply.jsp?nowPage=<%=nowPage%>" >댓글달기</a>
			
<%	}

	if(sessionID!=null && (sessionID.equals(name) || sessionID.equals("admin")))
	{
%>
              <a class="btn btn-default" href="/Jsp-Auction/index.jsp?PAGE=board/questionUpdate">수정</a>
              <a class="btn btn-default" href="/Jsp-Auction/index.jsp?PAGE=board/questionRemove">삭제</a>
<%} %>
            </div>
          </div>

        </form>
      </div>
    </div>
    <form name="listFrm" method="post">
	<input type="hidden" name="num" value="<%=num%>">
	</form>
