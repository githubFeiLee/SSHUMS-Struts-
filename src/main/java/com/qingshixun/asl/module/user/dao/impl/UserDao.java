package com.qingshixun.asl.module.user.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.qingshixun.asl.dto.UserModel;
import com.qingshixun.asl.module.user.dao.IUserDao;

@Repository("userDao")
public class UserDao implements IUserDao {

	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public void addUser(UserModel user) {
		sessionFactory.getCurrentSession().saveOrUpdate(user);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<UserModel> queryUsers() {
		return sessionFactory.getCurrentSession().createQuery("FROM UserModel").list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<UserModel> queryAllUsers() {
		String hql="FROM UserModel";
		List<UserModel> list=sessionFactory.getCurrentSession().createQuery(hql).list();
		
			return list;
	}
	
	@Override
	public UserModel queryUpdateUser(Integer userId) {
		UserModel user= (UserModel) sessionFactory.getCurrentSession().load(UserModel.class, userId);
		System.out.println(user);
		return user;
	}
	@Override
	public void deleteUser(Integer userId) {
		UserModel user=(UserModel) sessionFactory.getCurrentSession().load(UserModel.class, userId);
		sessionFactory.getCurrentSession().delete(user);
	}
	@SuppressWarnings("rawtypes")
	@Override
	public List queryUserGenderNumbers() {
		String hql = "SELECT count(*) AS number,gender FROM UserModel GROUP BY gender";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	@SuppressWarnings("rawtypes")
	@Override
	public List queryUserAgeNumbers() {
		String hql = "SELECT count(*) AS number,age FROM UserModel GROUP BY age";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	@Override
	public void deleteUser(int userId) {
		
		
	}

}
