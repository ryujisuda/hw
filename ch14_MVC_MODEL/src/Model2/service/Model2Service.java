package Model2.service;  /*�������̽��� */

import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse; 

//���� ���̽� ���� - �������̽��� ���븸 ����� ���� ������ ��� ���������� �Ѵ�.
public interface Model2Service {
	//request �� response �Ű������� ���� execute() �޼��� ������ ����
	//�� Ŭ������ ��� ���� ������ execute() �޼��带 �� �����Ͽ� ����� ��
	public void execute(HttpServletRequest request,	HttpServletResponse response);
	    // execute() �� �޼ҵ常 �ְ�, ������ �ƹ� �͵� ����
	}

// FrontController�� ���� ����� �м��Ͽ� �б��� ���� ������ ��
// Model2Service�� �������̽��� ���� ������Ʈ���� ǥ���� ����� ���� �� 
// �� ǥ���� - execute() ��ӹ޾� �������� ����ϵ�����.
// Model2Service�� ��� ���� WriteService ���� execute() ���� �ۼ���

// FrontController ���� �Ѿ�� ��ɾ� ���뿡 �´� �۾��� �����ϵ��� ��
// �۾���, ����, ����, ��ȸ ���� �۾��� �ϴ� ��ü�� Model2Service �������̽���
// ����� ���� ��� �޾� �� ��ɿ� �°� �� �����Ͽ� �����
// DAO : �����͸� ó���� �� ���(�Է�, ����, ��ȸ, ���� ��ɵ��� �ۼ��Ǿ� ����
// DTO : �����͸� ������� �� ���� ���� ���� �ʰ� ��ü �����͸� DTO �ٱ��Ͽ� ��� �̵�
