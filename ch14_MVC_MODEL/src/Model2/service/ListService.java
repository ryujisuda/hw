 package Model2.service;

import java.util.ArrayList;   //
import javax.servlet.http.HttpServletRequest;  //
import javax.servlet.http.HttpServletResponse;  //
import Model2.dao.EmpDAO;  //
import Model2.dto.EmpDTO;  //

//Model2Service�� �������̽���  ���븸 ������� �ִ�.  
//Model2Service �� ��� ���� �������� �ݵ�� �޼ҵ带 �����ؼ� ����ؾ� �Ѵ�. 
//public class ListService {     // ���� Ŭ���� ����
public class ListService implements Model2Service {
	// Model2Service �������̽� �� ����  execute() �� �����Ƿ� 
	// ��� ���� ���������� �����ؼ� ���ٴ� �ǹ̷�  Override �ؼ� ���
	@Override
	//  Model2Service �������̽��� execute() �� ��� �������� 
	// �ٽ� �����Ѵٰ� �ؼ�  Override �� ����
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	// �� ���븸 ��� �޾����Ƿ� �ȿ� ������ ä��
	// DB �� ���ٶ������ ����
	EmpDAO dao = new EmpDAO(); 
	// EmpDAO Ŭ������ ���� ��ü dao ���� ��  EmpDAO Ŭ������ list() �޼ҵ� 
	
	// ������ ����� ���Ϲ޾� list �� �����ϴµ�  list �� ����Ǵ� 
	//  ������ ���´� EmpDTO Ÿ���̰�, ����Ǵ� ����� ArrayList �̴� 
	// EmpDAO�� list() �޼ҵ� ������ �ð� 41���� ���� ��   ���Ϲ޾� list �� ������
	ArrayList<EmpDTO> list = dao.list();  

	//ArrayList �� ������ �� list�� �� list �� �����Ͽ� request ��ü�� ����
	//request ��ü�� ������Ƿ� �ٸ� ������������ ���� ������ �ִ�.
	request.setAttribute("list", list);
	//  request ��ü�� setAttribute�� �̿��� �� list ��ü��
	//  �� list ��� �̸����� �Ӽ���  ����
	//  ListService ����� FrontController �� ȣ���� ����.
	//  �׷��Ƿ� FrontControllerServlet 98 ���� �� ���� --> 98����
	}   //end execute

}
