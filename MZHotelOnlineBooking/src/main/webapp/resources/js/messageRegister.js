/**
 * Created by xiaoxin on 2018/9/9.
 */
$(document).ready(function(){

    $(".LAR-ulphone>.icon-cha2").click(function(){
        $("#LARidphone").fadeOut();
        $(".LAR-Containerphone").fadeOut();
    });
    $(".acquireMaphone").click(function(){
       
        phone = $("#emailInputphone").val();
        var pattern = /^1[34578]\d{9}$/;
        if(pattern.test(phone)==false){
            $("#emailInputphone").val("");
            swal('提示信息','输入手机号码格式不正确！','error');
        } else {
        	//利用ajax把手机号传入后台
            $.ajax({
                url: 'SendSms',
                type: "POST",
                //发送参数
                data: {"phone":phone},
                //返回结果
                success: function(result){
                    //控制台打印结果
                    //console.log("验证码是"+result);
                    code = result;
                    int = window.setInterval("getTime()",1000);
                }
            });
        }
    });
    $("#pwdInputphone").blur(function(){
        //验证验证码
        var sms = $("#pwdInputphone").val();
        if(sms==""){
            swal('提示信息','验证码未填写！','error');
        }else{
            if(code==sms){
                swal('提示信息',"验证成功",'success');
                $(".sub-btnphone").removeAttr("disabled");
            }else{
                $("#pwdInputphone").val("");
                swal('提示信息','验证码错误！','error');
            }
        }
    });
//监听短信验证按键
    $(".weicharLogin").click(function(){
    	$(".LAR-Background").css({"display":"none"});
        $("#LARidphone").fadeIn();
        $(".LAR-Containerphone").fadeIn();
    });
    
    $(".weicharLoginphone").click(function(){
    	$("#LARidphone").fadeOut();
    	$(".LAR-Containerphone").fadeOut();
    	$(".LAR-Background").show();
    	$("#LAR-login").show();
        $("#LAR-register").hide();
        $("#loginLi").css("background-color", "white");
        $("#registerLi").css("background-color", "#E9F0FA");
    });
});

var time = 60;

function getTime(){
	time--;
	$(".acquireMaphone").text(time +"秒后再发送");
	$(".acquireMaphone").attr("disabled",true);
	if(time == 0){
		$(".acquireMaphone").attr("disabled",false);
		$(".acquireMaphone").text("获取验证码");
		window.clearInterval(int);
	}
}
