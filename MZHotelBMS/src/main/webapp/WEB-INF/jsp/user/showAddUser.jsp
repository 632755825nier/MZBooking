<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<title>人事管理系统——添加用户</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="This is my page" />
	<link href="${ctx}/css/css.css" type="text/css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="${ctx}/js/ligerUI/skins/Aqua/css/ligerui-dialog.css"/>
	<link href="${ctx}/js/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
	
	   	<!-- 	弹窗框架           -->
	<link href="${ctx}/css/sweetalert/sweetalert.css" rel="stylesheet" type="text/css" />
	<script src="${ctx }/js/sweetalert/sweetalert.min.js"></script>	
	
	<script type="text/javascript" src="${ctx }/js/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="${ctx }/js/jquery-migrate-1.2.1.js"></script>
	<script src="${ctx}/js/ligerUI/js/core/base.js" type="text/javascript"></script>
	<script src="${ctx}/js/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script> 
	<script src="${ctx}/js/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
	<script src="${ctx}/js/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
	<link href="${ctx}/css/pager.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript">
	
	$(function(){
    	/** 员工表单提交 */
		$("#userForm").submit(function(){
			var UserName = $("#UserName");
			var UserEmail = $("#UserEmail");
			var UserPassword = $("#UserPassword");
			var UserPhoneNumber = $("#UserPhoneNumber");
	        var inpvalue = $("#UserEmail").val();
	        var pattern= /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	        var strEmail=pattern.test(inpvalue);
			var msg = "";
			 if ($.trim(UserEmail.val()) == ""&& !strEmail){
				msg = "邮箱不能为空或者邮箱格式错了";
// 				UserEmail.focus();
				swal('提示信息',msg,'error');

			}else if ($.trim(UserPassword.val()) == "" ){
				msg = "密码不能为空！";
				swal('提示信息',msg,'error');
// 				UserPassword.focus();
			}
			if (msg != ""){
				swal('提示信息',msg,'error');
// 				$.ligerDialog.error(msg);
				return false;
			}else{
				return true;
			}
			$("#userForm").submit();
		});
    	
    	
    	
	    $("#UserEmail").blur(function () {
	        var inpvalue = $("#UserEmail").val();
	        var pattern= /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	        var strEmail=pattern.test(inpvalue);
			  var msg = "";
	        if(strEmail){
	            //确认邮箱格式正确
	            $("#UserEmail").css("border-color","green");
	        }
	        else{
	            //邮箱格式不正确
	            $("#UserEmail").css("border-color","red");
// 	             msg = "邮箱格式不正确!";
// 	            $("#UserEmail").focus();
	        }
// 	        if (msg != ""){
// 				$.ligerDialog.error(msg);
// 				return false;
// 			}else{
// 				return true;
// 			}
	    });
	    
	    $("#UserPhoneNumber").blur(function(){
	        var inpvalue = $("#UserPhoneNumber").val();
			var phone=/^1[34578]\d{9}$/;	
			  var msg = "";
			if(inpvalue.match(phone)==null){  
		            $("#UserPhoneNumber").css("border-color","red");
// 		             msg = "手机号码格式不正确!";
// 		            $("#UserPhoneNumber").focus();
		        }else{
		            $("#UserPhoneNumber").css("border-color","green");
		        }
// 			if (msg != ""){
// 				$.ligerDialog.error(msg);
// 				return false;
// 			}else{
// 				return true;
// 			}
		});
    });
	
	
		

	</script>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr><td height="10"></td></tr>
  <tr>
    <td width="15" height="32"><img src="${ctx}/images/main_locleft.gif" width="15" height="32"></td>
	<td class="main_locbg font2"><img src="${ctx}/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：用户管理  &gt; 添加用户</td>
	<td width="15" height="32"><img src="${ctx}/images/main_locright.gif" width="15" height="32"></td>
  </tr>
</table>
<table width="100%" height="90%" border="0" cellpadding="5" cellspacing="0" class="main_tabbor">
  <tr valign="top">
    <td>
    	 <form action="${ctx}/user/addUser" id="userForm" method="post">
    	 	<!-- 隐藏表单，flag表示添加标记 -->
    	 	<input type="hidden" name="flag" value="2">
		  <table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
		    <tr><td class="font3 fftd">
		    	<table>
		    		<tr>
		    			<td class="font3 fftd">姓&nbsp;名：<input type="text" name="UserName" id="UserName" size="20"/></td>
		    			<td class="font3 fftd">手机号码：<input type="text" name="UserPhoneNumber" id="UserPhoneNumber" size="20"/></td>
		    		</tr>
		    			
		    		<tr>
		    			<td class="font3 fftd">邮箱号码：<input name="UserEmail" id="UserEmail" size="20" /></td>
		    			<td class="font3 fftd">密&nbsp;码：<input name="UserPassword" id="UserPassword" size="20" /></td>
		    		</tr>
		    		
		    	</table>
		    </td></tr>
			<tr><td class="main_tdbor"></td></tr>
			
			<tr><td align="left" class="fftd"><input type="submit" value="添加">&nbsp;&nbsp;<input type="reset" value="取消 "></td></tr>
		  </table>
		 </form>
	</td>
  </tr>
</table>
<div style="height:10px;"></div>
</body>
</html>