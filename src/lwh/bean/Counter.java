package lwh.bean;

public class Counter {
	private int count;

	public Counter(){
		count = 0;
		System.out.println("counter 생성자 호출됨!");
	}
	
	public int getCount() {
		System.out.println("count객체에는"+count+"값이 존재합니다.");
		return count;
	}

	public void setCount(int count) {
		this.count += count;
		System.out.println(count+"값이 넘어왔으며\n"+this.count+"값이 누적되었습니다.");
	}

}