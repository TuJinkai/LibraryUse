package com.jxnu.action;

import com.opensymphony.xwork2.ActionSupport;

public class LonginAction extends ActionSupport {
	//private static final long serialVersionUID
	
	//����user����
	private String Id;
	private String Password;
	
	@Override
	public String execute() throws Exception {
		// TODO �Զ����ɵķ������
		System.out.println(Id);
		//α��֤
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
