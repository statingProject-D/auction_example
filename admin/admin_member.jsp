<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*" import="java.sql.*"%>
<%@ page import="memberAction.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="bean" class="member_action.MemberBean" />
<jsp:useBean id="mgr" class="member_action.MemberMgr" />
<%
	Vector<MemberBean> vlist = null;
	vlist=mgr.getAdminList();
%>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th>ID</th>
								<th>Password</th>
								<th>Name</th>
								<th>Gender</th>
								<th>Birth</th>
								<th>Phone</th>
								<th>Email</th>
								<th>Address</th>
							</tr>
						</thead>
						<tbody>
						
						<%for(int i=0; i<vlist.size(); i++){
							bean=vlist.get(i);
						%>
							<tr>
								<td><%=bean.getMem_id()%></td>
								<td><%=bean.getMem_password()%></td>
								<th><%=bean.getMem_name()%></th>
								<th><%=bean.getMem_sex()%></th>
								<th><%=bean.getYear()+"-"+bean.getMonth()+"-"+bean.getDay()%></th>
								<th><%=bean.getPhone1()+"-"+bean.getPhone2()+"-"+bean.getPhone3()%></th>
								<th><%=bean.getMem_email()%></th>
								<th><%=bean.getAddress1()+"/"+bean.getAddress2()%></th>
								<td><a href="/Jsp-Auction/index.jsp?PAGE=admin/admin_updateMember.jsp?id=<%=bean.getMem_id()%>" class="btn btn-block btn-primary-outline"
									draggable="true">수정</a></td>
								<td><a href="/Jsp-Auction/index.jsp?PAGE=admin/admin_deleteMember.jsp?id=<%=bean.getMem_id()%>" class="btn btn-block btn-primary-outline"
									draggable="true">삭제</a></td>
							</tr>
						<% }%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
