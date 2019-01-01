package jdbc.util;

import java.util.*;
import java.sql.*;

public class ConnectionPoolBean {
	
	private HashMap<Connection, Boolean> hm = new HashMap<>();
	private String url="jdbc:oracle:thin:@localhost:1521:XE";
	private String user="myshop", pwd="tiger";
	private int increment = 3; //����ġ
	
	public ConnectionPoolBean() 
			throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		//�̸� Connection�� 5�� �����ؼ� HashMap�� �����س���.
		Connection con = null;
		for(int i=0;i<5;i++) {
			con = DriverManager.getConnection(url, user, pwd);
			hm.put(con, Boolean.FALSE);
		}
		
		/* connection�� key������ �����ϰ�, ó������ false�� value ������
		 * �����Ѵ�. false�� ����ִٴ� �ǹ� */
		
		System.out.println("ConnectionPoolBean����...");
	}

	public synchronized Connection getCon() 
			throws SQLException {
		// HashMap���� key������ �����ؼ� false�� connection�� �ִ��� ã�´�.
		// ������ ���Ϸ� ��������.(��ȯ) ��ȯ�ϱ� ���� true ǥ���صд�.
		Set<Connection> set = hm.keySet();
		
		if(set!=null) {
			for(Connection con:set) {
				Boolean b = hm.get(con);
				if(!b) {
					hm.put(con, Boolean.TRUE); //���ϴ� con���� ��ũ
					return con; //���Ϸ� ������
				}
			}
		}
		
		//����ִ� con�� �ϳ��� ���ٸ� Connection�� ������Ű��.
		for(int i=0;i<increment;i++) {
			Connection con 
				= DriverManager.getConnection(url, user, pwd);
			hm.put(con, Boolean.FALSE);
		}
		
		return getCon(); //��� ȣ��
	}
	
	public synchronized void returnCon(Connection rcon) 
			throws SQLException {
		/* hm���� key���� ������ ��ȯ�ϴ� Connection(rcon)�� ������ �ּҰ���
		 * ���� Connection�� �ִٸ� false�� ǥ�����ش�. */
		
		Set<Connection> set = hm.keySet();
		
		if(set!=null) {
			Iterator<Connection> it = set.iterator();
			
			while(it.hasNext()) {
				Connection con = it.next();
				if(con==rcon) {
					hm.put(con, Boolean.FALSE);
					break;
				}
			}
		}
		removeCon(); //Ŀ�ؼ��� �⺻������ 5���� �����ϵ��� �ϴ� �޼ҵ�
	}
	
	public void removeCon(){
		Connection con=null;
		Set<Connection> set = hm.keySet();
		int count=0;//False�� con�� ����
		try{
			Iterator<Connection> it = set.iterator();
			
			while(it.hasNext()){
				con=it.next();
				Boolean b=hm.get(con);
				if(!b){
					count++;
					if(count>5){
						hm.remove(con);
						con.close();// false�� con�� 5�� �̻��̶�� ht���� ������
						//���� ����
					}
				}//if----
			}//while--------------		
		}catch(SQLException e){
			
		}
	}//removeCon()-----------------------------------
	
	public void closeAll(){
		Set<Connection> set = hm.keySet();
		
		Iterator<Connection> it = set.iterator();
		while(it.hasNext()){
			Connection con=it.next();
			try{
				con.close();
			}catch(SQLException e){
				
			}
		}//while---------
	}//closeAll()--------------------------------------
	
}