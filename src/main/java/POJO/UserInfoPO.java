package POJO;

import java.io.Serializable;

public class UserInfoPO implements Serializable{
	private Integer id;
    private String username;
	private String password;
    
    

    public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}


    
	public UserInfoPO() {}
	
	public UserInfoPO(String username,String password){
    	 this.username = username;
    	 this.password = password;
    }
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public UserInfoPO(Integer id, String username, String password) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
	}

	

}
