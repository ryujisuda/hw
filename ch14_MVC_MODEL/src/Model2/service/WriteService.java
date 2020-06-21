package Model2.service;
import javax.servlet.http.HttpServletRequest;  // �߰�
import javax.servlet.http.HttpServletResponse; // �߰�
import Model2.dao.EmpDAO;                      // �߰�


//  WriteService Ŭ������ �������̽��� �����  Model2Service �� ��ӹ޾� ����ض�
// �������̽� �̹Ƿ� Model2Service ������ ���븸 ����� ���� �� 
// ��� ���� ������ WriteService �ٽ� �����ؼ� ����ض�
// Model2Service �� �������̽� ������ �ƹ��͵� ���� execute() �� ���� �Ǿ� ����
// ���⼭ ��� ������ ���� ���ϸ� ���� �ҽ� �м��� �ȵ�.
public class WriteService implements Model2Service {
	// Model2Service �������̽�  ������ 
	
@Override   // ��� ���� ������ �� �����ϰڴٴ� �ǹ�
// Model2Service �� interface �� ���븸 ������ ���� execute( )�� ���⼭ �ٽ� �����ؼ� �����
// ���� ������ ������ �޼ҵ常ŭ�� ����� ���� ������ �߻� ����.
public void execute(HttpServletRequest request, HttpServletResponse response) {
	response.setContentType("text/html; charset=EUC-KR");
	// ���Է� ������ �Է��� �����͸� �޾Ƽ� ������ ����
		String emp_id = request.getParameter( "emp_id" );
		String ename = request.getParameter( "ename" );
		int salary = Integer.parseInt(request.getParameter( "salary" ));
		String depart = request.getParameter( "depart" );

		// EmpDAO Ŭ������ �� ���� dao ��ü�� ������. 14���ο��� import �߱� ������ �ٷ� ����� ����
		// Model2.dao�� �ִ� EmpDAO.java ������ �ð� 
		    EmpDAO dao = new EmpDAO();
		 // dao ���ִ� write(emp_id, ename, salary,depart) �޼ҵ� ȣ��(����) 92����
		 // �� �ۼ��̹Ƿ� ���ϰ� ���� �޼ҵ� ȣ��
		    dao.write(emp_id, ename, salary,depart);
		    // �����̹Ƿ� ���⼭ ��ġ�� �̰��� ȣ���� FrontControllerServlet 85 �������� ����� �ѱ�
		    // ���ϰ��� ������ ȣ���� ������ ������ �ѱ� 
	}
}