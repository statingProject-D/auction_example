<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*" import="java.sql.*"%>
<%@ page import="memberAction.*"%>
<%@ page import="product.*"%>
<jsp:useBean id="bean" class="product.ProductDTO" />
<jsp:useBean id="mgr" class="member_action.MemberMgr" />
<%
	String sessionID = (String)session.getAttribute("logID");
	Vector<ProductDTO> vlist = null;
	vlist=mgr.getMyProductList_Buy(sessionID);
%>
 <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1>구매현황</h1>
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
            <%for(int i=0;i<vlist.size();i++){
            	bean=vlist.get(i);%>
              <tr>
                <td class="text-xs-center"><%=bean.getProduct_id()%></td>
                <td class="text-xs-center"><%=bean.getProduct_name() %></td>
                <td class="text-xs-center"><%=bean.getProduct_now() %></td>
                <td class="text-xs-center"><%if(bean.getProduct_status()==1){%>
                	<font color="blue">진행중</font>
                <%}else if(bean.getProduct_status()==0){%>
                	<font color="red">경매종료</font>
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
