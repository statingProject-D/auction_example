<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script type="text/javascript">
function remove(){
	var retVal = confirm("���� �Ͻðڽ��ϱ�?");
	
	if( retVal == true )
	{
		alert("�����Ǿ����ϴ�"); location.href="/Jsp-Auction/index.jsp?PAGE=board/noticeRemoveSuccess";
	}
	else
	{
	    alert("��ҵǾ����ϴ�"); location.href="/Jsp-Auction/index.jsp?PAGE=board/notice"
	}
}
</script>
<script>
javascript:remove();
</script>
