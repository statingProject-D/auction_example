<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="product.*" %>

<jsp:useBean id="mgr" class="product.ProductDAO"/>
<%	

	String get_id = request.getParameter("id");
	int idx = get_id.indexOf(".");
	int id = Integer.parseInt(get_id.substring(0,idx));
	boolean result = mgr.productDelete(id);
	if(result==true){
		%>
		<script>
		alert("�����Ǿ����ϴ�.");
		location.replace("/Jsp-Auction/index.jsp?PAGE=admin/admin_product"); 
		</script>
	<%}else{%>
		<script>
		alert("��������");
		history.go(-1);
		</script>
	<%}
	
%>