package com.qingshixun.asl.module.user.dao;

import java.util.List;

import com.qingshixun.asl.dto.UserModel;

public interface IUserDao {

	void addUser(UserModel user);

	List<UserModel> queryUsers();

	List<UserModel> queryAllUsers();

	UserModel queryUpdateUser(Integer userId);

	void deleteUser(Integer userId);
	
	List queryUserGenderNumbers();
	
	List queryUserAgeNumbers();
	
	void deleteUser(int userId);
}
