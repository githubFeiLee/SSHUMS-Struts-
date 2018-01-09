package com.qingshixun.asl.module.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qingshixun.asl.dto.ChartData;
import com.qingshixun.asl.dto.UserModel;
import com.qingshixun.asl.module.user.dao.IUserDao;
import com.qingshixun.asl.module.user.service.IUserService;

@Service("userService")
@Transactional
public class UserService implements IUserService {

	@Autowired
	private IUserDao userDao;

	@Override
	public boolean addUser(UserModel user) {
		if (user.equals(null)) {
			return false;
		}else{
			userDao.addUser(user);
			return true;
		}
		
	}

	@Override
	public List<UserModel> queryUsers() {
		return userDao.queryUsers();
	}

	@Override
	public List<UserModel> queryAllUsers() {

		return userDao.queryAllUsers();
	}

	@Override
	public UserModel queryUpdateUser(Integer userId) {
		return userDao.queryUpdateUser(userId);
	}

	@Override
	public void deleteUser(Integer userId) {
		userDao.deleteUser(userId);
	}

	@Override
	public ChartData queryUserGenderData() {
		List genderNumberList = userDao.queryUserGenderNumbers();
		int genderNumberCount = genderNumberList.size();
		String[] names = new String[genderNumberCount];
		String[] values = new String[genderNumberCount];
		
		for (int i=0,n = genderNumberCount;i<n;i++){
			Object[] genderNumbers = (Object[])genderNumberList.get(i);
			names[i]="\""+String.valueOf(genderNumbers[1])+"\"";
			values[i] = String.valueOf(genderNumbers[0]);
		}
		ChartData userGenderData = new ChartData();
		userGenderData.setNames("["+String.join(",",names)+"]");
		userGenderData.setValues("["+String.join(",",values)+"]");
		return userGenderData;
	}

	@Override
	public ChartData queryUserAgeData() {
		List ageNumberList = userDao.queryUserAgeNumbers();
		int ageNumberCount = ageNumberList.size();
		String[] names = new String[ageNumberCount];
		String[] values = new String[ageNumberCount];
		
		for(int i =0,n = ageNumberCount;i<n;i++){
			Object[] ageNumbers =(Object[]) ageNumberList.get(i);
			names[i] ="\""+String.valueOf(ageNumbers[1])+"\"";
			
			values[i] = String.valueOf(ageNumbers[0]);
		}
		ChartData userAgeData = new ChartData();
		userAgeData.setNames("["+String.join(",",names)+"]");
		userAgeData.setValues("["+String.join(",",values)+"]");
		return userAgeData;
	}

	

}
