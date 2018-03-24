package com.weitong.web.action.common;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class BaseAction<T> extends ActionSupport implements ModelDriven<T>{
	private T model;
	@Override
	public T getModel() {
		return model;
	}
	
	//设置model类型
	public BaseAction(){
		try {
			Class clazz = this.getClass();
			Type superclass = clazz.getGenericSuperclass();
			ParameterizedType pt = (ParameterizedType)superclass;
			Type[] types = pt.getActualTypeArguments();
			Class c = (Class) types[0];
			model = (T) c.newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
}
