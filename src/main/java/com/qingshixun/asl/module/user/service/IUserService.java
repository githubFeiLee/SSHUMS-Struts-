package com.qingshixun.asl.module.user.service;

import java.util.List;

import com.qingshixun.asl.dto.ChartData;
import com.qingshixun.asl.dto.UserModel;

public interface IUserService {

	boolean addUser(UserModel user);

	List<UserModel> queryUsers();

	List<UserModel> queryAllUsers();

	UserModel queryUpdateUser(Integer userId);

	void deleteUser(Integer userId);
	
	ChartData queryUserGenderData();
	
	ChartData queryUserAgeData();
	

}
