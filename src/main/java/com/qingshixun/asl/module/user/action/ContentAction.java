package com.qingshixun.asl.module.user.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.qingshixun.asl.dto.ChartData;
import com.qingshixun.asl.dto.UserModel;
import com.qingshixun.asl.module.user.service.IUserService;

@Controller("contentAction")
@Namespace("/")
@ParentPackage("base")
public class ContentAction {
	@Autowired
	private IUserService userService;

	private UserModel user;

	private List<UserModel> users;

	private ChartData userGenderData;
	
	private ChartData userAgeData;

	private Integer userId;

	
	public ChartData getUserGenderData() {
		return userGenderData;
	}

	public void setUserGenderData(ChartData userGenderData) {
		this.userGenderData = userGenderData;
	}

	public ChartData getUserAgeData() {
		return userAgeData;
	}

	public void setUserAgeData(ChartData userAgeData) {
		this.userAgeData = userAgeData;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public UserModel getUser() {
		return user;
	}

	public void setUser(UserModel user) {
		this.user = user;
	}

	public List<UserModel> getUsers() {
		return users;
	}

	public void setUsers(List<UserModel> users) {
		this.users = users;
	}


	@Action(value = "toAddAndUpdate", results = {
			@Result(name = "success", location = "/WEB-INF/views/user/form.jsp") })
	public String toAddAndUpdate() {
		if (!(userId == -1)) {
			user = userService.queryUpdateUser(userId);
			return "success";
		}
		return "success";
	}

	@Action(value = "addAndUpdate", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", type = "json") })
	public String addAndUpdateUser() {
		boolean flag = userService.addUser(user);
		if (flag == false) {
			return "error";
		}
		return "success";
	}

	@Action(value = "list", results = { @Result(name = "success", location = "/WEB-INF/views/user/list.jsp") })
	public String queryUsers() {
		users = userService.queryAllUsers();
		return "success";
	}

	@Action(value = "deleteUser", results = { @Result(name = "success", type = "json") })
	public String deleteUser() {
		userService.deleteUser(userId);
		return "success";
	}
	
	@Action(value="analyze",results={@Result(name="success",location="/WEB-INF/views/user/analyze.jsp")})
	public String analyzeUser(){
		userGenderData = userService.queryUserGenderData();
		userAgeData = userService.queryUserAgeData();
		return "success";
	}
}
