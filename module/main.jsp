<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*" import="java.sql.*"%>
<%@ page import="product.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="bean" class="product.ProductDTO" />
<jsp:useBean id="mgr" class="product.ProductDAO" />
<%
	Vector<ProductDTO> hotlist = null;
	String search="";
	if(search!=null)
		search=request.getParameter("search");
	hotlist=mgr.mainList(search);
	String sessionID = (String)session.getAttribute("logID");
%>
<script>
function check() {
	document.main.submit();
}
</script>


 <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center">Hot Auction</h1>
            <div class="row col-md-offset-10">
	        	<form name="main" method="post">
	           	<select name="search">
		            	<option value="regdate">�ֽż�</option>
		            	<option value="price">���ݼ�</option>
	           	</select>
	           	<input type="button"  value="ã��" onClick="javascript:check()">
	        	</form>
	        </div>
          </div>
        </div>
        <br>
        <hr>
        <div class="row">
        
        	<%for(int i=0; i<hotlist.size(); i++){
				bean=hotlist.get(i);
				if(i==3){break;}
				%>
							
          	<div class="col-md-4">
          		<h3 align="center"><%=bean.getProduct_name()%></h3>
            	<p align="center">���簡 : <%=bean.getProduct_now()%></p>
	            <a href="/Jsp-Auction/index.jsp?PAGE=product/product_detail.jsp?id=<%=bean.getProduct_id()%>">
	            <img src="/Jsp-Auction/product_img/<%=bean.getProduct_img1()%>" class="img-responsive"></a>
          	</div>
          	<%} %>
        </div>
        <hr>
        <div class="row">
			<%for(int i=3; i<hotlist.size(); i++){
				bean=hotlist.get(i);
				if(i==6){break;}
				%>
							
          	<div class="col-md-4">
          		<h3 align="center"><%=bean.getProduct_name()%></h3>
           		<p align="center">���簡 : <%=bean.getProduct_now()%></p>
            	<a href="/Jsp-Auction/index.jsp?PAGE=product/product_detail.jsp?id=<%=bean.getProduct_id()%>">
            	<img src="/Jsp-Auction/product_img/<%=bean.getProduct_img1()%>" class="img-responsive"></a>
         	</div>
       	<%} %> 
       	</div>
      </div>
    </div>
    <form method="post">
    	<input type="hidden" name="search" value="<%=search%>">
    </form>