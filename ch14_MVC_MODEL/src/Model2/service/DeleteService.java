package Model2.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model2.dao.EmpDAO;// �߰�

//WriteService Ŭ������ �������̽��� �����  Model2Service �� ��ӹ޾� ����ض�
//�������̽� �̹Ƿ� ��� �޾� �ٽ� �����ؼ� ����ض�
// public class DeleteServicr {   // ���� Ŭ����
public class DeleteService implements Model2Service {
	@Override  // �� �����ϰڴٴ� �ǹ�
	// Model2Service �� ���븸 ������ ���� execute( )�� ���⼭ �ٽ� ������ ���
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	// �����ϸ� ���� view.jsp ���� ���̵� �����ͼ� DB�� �Ƶ�� ���� ���� �����ؾ� ��
	String id = request.getParameter("id");
	 // EmpDAO Ŭ������ �� ���� dao ��ü�� ����-Model2.dao�� �ִ� 
	// EmpDAO.java ������ �ð�
	         EmpDAO  dao = new EmpDAO();
	         // dao�� �ִ� delete(id) �޼ҵ� ȣ��(����)
	         // �����̹Ƿ� ���ϰ��� ������ ������ ����Ʈ ���� �������� �̵�
	 dao.delete(id); // id�� �Ű������� �Ѱ� ��
	 // �����Ϸ�ǰ� �̰��� ȣ���� FrontControllerServlet 74�������� ����� �Ѱ� ��
	}
	}
