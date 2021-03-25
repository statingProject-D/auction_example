<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script type="text/javascript">
function remove(){
	var retVal = confirm("삭제 하시겠습니까?");
	
	if( retVal == true )
	{
		alert("삭제되었습니다"); location.href="/Jsp-Auction/index.jsp?PAGE=board/noticeRemoveSuccess";
	}
	else
	{
	    alert("취소되었습니다"); location.href="/Jsp-Auction/index.jsp?PAGE=board/notice"
	}
}
</script>
<script>
javascript:remove();
</script>
