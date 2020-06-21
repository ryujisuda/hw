package Model2.dto;
//ListService ���� �۾��� �� ���� DB ���� �����͸� �����ͼ� 
//�ڹ� ���α׷����� ����ϱ� ���� DTO ��ü�� ��ȯ����
public class EmpDTO {
	String emp_id;  // ���̺� �÷���� ���� ������
	String ename;
	int salary;
	String depart;

	public EmpDTO() {}   // default ������
	
	// �Է������� �Ķ���ͷ� �Է� ���� �����͸� �ʱ�ȭ�ϴ� �Ű������� �ִ� ������
	public EmpDTO(String emp_id, String ename, int salary, String depart) {
	this.emp_id = emp_id;   
	this.ename = ename;
	this.salary = salary;
	this.depart = depart;
	}   // �Ű����� �ִ� ������

	// getter : �о�� �� ��� - ù ���ڴ� �빮�� E
	public String getEmp_id() {
	return emp_id;
	}
	//setter : ������ �� - ù ���ڴ� �빮�� E
	public void setEmp_id(String emp_id) {
	this.emp_id = emp_id;
	}
	public String getEname() {    // - ù ���ڴ� �빮�� Ename
	return ename;   
	}
	public void setEname(String ename) {
	this.ename = ename;  
	}

	    public int getSalary() {
		return salary;      
		}
		public void setSalary(int salary) {
		this.salary = salary;    
		}
		public String getDepart() {
		return depart;   
		 }
		public void setDepart(String depart) {
		this.depart = depart;  
		 }

	}