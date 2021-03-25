<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

  <div class="section">
    <div class="container">
      <table align="center" width="80%">
        <tbody>
          <tr>
            <td colspan="6" align="center">
              <h1>회원가입</h1></td>
          </tr>
          <tr>
            <td align="center">
              <h2><u>약관동의</u></h2></td>
            <td>
              <h3>&gt;</h3></td>
            <td align="center">
              <h2>정보입력</h2></td>
            <td>
              <h3>&gt;</h3></td>
            <td align="center">
              <h2>가입완료</h2></td>
          </tr>
        </tbody>
      </table>
      <br>
      <br>
      <br>
<form method="post" action="/Jsp-Auction/index.jsp?PAGE=member/join2" name="join1" onsubmit="return check()">
      <table align="center" width="80%">
        <tbody>
          <tr>
            <td align="center" width="45%" class="text-xs-left">이용약관 동의 </td>
            <td width="10%"></td>
            <td align="center" width="45%" class="text-xs-left">개인정보 수집 및 이용에 대한 안내</td>
          </tr>
          <tr>
            <td>
              <textarea cols="30" rows="10">경매사이트 이용약관입니다! 경매사이트 이용약관입니다! 경매사이트 이용약관입니다! 경매사이트 이용약관입니다!</textarea>
            </td>
            <td width="10%"></td>
            <td>
              <textarea cols="30" rows="10">개인정보 수집 이용에 대한 안내입니다. 개인정보 수집 이용에 대한 안내입니다</textarea>
            </td>
          </tr>
          <tr>
            <td>
              <input type="checkbox" name="ck1">약관 내용에 동의합니다
            </td>
            <td width="10%"></td>
            <td>
              <input type="checkbox" name="ck2">개인 정보 수집이용에 동의합니다
            </td>
          </tr>
          <tr>
          </tr>
        </tbody>
      </table>

      <div class="collapse navbar-collapse" id="navbar-ex-collapse">
        <ul class="nav navbar-nav navbar-right">
          <li class="active">
              <input type="submit" value="동의" class="form-control">
          </li>
        </ul>
      </div>
      </form>
    </div>
  </div>


<script language="javascript">
function check(){
	if(!document.join1.ck1.checked){
		alert("이용약관에 동의하세요");
		return false;
	}
	if(!document.join1.ck2.checked){
		alert("개인정보수집에 동의하세요");
		return false;
	}
}
</script>

