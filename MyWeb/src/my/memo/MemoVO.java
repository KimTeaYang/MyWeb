package my.memo;

import java.sql.Date;

/*
 * M : MemoVO (Value Object)=> Domain����
		db���̺��� ���ڵ带 Objectȭ�ؼ� �Űܳ��� Ŭ����.
		����ڰ� �Է��� ���� ��ų�, db���� ������ ���� ���� �� ����Ѵ�.
	   MemoDAO (Data Access Object)=> Persistence����
		�����ͺ��̽��� �����Ͽ� ����Ͻ� ����(CRUD)�� �����ϴ� Ŭ����.
   V : MemoGui (View����)=> Presentation ����
   C : Controller
------------------------------------------------
   UI Delegation -- Model
*/

public class MemoVO implements java.io.Serializable {
	private int idx;
	private String name;
	private String msg;
	private java.sql.Date wdate;
	
	public MemoVO() {
		
	}

	public MemoVO(int idx, String name, String msg, Date wdate) {
		super();
		this.idx = idx;
		this.name = name;
		this.msg = msg;
		this.wdate = wdate;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public java.sql.Date getWdate() {
		return wdate;
	}

	public void setWdate(java.sql.Date wdate) {
		this.wdate = wdate;
	}

	@Override
	public String toString() {
		return "MemoVO [idx=" + idx + ", name=" + name + ", msg=" + msg + ", wdate=" + wdate + "]";
	}
	
}