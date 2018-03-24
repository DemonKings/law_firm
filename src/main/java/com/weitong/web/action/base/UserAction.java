package com.weitong.web.action.base;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

import javax.jms.JMSException;
import javax.jms.MapMessage;
import javax.jms.Message;
import javax.jms.Session;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Controller;

import com.weitong.domain.User;
import com.weitong.service.UserService;
import com.weitong.utils.MailUtils;
import com.weitong.web.action.common.BaseAction;

@Controller
@Namespace("/")
@Scope("prototype")
@ParentPackage("struts-default")
@Results({@Result(name="toIndex",type="redirect",location="/pages/base/index.jsp"),
	@Result(name="signup",location="/pages/base/signup.jsp")})
public class UserAction extends BaseAction<User>{
	//注入UserService
	@Autowired
	private UserService userService;
	
	//注入activeMQ的JmsTemplate模板
	@Autowired
	private JmsTemplate jmsTemplate;
	
	//注入RedisTemplate
	@Autowired
	private RedisTemplate<String, String> redisTemplate;
	
	/**
	 * 登录页面输入手机号发送Ajax校验手机号是否存在
	 * 
	 */
	@Action("UserAction_validateTel")
	public String validateTel() throws Exception {
		//调用service,根据手机号查询用户
		User user = userService.findByTelephone(model.getTelephone());
		if(user==null){
			ServletActionContext.getResponse().getWriter().write("true");
		}else{
			ServletActionContext.getResponse().getWriter().write("false");
		}
		return null;
	}
	
	/**
	 * 发送短信验证码,使用activeMQ
	 */
	@Action("CustomerAction_sendCheckcode")
	public String sendCheckcode() throws Exception {
		//生成4位短信验证码
		final String checkcode = RandomStringUtils.randomNumeric(4).toString();
		System.out.println(checkcode);
		//将短信验证码放入session中
		ServletActionContext.getRequest().getSession().setAttribute("checkcode", checkcode);
		//创建发送短信需要的参数,发送到消息中
		//使用jmsTemplate发送消息
		try {
			jmsTemplate.send("signup_checkcode", new MessageCreator() {
				@Override
				public Message createMessage(Session session) throws JMSException {
					//创建map消息
					MapMessage mapMessage = session.createMapMessage();
					//参数一:用户电话
					mapMessage.setString("tel", model.getTelephone());
					//参数二:短信模板
					mapMessage.setString("templateCode", "SMS_128060131");
					//参数三:参数map
					Map<String, Object> map = new HashMap<>();
					map.put("code", checkcode);
					mapMessage.setObject("tempalteParams", map);
					return mapMessage;
				}
			});
			//发送成功响应1
			ServletActionContext.getResponse().getWriter().write("1");
		} catch (Exception e) {
			//发送失败响应0
			ServletActionContext.getResponse().getWriter().write("0");
			e.printStackTrace();
		}
		return null;
	}
	
	//属性驱动接收短信验证码参数
	private String checkcode;
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}
	/**
	 * 校验验证码是否填写正确
	 */
	@Action("UserAction_validateCheckcode")
	public String validateCheckcode() throws Exception {
		//从session中取出短信验证码
		String realCheckcode = (String) ServletActionContext.getRequest().getSession().getAttribute("checkcode");
		if(StringUtils.isNotBlank(realCheckcode)&&realCheckcode.equals(checkcode)){
			//验证码输入正确返回true
			ServletActionContext.getResponse().getWriter().write("true");
		}else{
			//验证码输入错误返回false
			ServletActionContext.getResponse().getWriter().write("false");
		}
		return null;
	}
	
	/**
	 * 用户提交表单注册
	 * 保存用户,发送短信通知,发送邮件激活
	 */
	@Action("UserAction_regist")
	public String regist() throws Exception {
		try {
			//保存用户
			userService.save(model);
			//TODO 发送短信通知
			
			//发送邮件激活
			jmsTemplate.send("active_mail", new MessageCreator() {
				@Override
				public Message createMessage(Session session) throws JMSException {
					//创建map消息
					MapMessage mapMessage = session.createMapMessage();
					//参数一:主题
					mapMessage.setString("subject", "恭喜注册全景律师事务所用户");
					//参数二:邮件内容
					//创建激活码
					String activeCode = UUID.randomUUID().toString();
					String content = "欢迎您注册全景律师事务所，为了提供更好的服务，请您在24小时内激活用户!!</br>"
							+ "<a href='"+MailUtils.activeUrl+"?telephone="+model.getTelephone()+"&activeCode="+activeCode+"'>点击激活</a>";
					mapMessage.setString("content", content);
					//参数三:用户邮箱
					mapMessage.setString("to", model.getEmail());
					//将激活码放入Redis中,有效期24小时,key为用户的手机
					redisTemplate.opsForValue().set(model.getTelephone(), activeCode, 24, TimeUnit.HOURS);
					return mapMessage;
				}
			});
			return "toIndex";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "signup";
	}
}
