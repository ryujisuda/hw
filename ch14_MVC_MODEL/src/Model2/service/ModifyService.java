package Model2.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model2.dao.EmpDAO;

// public class ModifyService {  // ���� Ŭ���� 
public class ModifyService implements Model2Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	String emp_id = request.getParameter("emp_id");
	String ename = request.getParameter( "ename" );
	String salary = request.getParameter( "salary" );
	String depart = request.getParameter( "depart" );

	EmpDAO  dao = new EmpDAO();
	// �Ű����θ� ������ dao�� update  ȣ��
	dao.update( emp_id,ename,salary,depart );
	}
	}
