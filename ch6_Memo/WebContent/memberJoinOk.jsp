<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*" %>
<%
request.setCharacterEncoding("euc-kr");
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
int age=Integer.parseInt(request.getParameter("age"));
String gender=request.getParameter("gender");
String email=request.getParameter("email");
int status=0;
Connection conn=null; 
String driver="oracle.jdbc.driver.OracleDriver";  
String url="jdbc:oracle:thin:@localhost:1521:orcl";  
Class.forName(driver);  
conn=DriverManager.getConnection(url,"jisu","jisu");   
Statement stmt = conn.createStatement();  
 String SQL = "select count(*) cnt from member where id = '" + id + "'";

ResultSet rs = stmt.executeQuery(SQL);
rs.next() ;
if (rs != null) 
   {
      if (rs.getInt("cnt") > 0)
      {   
        out.println("이 아이디는 이미 다른 사람이 사용하고 있음.");
      }
      else  {  
    	  String  SQL1 = "insert into member(id, pass, name, age, gender, email, status) values (?,?,?,?,?,?,?)";
    	    PreparedStatement pstmt=conn.prepareStatement(SQL1); 
    	    pstmt.setString(1,id);
    	    pstmt.setString(2,pass);
    	    pstmt.setString(3,name);
    	    pstmt.setInt(4,age);
    	    pstmt.setString(5,gender);
    	    pstmt.setString(6,email);
    	    pstmt.setInt(7,status);
    	    pstmt.executeUpdate();            
    	    pstmt.close(); 
    	    stmt.close();  
    	    conn.close();      
    	         out.println("<script>");
    	         out.println("location.href='memberLogin.jsp'");
    	         out.println("</script>");
    	      }
    	     }
    	    %>
 

      
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>