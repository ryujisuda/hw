<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
     String id = request.getParameter("id");   
      // 폼에서 입력한 id 참조, 
     boolean fnd = false;  // id 여부 저장
      if (id == null) // id 가 없으면
         id = "";
     else  
     {
       String driver="oracle.jdbc.driver.OracleDriver";  
      String url="jdbc:oracle:thin:@localhost:1521:orcl";  
      Connection conn=null;
      Class.forName(driver);  
      conn=DriverManager.getConnection(url,"jisu","jisu");  
      ResultSet rs = null;
       
      Statement stmt= conn.createStatement();
      String strSQL= "SELECT S_NUM FROM SCORE WHERE S_NUM='" + id + "'";
        // 뒤에 id는 아디 체크 폼에서 입력한 아이디임.
       rs = stmt.executeQuery(strSQL);
        if (rs.next())  fnd = true;   
        // select 된 결과 행이 있으면 fnd 는 true
           stmt.close();
           conn.close();
          }
       %>
 <HTML><HEAD><TITLE>id check</TITLE></HEAD>
<script language="JavaScript">
function id_search()  // id 유효성 검사 메소드 , id 하나만 체크 함
{
   if(document.form_id_check.id.value=="") 
   {
     alert("ID를 입력해 주세요.");
     document.form_id_check.id.focus();
   }
     else 
     {
      document.form_id_check.submit();
     }
}
function id_ok(a)
{
  opener.document.random_suffle.id.value=a;       
  self.close();   
}
 
</script>

<BODY><center><BR>
<P align="center">사용할 ID를 입력 후 검색 버튼을 누르세요</P>
<FORM NAME = "form_id_check" ACTION = "id_check.jsp" METHOD = "POST" >
  <TABLE WIDTH="200">
    <TR>     <TD WIDTH="150">ID</TD>
    <TD WIDTH="100"><INPUT TYPE="text"   NAME="id"  size="20" 
               VALUE=<%= id %>></TD> 
           <!– id_check.jsp  폼에서 입력하여 중복 검사 후 채워진 id -->
    <TD WIDTH="40" ><INPUT TYPE="button" VALUE="검색" 
                  onClick="javascript:id_search()"></TD>
    </TR>  </TABLE>
</FORM>
 <% 
if (id != "" && fnd == false)  
  { 
   %>
  사용 가능한 학번입니다.<P>
   <a href ="javascript:id_ok('<%= id %>')">  확인 </a>
   <% 
  }
else if (id != "" && fnd == true)
  { 
  %>
   이미 등록 되어있는 학번입니다. 확인해주세요
  <%
  }
  %>
</center></BODY></HTML>