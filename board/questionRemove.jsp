<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="board.QuestionBean"%>
 <jsp:useBean id="bMgr" class="board.QuestionMgr" />

<script type="text/javascript">
function remove(){
	var retVal = confirm("���� �Ͻðڽ��ϱ�?");
	
	if( retVal == true )
	{
		alert("�����Ǿ����ϴ�"); location.href="/Jsp-Auction/index.jsp?PAGE=board/questionRemoveSuccess";
	}
	else
	{
	    alert("��ҵǾ����ϴ�"); location.href="/Jsp-Auction/index.jsp?PAGE=board/question"
	}
}
</script>
<script>
javascript:remove();
</script>
