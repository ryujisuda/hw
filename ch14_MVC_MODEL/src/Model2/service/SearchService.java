package Model2.service;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model2.dao.EmpDAO;
import Model2.dto.EmpDTO;
// public class SearchService {   // 원래 클래스이지만
// Model2Service 를 상속 받아 내가 메소드 구현하여 사용함.
public class SearchService implements Model2Service {
@Override     // execute 를 재 정의해서 사용하겠다.
public void execute(HttpServletRequest request, HttpServletResponse response) {
	// 검색창에서 검색항목과 검색 키워드 
	String searchName = request.getParameter( "searchName" );
	String searchValue = request.getParameter( "searchValue" );
	EmpDAO dao = new EmpDAO();
	// dao 의 search() 메소드 실행 후 결과 값을 이곳으로 반환
	// 반환된 값은 list 객체에 저장
	ArrayList<EmpDTO>  list = dao.search( searchName ,  searchValue );
	 // 저장된 list 객체를 list2 라는 이름으로 속성 저장하여 request 에 저장
	// 이 값을 넘겨 받은 페이지에서는 list2 로 사용하여 값을 뽑아 냄.
	request.setAttribute(  "list2"  ,   list );
	}
	}
