package Model2.dao;

//DB 에서 데이터를 가져오는 역할을 하는 객체 DAO,  DAO는 service 객체로부터 호출받음.
	// service는 Model2Service 인터페이스를 상속 받아 구현함 excute(). 
    // service 객체는 FrontController 로부터 호출 받음
	// FrontController는 사용자로 부터 요청 받음
	import java.sql.Connection;  
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.util.ArrayList;
	import javax.naming.Context;
	import javax.naming.InitialContext;
	import javax.naming.NamingException;

	import javax.sql.DataSource;   // DataSource를 사용하기 위한 클래스 import
	import Model2.dto.EmpDTO;      //
	
public class EmpDAO {
	DataSource dataFactory;  // DataSource 객체 선언-전역변수임

	public EmpDAO(){   // 생성자
		// 이곳에서 DB Connection Pool 을 이용하여 connection 객체 구함
		// 가장 먼저 호출되는 생성자에서 DBCP 만들어 놓음
	try {
		 // DataSource 객체를 얻기 위해서 InitialContext() 객체 ctx를 생성
		Context ctx = new InitialContext();
		// lookup 메소드를 사용하여 DataSouece 객체를 얻는다. 
		// 인자값은 반드시 java:comp/env 값에 context.xml 파일에서 
		// 설정한  name="jdbc/Oracle11g" 값을 저장한다.
		dataFactory = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");

	} catch (NamingException e) {
		e.printStackTrace();
		}
	} //end EmpDAO 생성자 - DB에 접근하기 위한 Connection 객체 구함
	  // EmpDAO() 호출(생성자)하는 순간 바로 로드됨.
	
	
// ListService 에서 list() 메소드 호출함 - 반환값 있음
public ArrayList<EmpDTO> list(){
	// 데이터 타입은 ArrayList 이고 데이터 형태는 EmpDTO로 하는 
	// list 메소드 구조 선언
	ArrayList<EmpDTO> list = new ArrayList<EmpDTO>();
	Connection con = null;
	PreparedStatement pstmt = null;
		
	ResultSet rs = null;
	 // 데이터 가져올 때 (select 쿼리 문 사용)사용하여 rs 에 저장
	try{
	// dataFactory 는 웨에서 전역 변수로 선언이므로 바로 사용
	con = dataFactory.getConnection(); /* 데이터 베이스 접속함 */
	 // 쿼리문 작성
	 String sql = "select emp_id, ename, salary, depart from emp";
	 // sql 을 prepareStatement의 매개변수로 넣어 줌
	 pstmt = con.prepareStatement(sql);
	// resultSet 객체 rs는  select 해 온 값을 저장하는 객체
	// rs 에 SQL 문실행한 결과 값을 저장
	 rs = pstmt.executeQuery(); 

	// select  해 온 모든 데이터를 while 문 돌면서 
	//  list 객체에 저장 후 ListService  로 리턴해 줌
	 while( rs.next()){    // 전체 데이터 가져와서 하나씩 차례대로 처리하는 과정
	 String emp_id = rs.getString("emp_id"); // 값을 저장
	 String ename = rs.getString("ename");
	 int salary = rs.getInt("salary");
	 String depart = rs.getString("depart");
	 // 각 변수에 저장된 값으로 dto 객체를 만들고 있음
	// Model2.dto의 EmpDTO 매개변수 있는 생성자 가 보고 올것 13라인
	 EmpDTO dto = new EmpDTO(emp_id, ename, salary, depart);
	 // 각 레코드 값을 dto 객체로 변환 후 내가 만든 ArrayList 객체 dto 에 추가
	 list.add(dto); // 하나의 값을  dto 에 넣었다가 list 에 추가함
	   // 더이상 데이터가 없을 때까지 모든 데이터를 list 에 추가함
	 }  //end while
	}catch(Exception e){ 
		e.printStackTrace();
		}finally{
		try {
		if( rs!= null) rs.close();
		if( pstmt!= null) pstmt.close();
		if( con!= null) con.close();
		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		} 
	}
	 return list;   // 전체 데이터가 저장된 ArrauList 형태의 데이터를 반환함
	    // list()를 호출한 곳이 ListService 이므로 그곳 27라인으로  list을 반환함.
   }  //end list
	 	
		
// 이곳에 write() 메소드 추가 할 것// 글쓰기 -  반환값 없음
public void write( String _emp_id, String _ename, int _salary, String _depart){
 // WriteService 에서 write() 메소드 호출, DB의 필드와 혼동을 막기 위해 _붙임 
Connection con = null;
PreparedStatement pstmt = null;
	try{
	  con = dataFactory.getConnection(); /* connection 객체 얻어 옴 */
	  String query =" INSERT INTO emp ( emp_id, ename, salary, depart ) values ( ?,?,?,? )";
	    /* ? ? ?  PreparedStatement 방식으로 처리 */
	  pstmt = con.prepareStatement( query );
	  pstmt.setString( 1, _emp_id );
	  pstmt.setString( 2, _ename );
	  pstmt.setInt( 3, _salary );
	  pstmt.setString( 4, _depart );
				  
	  int n = pstmt.executeUpdate();  // 정상으로 실행되면 정수형으로 저장후 차례대로 수행함
		}catch(Exception e){ 
		e.printStackTrace();
		}finally{
		try {
		if( pstmt!= null) pstmt.close();
		if( con!= null) con.close();
		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		}  // 저장이므로 이 상태로 끝남. 리턴은 없음.
		/* 이곳을 호출한 WriteService의 31 라인으로 제어권 돌려 줌 */
	}  //end write
			
		
	// 삭제하기 이곳에 추가 
	// DeleteService에서 매개변수 id인 delete()를 호출
	public void delete( String  _id ){
	 Connection con = null;
	 PreparedStatement pstmt = null;
	try{
		con = dataFactory.getConnection();
		// DB의 아디와 넘겨져 온 아디가 같으면 삭제해라
		String query = "DELETE FROM emp WHERE emp_id = ?";
		pstmt = con.prepareStatement( query );
		pstmt.setString(1 , _id );
		  int n =pstmt.executeUpdate( ); 
		  // 삭제여부를 정수형으로 저장  반환값 없음 DB 에응 삭제 되어 있음
		  // DeleteService 22 라인으로 돌아가면
		  
		}catch( Exception e) { 
			e.printStackTrace();
			}finally{
			try {
			if( pstmt!= null) pstmt.close();
			if( con!= null) con.close();

			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
			}
	}  //end delete()
		  
		
// 이곳에 수정하기 소스 추가
// ModifyService 에서 update() 매개변수를 이용하여 메소드를 호출함
	public void update( String  _emp_id , String  _ename ,String  _salary , String  _depart ){
	 Connection con = null;
	 PreparedStatement pstmt = null; 
	try{
    con = dataFactory.getConnection();
	String query = "UPDATE emp SET ename = ? , salary = ? , depart = ? WHERE emp_id = ?";
	 // 넘겨져 온 데이터를 그냥 수정하는 것이 아니라 DB의 id와 넘겨져 온 Id가 같을 때만 수정함
	pstmt = con.prepareStatement( query );
	pstmt.setString ( 1 , _ename );
	pstmt.setInt( 2,  Integer.parseInt( _salary ));
	pstmt.setString( 3 ,  _depart );
	pstmt.setString(  4 ,    _emp_id );
	int n = pstmt.executeUpdate(); 
	// 수정 여부를 반환값이 없는 정수형으로 저장

	}catch( Exception e){ 
	e.printStackTrace(); 
	}finally{
		try {
			if( pstmt!= null) pstmt.close();
			if( con!= null) con.close();
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
		}
	}  // end update class

			
		
// 이곳에 검색하기 추가 
// 검색하기 위해 2개의 매개변수를 가지고 옴
public ArrayList<EmpDTO>  search( String  _searchName,  String  _searchValue ){
ArrayList<EmpDTO> list = new ArrayList<EmpDTO>();
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
	// int COUNT=0;   // 검색 레코드 갯수 변수
	// public static int COUNT =0;  // 검색 레코드 갯수 전역 변수
	// 위에 public class EmpDAO { 바로 아래 선언해야 함

	try{
	 con = dataFactory.getConnection();
	 String query = "SELECT  emp_id, ename, salary, depart FROM emp";
       if(  _searchName.equals( "emp_id" )){
				query += "     WHERE  emp_id  LIKE  ?";
		  }else{
			query += "    WHERE  ename LIKE ?";
		   }//
			pstmt = con.prepareStatement( query );
			pstmt.setString(  1 ,   "%"+_searchValue+"%" );
		     // _searchValue 앞 뒤로 어으 글자가 오더라도 검색하라
			 rs = pstmt.executeQuery( );
			 while( rs.next()){
			// COUNT++;    // 검색 카운트 증가
			String emp_id = rs.getString( "emp_id" );
			String ename = rs.getString( "ename" );
			int salary = rs.getInt( "salary" );
			String depart = rs.getString( "depart" );
			EmpDTO data = new EmpDTO();
			data.setEmp_id( emp_id );
			data.setEname( ename );
			data.setSalary( salary );
			data.setDepart( depart );
			list.add( data );
			 } // end while
		}catch(Exception e){ 
		e.printStackTrace();
		}finally{
		try {
		if( rs!= null) rs.close();
		if( pstmt!= null) pstmt.close();
		if( con!= null) con.close();
		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		}
	 return list;    // 호출한 곳으로 리턴 
	} // end search

		
			
	} // end EmpDAO class

	// 기능이 추가되면(insert, update, delete) 이곳에 메소드 추가하면 됨
	// 아래는 Model2.service 패키지에 추가하는 내용임
	// 기능이 추가 될 때마다 Model2Service 를 상속받아  기능에 맞는 서비스를 작성하면 됨.
	// Model2.service 패키지에 InsertService, DeleteService, UpdateService 등...

