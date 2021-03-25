function inputCheck() 
{

	var checkFlag = document.getElementById("checkFlag");
    if (document.regFrm.id.value == "") {
        alert("아이디를 입력해 주세요.");
        document.regFrm.id.focus();
        return;
    }
	
	if(document.regFrm.checkFlag.value == "false"){
		alert("ID중복확인은 필수입니다.");
		 document.regFrm.id.focus();
		return;
	}
 
    if (document.regFrm.pw.value == "") {
        alert("비밀번호를 입력해 주세요.");
        document.regFrm.pw.focus();
        return;
    }
 
    if (document.regFrm.pw_confirm.value == "") {
        alert("비밀번호를 확인해 주세요.");
        document.regFrm.pw_confirm.focus();
        return;
    }
 
    if (document.regFrm.pw.value != document.regFrm.pw_confirm.value) 
    
    {
        alert("비밀번호가 일치하지 않습니다.");
        document.regFrm.pw_confirm.value = "";
        document.regFrm.pw_confirm.focus();
        return;
    }
 
    if (document.regFrm.name.value == "") {
        alert("이름을 입력해 주세요");
        document.regFrm.name.focus();
        return;
    }
 
    if (document.regFrm.tel.value == "") {
        alert("연락처를 입력해 주세요.");
        document.regFrm.tel.focus();
        return;
    }
 
 
    document.regFrm.submit();
}
 
