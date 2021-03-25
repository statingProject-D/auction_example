
function updateCheck(){
	if(document.regForm.subject.value==""){
		alert("제목을 입력하세요");
		document.regForm.subject.focus();
		return;
	}
	if(document.regForm.content.value==""){
		alert("내용을 입력하세요");
		document.regForm.content.focus();
		return;
	}
	document.regForm.submit();
}

function cancle(){
	history.go(-1);
}