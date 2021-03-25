<%@ page import="product.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*" import="java.sql.*"%>
<jsp:useBean id="bean" class="product.ProductDTO"/>
<jsp:useBean id="mgr" class="product.ProductDAO"/>
<%
int a=1;
Vector<ProductDTO> hotlist = null;
String search="";
if(search!=null)
	search=request.getParameter("search");
hotlist=mgr.mainList(search);
	String sessionID = (String) session.getAttribute("logID");
	if (sessionID != null) {
%>

<%
	} else {
%>
<script>
	alert("로그인부터 하세요");
	history.go(-1);
</script>
<%
	}
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
            <h1 class="text-center">경매 리스트</h1>
            <div class="row col-md-offset-10">
	        	<form name="main" method="post">
	           	<select name="search">
		            	<option value="regdate">최신순</option>
		            	<option value="price">가격순</option>
	           	</select>
	           	<input type="button"  value="찾기" onClick="javascript:check()">
	        	</form>
	        </div>
          </div>
        </div>
        
        
        

        
		<hr>
		 <div class="row">
          <%for(int i=0; i<hotlist.size(); i++){
				bean=hotlist.get(i);
				%>
			
	        <div class="col-md-4">
	          	<h3 align="center"><%=bean.getProduct_name()%></h3>
            	<p align="center">현재가 : <%=bean.getProduct_now()%></p>
          		<a href="/Jsp-Auction/index.jsp?PAGE=product/product_detail.jsp?id=<%=bean.getProduct_id()%>">
            	<img src="/Jsp-Auction/product_img/<%=bean.getProduct_img1()%>" class="img-responsive"></a>
            	<br>
            	<br>
          	</div>
          
      		<%if((a%3)==0){%>
      			
	      		<div class="row">
	      		
	      		</div>
	      		<hr>
      		<%}
      		a++;
      		
        }%>
        </div>




      </div>
    </div>
    <form method="post">
    	<input type="hidden" name="search" value="<%=search%>">
    </form>
    
