<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
	String sessionID = (String)session.getAttribute("logID");
	if(sessionID!=null)
	{
%>
				
<%
	}else{
%>
	<script>
		alert("로그인부터 하세요");
		history.go(-1);
	</script>
<%
	}
%>
  <div class="section">
      <div class="container col-lg-offset-2">
        <form class="form-horizontal" method="post" action="/Jsp-Auction/board/questionproc.jsp">
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
              <input type="text" name="subject" class="form-control" id="inputEmail" placeholder="제목">
            </div>
          </div>
          <div class="form-group">
            <label for="textArea" class="col-lg-1 control-label">내용</label>
            <div class="col-lg-10">
              <textarea class="form-control" name="content"rows="3" id="textArea" style="margin-top: 0px; margin-bottom: 0px; height: 250px;"></textarea>
            </div>
          </div>
          <div class="form-group">
            <div class="col-lg-10 col-lg-offset-6">
              <button type="reset" class="btn btn-default">Cancel</button>
              <button type="submit" class="btn btn-primary">Submit</button>
            </div>
          </div>
        </form>
      </div>
    </div>