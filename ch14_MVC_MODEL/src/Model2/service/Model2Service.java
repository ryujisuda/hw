package Model2.service;  /*인터페이스임 */

import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse; 

//인터 페이스 선언 - 인터페이스는 뼈대만 만들어 놓고 구현은 상속 받은곳에서 한다.
public interface Model2Service {
	//request 와 response 매개변수를 갖는 execute() 메서드 선언해 놓고
	//이 클래스를 상속 받은 곳에서 execute() 메서드를 재 정의하여 사용할 것
	public void execute(HttpServletRequest request,	HttpServletResponse response);
	    // execute() 빈 메소드만 있고, 내용은 아무 것도 없음
	}

// FrontController는 들어온 명령을 분석하여 분기할 곳을 지정해 줌
// Model2Service는 인터페이스로 같은 프로젝트에서 표준을 만들어 놓은 후 
// 이 표준을 - execute() 상속받아 공통으로 사용하도록함.
// Model2Service를 상속 받은 WriteService 에서 execute() 실제 작성함

// FrontController 에서 넘어온 명령어 내용에 맞는 작업을 수행하도록 함
// 글쓰기, 수정, 삭제, 조회 등의 작업을 하는 객체는 Model2Service 인터페이스로
// 선언된 것을 상속 받아 각 명령에 맞게 재 정의하여 사용함
// DAO : 데이터를 처리할 때 사용(입력, 저장, 조회, 삭제 기능등이 작성되어 있음
// DTO : 데이터를 입출력할 때 따로 따로 하지 않고 전체 데이터를 DTO 바구니에 담아 이동
