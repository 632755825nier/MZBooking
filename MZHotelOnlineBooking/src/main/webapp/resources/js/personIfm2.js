$(document).ready(function(){
	//personInfor2.jsp获取cookie表单的值
//	alert("姓名："+$.cookie("Order_User_Name"));
//	alert("邮箱号码："+$.cookie("Order_User_Email"));
	$(".get_user_Name").text($.cookie("Order_User_Name"));
	$(".get_user_email").text($.cookie("Order_User_Email"));

	$("#get_pre_tel").blur(function(){
        var inpvalue = $("#get_pre_tel").val().split(" ")[1];
		var phone=/^1[34578]\d{9}$/;		
		if(inpvalue.match(phone)==null){  
			    $(".input_ifm_tel").html("<p style='color: red;'>请检查您的电话号码</p>");
	            $("#get_pre_tel").css("border-color","red");
	        }else{
				 $(".input_ifm_tel").html("<p style='display: inline-block'><i style='color:#383838;font-style:normal;'>请填写您的电话号码</i><i style='color: red;display: inline-block'>*</i> </p>");
	            $("#get_pre_tel").css("border-color","green");
	        }
	});
	
});

function goOrderPay(){
	 var inpvalue = $("#get_pre_tel").val().split(" ")[1];
		var phone=/^1[34578]\d{9}$/;		
		if(inpvalue.match(phone)==null){ 
		swal('提示信息','请填写您的电话号码！','error');
    		return false;
		}else{
			inpvalue = $("#get_pre_tel").val();
			$.cookie("ORDER_CONTACT_NUM",inpvalue);   //订单联系人号码
			var myDate = new Date();				
			$.cookie("ORDER_Time",myDate.toLocaleString());   //订单联系人号码
		  	return true;
    }	
}
