<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page contentType="text/html;charset=euc-kr"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.*,java.io.*"%>
<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@ page import="java.sql.*, java.util.Vector"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="productbean" class="product.ProductDTO" />
<jsp:setProperty name="productbean" property="*" />
<jsp:useBean id="mgr" class="product.ProductDAO" />

<%

String sessionID = (String)session.getAttribute("logID");
//C:\datafiles
//  "/Jsp-Auction/product_img/Desert.jpg"
String saveFolder = request.getServletContext().getRealPath("")+"/product_img";//업로드 파일 저장 위치
 	String encType = "euc-kr";
	String str="";
	int maxSize = 5 * 1024 * 1024;
	String spath="";
	try {
		MultipartRequest multi = null;
		multi = new MultipartRequest(request, saveFolder, maxSize,
				encType, new DefaultFileRenamePolicy());
		Enumeration params = multi.getParameterNames();

		while (params.hasMoreElements()) {
			String name = (String) params.nextElement();
			String value = multi.getParameter(name);
			if(name.equals("product_memo"))
			{
				productbean.setProduct_memo(value);
			}else if(name.equals("product_date")){
				productbean.setProduct_date(value);
			}else if(name.equals("product_name")){
				productbean.setProduct_name(value);
			}else if(name.equals("product_title")){
				productbean.setProduct_title(value);
			}else if(name.equals("product_unit")){
				productbean.setProduct_unit(Integer.parseInt(value));
			}else if(name.equals("product_stprice")){
				productbean.setProduct_stprice(Integer.parseInt(value));
			}
		}

		Enumeration files = multi.getFileNames();
		while (files.hasMoreElements()) {
			String name = (String) files.nextElement();
			String filename = multi.getFilesystemName(name);
			if(name.equals("upimg1")){
				productbean.setProduct_img1(filename);
			}else if(name.equals("upimg2")){
				productbean.setProduct_img2(filename);
			}else if(name.equals("upimg3")){
				productbean.setProduct_img3(filename);
			}
		}
	} catch (IOException ioe) {
		System.out.println(ioe);
	} catch (Exception ex) {
		System.out.println(ex);
	}
	productbean.setProduct_writer(sessionID);
	
	int result = mgr.productNew(productbean);
	if(result==1){
%>
		<script>
		location.replace("/Jsp-Auction/index.jsp?PAGE=product/product_list"); 
		</script>
	<% }else{%>
		<script>
		alert("등록 실패");
		history.go(-1);
		</script>
	<%}%>
	
