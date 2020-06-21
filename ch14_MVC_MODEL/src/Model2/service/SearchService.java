package Model2.service;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model2.dao.EmpDAO;
import Model2.dto.EmpDTO;
// public class SearchService {   // ���� Ŭ����������
// Model2Service �� ��� �޾� ���� �޼ҵ� �����Ͽ� �����.
public class SearchService implements Model2Service {
@Override     // execute �� �� �����ؼ� ����ϰڴ�.
public void execute(HttpServletRequest request, HttpServletResponse response) {
	// �˻�â���� �˻��׸�� �˻� Ű���� 
	String searchName = request.getParameter( "searchName" );
	String searchValue = request.getParameter( "searchValue" );
	EmpDAO dao = new EmpDAO();
	// dao �� search() �޼ҵ� ���� �� ��� ���� �̰����� ��ȯ
	// ��ȯ�� ���� list ��ü�� ����
	ArrayList<EmpDTO>  list = dao.search( searchName ,  searchValue );
	 // ����� list ��ü�� list2 ��� �̸����� �Ӽ� �����Ͽ� request �� ����
	// �� ���� �Ѱ� ���� ������������ list2 �� ����Ͽ� ���� �̾� ��.
	request.setAttribute(  "list2"  ,   list );
	}
	}
