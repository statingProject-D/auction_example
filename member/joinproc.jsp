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
	bean.setMem_time(time.toString()); //등록날짜
	bean.setMem_key(key);
	mgr.insertMember(bean); //db에 넘어온 파라메터 값들 저장
	
	response.sendRedirect("/Jsp-Auction/index.jsp?PAGE=member/join3");
%>



<%
	String text = "<h3>가입을 환영합니다. 아래의 인증값을 입력하길 바랍니다.</h3>";
	text+="인증값 : ";
	text+=key;
	text+="<hr>";
	text+="<a href='http://127.0.0.1:81/Jsp-Auction/index.jsp?PAGE=member/certify.jsp?id="+mail_id+"'>";
	text+="인증코드 입력으로 이동";
	text+="</a>";
	
	Properties p = new Properties(); // 정보를 담을 객체

	p.put("mail.smtp.host", "smtp.naver.com"); // 네이버 SMTP

	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
	// SMTP 서버에 접속하기 위한 정보들

	try {
		Authenticator auth = new SMTPAuthenticatior();
		Session ses = Session.getInstance(p, auth);

		ses.setDebug(true);

		MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
		msg.setSubject("Auction 인증메일"); // 제목

		Address fromAddr = new InternetAddress("kungfumong@naver.com");
		msg.setFrom(fromAddr); // 보내는 사람

		Address toAddr = new InternetAddress(mail_address);
		msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람

		msg.setContent(text, "text/html;charset=euc-kr"); // 내용과 인코딩

		Transport.send(msg); // 전송
	} catch (Exception e) {
		e.printStackTrace();
		out.println("<script>alert('Send Mail Failed..');history.back();</script>");
		// 오류 발생시 뒤로 돌아가도록
		return;
	}

	out.println("<script>alert('Send Mail Success!!');</script>");
	// 성공 시
%>