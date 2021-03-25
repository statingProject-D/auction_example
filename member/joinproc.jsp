<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="memberAction.SMTPAuthenticatior" %>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import ="java.util.UUID"%>

<%@page import="com.project.market.vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.sql.*,java.util.Vector"%>
<%
	request.setCharacterEncoding("euc-kr");
	Timestamp time = new Timestamp(System.currentTimeMillis());
	String key = UUID.randomUUID().toString().substring(0, 5);
%>
<jsp:useBean id="bean" class="member_action.MemberBean" />
<jsp:setProperty name="bean" property="*" />
<jsp:useBean id="mgr" class="member_action.MemberMgr" />

<%
	String mail_id = bean.getMem_id();
	String mail_address =bean.getMem_email();
	bean.setMem_time(time.toString()); //��ϳ�¥
	bean.setMem_key(key);
	mgr.insertMember(bean); //db�� �Ѿ�� �Ķ���� ���� ����
	
	response.sendRedirect("/Jsp-Auction/index.jsp?PAGE=member/join3");
%>



<%
	String text = "<h3>������ ȯ���մϴ�. �Ʒ��� �������� �Է��ϱ� �ٶ��ϴ�.</h3>";
	text+="������ : ";
	text+=key;
	text+="<hr>";
	text+="<a href='http://127.0.0.1:81/Jsp-Auction/index.jsp?PAGE=member/certify.jsp?id="+mail_id+"'>";
	text+="�����ڵ� �Է����� �̵�";
	text+="</a>";
	
	Properties p = new Properties(); // ������ ���� ��ü

	p.put("mail.smtp.host", "smtp.naver.com"); // ���̹� SMTP

	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
	// SMTP ������ �����ϱ� ���� ������

	try {
		Authenticator auth = new SMTPAuthenticatior();
		Session ses = Session.getInstance(p, auth);

		ses.setDebug(true);

		MimeMessage msg = new MimeMessage(ses); // ������ ������ ���� ��ü
		msg.setSubject("Auction ��������"); // ����

		Address fromAddr = new InternetAddress("kungfumong@naver.com");
		msg.setFrom(fromAddr); // ������ ���

		Address toAddr = new InternetAddress(mail_address);
		msg.addRecipient(Message.RecipientType.TO, toAddr); // �޴� ���

		msg.setContent(text, "text/html;charset=euc-kr"); // ����� ���ڵ�

		Transport.send(msg); // ����
	} catch (Exception e) {
		e.printStackTrace();
		out.println("<script>alert('Send Mail Failed..');history.back();</script>");
		// ���� �߻��� �ڷ� ���ư�����
		return;
	}

	out.println("<script>alert('Send Mail Success!!');</script>");
	// ���� ��
%>