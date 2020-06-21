package Model2.service;
import javax.servlet.http.HttpServletRequest;  // 추가
import javax.servlet.http.HttpServletResponse; // 추가
import Model2.dao.EmpDAO;                      // 추가


//  WriteService 클래스는 인터페이스로 선언된  Model2Service 를 상속받아 사용해라
// 인터페이스 이므로 Model2Service 에서는 뼈대만 만들어 놓은 후 
// 상속 받은 곳에서 WriteService 다시 정의해서 사용해라
// Model2Service 의 인터페이스 가보면 아무것도 없는 execute() 만 정의 되어 있음
// 여기서 상속 개념을 이해 못하면 다음 소스 분석이 안됨.
public class WriteService implements Model2Service {
	// Model2Service 인터페이스  가보면 
	
@Override   // 상속 받은 곳에서 재 정의하겠다는 의미
// Model2Service 의 interface 에 뼈대만 선언해 놓은 execute( )를 여기서 다시 선언해서 사용함
// 설령 내용은 없더라도 메소드만큼은 만들어 놔야 에러가 발생 안함.
public void execute(HttpServletRequest request, HttpServletResponse response) {
	response.setContentType("text/html; charset=EUC-KR");
	// 글입력 폼에서 입력한 데이터를 받아서 변수에 저장
		String emp_id = request.getParameter( "emp_id" );
		String ename = request.getParameter( "ename" );
		int salary = Integer.parseInt(request.getParameter( "salary" ));
		String depart = request.getParameter( "depart" );

		// EmpDAO 클래스와 똑 같은 dao 객체를 생성함. 14라인에서 import 했기 때문에 바로 사용이 가능
		// Model2.dao에 있는 EmpDAO.java 가보고 올것 
		    EmpDAO dao = new EmpDAO();
		 // dao 에있는 write(emp_id, ename, salary,depart) 메소드 호출(실행) 92라인
		 // 글 작성이므로 리턴값 없는 메소드 호출
		    dao.write(emp_id, ename, salary,depart);
		    // 저장이므로 여기서 마치고 이곳을 호출한 FrontControllerServlet 85 라인으로 제어권 넘김
		    // 리턴값은 없지만 호출한 곳으로 수행을 넘김 
	}
}