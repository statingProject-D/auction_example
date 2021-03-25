<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*" import="java.sql.*"%>
<%@ page import="memberAction.*"%>
<%@ page import="product.*"%>
<jsp:useBean id="bean" class="product.ProductDTO" />
<jsp:useBean id="bean2" class="product.ProductDTO" />
<jsp:useBean id="mgr" class="member_action.MemberMgr" />
<%
	String sessionID = (String)session.getAttribute("logID");
	Vector<ProductDTO> vlist = null;
	Vector<ProductDTO> vlist2 = null;
	vlist=mgr.getMyProductList_Buy(sessionID);
	vlist2=mgr.getMyProductList_Sell(sessionID);
%>


<div class="section">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1>�Ǹ���Ȳ</h1>
        </div>
      </div>
      <div class="row">
        <div class="bg-faded col-md-12">
          <table class="table">
            <thead>
              <tr>
                <th class="info text-xs-center">��ǰID</th>
                <th class="info text-xs-center">��ǰ��</th>
                <th class="info text-xs-center">���簡</th>
                <th class="info text-xs-center">��Ż���</th>
              </tr>
            </thead>
            <tbody>
            <%for(int i=0;i<vlist.size();i++){
            	bean=vlist.get(i);
            	if(i==5){break;}%>
              <tr>
                <td class="text-xs-center"><%=bean.getProduct_id()%></td>
                <td class="text-xs-center"><%=bean.getProduct_name() %></td>
                <td class="text-xs-center"><%=bean.getProduct_now() %></td>
                <td class="text-xs-center"><%if(bean.getProduct_status()==1){%>
                	<font color="blue">������</font>
                <%}else if(bean.getProduct_status()==0){%>
                	<font color="red">�������</font>
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
  <div class="section">
    <div class="container">
      <div class="row">
        <div class="col-lg-2 col-md-offset-5"><a href="./index.jsp?PAGE=member/mypage_product_buy" class="btn btn-block btn-info" draggable="true">������</a></div>

      </div>
    </div>
  </div>

  <div class="section">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <hr class="" draggable="true">
        </div>
      </div>
    </div>
  </div>


  <div class="section">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1>������Ȳ</h1>
        </div>
      </div>
      <div class="row">
        <div class="bg-faded col-md-12">
          <table class="table">
            <thead>
              <tr>
                <th class="info text-xs-center">��ǰID</th>
                <th class="info text-xs-center">��ǰ��</th>
                <th class="info text-xs-center">���簡</th>
                <th class="info text-xs-center">��Ż���</th>
                <th class="info text-xs-center">���</th>
              </tr>
            </thead>
            <tbody>
            <%for(int i=0;i<vlist2.size();i++){
            	bean2=vlist2.get(i);
            	if(i==5){break;}%>
              <tr>
                <td class="text-xs-center"><%=bean2.getProduct_id()%></td>
                <td class="text-xs-center"><%=bean2.getProduct_name()%></td>
                <td class="text-xs-center"><%=bean2.getProduct_now() %></td>
                <td class="text-xs-center">
                <%if(bean2.getProduct_status()==1){%>
                	<font color="blue">������</font>
                <%}else if(bean2.getProduct_status()==0){%>
                	<font color="red">�������</font>
                <%}%>
                <td class="text-xs-center">
                <%if(bean2.getProduct_status()==0){
                	if(bean2.getProduct_myvalue()==bean2.getProduct_now()){ %>
						������ ���ϵ帳�ϴ�!
					<%}else {%>
						��������..
					<%}%>       
				<%}else if(bean2.getProduct_status()==1){
					if(bean2.getProduct_myvalue()==bean2.getProduct_now()){ %>
						���� 1����
					<%}else {%>
						<a href="/Jsp-Auction/index.jsp?PAGE=product/product_detail.jsp?id=<%=bean2.getProduct_id()%>">������</a>
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
  <div class="section">
    <div class="container">
      <div class="row">
        <div class="col-lg-2 col-md-offset-5"><a href="./index.jsp?PAGE=member/mypage_product_sell" class="btn btn-block btn-info" draggable="true">������</a></div>

      </div>
    </div>
  </div>











