package Model2.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.RequestDispatcher;  // 추가 

import Model2.service.Model2Service; //  추가 interface
import Model2.service.DeleteService; //  추가
import Model2.service.ListService;   //  추가
import Model2.service.ModifyService; //  추가
import Model2.service.SearchService; //  추가
import Model2.service.WriteService;  //  추가
/**
 * Servlet implementation class FrontControllerServlet
 */
@WebServlet("*.mo") /* 확장자가 mo 인 것은 일단 이곳으로 와라 */
public class FrontControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   //  FrontContcntroller 의 역할 - 사용자의 요청을 이곳으로 집중시키고, 
   // 이곳에서 분기할 곳을 지정하는 역할
   // extends : 모든 것을 상속받아 그대로 사용이 가능한 것
   // implement : interface에 뼈대만 있는 메소드를 상속 받아
           // 상속 받은 곳에서 메소드를 구현하여 사용함.
   // FrontControllerServlet 는 HttpServlet을 상속 받아 사용한다. 

	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	
		request.setCharacterEncoding("euc-kr"); // 한글 처리
		
		Model2Service command = null;
		// 수행해야 할 로직을 저장할 객체
		    String nextPage = null;
		 // 값이 변경될 가능성이 있는 것은 null 로 선언 
		    String requestURI = request.getRequestURI();
		// 출력해 보면 /ch14_MVC_MODEL2/list.mo  가 출력됨 
		String contextPath = request.getContextPath();
		// 출력해 보면 /ch14_MVC_MODEL2  가 출력됨 
		String com = requestURI.substring(contextPath.length());
		// URI 에서 contextPath.length 길이 만큼 잘라버림,  list.mo

		
		//글 수정 하기
		if(com.equals("/update.mo")){
		command = new ModifyService();
		command.execute(request, response);
		nextPage = "list.mo";
		 }

		
		//글 삭제 하기
		if(com.equals("/delete.mo")){
		System.out.println("delete 요청...");
		command = new DeleteService();
		command.execute(request, response);
		nextPage = "list.mo"; /* 여기서부터는 write 일 때와 같음 */
		}

		// 글 쓰기   폼에서 입력 받은 내용을 request 객체에 담아 이곳으로 옴
		if(com.equals("/write.mo")){
		 // WriterService() 의 객체 command 생성
		command = new WriteService(); 
		/* 17라인에서 import 했기때문에 이렇게 사용이 가능함 */
		// Model2.service 에 있는 WriterService() 가보고 올 것
		// WriterService() 에 있는 execute(request, response)를 실행
		command.execute(request, response); 
		/* 폼에서 입력한 데이터를 request 에 담아 전달함 */
		// nextPage 에 이동할 페이지를 list.mo 로 저장하고 114 라인으로 감.
		nextPage = "list.mo";
		}
				
		// 리스트 보기(list.mo) 이므로 
		 if(com.equals("/list.mo")){
		// 비지니스 로직을 처리하는 ListService 의 객체 command 생성
			command = new ListService(); /* 14라인에서 import 했기 때문에 바로 사용이 가능 */
		// null인 command 에 ListService() 생성후 할당해 줌
		// Model2.service 에 있는 ListService() 가 보면
		// ListService() 에 있는 19라인  execute(request, response)를 실행 
		command.execute(request, response);
		// DB 에서 값을 select 해 온 결과가 request 에 담겨있다.
		// 이동할 페이지를 저장, 즉 글 목록 보여주고  list.jsp로  이동함.
		nextPage = "list.jsp";
		}

		 
		// 글 검색 하기
			if(com.equals("/search.mo")){
			command = new SearchService();
			command.execute(request, response);
			nextPage = "search.jsp";
			}
			
		// HttpServletRequest 객체의 getRequestDispatcher() 메소드를 사용하여
		// RequestDispatcher 객체 dis를 생성한다. 인자 값으로는 이동할 페이지를 list.mo 지정
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
                   // nextPage 에는 list.mo  가 저장되어 이곳으로 옴
		          // nextPage 에는 list.jsp  가 저장되어 이곳으로 옴
		
		// RequestDispatcher 객체 dis 가 가지고 있는 경로에 해당하는 페이지로 이동하고
		// forward() 메소드로 클라이언트로 응답을  보낼때  doGet 또는 doPost 메소드의 인자값인
		// request, response 값을 지정하여 forwarding 한다. 
		// 이 때 request 객체에는 dis 이름으로 EmpDTO 객체의 주소값이 들어있다. 
		dis.forward(request, response);
		// request 내용을 list.mo 면 FrontControllerServlet 92 라인 으로  포워딩하고
		// list.jsp 이면 ListService에서 request에 set 한 내용을 가지고  list.jsp 로 포워딩함. 
		// select 한 정보를 request 에 담아서 list.jsp 페이지 가 보면	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
