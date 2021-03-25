<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@ page import="java.util.*" import="java.text.*"%>
<jsp:useBean id="bean" class="product.ProductDTO" />
<jsp:useBean id="mgr" class="product.ProductDAO" />
<%
	    request.setCharacterEncoding("euc-kr");
		String content = request.getParameter("PAGE");
		if (content == null)
		{
			content = "module/main";
		}
		
		Vector<ProductDTO> vlist = null;
		vlist=mgr.auctionEnd();
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	    Calendar cal = Calendar.getInstance();
	    Calendar now = Calendar.getInstance();
		for(int i=0;i<vlist.size();i++){
			bean=vlist.get(i);
			int add = Integer.parseInt(bean.getProduct_date().substring(0,1));
			Date time = bean.getProduct_time();
			
			int year = time.getYear()+1900;
			int month = time.getMonth();
			int day = time.getDate();
			
			cal.set(year,month,day);
			cal.add(Calendar.DATE,add);
			if(cal.before(now)){
				mgr.upEnd(bean.getProduct_id());
			}
		}
		
		
%>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/js/bootstrap.js"></script>
	
<link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.1/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="http://v4.pingendo.com/assets/bootstrap/themes/default.css"
	rel="stylesheet" type="text/css">


<link href="css/AuctionCss.css" rel="stylesheet" type="text/css">
<% %>
</head>
<body>
	<jsp:include page="module/header.jsp" />	
	<%
		if (content == "module/main") {%>
		<jsp:include page="module/slide.jsp" />
	<%}%>
	<jsp:include page="module/menu.jsp" />
	<jsp:include page='<%=content + ".jsp"%>' />
	<jsp:include page="module/footer.jsp" />



</body>

</html>