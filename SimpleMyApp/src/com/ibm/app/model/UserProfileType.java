package com.ibm.app.model;

import java.io.Serializable;

public enum UserProfileType implements Serializable{
	USER("USER"),
	DBA("DBA"),
	ADMIN("ADMIN"),
	DEVELOPER("DEVELOPER"),
	MANAGER("MANAGER"),
	RESIGNED_EMPLOYEE("RESIGNED_EMPLOYEE"),
	ON_BENCH_EMPLOYEE("ON_BENCH_EMPLOYEE"),
	HR_MANAGER("HR_MANAGER"),
	VENDOR("VENDOR"),
	CUSTOMER("CUSTOMER"),
	PARTNER("PARTNER"),
	ANNONYMOUSE("ANNONYMOUSE"),
	INDIA_EMPLOYEE("INDIA_EMPLOYEE"),
	USA_EMPLOYEE("USA_EMPLOYEE"),
	GLOBAL_EMPLOYEE("GLOBAL_EMPLOYEE"),
	OWNER("OWNER");
	
	String userProfileType;
	
	private UserProfileType(String userProfileType){
		this.userProfileType = userProfileType;
	}
	
	public String getUserProfileType(){
		return userProfileType;
	}
	
}
