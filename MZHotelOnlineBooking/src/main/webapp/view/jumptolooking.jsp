<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	手机号：<input type="text" id="phone"> <input type="button" id="btn" value="发送验证码"><br>
	验证码：<input type="text" id="sms"> <input id="login" type="button" value="登录">
	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
	var code = "";
	var phone = "";
	//1.获取	输入框的值，以id命名采用#号
	$("#btn").click(function(){
			phone = $("#phone").val();
			//利用ajax把手机号传入后台
			$.ajax({
				url: '../SendSms',
				type: "POST",
				//发送参数
				data: {"phone":phone},
				//返回结果
				success: function(result){
					//控制台打印结果
					//console.log("验证码是"+result);
					code = result;
				}
			});
		});
	$("#login").click(function(){
		//验证验证码
		var sms = $("#sms").val();
		if(sms==""){
			alert("验证码未填写！");
		}else{
			if(code==sms){
				alert("登录成功");
			}else{
				alert("验证码错误");
			}
		}
		
		
	});
	</script>
</body>
</html>