package a.b.c.ch9;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Ex_OracleTest {

	public static void main(String[] args) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		
		/*
		   1. 	oracle.jdbc.driver.OracleDriver : ojdbc6.jar ����Ŭ ����̹� ã�� ������ Ŭ������ ���ӽ����̽� 
		   		oracle.jdbc.driver : ��Ű�� �̸� 
		   		OracleDriver : Ŭ���� �̸�
		   
		   2. 	jdbc:oracle:thin: - ����Ŭ jdbc thin ����̹� ã�� ���ڿ�
		   
		   3. 	@localhost - @ ������, localhost : ������ ���̽��� ��ġ�� ��ǻ�� �̸�
			                     127.0.0.1 
			                     192.168.219.100  
			                     DESKTOP-A9S5QHQ  
		   4.	1521 - ����Ŭ �����ͺ��̽� ����Ű�� port ��ȣ 
		   5.	orclKOSMO00 - �����ͺ��̽� �ĺ��� : SID �Ǵ� ���������ͺ��̽� �̸�
		   6. 	: <== ������  
		   
		   7. 	scott : ���� 
		   8. 	tiger : ��й�ȣ
		*/
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orclKOSMO00", "scott", "tiger");
		Statement stmt = conn.createStatement();
		ResultSet rsRs = stmt.executeQuery("SELECT * FROM EMP");
		while (rsRs.next()) {
			System.out.print(rsRs.getString(1) + " : ");
			System.out.print(rsRs.getString(2) + " : ");
			System.out.print(rsRs.getString(3) + " : ");
			System.out.print(rsRs.getString(4) + " : ");
			System.out.print(rsRs.getString(5) + " : ");
			System.out.print(rsRs.getString(6) + " : ");
			System.out.print(rsRs.getString(7) + " : ");
			System.out.println(rsRs.getString(8));
		}
	}
}
