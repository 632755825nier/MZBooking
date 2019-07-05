/**
 * Created by Nier on 2018/8/8.
 */
$(document).ready(function() {
	
    $("#hide_i").click(function(){
       $("#container_holiday").hide("show");
    });    
  
    $('.user_email').hover(function(){
        $('.tip2').fadeIn();
        $('.tip2').text($('.user_email').attr('data-title'));
    });

    $('.user_email').mousemove(function(e){
        var top = e.pageY+15;
        var left = e.pageX+20; 
        $('.tip2').css({
            'top' : top + 'px',
            'left': left+ 'px'
        });
    });


    $('.user_email').mouseout(function(){
        $('.tip2').hide();
    });
    
    $(".container2_right_dowm_btn").click(function(){
    	var userEmail = $(".user_email").val();
    	if(userEmail==""){
    		swal('提示信息','邮箱号码不能为空，请输入邮箱号码！','error');
    	}else{
    		$.ajax({
        		url:"../SubscribeServlet",
        		type:"post",
        		data:{userEmail:userEmail},
        		success:function(result){
        			swal('提示信息',"已订阅成功！",'success');

        		},
        		error:function(){
            		swal('提示信息','网络错误！','error');
        			}
        		})
    	}
    })
});



    $(document).ready(function(){
        var slideindex4 = 0;
        $("#slideLeftBtn4").click(function(){
            slideindex4--;
            var animateLength = slideindex4 * 275 + "px";
            $(".container4list").animate({"left":animateLength},"slow",function(){
                if(slideindex4==2){
                    $("#slideLeftBtn4").hide();
                    //return false;
                }
            });
        });
        
        $("#slideRightBtn4").click(function(){
            slideindex4++;
            var animateLength = slideindex4 * 275 + "px";
            $(".container4list").animate({"left":animateLength},"slow")  });

        
        var slideindex5 = 0;
        $("#slideLeftBtn5").click(function(){
            slideindex5--;
            var animateLength = slideindex5 * 550 + "px";
            $(".container5list").animate({"left":animateLength},"slow",function(){
                if(slideindex5==2){
                    //$("#slideLeftBtn5").hide();
                    //return false;
                    $(".container5list").stop();
                }
            });
        });
        $("#slideRightBtn5").click(function(){
            slideindex5++;
            var animateLength = slideindex5 * 550 + "px";
            $(".container5list").animate({"left":animateLength},"slow")  });

        $(".container6 ul li p").css("color","#006BBc");

        $(".tab_menu li").click(function(){
            var _index = $(this).index();
            $(".tab_box div").eq(_index).show().siblings().hide();
            $(this).addClass("change").siblings().removeClass("change");
        });
        
        $(".tab_menu8 li").click(function(){
            var _index8 = $(this).index();
            $(".tab_box8 div").eq(_index8).show().siblings().hide();
            $(this).addClass("change").siblings().removeClass("change");
        });

        $(".tab_menu9 li").click(function(){
            var _index9 = $(this).index();
            $(".tab_box9 div").eq(_index9).show().siblings().hide();
            $(this).addClass("change").siblings().remove("change");
        });
    });

