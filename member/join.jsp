<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

  <div class="section">
    <div class="container">
      <table align="center" width="80%">
        <tbody>
          <tr>
            <td colspan="6" align="center">
              <h1>ȸ������</h1></td>
          </tr>
          <tr>
            <td align="center">
              <h2><u>�������</u></h2></td>
            <td>
              <h3>&gt;</h3></td>
            <td align="center">
              <h2>�����Է�</h2></td>
            <td>
              <h3>&gt;</h3></td>
            <td align="center">
              <h2>���ԿϷ�</h2></td>
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
            <td align="center" width="45%" class="text-xs-left">�̿��� ���� </td>
            <td width="10%"></td>
            <td align="center" width="45%" class="text-xs-left">�������� ���� �� �̿뿡 ���� �ȳ�</td>
          </tr>
          <tr>
            <td>
              <textarea cols="30" rows="10">��Ż���Ʈ �̿����Դϴ�! ��Ż���Ʈ �̿����Դϴ�! ��Ż���Ʈ �̿����Դϴ�! ��Ż���Ʈ �̿����Դϴ�!</textarea>
            </td>
            <td width="10%"></td>
            <td>
              <textarea cols="30" rows="10">�������� ���� �̿뿡 ���� �ȳ��Դϴ�. �������� ���� �̿뿡 ���� �ȳ��Դϴ�</textarea>
            </td>
          </tr>
          <tr>
            <td>
              <input type="checkbox" name="ck1">��� ���뿡 �����մϴ�
            </td>
            <td width="10%"></td>
            <td>
              <input type="checkbox" name="ck2">���� ���� �����̿뿡 �����մϴ�
            </td>
          </tr>
          <tr>
          </tr>
        </tbody>
      </table>

      <div class="collapse navbar-collapse" id="navbar-ex-collapse">
        <ul class="nav navbar-nav navbar-right">
          <li class="active">
              <input type="submit" value="����" class="form-control">
          </li>
        </ul>
      </div>
      </form>
    </div>
  </div>


<script language="javascript">
function check(){
	if(!document.join1.ck1.checked){
		alert("�̿����� �����ϼ���");
		return false;
	}
	if(!document.join1.ck2.checked){
		alert("�������������� �����ϼ���");
		return false;
	}
}
</script>

