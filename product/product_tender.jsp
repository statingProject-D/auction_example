<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="mgr" class="product.ProductDAO" />
<%
	String sessionID = (String)session.getAttribute("logID");
	Integer bid_price = Integer.parseInt(request.getParameter("bid"));
	Integer product_num = Integer.parseInt(request.getParameter("product_id"));
	
	int result = mgr.tenderNew(product_num,sessionID,bid_price);
	if(result==1){
		int now = mgr.productUpdate(product_num, bid_price);
	%>
		<script>
		alert("등록 성공");
		location.replace("/Jsp-Auction/index.jsp?PAGE=product/product_detail.jsp?id=<%=product_num%>"); 
		</script>
	<%}else{
		int ck = mgr.tenderSearch(product_num,sessionID);
		if(ck==1){
			int up = mgr.tenderUpdate(product_num, sessionID, bid_price);
			int now = mgr.productUpdate(product_num, bid_price);
			%>
			<script>
			alert("등록 성공");
			location.replace("/Jsp-Auction/index.jsp?PAGE=product/product_detail.jsp?id=<%=product_num%>"); 
			</script>
		<%}else{%>
			<script>
			alert("등록 실패");
			history.go(-1);
			</script>
		<%}
	}

%>

	
			
		