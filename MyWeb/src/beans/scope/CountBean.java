package beans.scope;

public class CountBean {
	private int cnt;
	//jsp�� input name�� ��ġ�����ִ� ���� ����.
	
	public CountBean() {
		System.out.println("CountBean()����...");
	}

	public int getCount() {
		System.out.println("getCount()");
		return cnt;
	}

	public void setCount(int cnt) {
		System.out.println("setCount() : "+cnt);
		this.cnt += cnt; // ����
	}
	
}
