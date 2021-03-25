<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*" import="java.sql.*"%>
<%@ page import="memberAction.*"%>
<%@ page import="product.*"%>
<jsp:useBean id="bean2" class="product.ProductDTO" />
<jsp:useBean id="mgr" class="member_action.MemberMgr" />
<%
	String sessionID = (String)session.getAttribute("logID");
	Vector<ProductDTO> vlist2 = null;
	vlist2=mgr.getMyProductList_Sell(sessionID);
%>
 <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1>판매현황</h1>
          </div>
        </div>
        <div class="row">
          <div class="bg-faded col-md-12">
            <table class="table">
              <thead>
                <tr>
                  <th class="info text-xs-center">상품ID</th>
                  <th class="info text-xs-center">상품명</th>
                  <th class="info text-xs-center">현재가</th>
                  <th class="info text-xs-center">경매상태</th>
                </tr>
              </thead>
             <tbody>
            <%for(int i=0;i<vlist2.size();i++){
            	bean2=vlist2.get(i);%>
              <tr>
                <td class="text-xs-center"><%=bean2.getProduct_id()%></td>
                <td class="text-xs-center"><%=bean2.getProduct_name()%></td>
                <td class="text-xs-center"><%=bean2.getProduct_now() %></td>
                <td class="text-xs-center">
                <%if(bean2.getProduct_status()==1){%>
                	<font color="blue">진행중</font>
                <%}else if(bean2.getProduct_status()==0){%>
                	<font color="red">경매종료</font>
                <%}%>
                <td class="text-xs-center">
                <%if(bean2.getProduct_status()==0){
                	if(bean2.getProduct_myvalue()==bean2.getProduct_now()){ %>
						낙찰을 축하드립니다!
					<%}else {%>
						낙찰실패..
					<%}%>       
				<%}else if(bean2.getProduct_status()==1){
					if(bean2.getProduct_myvalue()==bean2.getProduct_now()){ %>
						현재 1순위
					<%}else {%>
						<a href="/Jsp-Auction/index.jsp?PAGE=product/product_detail.jsp?id=<%=bean2.getProduct_id()%>">재입찰</a>
					<%}%>  
				<%}%>
				     
                </td>
              </tr>
             <%}%>
            </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  