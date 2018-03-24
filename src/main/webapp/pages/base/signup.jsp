<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	    <title>用户注册</title>
  	</head>
	<body>
		<!-- 插入头 -->
		<%@ include file="/pages/base/head.jsp" %>
			
			<!-- 用户注册 -->
			<div class="container">
				<section class="mainsign">
					<div class="headnav">
					</div>
					<div class="signup">
						<div class="col-md-9 signupbox">
							<form action="${pageContext.request.contextPath }/UserAction_regist.action" method="post" class="bl-form bl-formhor" id="jsForm">
								<ul>
									<li class="bl-form-group">
										<label><em>*</em>手机号：</label>
										<div class="controls">
											<input type="text" id="telephone" value="" name="telephone" class="fn-tinput" placeholder="手机号" required data-rule-mobile="true" data-msg-required="请输入手机号" data-msg-mobile="请输入正确格式" data-rule-remote="${pageContext.request.contextPath }/UserAction_validateTel.action" data-msg-remote="手机号已被注册!"/>
										</div>
									</li>
									<li class="bl-form-group">
										<label><em>*</em>验证码：</label>
										<div class="controls">
											<input type="text" value="" name="checkcode" class="fn-tinput" placeholder="请输入验证码" required data-rule-remote="${pageContext.request.contextPath }/UserAction_validateCheckcode.action" data-msg-remote="验证码错误!"/>
											<input type="button"  onclick="sendCode(this)" class="btn btn-default" value="获取验证码">
											<script type="text/javascript">
												var clock = '';
												var nums = 60;
												var btn;
												function sendCode(thisBtn) {
													//判断手机号是否输入正确
													var tel = $("#telephone").val();
													var reg = /^1[3|4|5|7|8][0-9]{9}$/;
													var r = reg.test(tel);
													if(!r){
														alert("请输入正确的手机号!");
														return;
													}
													//发送Ajax请求给用户发送验证码
													$.post("${pageContext.request.contextPath }/CustomerAction_sendCheckcode.action",{"telephone":tel},function(data){
														if(data==1){
															alert("验证码发送成功,请注意查收!")
														}else{
															alert("验证码发送失败,请联系客服!")
														}
													})
													
													btn = thisBtn;
													btn.disabled = true; //将按钮置为不可点击
													btn.value = nums + '秒后重新获取';
													clock = setInterval(doLoop, 1000); //一秒执行一次
												}
												function doLoop() {
													nums--;
													if (nums > 0) {
														btn.value = nums + '秒后重新获取';
													} else {
														clearInterval(clock); //清除js定时器
														btn.disabled = false;
														btn.value = '重新获取验证码';
														nums = 60; //重置时间
													}
												}
											</script>
										</div>	
									</li>
									<li class="bl-form-group">
										<label><em>*</em>新密码：</label>
										<div class="controls">
											<input class="fn-tinput" type="password" name="password" value="" placeholder="新密码" required id="password" data-rule-remote="php.php">
										</div>
									</li>
									<li class="bl-form-group">
										<label><em>*</em>确认新密码：</label>
										<div class="controls">
											<input class="fn-tinput" type="password" name="confirm_password" value="" placeholder="确认新密码" required equalTo="#password">
										</div>
									</li>
									<li class="bl-form-group">
										<label><em>*</em>绑定邮箱：</label>
										<div class="controls">
											<input type="email" value="" name="email" class="fn-tinput" placeholder="请输入email地址" required data-rule-email="true" data-msg-required="请输入email地址" data-msg-email="请输入正确的email地址" />
										</div>
									</li>
									<li class="bl-form-group bl-form-text">
					                <label></label>
					                <div class="controls">
					                    <label></label>
					                    <label><input name="radio1" type="radio" checked="checked" value=""> <a href="#">查看并同意 《速运快递服务协议》</a></label>
					                </div>
					            </li>
									<li class="bl-form-group bl-form-btns">
										<label class="fn-vhid">提交：</label>
										<div class="controls">
											<a id="checkbtn" class="btn btn-danger btn-submit submitBtn col-md-3" type="submit">注册</a>
											<script type="text/javascript">
												$(function(){
													$("#checkbtn").click(function(){
														 if ($('#jsForm').validate().form()) {
															$('#jsForm')[0].submit();
											             }
													});
												});
											</script>
										</div>
									</li>
								</ul>
							</form>
						</div>
						<div class="col-md-3 introbox">
							<div class="signintro">
								<h5 class="redtext">注册成为全景用户，您可以享受更多的服务！</h5>
								<ul>
									<li class="list-group">专业团队,查看律师详细信息</li>
									<li class="list-group">经典案例,查看我所受理的经典案例</li>
									<li class="list-group">案例分析,查看案例详情</li>
									<li class="list-group">法律咨询,在线与客服沟通咨询</li>
								</ul>
							</div>
						</div>
					</div>
				</section>
			</div>
			<br/>
			<br/>
			<br/>
		<!-- 插入脚 -->
		<%@ include file="/pages/base/foot.jsp" %>
	</body>
</html>