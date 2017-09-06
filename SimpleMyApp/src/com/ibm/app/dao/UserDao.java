package com.ibm.app.dao;

import java.util.List;

import com.ibm.app.model.User;

public interface UserDao 
{
	public User findById(int id);

	public User findBySSO(String sso);

	public List<User> findAllUsers();

	public void save(User user);

	public void deleteBySSO(String sso);
}
