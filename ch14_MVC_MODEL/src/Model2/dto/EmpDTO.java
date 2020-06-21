package Model2.dto;
//ListService 에서 작업을 한 다음 DB 에서 데이터를 가져와서 
//자바 프로그램에서 사용하기 위해 DTO 객체로 변환해줌
public class EmpDTO {
	String emp_id;  // 테이블 컬럼명과 같게 지정함
	String ename;
	int salary;
	String depart;

	public EmpDTO() {}   // default 생성자
	
	// 입력폼에서 파라미터로 입력 받은 데이터를 초기화하는 매개변수가 있는 생성자
	public EmpDTO(String emp_id, String ename, int salary, String depart) {
	this.emp_id = emp_id;   
	this.ename = ename;
	this.salary = salary;
	this.depart = depart;
	}   // 매개변수 있는 생성자

	// getter : 읽어올 때 사용 - 첫 글자는 대문자 E
	public String getEmp_id() {
	return emp_id;
	}
	//setter : 저장할 때 - 첫 글자는 대문자 E
	public void setEmp_id(String emp_id) {
	this.emp_id = emp_id;
	}
	public String getEname() {    // - 첫 글자는 대문자 Ename
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