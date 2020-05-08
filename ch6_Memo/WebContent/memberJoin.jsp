

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script language = javascript>
function valid_check()
{
	 
// alert("사용자 함수를 호출함.");
	    if (document.joinform.id.value == "")
	    {
	         // joinform 은 form name="joinform" 임
	        // 다른 파일에서 같은 이름 사용하면 에러 발생-에러 고치기 어려움
	       alert("아이디를 입력하여 주시기 바랍니다.");
	       document.joinform.id.focus();
	       return false;
	    }
	    else if ((document.joinform.id.value.length <4) || 
               (document.joinform.id.value.length >=9 ))
		{
		alert("아이디는 4자 이상 8 까지입니다.");
		document.joinform.id.focus();
		return false;
		}
	    
	    else if ((document.joinform.pass.value.length !=4))
		{
		alert("패스워드는 4자리입니다.");
		document.joinform.pass.focus();
		return false;
		}
	    else if ((document.joinform.name.value.length ==""))
		{
		alert("이름을 채워주세요.");
		document.joinform.name.focus();
		return false;
		}
	    else if ((document.joinform.age.value.length ==""))
		{
		alert("나이를 채워주세요.");
		document.joinform.age.focus();
		return false;
		}
	    
	    else if ((document.joinform.email.value.length ==""))
		{
		alert("이메일을 채워주세요.");
		document.joinform.email.focus();
		return false;
		}
	    for (var i = 0; i < document.joinform.age.value.length; i++)
	    {     
	      if (document.joinform.age.value.charAt(i) < "0" ||   
	                                      document.joinform.age.value.charAt(i) > "9")
	        {
	          alert("나이는 숫자만 가능합니다. ");
	          document.joinform.age.focus();
	          return false;
	      }
	   }
	   console.log("도착하눈뎅");
	   document.joinform.submit();//유효성 검사 통과면 action 페이지로 
}

function check_id() 
{
  var JSPName = "id_check.jsp";
  browsing_window = window.open(JSPName,      
  "_idcheck","height=220,width=420");
   browsing_window.focus(); 
 }

</script>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form name="joinform" action="memberJoinOk.jsp" method="post">
 <!-- 반드시 폼 이름 은 파일명과 같게 한다. -->
 <center>
<table border=1>
<tr><td colspan="2" align=center>
      <b><font size=5>회원가입 페이지</font></b> </td> </tr>
<tr><td>아이디 : </td>
      <td><input type="text" name="id" readonly/>
      <!-- 아디는 수정 못하게 일기 전용으로 --> 
  <input TYPE=button VALUE="ID Check" onclick="check_id()" onmouseover="this.style.cursor='hand';">
  <!--  onmouseover="this.style.cursor='hand' 마우스가 올라가면 손 모양으로 변환 -->
      
      </td></tr>
<tr><td>비밀번호 :  </td>
           <td><input type="password" name="pass"/></td></tr>
<tr><td>이름 : </td><td><input type="text" name="name"/></td></tr>
<tr><td>나이 : </td><td><input type="text" name="age" 
        maxlength=2 size=5/></td></tr>
<tr><td>성별 : </td>
      <td><input type="radio" name="gender" value="남" checked/>남자
      <input type="radio" name="gender" value="여"/>여자  </td></tr>
<tr><td>이메일 주소 : </td><td><input type="text" name="email" 
         size=30/></td></tr>
<tr><td colspan="2" align=center>
     <input type="button" value="회원가입" onclick="valid_check()"> &nbsp;&nbsp; 
     <a href="javascript:joinform.reset()">다시작성</a>
</td></tr>
</table></center></form>
</body></html>
