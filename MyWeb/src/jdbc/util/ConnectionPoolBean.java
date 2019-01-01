package jdbc.util;

import java.util.*;
import java.sql.*;

public class ConnectionPoolBean {
	
	private HashMap<Connection, Boolean> hm = new HashMap<>();
	private String url="jdbc:oracle:thin:@localhost:1521:XE";
	private String user="myshop", pwd="tiger";
	private int increment = 3; //증가치
	
	public ConnectionPoolBean() 
			throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		//미리 Connection을 5개 생성해서 HashMap에 저장해놓자.
		Connection con = null;
		for(int i=0;i<5;i++) {
			con = DriverManager.getConnection(url, user, pwd);
			hm.put(con, Boolean.FALSE);
		}
		
		/* connection을 key갑으로 저장하고, 처음에는 false를 value 값으로
		 * 저장한다. false는 놀고있다는 의미 */
		
		System.out.println("ConnectionPoolBean생성...");
	}

	public synchronized Connection getCon() 
			throws SQLException {
		// HashMap에서 key값들을 추출해서 false인 connection이 있는지 찾는다.
		// 있으면 일하러 내보낸다.(반환) 반환하기 전에 true 표시해둔다.
		Set<Connection> set = hm.keySet();
		
		if(set!=null) {
			for(Connection con:set) {
				Boolean b = hm.get(con);
				if(!b) {
					hm.put(con, Boolean.TRUE); //일하는 con으로 마크
					return con; //일하러 내보냄
				}
			}
		}
		
		//놀고있는 con이 하나도 없다면 Connection을 증가시키자.
		for(int i=0;i<increment;i++) {
			Connection con 
				= DriverManager.getConnection(url, user, pwd);
			hm.put(con, Boolean.FALSE);
		}
		
		return getCon(); //재귀 호출
	}
	
	public synchronized void returnCon(Connection rcon) 
			throws SQLException {
		/* hm에서 key값을 꺼내서 반환하는 Connection(rcon)과 동일한 주소값을
		 * 갖는 Connection이 있다면 false로 표시해준다. */
		
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
		removeCon(); //커넥션을 기본적으로 5개만 유지하도록 하는 메소드
	}
	
	public void removeCon(){
		Connection con=null;
		Set<Connection> set = hm.keySet();
		int count=0;//False인 con의 개수
		try{
			Iterator<Connection> it = set.iterator();
			
			while(it.hasNext()){
				con=it.next();
				Boolean b=hm.get(con);
				if(!b){
					count++;
					if(count>5){
						hm.remove(con);
						con.close();// false인 con이 5개 이상이라면 ht에서 제거후
						//연결 종료
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