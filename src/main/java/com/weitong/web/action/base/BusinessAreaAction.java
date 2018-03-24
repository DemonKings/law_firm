package com.weitong.web.action.base;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.weitong.domain.BusinessArea;
import com.weitong.service.BusinessAreaService;
import com.weitong.web.action.common.BaseAction;

import net.sf.json.JSONArray;

@Controller
@Namespace("/")
@Scope("prototype")
@ParentPackage("struts-default")
@Results({@Result(name="list",type="redirect",location="/pages/base/business_area.jsp")})
public class BusinessAreaAction extends BaseAction<BusinessArea>{
	
	@Autowired
	private BusinessAreaService businessAreaService;
	
	/**
	 * 查询所有业务领域
	 */
	@Action("BusinessAreaAction_findAll")
	public String findAll() throws Exception {
		//调用service查询
		List<BusinessArea> list = businessAreaService.findAll();
		//将list转为json
		String json = JSONArray.fromObject(list).toString();
		//将json写回浏览器
		ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
		ServletActionContext.getResponse().getWriter().write(json);
		return null;
	}
}
