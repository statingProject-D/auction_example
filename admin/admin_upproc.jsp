<%@ page language="java" contentType="text/html; charset=EUC-KR"
	info="������¥:11�� 15��"
%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="bean" class="member_action.MemberBean"/>
<jsp:setProperty name="bean" property="*"/>

<jsp:useBean id="mgr" class="member_action.MemberMgr"/>
<%	
	String id = request.getParameter("mem_id");	//logID�� �ش��ϴ� ���ǰ�=mem_id ��ȯ
	mgr.updateMember(bean, id);				//db�����Ͽ� id�� �ش��ϴ� db���� ����
%>


<script>
alert("�����Ϸ�");
location.replace("/Jsp-Auction/index.jsp"); 
</script>





  