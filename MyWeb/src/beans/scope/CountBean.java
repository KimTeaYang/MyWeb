package beans.scope;

public class CountBean {
	private int cnt;
	//jsp의 input name과 일치시켜주는 것이 좋다.
	
	public CountBean() {
		System.out.println("CountBean()생성...");
	}

	public int getCount() {
		System.out.println("getCount()");
		return cnt;
	}

	public void setCount(int cnt) {
		System.out.println("setCount() : "+cnt);
		this.cnt += cnt; // 누적
	}
	
}
