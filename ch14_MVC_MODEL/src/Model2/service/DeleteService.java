package Model2.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model2.dao.EmpDAO;// 추가

//WriteService 클래스는 인터페이스로 선언된  Model2Service 를 상속받아 사용해라
//인터페이스 이므로 상속 받아 다시 정의해서 사용해라
// public class DeleteServicr {   // 원래 클래스
public class DeleteService implements Model2Service {
	@Override  // 재 정의하겠다는 의미
	// Model2Service 에 뼈대만 선언해 놓은 execute( )를 여기서 다시 선언해 사용
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	// 삭제하면 먼저 view.jsp 에서 아이디를 가져와서 DB의 아디와 같은 것을 삭제해야 함
	String id = request.getParameter("id");
	 // EmpDAO 클래스와 똑 같은 dao 객체를 생성-Model2.dao에 있는 
	// EmpDAO.java 가보고 올것
	         EmpDAO  dao = new EmpDAO();
	         // dao에 있는 delete(id) 메소드 호출(실행)
	         // 삭제이므로 리턴값은 없으며 삭제후 리스트 보기 페이지로 이동
	 dao.delete(id); // id를 매개변수로 넘겨 줌
	 // 삭제완료되고 이곳을 호출한 FrontControllerServlet 74라인으로 제어권 넘겨 줌
	}
	}
