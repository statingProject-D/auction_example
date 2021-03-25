<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"  import="java.util.*"%>
<%@ page import="product.*"%>
<%@ page import="java.text.*"%>

<% 
	String sessionID = (String)session.getAttribute("logID");
	String ce_id = request.getParameter("id");
	int idx = ce_id.indexOf(".");
	String id = ce_id.substring(0,idx);
	Vector<TenderDTO> vlist = null;
%>
<jsp:useBean id="bean" class="product.ProductDTO" />
<jsp:useBean id="mgr" class="product.ProductDAO" />
<jsp:useBean id="T_bean" class="product.TenderDTO" />
<%
	bean = mgr.productDetail(Integer.parseInt(id));
	vlist=mgr.tenderList(Integer.parseInt(id));
	int nowprice = bean.getProduct_now();
	int unit = bean.getProduct_unit();
	
	
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    Calendar cal = Calendar.getInstance();
	int add = Integer.parseInt(bean.getProduct_date().substring(0,1));
	
	Date time = bean.getProduct_time();
		
	int year = time.getYear()+1900;
	int month = time.getMonth();
	int day = time.getDate();
		
	cal.set(year,month,day);
	cal.add(Calendar.DATE,add);

%>

   <div class="p-y-3 section">
      <div class="container bg-inverse container">
        <div class="p-y-1 row">
          <div class="form-group m-a-0">
            <label for="id" class="col-sm-2 control-label text-xs-center">
              <h2>Title :</h2>
            </label>
            <div class="col-sm-10">
              <h2><%=bean.getProduct_title() %></h2>
            </div>
          </div>
        </div>
        <br>
        <br>
        <div class="row">
          <div class="col-md-6">
            <div class="carousel slide" data-interval="false" data-ride="carousel"
            id="carousel-example">
              <div class="carousel-inner">
            
                <div class="carousel-item active">
                  <img class="center-block img-fluid" src="/Jsp-Auction/product_img/<%=bean.getProduct_img1() %>">
                </div>
                
                <div class="carousel-item">
                  <img class="img-fluid" src="/Jsp-Auction/product_img/<%=bean.getProduct_img2() %>">
                </div>
                
                 <div class="carousel-item">
                  <img class="img-fluid" src="/Jsp-Auction/product_img/<%=bean.getProduct_img3() %>">
                </div>
                
              </div>
              <a class="left carousel-control" href="#carousel-example" data-slide="prev"><i class="icon-prev  fa fa-angle-left"></i></a>
              <a class="right carousel-control" href="#carousel-example" data-slide="next"><i class="icon-next fa fa-angle-right"></i></a>
            </div>
          </div>
          <div class="col-md-6">
            <form class="text-center" method="post" name="product_detail" action="/Jsp-Auction/product/product_tender.jsp" onsubmit="return check()">
              <br>
              <div class="form-group">
                <label>상품이름</label>
                <br><%=bean.getProduct_name()%></div>
              <div class="form-group">
                <br>
                <br>
                <label>현재가</label>
                <br><%=bean.getProduct_now() %></div>
              <div class="form-group">
                <br>
                <br>
                <label>입찰단위</label>
                <br><%=bean.getProduct_unit() %></div>
              <div class="form-group">
                <br>
                <br>
                <label>경매기간</label>
                <br><%=bean.getProduct_time()%>~<%=df.format(cal.getTime())%></div>
              <br>
              <div class="form-group">
              	<%if(sessionID!=null){
              		if(!sessionID.equals(bean.getProduct_writer())){ 
              	%>
              	<input type="number" placeholder="입찰금액 입력해주세요" class="col-md-offset-2 text-danger" name="bid"/>
              	<button type="submit" class="btn btn-default col-md-offset-1">입찰</button>
              	<%}%>
              <%} %>
              	<input type="hidden" name="product_id" value="<%=id%>">
              	<br>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div> 
    <div class="p-y-3 section ">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="card-deck-wrapper">
              <div class="card-deck">
                <div class="card">
                  <textarea readonly class="form-control" rows="3" id="textArea" style="margin-top: 0px; margin-bottom: 0px; height: 250px;"><%=bean.getProduct_memo()%></textarea>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="section" >
      <div class="container">
        <div class="row">
          <div class="col-md-4  col-md-offset-4">
            <div class="col-md-12 text-center">경매현황
              <table class="table table-condensed table-hover col-md-3">
              <thead>
                  <tr>
                    <th class="text-xs-center">#</th>
                    <th class="text-xs-center">입찰자</th>
                    <th class="text-xs-center">입찰가</th>
                  </tr>
                </thead>
                <tbody>
                
             
				<%for(int i=0; i<vlist.size(); i++){
							T_bean=vlist.get(i);
						%>
                  <tr>
                    <td class="text-xs-center"><%=i+1 %></td>
                    <td class="text-xs-center"><%=T_bean.getTender_id()%></td>
                    <td class="text-xs-center"><%=T_bean.getTender_price() %></td>
                  </tr>
                
                  <%} %>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
	</div>    



<script language="javascript">
function check(){ 
	if(document.product_detail.bid.value<=<%=nowprice%>){
		alert("현재가 보다 높게 입찰하세요");
		return false;
	}
	if(document.product_detail.bid.value%<%=unit%>){
		alert("입찰단위에 맞춰주세요");
		return false;
	}
}
</script>

