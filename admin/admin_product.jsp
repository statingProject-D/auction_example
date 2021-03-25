<%@page import="product.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*" import="java.text.*"%>
<%@ page import="product.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="bean" class="product.ProductDTO" />
<jsp:useBean id="mgr" class="product.ProductDAO" />
<%
	Vector<ProductDTO> vlist = null;
	vlist=mgr.product_AllList();
	
	
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    Calendar cal = Calendar.getInstance();
%> 
  <div class="section">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th>상품번호</th>
                  <th>상품이름</th>
                  <th>현재가</th>
                  <th>경매기간</th>
                  <th>판매자</th>
                  <th>상태</th>
                </tr>
              </thead>
              <tbody>
              
              <%for(int i=0; i<vlist.size(); i++){
							bean=vlist.get(i);
							int add = Integer.parseInt(bean.getProduct_date().substring(0,1));
							Date time = bean.getProduct_time();
							
							int year = time.getYear()+1900;
							int month = time.getMonth();
							int day = time.getDate();
							
							cal.set(year,month,day);
							cal.add(Calendar.DATE,add);
						%><tr>
								<td><%=bean.getProduct_id()%></td>
								<td><%=bean.getProduct_name()%></td>
								<td><%=bean.getProduct_now()%></td>
								<td><%=bean.getProduct_time()%>~<%=df.format(cal.getTime())%></td>
								<td><%=bean.getProduct_writer()%></td>
								<td><%if(bean.getProduct_status()==1){%>
									<font color="blue">진행중</font>
									<%}else{%>
									<font color="red">경매종료</font>
									<%}%></td>
								<td><a href="/Jsp-Auction/index.jsp?PAGE=admin/admin_productDelete.jsp?id=<%=bean.getProduct_id()%>" class="btn btn-block btn-primary-outline"
									draggable="true">삭제</a></td>
								<td><a href="/Jsp-Auction/index.jsp?PAGE=admin/admin_productUpdate.jsp?id=<%=bean.getProduct_id()%>" class="btn btn-block btn-primary-outline"
									draggable="true">종료</a></td>
							</tr>
						<% }%>
               
              
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>