 package Model2.service;

import java.util.ArrayList;   //
import javax.servlet.http.HttpServletRequest;  //
import javax.servlet.http.HttpServletResponse;  //
import Model2.dao.EmpDAO;  //
import Model2.dto.EmpDTO;  //

//Model2Service는 인터페이스로  뼈대만 만들어져 있다.  
//Model2Service 를 상속 받은 곳에서는 반드시 메소드를 구현해서 사용해야 한다. 
//public class ListService {     // 원래 클래스 형태
public class ListService implements Model2Service {
	// Model2Service 인터페이스 가 보면  execute() 가 있으므로 
	// 상속 받은 곳에서는재 정의해서 쓴다는 의미로  Override 해서 사용
	@Override
	//  Model2Service 인터페이스에 execute() 를 상속 받은데서 
	// 다시 정의한다고 해서  Override 로 선언
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	// 빈 뼈대만 상속 받았으므로 안에 내용을 채움
	// DB 에 접근라기위해 생성
	EmpDAO dao = new EmpDAO(); 
	// EmpDAO 클래스와 같은 객체 dao 생성 후  EmpDAO 클래스의 list() 메소드 
	
	// 실행한 결과를 리턴받아 list 에 저장하는데  list 에 저장되는 
	//  데이터 형태는 EmpDTO 타입이고, 저장되는 방식은 ArrayList 이다 
	// EmpDAO의 list() 메소드 가보고 올것 41라인 실행 후   리턴받아 list 에 저장함
	ArrayList<EmpDTO> list = dao.list();  

	//ArrayList 로 저장한 뒤 list를 앞 list 에 저장하여 request 객체에 담음
	//request 객체에 담겼으므로 다른 페이지에서도 값을 볼수가 있다.
	request.setAttribute("list", list);
	//  request 객체의 setAttribute를 이용해 뒷 list 객체를
	//  앞 list 라는 이름으로 속성에  저장
	//  ListService 여기는 FrontController 가 호출한 것임.
	//  그러므로 FrontControllerServlet 98 라인 가 보면 --> 98라인
	}   //end execute

}
