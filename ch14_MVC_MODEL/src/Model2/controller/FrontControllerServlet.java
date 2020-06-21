package Model2.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.RequestDispatcher;  // �߰� 

import Model2.service.Model2Service; //  �߰� interface
import Model2.service.DeleteService; //  �߰�
import Model2.service.ListService;   //  �߰�
import Model2.service.ModifyService; //  �߰�
import Model2.service.SearchService; //  �߰�
import Model2.service.WriteService;  //  �߰�
/**
 * Servlet implementation class FrontControllerServlet
 */
@WebServlet("*.mo") /* Ȯ���ڰ� mo �� ���� �ϴ� �̰����� �Ͷ� */
public class FrontControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   //  FrontContcntroller �� ���� - ������� ��û�� �̰����� ���߽�Ű��, 
   // �̰����� �б��� ���� �����ϴ� ����
   // extends : ��� ���� ��ӹ޾� �״�� ����� ������ ��
   // implement : interface�� ���븸 �ִ� �޼ҵ带 ��� �޾�
           // ��� ���� ������ �޼ҵ带 �����Ͽ� �����.
   // FrontControllerServlet �� HttpServlet�� ��� �޾� ����Ѵ�. 

	
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
	
		request.setCharacterEncoding("euc-kr"); // �ѱ� ó��
		
		Model2Service command = null;
		// �����ؾ� �� ������ ������ ��ü
		    String nextPage = null;
		 // ���� ����� ���ɼ��� �ִ� ���� null �� ���� 
		    String requestURI = request.getRequestURI();
		// ����� ���� /ch14_MVC_MODEL2/list.mo  �� ��µ� 
		String contextPath = request.getContextPath();
		// ����� ���� /ch14_MVC_MODEL2  �� ��µ� 
		String com = requestURI.substring(contextPath.length());
		// URI ���� contextPath.length ���� ��ŭ �߶����,  list.mo

		
		//�� ���� �ϱ�
		if(com.equals("/update.mo")){
		command = new ModifyService();
		command.execute(request, response);
		nextPage = "list.mo";
		 }

		
		//�� ���� �ϱ�
		if(com.equals("/delete.mo")){
		System.out.println("delete ��û...");
		command = new DeleteService();
		command.execute(request, response);
		nextPage = "list.mo"; /* ���⼭���ʹ� write �� ���� ���� */
		}

		// �� ����   ������ �Է� ���� ������ request ��ü�� ��� �̰����� ��
		if(com.equals("/write.mo")){
		 // WriterService() �� ��ü command ����
		command = new WriteService(); 
		/* 17���ο��� import �߱⶧���� �̷��� ����� ������ */
		// Model2.service �� �ִ� WriterService() ������ �� ��
		// WriterService() �� �ִ� execute(request, response)�� ����
		command.execute(request, response); 
		/* ������ �Է��� �����͸� request �� ��� ������ */
		// nextPage �� �̵��� �������� list.mo �� �����ϰ� 114 �������� ��.
		nextPage = "list.mo";
		}
				
		// ����Ʈ ����(list.mo) �̹Ƿ� 
		 if(com.equals("/list.mo")){
		// �����Ͻ� ������ ó���ϴ� ListService �� ��ü command ����
			command = new ListService(); /* 14���ο��� import �߱� ������ �ٷ� ����� ���� */
		// null�� command �� ListService() ������ �Ҵ��� ��
		// Model2.service �� �ִ� ListService() �� ����
		// ListService() �� �ִ� 19����  execute(request, response)�� ���� 
		command.execute(request, response);
		// DB ���� ���� select �� �� ����� request �� ����ִ�.
		// �̵��� �������� ����, �� �� ��� �����ְ�  list.jsp��  �̵���.
		nextPage = "list.jsp";
		}

		 
		// �� �˻� �ϱ�
			if(com.equals("/search.mo")){
			command = new SearchService();
			command.execute(request, response);
			nextPage = "search.jsp";
			}
			
		// HttpServletRequest ��ü�� getRequestDispatcher() �޼ҵ带 ����Ͽ�
		// RequestDispatcher ��ü dis�� �����Ѵ�. ���� �����δ� �̵��� �������� list.mo ����
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
                   // nextPage ���� list.mo  �� ����Ǿ� �̰����� ��
		          // nextPage ���� list.jsp  �� ����Ǿ� �̰����� ��
		
		// RequestDispatcher ��ü dis �� ������ �ִ� ��ο� �ش��ϴ� �������� �̵��ϰ�
		// forward() �޼ҵ�� Ŭ���̾�Ʈ�� ������  ������  doGet �Ǵ� doPost �޼ҵ��� ���ڰ���
		// request, response ���� �����Ͽ� forwarding �Ѵ�. 
		// �� �� request ��ü���� dis �̸����� EmpDTO ��ü�� �ּҰ��� ����ִ�. 
		dis.forward(request, response);
		// request ������ list.mo �� FrontControllerServlet 92 ���� ����  �������ϰ�
		// list.jsp �̸� ListService���� request�� set �� ������ ������  list.jsp �� ��������. 
		// select �� ������ request �� ��Ƽ� list.jsp ������ �� ����	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
