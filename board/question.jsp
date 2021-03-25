<%@page import="board.QuestionMgr"%>
<%@page import="board.QuestionBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*" import="java.sql.*"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="bMgr" class="board.QuestionMgr"/>

<%
response.setCharacterEncoding("euc-kr");

		int totalRecord = 0;
		int numPerPage=10;
		int pagePerBlock=15;
		
		int totalPage=0;
		int totalBlock=0;
		
		int nowPage=1;
		int nowBlock=1;
		
		int start=0;
		int end=10;
		
		int listSize=8;
		
		String keyWord="",keyField="";
		Vector<QuestionBean> vlist = null;
		if(request.getParameter("keyWord")!=null)
		{
				keyWord=request.getParameter("keyWord");
				keyField=request.getParameter("keyField");	
		}
		if(request.getParameter("nowPage")!=null)
		{
			nowPage=Integer.parseInt(request.getParameter("nowPage"));
		}
		
		if (request.getParameter("reload") != null){
			if(request.getParameter("reload").equals("true")) {
				keyWord = "";
				keyField = "";
			}
		}
		
		start=(nowPage * numPerPage) - numPerPage;
		end = numPerPage;
		
		totalRecord=bMgr.getTotalCount(keyField,keyWord);
		totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		nowBlock=(int)Math.ceil((double)nowPage/pagePerBlock);
		totalBlock=(int)Math.ceil((double)totalPage/pagePerBlock);
		vlist=bMgr.getBoardList(keyField,keyWord,start,end);	
		listSize=vlist.size();
%>
<script type="text/javascript">
	function list() {
		document.listFrm.action = "/Jsp-Auction/index.jsp?PAGE=board/question";
		document.listFrm.submit();
	}
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}
	
	function block(value){
		 document.readFrm.nowPage.value=<%=pagePerBlock%>*(value-1)+1;
		 document.readFrm.submit();
	} 

	function read(num){
		document.readFrm.num.value=num;
		document.readFrm.action="/Jsp-Auction/index.jsp?PAGE=board/questionRead";
		document.readFrm.submit();
	}
	
	function check() {
	     if (document.searchFrm.keyWord.value == "") {
	   alert("검색어를 입력하세요.");
	   document.searchFrm.keyWord.focus();
	   return;
	     }
	  document.searchFrm.submit();
	 }
</script>
<div class="section">
	<div class="container">
 
		<div class="col-md-12">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
<%
		if(vlist.isEmpty()) {
		%>
		 		<tr align="center" bgcolor="#FFFFFF" height="30">
		 	   <td colspan="6">등록된 글이 없습니다.</td>
		 	  </tr>
	<%
		}else{
			for(int i=0;i<numPerPage;i++)
			{
					if(i==listSize)break;
				
					QuestionBean bean=vlist.get(i);
					int num=bean.getNum();
					String name=bean.getName();
					String subject = bean.getSubject();
					String regdate=bean.getRegdate();
					int depth = bean.getDepth();
					int count = bean.getCount();
			
	%>
					<tr>
						<td><%=totalRecord-((nowPage-1)*numPerPage)-i %></td>
						<td><a href="javascript:read('<%= num%>')"><%=subject %></a></td>
						<td><%=name %></td>
						<td><%=regdate %></td>
						<td><%=count %></td>
					</tr>
				
<% 
			}
		}
%>
				</tbody>
<td colspan=5 align=center>
<%
		totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		int pageStart = (nowBlock -1)*pagePerBlock + 1 ;	
		int pageEnd = ((pageStart + pagePerBlock ) < totalPage) ?  (pageStart + pagePerBlock): totalPage+1; 

		if(totalPage !=0)
		{
		  	if (nowBlock > 1)
	  		{
%>
  			<a href="javascript:block('<%=nowBlock-1%>')">prev...</a>	
<% 	  		} %>

<%			for ( ; pageStart < pageEnd; pageStart++)
			{
%>		     	<a href="javascript:pageing('<%=pageStart %>')">
<%	
				if(pageStart==nowPage)
				{%>
					<font color="blue"> 	
<% 				} %>
				[<%=pageStart %>] 
<%				
				if(pageStart==nowPage) 
				{%>
					</font> <%
				}%></a> 
<%			}%>
<%		}	%>
		&nbsp; 
<%			if (totalBlock > nowBlock ){ 
%>			<a href="javascript:block('<%=nowBlock+1 %>')">.....next</a>
<% }%>
</td>
	
			</table>
		</div>
		<form  name="searchFrm"  method="post" action="/Jsp-Auction/index.jsp?PAGE=board/question">
			<table border="0" width="527" align=center cellpadding="4" cellspacing="0">
				<tr>
					<td align="center" valign="bottom">
						<select name="keyField" size="1" >
							<option value="name"> 아이디</option>
							<option value="subject"> 제 목</option>
							<option value="content"> 내 용</option>
						</select>
							<input type="text" size="16" name="keyWord">
							<input type="button"  value="찾기" onClick="javascript:check()">
							<input type="hidden" name="nowPage" value="1">
			  		</td>
			 	</tr>	
			</table>
		</form>
		<div class="col-md-8">
			<span style="margin-left: 51%"></span>
			
		</div>
		<div class="col-md-1 col-md-offset-2">
          <ul class="pagination">
<% String sessionID = (String)session.getAttribute("logID");

	if(sessionID!=null)
	{
%>
            <a class="btn btn-primary" href="./index.jsp?PAGE=board/question_write">질문하기</a>
<% }%>
          </ul>
        </div>
	</div>
</div>
	<form name="listFrm" method="get">
		<input type="hidden" name="reload" value="true"> 
		<input type="hidden" name="nowPage" value="1">
	</form>
	<form name="readFrm" method="post">
		<input type="hidden" name="PAGE" value="board/question">
		<input type="hidden" name="num"> 
		<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
		<input type="hidden" name="keyField" value="<%=keyField%>"> 
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
	</form>