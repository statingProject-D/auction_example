<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	String sessionID = (String)session.getAttribute("logID");
	if(sessionID!=null)
	{
%>
				
<%
	}else{
%>
	<script>
		alert("�α��κ��� �ϼ���");
		history.go(-1);
	</script>
<%
	}
%>

<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script>
function readURL(input){
	var sl = document.getElementById(input.getAttribute('id')).getAttribute('id');
	if(input.files && input.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){
			if(sl=="sl1"){
				$('#slide1').attr('src',e.target.result);
   			}else if(sl=="sl2"){
				$('#slide2').attr('src',e.target.result);
   			}else if(sl=="sl3"){
				$('#slide3').attr('src',e.target.result);
   			}
		}
			reader.readAsDataURL(input.files[0]);
		}  
  
}
function Check(){
	if(document.regForm.product_name.value==""){
		alert("������ �Է��ϼ���");
		return false; 
	}
	if(document.regForm.product_stprice.value==""){
		alert("���۰��� �Է��ϼ���");
		return false;
	}
	if(document.regForm.product_unit.value==""){
		alert("���������� �Է��ϼ���");
		return false;
	}
	if(document.regForm.product_date.value==""){
		alert("��űⰣ�� �����ϼ���");
		return false;
	}
	if(document.regForm.product_title.value==""){
		alert("Title�� �Է��ϼ���");
		return false;
	}
	if(document.regForm.product_memo.value==""){
		alert("�޸� �Է��ϼ���");
		return false;
	}
	
}
</script>





 <form method="post" action="/Jsp-Auction/product/product_addproc.jsp" enctype="multipart/form-data" name="regForm" onsubmit="return Check()">
  <div class="p-y-3 section">
    <div class="bg-inverse container">
      <div class="p-y-1 row">


        <div class="form-group m-a-0">
          <label for="product_title" class="col-sm-2 control-label text-xs-center">
            <h2>Title : </h2></label>
          <div class="col-sm-10"><br>
            <input type="text" class="form-control" name="product_title" id="product_title">
          </div>
        </div>
      </div>
      <br>
      <br>
      <div class="row">
        <div class="col-md-6">
           <div class="carousel slide" data-interval="false" data-ride="carousel" id="carousel-example">
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img id="slide1" class="center-block img-fluid" src="">
              </div>
              <div class="carousel-item">
                <img class="img-fluid" id="slide2" src="">
              </div>
               <div class="carousel-item">
                <img class="img-fluid" id="slide3" src="">
              </div>
            </div>
            <a class="left carousel-control" href="#carousel-example" data-slide="prev"><i class="icon-prev  fa fa-angle-left"></i></a>
            <a class="right carousel-control" href="#carousel-example" data-slide="next"><i class="icon-next fa fa-angle-right"></i></a>

          </div>
          	<script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js"></script>
			<link rel="stylesheet" href="css/dropzone.css">

		
           
          		<label  class="btn btn-block btn-danger-outline">
              		  �̹��� <input type="file" style="display: none;" id="sl1" onchange="readURL(this)" name="upimg1">
            	</label>
            	<label  class="btn btn-block btn-danger-outline">
              		  �̹��� <input type="file" style="display: none;" id="sl2" onchange="readURL(this)" name="upimg2">
            	</label>
            	<label  class="btn btn-block btn-danger-outline">
              		  �̹��� <input type="file" style="display: none;" id="sl3" onchange="readURL(this)" name="upimg3">
            	</label>
            
            
           
            
        	
        </div>
        <div class="col-md-6"> 
		

<br><br>
          
            <div class="form-group">
              <label for="product_name">��ǰ�̸�</label>
              <input type="text" class="form-control" id="product_name" name="product_name" placeholder="ex)����">
            </div>
            <div class="form-group">
              <label for="product_stprice">���۰�</label>
              <input type="text" class="form-control" id="product_stprice" name="product_stprice" placeholder="ex)50000">
            </div>
            <div class="form-group">
              <label for="product_unit">��������</label>
              <input type="text" class="form-control" id="product_unit" name="product_unit" placeholder="ex)1000">
            </div>
            <div class="form-group">
              <label for="product_date">��űⰣ</label>
              <select class="form-control" id="product_date" name="product_date">
              	<option>3��</option>
          	  	<option>4��</option>
              	<option>5��</option>
              	<option>6��</option>
              	<option>7��</option>
              </select>
            </div>
            <br>
            <button type="submit" class="btn btn-default col-md-offset-5" onClick="Check()">���</button>
         
        </div>



      </div>
    </div>
  </div>

  <div class="p-y-3 section">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="card-deck-wrapper">
            <div class="card-deck">

              <div class="card">

                <textarea class="form-control" rows="10" id="product_memo" style="margin-top: 0px; margin-bottom: 0px; height: 250px;" name="product_memo"></textarea>
              </div>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>


 </form>







