package com.ibm.app.dao;

import java.util.List;

import com.ibm.app.model.UserProfile;


public interface UserProfileDao {

	List<UserProfile> findAll();
	
	UserProfile findByType(String type);
	
	UserProfile findById(int id);
}
