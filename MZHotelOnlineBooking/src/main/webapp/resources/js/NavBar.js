//登录注册
// 显示提示信息
$(document).ready(function () {
    $('#reg-btn').hover(function () {
        $('.index_tip').fadeIn();
        $('.index_tip').text($('#reg-btn').attr('data-title'));
    });

    $('#log-btn').hover(function () {
        $('.index_tip').fadeIn();
        $('.index_tip').text($('#log-btn').attr('data-title'));
    });

    $('#mon_tex').hover(function () {
        $('.index_tip').fadeIn();
        $('.index_tip').text($('#mon_tex').attr('data-title'));
    });

    $('#lang-i').hover(function () {
        $('.index_tip').fadeIn();
        $('.index_tip').text($('#lang-i').attr('data-title'));
    });


    $('#wechat-i').hover(function () {
        $('#none_img_id').show();
    });

    $('#wechat-i').mousemove(function (e) {
        var top = e.pageY + 15;
        var left = e.pageX + 20; //使得文字块显示在鼠标的右下方
        $('#none_img_id').css({
            'top': top + 'px',
            'left': left + 'px'
        });
    });
    //图片隐藏
    $('#wechat-i').mouseout(function () {
        $('#none_img_id').hide();
    });

    $('.user-btn').mousemove(function (e) {
        var top = e.pageY + 15;
        var left = e.pageX + 20; //使得文字块显示在鼠标的右下方
        $('.index_tip').css({
            'top': top + 'px',
            'left': left + 'px'
        });
    });

    $('.user-tex').mousemove(function (e) {
        var top = e.pageY + 15;
        var left = e.pageX + 20;
        $('.index_tip').css({
            'top': top + 'px',
            'left': left + 'px'
        });
    });


    $('#img_id').mousemove(function (e) {
        var top = e.pageY + 15;
        var left = e.pageX + 20;
        $('.index_tip').css({
            'top': top + 'px',
            'left': left + 'px'
        });
    });

    $('.lang_cla').mousemove(function (e) {
        var top = e.pageY + 15;
        var left = e.pageX + 20;
        $('.index_tip').css({
            'top': top + 'px',
            'left': left + 'px'
        });
    });



    $('.user-btn').mouseout(function () {
        $('.index_tip').hide();
    });

    $('.user-tex').mouseout(function () {
        $('.index_tip').hide();
    });

    $('#img_id').mouseout(function () {
        $('.index_tip').hide();
    });


    $(".person_class_a").click(function(){

        $(".showIfm_none").toggle();
    });
    
  //跳转到指定页面
//    $(".link_id").click(function(){
//    	alert("aaaa");
//// 	    evt.stopPropagation(); 			//阻止事件冒泡
//    	window.location.href="../LookingroomInitServlet?hotelId="+1; 
//    });
//    
    
    
});




// 显示登录/注册窗口
// 切换和关闭登录/注册窗口
$(document).ready(function () {
    $("#loginLi").click(function() {
        $("#LAR-login").show();
        $("#LAR-register").hide();
        $("#loginLi").css("background-color", "white");
        $("#registerLi").css("background-color", "#E9F0FA");
    });
    $("#registerLi").click(function() {
        $("#LAR-login").hide();
        $("#LAR-register").show();
        $("#loginLi").css("background-color", "#E9F0FA");
        $("#registerLi").css("background-color", "white");
    });

    $("#log-btn").click(function() {
        $("#LARid").css({"display":"block"});
        $("#loginLi").click();
    });

    $("#reg-btn").click(function(){
        $("#LARid").css({"display":"block"});
        $("#registerLi").click();
    });

    $("#closebtn").click(function () {
        $("#LARid").hide();
    });
    
    $("#eopInput").change(function(){
    	var eop = $("#eopInput").val();
    	$.ajax({
    		url:"RegisterVerifyServlet",
    		data:{EOP:eop},
    		success:function(result){
    			if(result == '0'){
    				$("#eoplogin").text("× 格式错误");
    			} else if(result == '2'){
    				$("#eoplogin").text("× 用户不存在");
    			} else {
    				$("#eoplogin").text("");
    			}
    		},
    		error:function(){
				swal('提示信息','网络错误！','error');

    		}
    	});
    });
    $("#eopInput2").change(function(){
    	var eop = $("#eopInput2").val();
    	$.ajax({
    		url:"../RegisterVerifyServlet",
    		data:{EOP:eop},
    		success:function(result){
    			if(result == '0'){
    				$("#eoplogin").text("× 格式错误");
    			} else if(result == '2'){
    				$("#eoplogin").text("× 用户不存在");
    			} else {
    				$("#eoplogin").text("");
    			}
    		},
    		error:function(){
				swal('提示信息','网络错误！','error');
    		}
    	});
    });
    
//    当鼠标移出的时候，进行判断
    $("#eopReg").change(function(){
    	var eop = $("#eopReg").val();
    	$.ajax({
    		url:"RegisterVerifyServlet",
    		data:{EOP:eop},
    		success:function(result){
    			if(result == '0'){
    				$("#eop").text("× 格式错误");
    			} else if(result == '1'){
    				$("#eop").text("× 该用户已存在");
    			} else {
    				$("#eop").text("√ 账号可用");
    			}
    		},
    		error:function(){
				swal('提示信息','网络错误！','error');

    		}
    	});
    });
    $("#eopReg1").change(function(){
    	var eop = $("#eopReg1").val();
    	$.ajax({
    		url:"../RegisterVerifyServlet",
    		data:{EOP:eop},
    		success:function(result){
    			if(result == '0'){
    				$("#eop").text("× 格式错误");
    			} else if(result == '1'){
    				$("#eop").text("× 该用户已存在");
    			} else {
    				$("#eop").text("√ 账号可用");
    			}
    		},
    		error:function(){
				swal('提示信息','网络错误！','error');
    		}
    	});
    });
    
//    验证码
    $("input[name='verifyName1']").change(function(){
    	var verifyCode = $("input[name='verifyName1']").val();
    	$.ajax({
    		url:"VerifyServlet",
    		data:{VC:verifyCode},
    		success:function(result){
    			$("#verifyCode").text(result);
    		},
    		error:function(){
				swal('提示信息','网络错误！','error');

    		}
    	});
    });
    $("input[name='verifyName']").change(function(){
    	var verifyCode = $("input[name='verifyName']").val();
    	$.ajax({
    		url:"../VerifyServlet",
    		data:{VC:verifyCode},
    		success:function(result){
    			if(result=="√"){
    				$(".input_tip").addClass("input_tip");
    				$(".input_tip").removeClass("input_tip2");
    			}else{
    				$(".input_tip").addClass("input_tip2");
    				$(".input_tip").removeClass("input_tip");    		
    			}
    			$("#verifyCode").text(result);
    		},
    		error:function(){
				swal('提示信息','网络错误！','error');

    		}
    	});
    });
    
    /**
     * 注册
     */
    
    $("input[name='reginsterBtn1']").unbind('click').click(function(){
    	if($("#eop").text()=="√ 账号可用" && $("#verifyCode").text()=="√"){
        	var userEmail = $(".emailInput2").val();
        	var userPassword = $(".pwdInput2").val();
    		 $.getJSON(
    				 '../RegisterServlet',
    				 {EmailOrPhone:userEmail,password:userPassword},
    				 function(result){
    					 if(result){
 							swal('提示信息',"恭喜"+userEmail+"注册成功",'success');
    						 $(".emailInput").attr("value",userEmail);
    						 $("#log-btn").click();
    					 }else{
    							swal('提示信息','注册失败！','error');

    					 }
    				 });
        } else {
			swal('提示信息','信息不正确！','error');

        }
	});
    $("input[name='reginsterBtn']").unbind('click').click(function(){
    	if($("#eop").text()=="√ 账号可用" && $("#verifyCode").text()=="√"){
        	var userEmail = $(".emailInput2").val();
        	var userPassword = $(".pwdInput2").val();
    		 $.getJSON(
    				 'RegisterServlet',
    				 {EmailOrPhone:userEmail,password:userPassword},
    				 function(result){
    					 if(result){
    							swal('提示信息',"恭喜"+userEmail+"注册成功",'success');

    						 $(".emailInput").attr("value",userEmail);
    						 $("#log-btn").click();
    					 }else{
    							swal('提示信息','注册失败！','error');

    					 }
    				 });
        } else {
			swal('提示信息','信息不正确！','error');

        }
	});
    
//显示选择货币窗口
    $("#mon_tex").click(function () {
        $("#mon_id_box").toggle();
        $("#language_id").hide();
    });

//显示选择语言
    $(".lang-i-cla").click(function () {
        $("#language_id").toggle();
        $("#mon_id_box").hide();

    });

//显示图片
    $(".user-li_3").mousemove(function () {
        $("#img_id").show();
    });
//隐藏图片
    $(".user-li_3").mouseout(function () {
        $("#img_id").hide();
    });

});
