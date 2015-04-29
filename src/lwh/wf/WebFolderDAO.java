package lwh.wf;

import java.io.File;

public class WebFolderDAO {

	public static final String USER_HOME = "C:/Users/LeeWonHee/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/jspTest/webFolder/upload";

	private String userId;
	private String cr_path;
	private int total_size;
	private int used_size;
	private int free_size;
	
	public WebFolderDAO(){
		total_size = 1024*1024*10; //가상의 10MB
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCr_path() {
		return cr_path;
	}

	public void setCr_path(String cr_path) {
		this.cr_path = cr_path;
	}

	public int getTotal_size() {
		return total_size;
	}

	public void setTotal_size(int total_size) {
		this.total_size = total_size;
	}

	public int getUsed_size() {
		return used_size;
	}

	public void setUsed_size(int used_size) {
		this.used_size = used_size;
	}

	public int getFree_size() {
		return free_size;
	}

	public void setFree_size(int free_size) {
		this.free_size = free_size;
	}

	public boolean userFolderExists() {
		File f = new File(USER_HOME + "/" + userId);
		if (f.exists()) {
			used_size = 0;
			usedSizeSetting(f);
			free_size = total_size - used_size;
			return true;
		} else {
			return false;
		}
	}

	public void usedSizeSetting(File f) {
		File files[] = f.listFiles();
		for(int i = 0; i < files.length; i++) {
			if(files[i].isFile()){
				used_size += files[i].length();
			} else {
				usedSizeSetting(files[i]);
			}	
		}
	}
}
