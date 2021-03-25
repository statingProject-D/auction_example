<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="board.QuestionBean"%>
 <jsp:useBean id="bMgr" class="board.QuestionMgr" />
 <% 
 	  request.setCharacterEncoding("EUC-KR");
	  String nowPage = request.getParameter("nowPage");
	  QuestionBean bean = (QuestionBean)session.getAttribute("bean");
	  String subject = bean.getSubject();
	  int num = bean.getNum();
	  String name = bean.getName(); 
	  String content = bean.getContent(); 

%>
<script>
function updateCheck(){
	if(document.regForm.subject.value==""){
		alert("제목을 입력하세요");
		document.regForm.subject.focus();
		return;
	}
	if(document.regForm.content.value==""){
		alert("내용을 입력하세요");
		document.regForm.content.focus();
		return;
	}
	document.regForm.submit();
}
function cancle(){
	history.go(-1);
}
</script>
 <div class="section">
      <div class="container col-lg-offset-2">
        <form name="regForm" class="form-horizontal" method="post" action="/Jsp-Auction/board/questionUpdateproc.jsp">
           <div class="row">
          <div class="col-md-3 col-lg-offset-6">
            <h1>질의응답</h1>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <hr class="col-md-offset-2">
          </div>
        </div>
          <div class="form-group">
            <label for="inputEmail" class="col-lg-1 control-label">제목</label>
            <div class="col-lg-10">
              <input type="text" name="subject" class="form-control" id="inputEmail" placeholder="<%=subject%>">
            </div>
          </div>
          <div class="form-group">
            <label for="textArea" class="col-lg-1 control-label">내용</label>
            <div class="col-lg-10">
              <textarea class="form-control" name="content" rows="3" id="textArea" style="margin-top: 0px; margin-bottom: 0px; height: 250px;"></textarea>
            </div>
          </div>
          <div class="form-group">
            <div class="col-lg-10 col-lg-offset-6">
              <input type="button" value="수정" class="btn btn-primary" onClick="updateCheck()">
              <input type="button" value="취소" class="btn btn-default" onClick="cancle()">
            </div>
          </div>
        </form>
      </div>
    </div>	
    <form name="listFrm" method="post">
	<input type="hidden" name="num" value="<%=num%>">
	</form>
