<%@ page import="memberAction.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>

<jsp:useBean id="bean" class="member_action.MemberBean"/>
<jsp:useBean id="mgr" class="member_action.MemberMgr"/>
<%	
	String id=(String)session.getAttribute("logID");	//logID에 해당하는 세션값=mem_id 반환
	bean = mgr.getMemberList(id);				//db연동하여 id에 해당하는 db정보 수정
%>

  
<div class="section">
	<div class="container">
	
	<table align="center" width=80%>
			<tr>
				<td colspan=6 align="center"><h1>정보수정</h1></td>
			</tr>
	</table>
	<br><br><br>
	
<form class="form-horizontal"  method="post" action="/Jsp-Auction/member/updateproc.jsp">

	<div class="form-group">
    	<label for="ID" class="col-sm-4 control-label">ID</label>
    		<div class="col-sm-3">
      			<input type="text" class="form-control" name="mem_id" readonly value="<%=id%>">
    		</div>
  	</div>


  <!-- 인자 값 : pass-->
  <div class="form-group">
    <label for="pass" class="col-sm-4 control-label">Password</label>
    <div class="col-sm-3">
      <input type="password" class="form-control" name="mem_password" placeholder="Password">
    </div>
  </div>
  
  <!-- 인자 값 : pass2 -->
  <div class="form-group">
    <label for="pass2" class="col-sm-4 control-label">Confirm Password</label>
    <div class="col-sm-3">
      <input type="password" class="form-control" name="pass2" placeholder="Confirm Password">
    </div>
  </div>
  
  <hr>
  


  
 
  

  <!-- 인자 값 : phone1, phone2, phone3 -->
	<div class="form-group">
      <label for="phone" class="col-lg-4 control-label">Phone</label>
      <div class="col-lg-2">
        <select class="form-control" name="phone1">
          <option>010</option>
          <option>011</option>
          <option>018</option>
          <option>012</option>
        </select>
      </div>
      
       <div class="col-sm-2">
      	<input type="text" class="form-control" name="phone2" value="<%=bean.getPhone2()%>">
   	   </div>
    
      <div class="col-sm-2">
        <input type="text" class="form-control" name="phone3" value="<%=bean.getPhone3()%>">
      </div>
	</div>
  
  <!-- 인자 값 : email -->
  <div class="form-group">
    <label for="email" class="col-sm-4 control-label">Email</label>
    <div class="col-sm-3">
      <input type="email" class="form-control" name="mem_email" value="<%=bean.getMem_email()%>">
    </div>
  </div>
  
  <!-- 인자 값 : address1 -->
  <div class="form-group">
    <label for="addres1" class="col-sm-4 control-label">Address</label>
    <div class="col-sm-5">
      <input type="text" class="form-control" name="address1" value="<%=bean.getAddress1()%>">
    </div>
  </div>
  
  <!-- 인자 값 : address2 -->
   <div class="form-group">
    <label for="addres2" class="col-sm-4 control-label">Address2</label>
    <div class="col-sm-5">
      <input type="text" class="form-control" name="address2" value="<%=bean.getAddress2()%>">
    </div>
  </div>
  
  
  
  <div class="form-group">
    <div class="col-sm-offset-5">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 	
      <button type="submit" class="btn btn-default">Back</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <button type="submit" class="btn btn-default">Update</button>
    </div>
 
  </div>
  
  
</form>


</div>
</div>