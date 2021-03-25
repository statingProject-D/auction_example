<%@ page contentType="text/html; charset=EUC-KR" import="board.QuestionBean"%>

<html>
<head>
<jsp:useBean id="bean" class="board.QuestionBean" scope="session"/>
<script language="javascript">
function check(){
	if(!document.regForm.content.value)
	{
		alert("내용을 입력하세요");
		return false;
	}
}
</script>
<%
	  String sessionID=(String)session.getAttribute("logID");
	  String nowPage = request.getParameter("nowPage");
	  QuestionBean bean2 = (QuestionBean)session.getAttribute("bean");
	  int num = bean2.getNum();

%>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<div align="center">
<br><br>
<form name="regForm" method="post" action="/Jsp-Auction/board/questionReplyproc.jsp" onsubmit="return check()">
<table width="527" cellspacing="0" cellpadding="7">
 <tr>
  <td>
   <table>
    <tr>
     <td>작성자</td>
     <td width="80%">
	  <input readonly type="text" class="form-control" id="inputEmail" value="<%=sessionID %>"></td>
    </tr>	
	<tr>
     <td>내  용</td>
     <td width="50%">
	  <textarea name="content" rows="3" cols="50">
</textarea>
      </td>
    </tr>
    <tr>
     <td colspan="2" height="5"><hr/></td>
    </tr>
	<tr> 
     <td colspan="2" align="center">
	  <input type="submit" value="등록" >
    </tr> 
   </table>
  </td>
 </tr>
</table>
 <input type="hidden" name="nowPage" value="<%=nowPage%>">
 <input type="hidden" name="num" value="<%=num%>">
</form> 
</div>
</body>
</html>