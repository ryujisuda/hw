package Model2.dao;

//DB ���� �����͸� �������� ������ �ϴ� ��ü DAO,  DAO�� service ��ü�κ��� ȣ�����.
	// service�� Model2Service �������̽��� ��� �޾� ������ excute(). 
    // service ��ü�� FrontController �κ��� ȣ�� ����
	// FrontController�� ����ڷ� ���� ��û ����
	import java.sql.Connection;  
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.util.ArrayList;
	import javax.naming.Context;
	import javax.naming.InitialContext;
	import javax.naming.NamingException;

	import javax.sql.DataSource;   // DataSource�� ����ϱ� ���� Ŭ���� import
	import Model2.dto.EmpDTO;      //
	
public class EmpDAO {
	DataSource dataFactory;  // DataSource ��ü ����-����������

	public EmpDAO(){   // ������
		// �̰����� DB Connection Pool �� �̿��Ͽ� connection ��ü ����
		// ���� ���� ȣ��Ǵ� �����ڿ��� DBCP ����� ����
	try {
		 // DataSource ��ü�� ��� ���ؼ� InitialContext() ��ü ctx�� ����
		Context ctx = new InitialContext();
		// lookup �޼ҵ带 ����Ͽ� DataSouece ��ü�� ��´�. 
		// ���ڰ��� �ݵ�� java:comp/env ���� context.xml ���Ͽ��� 
		// ������  name="jdbc/Oracle11g" ���� �����Ѵ�.
		dataFactory = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");

	} catch (NamingException e) {
		e.printStackTrace();
		}
	} //end EmpDAO ������ - DB�� �����ϱ� ���� Connection ��ü ����
	  // EmpDAO() ȣ��(������)�ϴ� ���� �ٷ� �ε��.
	
	
// ListService ���� list() �޼ҵ� ȣ���� - ��ȯ�� ����
public ArrayList<EmpDTO> list(){
	// ������ Ÿ���� ArrayList �̰� ������ ���´� EmpDTO�� �ϴ� 
	// list �޼ҵ� ���� ����
	ArrayList<EmpDTO> list = new ArrayList<EmpDTO>();
	Connection con = null;
	PreparedStatement pstmt = null;
		
	ResultSet rs = null;
	 // ������ ������ �� (select ���� �� ���)����Ͽ� rs �� ����
	try{
	// dataFactory �� ������ ���� ������ �����̹Ƿ� �ٷ� ���
	con = dataFactory.getConnection(); /* ������ ���̽� ������ */
	 // ������ �ۼ�
	 String sql = "select emp_id, ename, salary, depart from emp";
	 // sql �� prepareStatement�� �Ű������� �־� ��
	 pstmt = con.prepareStatement(sql);
	// resultSet ��ü rs��  select �� �� ���� �����ϴ� ��ü
	// rs �� SQL �������� ��� ���� ����
	 rs = pstmt.executeQuery(); 

	// select  �� �� ��� �����͸� while �� ���鼭 
	//  list ��ü�� ���� �� ListService  �� ������ ��
	 while( rs.next()){    // ��ü ������ �����ͼ� �ϳ��� ���ʴ�� ó���ϴ� ����
	 String emp_id = rs.getString("emp_id"); // ���� ����
	 String ename = rs.getString("ename");
	 int salary = rs.getInt("salary");
	 String depart = rs.getString("depart");
	 // �� ������ ����� ������ dto ��ü�� ����� ����
	// Model2.dto�� EmpDTO �Ű����� �ִ� ������ �� ���� �ð� 13����
	 EmpDTO dto = new EmpDTO(emp_id, ename, salary, depart);
	 // �� ���ڵ� ���� dto ��ü�� ��ȯ �� ���� ���� ArrayList ��ü dto �� �߰�
	 list.add(dto); // �ϳ��� ����  dto �� �־��ٰ� list �� �߰���
	   // ���̻� �����Ͱ� ���� ������ ��� �����͸� list �� �߰���
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
	 return list;   // ��ü �����Ͱ� ����� ArrauList ������ �����͸� ��ȯ��
	    // list()�� ȣ���� ���� ListService �̹Ƿ� �װ� 27��������  list�� ��ȯ��.
   }  //end list
	 	
		
// �̰��� write() �޼ҵ� �߰� �� ��// �۾��� -  ��ȯ�� ����
public void write( String _emp_id, String _ename, int _salary, String _depart){
 // WriteService ���� write() �޼ҵ� ȣ��, DB�� �ʵ�� ȥ���� ���� ���� _���� 
Connection con = null;
PreparedStatement pstmt = null;
	try{
	  con = dataFactory.getConnection(); /* connection ��ü ��� �� */
	  String query =" INSERT INTO emp ( emp_id, ename, salary, depart ) values ( ?,?,?,? )";
	    /* ? ? ?  PreparedStatement ������� ó�� */
	  pstmt = con.prepareStatement( query );
	  pstmt.setString( 1, _emp_id );
	  pstmt.setString( 2, _ename );
	  pstmt.setInt( 3, _salary );
	  pstmt.setString( 4, _depart );
				  
	  int n = pstmt.executeUpdate();  // �������� ����Ǹ� ���������� ������ ���ʴ�� ������
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
		}  // �����̹Ƿ� �� ���·� ����. ������ ����.
		/* �̰��� ȣ���� WriteService�� 31 �������� ����� ���� �� */
	}  //end write
			
		
	// �����ϱ� �̰��� �߰� 
	// DeleteService���� �Ű����� id�� delete()�� ȣ��
	public void delete( String  _id ){
	 Connection con = null;
	 PreparedStatement pstmt = null;
	try{
		con = dataFactory.getConnection();
		// DB�� �Ƶ�� �Ѱ��� �� �Ƶ� ������ �����ض�
		String query = "DELETE FROM emp WHERE emp_id = ?";
		pstmt = con.prepareStatement( query );
		pstmt.setString(1 , _id );
		  int n =pstmt.executeUpdate( ); 
		  // �������θ� ���������� ����  ��ȯ�� ���� DB ���� ���� �Ǿ� ����
		  // DeleteService 22 �������� ���ư���
		  
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
		  
		
// �̰��� �����ϱ� �ҽ� �߰�
// ModifyService ���� update() �Ű������� �̿��Ͽ� �޼ҵ带 ȣ����
	public void update( String  _emp_id , String  _ename ,String  _salary , String  _depart ){
	 Connection con = null;
	 PreparedStatement pstmt = null; 
	try{
    con = dataFactory.getConnection();
	String query = "UPDATE emp SET ename = ? , salary = ? , depart = ? WHERE emp_id = ?";
	 // �Ѱ��� �� �����͸� �׳� �����ϴ� ���� �ƴ϶� DB�� id�� �Ѱ��� �� Id�� ���� ���� ������
	pstmt = con.prepareStatement( query );
	pstmt.setString ( 1 , _ename );
	pstmt.setInt( 2,  Integer.parseInt( _salary ));
	pstmt.setString( 3 ,  _depart );
	pstmt.setString(  4 ,    _emp_id );
	int n = pstmt.executeUpdate(); 
	// ���� ���θ� ��ȯ���� ���� ���������� ����

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

			
		
// �̰��� �˻��ϱ� �߰� 
// �˻��ϱ� ���� 2���� �Ű������� ������ ��
public ArrayList<EmpDTO>  search( String  _searchName,  String  _searchValue ){
ArrayList<EmpDTO> list = new ArrayList<EmpDTO>();
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
	// int COUNT=0;   // �˻� ���ڵ� ���� ����
	// public static int COUNT =0;  // �˻� ���ڵ� ���� ���� ����
	// ���� public class EmpDAO { �ٷ� �Ʒ� �����ؾ� ��

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
		     // _searchValue �� �ڷ� ���� ���ڰ� ������ �˻��϶�
			 rs = pstmt.executeQuery( );
			 while( rs.next()){
			// COUNT++;    // �˻� ī��Ʈ ����
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
	 return list;    // ȣ���� ������ ���� 
	} // end search

		
			
	} // end EmpDAO class

	// ����� �߰��Ǹ�(insert, update, delete) �̰��� �޼ҵ� �߰��ϸ� ��
	// �Ʒ��� Model2.service ��Ű���� �߰��ϴ� ������
	// ����� �߰� �� ������ Model2Service �� ��ӹ޾�  ��ɿ� �´� ���񽺸� �ۼ��ϸ� ��.
	// Model2.service ��Ű���� InsertService, DeleteService, UpdateService ��...

