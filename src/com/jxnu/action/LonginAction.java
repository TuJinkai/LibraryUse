package com.jxnu.action;

import com.opensymphony.xwork2.ActionSupport;

public class LonginAction extends ActionSupport {
	//private static final long serialVersionUID
	
	//定义user对象
	private String Id;
	private String Password;
	
	@Override
	public String execute() throws Exception {
		// TODO 自动生成的方法存根
		System.out.println(Id);
		//伪验证
		if(Id.equals("admin@admin") && Password.equals("admin"))
			return SUCCESS;
		else
			return ERROR;
	}
	


	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}



	public String getPassword() {
		return Password;
	}



	public void setPassword(String password) {
		Password = password;
	}
	
	
	

}
