<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/additional-methods.min.js"></script>
<script type="text/javascript" src="js/messages_ko.min.js"></script>

<div class="section">
	<div class="container">
	
	<table align="center" width=80%>
			<tr>
				<td colspan=6 align="center"><h1>ȸ������</h1></td>
			<tr>
				<td align="center"><h2>�������</h2></td>
				<td><h3>></h3></td>
				<td align="center"><h2><u>�����Է�</u></h2></td>
				<td><h3>></h3></td>
				<td align="center"><h2>���ԿϷ�</h2></td>
	</table>
	<br><br><br>
	
<form class="form-horizontal"  method="post" action="/Jsp-Auction/member/joinproc.jsp" name="join2" onsubmit="return check()">

<!-- ���� �� : id -->
  <div class="form-group">
    <label for="id" class="col-sm-4 control-label">ID</label>
    <div class="col-sm-3">
      <input type="text" class="form-control" name="mem_id" id="mem_id" placeholder="���̵� �Է����ּ���"/>
    </div>
  </div>
  
  <!-- ���� �� : password-->
  <div class="form-group">
    <label for="pass" class="col-sm-4 control-label">Password</label>
    <div class="col-sm-3">
      <input type="password" class="form-control" name="mem_password" placeholder="Password">
    </div>
  </div>
  
  <!-- ���� �� : pass2 -->
  <div class="form-group">
    <label for="pass2" class="col-sm-4 control-label">Confirm Password</label>
    <div class="col-sm-3">
      <input type="password" class="form-control" name="pass2" placeholder="Confirm Password">
    </div>
  </div>
  
  <hr>
  
<!-- ���� �� : name -->
 <div class="form-group">
    <label for="name" class="col-sm-4 control-label">Name</label>
    <div class="col-sm-3">
      <input type="text" class="form-control" name="mem_name" placeholder="Name">
    </div>
  </div>
  
  
  <!-- ���ڰ� : gender (value : man, woman)  -->
  <div class="form-group">
			<label for="gender" class="col-sm-4 control-label">Gender</label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<label class="radio-inline">
				<input type="radio" name="mem_sex" value="man" checked> ����
			</label>
		
			<label class="radio-inline">
				<input type="radio" name="mem_sex" value="woman" > ����
			</label>
   </div>
  
  
  
  
  
  
   <!-- ���� �� : year1, month, day -->
  <div class="form-group">
      <label for="select" class="col-lg-4 control-label">Birth</label>
      <div class="col-lg-2">
        <select class="form-control" name="year">
          <%
          	for(int i=1970;i<=2016;i++)
          	{
          %>
          		<option> <%=i %></option>
			<%
          	}
          %>
        </select>
      </div>
      
      <div class="col-lg-1">
        <select class="form-control" name="month">
          <%
          	for(int i=1;i<=12;i++)
          	{
          		if(i<10)
          		{
          	%>		
          	<option><%=0%><%=i %></option>
          <%
          		}
          		else{
 
          %>
          		<option><%=i %></option>
          <%
          			}
          	}
          %>
        </select>
      </div>
      
      <div class="col-lg-1">
        <select class="form-control" name="day">
          <%
          	for(int i=1;i<=31;i++)
          	{
          		if(i<10)
          		{
          	%>		
          	<option><%=0%><%=i %></option>
          <%
          		}
          		else{
 
          %>
          		<option><%=i %></option>
          <%
          			}
          	}
          %>
        </select>
      </div>
      
  </div>

  <!-- ���� �� : phone1, phone2, phone3 -->
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
      	<input type="text" class="form-control" name="phone2" maxlength="4">
   	   </div>
    
      <div class="col-sm-2">
        <input type="text" class="form-control" name="phone3" maxlength="4">
      </div>
	</div>
  
  <!-- ���� �� : email -->
  <div class="form-group">
    <label for="email" class="col-sm-4 control-label">Email</label>
    <div class="col-sm-3">
      <input type="email" class="form-control" name="mem_email" placeholder="ex) kungfumong@naver.com">
    </div>
  </div>
  
  <!-- ���� �� : address1 -->
  <div class="form-group">
    <label for="addres1" class="col-sm-4 control-label">Address</label>
    <div class="col-sm-5">
      <input type="text" class="form-control" name="address1">
    </div>
  </div>
  
  <!-- ���� �� : address2 -->
   <div class="form-group">
    <label for="addres2" class="col-sm-4 control-label">Address2</label>
    <div class="col-sm-5">
      <input type="text" class="form-control" name="address2">
    </div>
  </div>
  
  
  
  <div class="form-group">
    <div class="col-sm-offset-5">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 	
      <button type="button" class="btn btn-default" onclick="/Jsp-Auction/index.jsp?PAGE=member/join">Back</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <button type="submit" class="btn btn-default">Sign in</button>
    </div>
 
  </div>
  
  
</form>


</div>
</div>





<script language="javascript">
function check(){
	if(!document.join2.mem_password.value){
		alert("Password�� �Է��ϼ���");
		return false;
	}
	if(document.join2.mem_password.value != document.join2.pass2.value){
		alert("Password�� ���� �ٸ��ϴ�.");
		return false;
	}
	if(!document.join2.mem_name.value){
		alert("�̸��� �Է��ϼ���");
		return false;
	}
	if(!document.join2.mem_phone2.value){
		alert("����ó�� �Է��ϼ���");
		return false;
	}
	if(!document.join2.mem_phone3.value){
		alert("����ó�� �Է��ϼ���");
		return false;
	}
	if(!document.join2.mem_email.value){
		alert("�̸����� �Է��ϼ���");
		return false;
	}
	if(!document.join2.address1.value){
		alert("�ּҸ� �Է��ϼ���");
		return false;
	}
	if(!document.join2.address2.value){
		alert("�ּҸ� �Է��ϼ���");
		return false;
	}
	
}

</script>


<script>
$(function(){
        $("form").validate({
            rules: {
                mem_id: {
                	required : true,
                	minlength : 2,
                    remote: "member/ckck.jsp"
                }
            },
            //��Ģüũ ���н� ��µ� �޽���
            messages : {
                mem_id: {
                	required : "�ʼ����Է��ϼ���",
                	minlength : "�ּ� {0}�����̻��̾�� �մϴ�",
                    remote : "�����ϴ� ���̵��Դϴ�"
                }
            }
        });
})
</script>