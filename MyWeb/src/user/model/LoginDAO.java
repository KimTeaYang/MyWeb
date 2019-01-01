package user.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.*;
import javax.sql.*;
import jdbc.util.ConnectionPoolBean;
import jdbc.util.DAOBase;

public class LoginDAO extends DAOBase {
	
	/*private ConnectionPoolBean pool;*/ //ConnectionPool property
	
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
/*
	public ConnectionPoolBean getPool() {
		return pool;
	}
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}
*/
	
	public LoginDAO() {
		super();
	}
	
	/** userid(unique constraint)�� ȸ�������� �������� �޼ҵ� */
	public UserVO findUserByUserid(String userid) 
	throws SQLException, NotUserException {
		try {
			//con = DBUtil.getCon();
			con = ds.getConnection();
			String sql = "SELECT * FROM memberView WHERE USERID=?";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			
			ArrayList<UserVO> arr = makeList(rs);
			
			if(arr!=null && arr.size()==1) {
				UserVO userVO = arr.get(0);
				return userVO;
			}
 
			//�ش� ���̵� ���� ��� ���ܸ� �߻���Ų��
			throw new NotUserException("�������� �ʴ� ȸ���Դϴ�.");
		}finally{
			close();
		}
	}
	
	/** �α��� ���θ� üũ�ϴ� �޼ҵ� */
	public UserVO loginCheck(String userid, String pwd) 
	throws SQLException, NotUserException {
		
		//1. userid�� ȸ������ �������� �޼ҵ� ȣ��
		UserVO loginUser = this.findUserByUserid(userid);
		
		//2. ���̵� �����Ѵٸ�
		if(loginUser!=null) {
			// ��й�ȣ ��ġ���θ� üũ����
			String dbPwd = loginUser.getPwd();
			if(!dbPwd.equals(pwd)) {
				//��й�ȣ�� ��ġ���� ������ ���� �߻�
				throw new NotUserException("��й�ȣ�� Ʋ����");
			}
			
			// ����ȸ�� �� Ż��ȸ�� �α��� ����
			/*int mstate = loginUser.getMstate();
			if(mstate==-1) {
				throw new NotUserException("���� ȸ���Դϴ�.");
			}else if(mstate==-2) {
				throw new NotUserException("Ż�� ȸ���Դϴ�.");
			}*/
		}
		//��й�ȣ�� ��ġ�Ѵٸ� �ش� ȸ������ ��ȯ
		return loginUser;
	}

	private ArrayList<UserVO> makeList(ResultSet rs) 
	throws SQLException {
		ArrayList<UserVO> arr = new ArrayList<>();
		while (rs.next()) {
			int idx = rs.getInt("idx");
			String name = rs.getString("name");
			String userid = rs.getString("userid");
			String pwd = rs.getString("pwd");
			String email = rs.getString("email");
			String hp1 = rs.getString("hp1");
			String hp2 = rs.getString("hp2");
			String hp3 = rs.getString("hp3");
			String zipcode = rs.getString("zipcode");
			String addr1 = rs.getString("addr1");
			String addr2 = rs.getString("addr2");
			java.sql.Date indate = rs.getDate("indate");
			int mileage = rs.getInt("mileage");
			int mstate = rs.getInt("mstate");
			UserVO userVO = new UserVO(idx, name, userid, pwd, email, hp1, hp2, hp3, zipcode, addr1, addr2, indate,
					mileage, mstate);
			arr.add(userVO);
		}

		if (arr.size() == 0) {
			return null;
		}
		return arr;
	}

	private void close() {
		try {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (con != null) con.close();
			//if(con!=null) pool.returnCon(con);
		} catch (SQLException e) {
			
		}
	}
}