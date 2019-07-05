//    ****************菜单选项卡***************
function openModel(evt, modelName) {
    var i, model, modelLinks;
    model = document.getElementsByClassName("Model ");
    for (i = 0; i < model.length; i++) {
        model[i].style.display = "none";
    }
    modelLinks = document.getElementsByClassName("BarLi");
    for (i = 0; i < modelLinks.length; i++) {
        modelLinks[i].className = modelLinks[i].className.replace("active", "");
    }
    document.getElementById(modelName).style.display = "block";
    evt.currentTarget.className += "active";
}
$(document).ready(function(){


////    *****************个人中心****************
////        设置首个内容上浮效果
    $(".first-info-con-a").mouseover(function (){
        $(this).css({"background-color":"#0077CC"});
        $(this).children(".first-info-con-icon").css({"margin-top":"30px"});
        $(this).children(".first-info-con-p1").css({"margin-top":"-5px","color":"white"});
        $(this).children(".first-info-con-p2").css({"margin-top":"-10px","color":"white"});
    });

    $(".first-info-con-a").mouseleave(function (){
        $(this).css({"background-color":"white"});
        $(this).children(".first-info-con-icon").css({"margin-top":"40px"});
        $(this).children(".first-info-con-p1").css({"margin-top":"0px","color":"black"});
        $(this).children(".first-info-con-p2").css({"margin-top":"0px","color":"black"});
    });

////    *******************设置*****************
////        设置选项卡：左菜单的固定
    $(window).bind("scroll", function () {
        var height = $(this).scrollTop(); 		// 当前窗口的滚动距离
        var top;
        if (height >= 140) {
            $(".InstallBar").css({"top": "-20px"});
        } else {
            top = (140 - height).toString() + 'px';
            $(".InstallBar").css({"top": top});
        }
    });

////        动态插入生日日期

    for(var i=1; i<=31; i++){
        $("#select_day").append("<option value='" + i + "'>" + i +"</option>");
    }
    for(var i=1; i<=12; i++){
        $("#select_month").append("<option value='" + i + "'>" + i +"月</option>");
    }
    for(var i=2018; i>=1906; i--){
        $("#select_year").append("<option value='" + i + "'>" + i +"</option>");
    }

////    修改家庭地址按钮

    $("#changAdBtn").click(function(){
        $("#showAddress").css({"display":"none"});
        $(this).css({"display":"none"});
        $(".second_Ad_card").css({"display":"block"});
    });

    $("a[name='save']").click(function(){
        var country = $("#country").find("option:selected").text();
        var city = $("#city").val();
        var address = $("#address").val();
        var postal = $("#postal").val();
        $("#showAddress").html(address + "," + postal + "," + city + "," + country);
        $("a[name='exit']").click();
    });

    $("a[name='exit']").click(function(){
        $("#showAddress").css({"display":"inline-block"});
        $("#changAdBtn").css({"display":"block"});
        $(".second_Ad_card").css({"display":"none"});
    });

//    添加必要设施按钮

    $("#addFacility").click(function(){
        $("#facilities").css({"display":"none"});
        $(this).css({"display":"none"});
        $(".four_setFacility").css({"display":"block"});
    });

    $(".four_button-a[name='save']").click(function(){
        var isc = "";
        $(".four_row_facility_model input:checked").each(function(){      //遍历全部checkbox
            isc += $(this).val() + ",";              //获取所有checkbox的值
        });
        $("#facilities").html(isc);
        $(".four_button-a[name='exit']").click();
    });

    $(".four_button-a[name='exit']").click(function(){
        $("#facilities").css({"display":"inline-block"});
        $("#addFacility").css({"display":"block"});
        $(".four_setFacility").css({"display":"none"});
    });
//  修改头像~~~~~~~~~~~~
    $(".first_row_setHeadImg").click(function(){
       $(".changeHeadImg").css({"display":"block"});
    });
    $(".closeImg").click(function(){
        $(".changeHeadImg").css({"display":"none"});
    });
});


var result=document.getElementById("img-vessel");
var file=document.getElementById("imgfile");
function readAsDataURL(){
    //检验是否为图像文件
    var file = document.getElementById("imgfile").files[0];
    if(!/image\/\w+/.test(file.type)){
        swal('提示信息','请传入图片类型！','error');
        return false;
    }
    //检测上传文件的大小        
    var isIE = /msie/i.test(navigator.userAgent) && !window.opera;  
    var fileSize = 0;           
    if (isIE && !file.files){       
        var filePath = file.value;       
        var fileSystem = new ActiveXObject("Scripting.FileSystemObject");          
        var file1 = fileSystem.GetFile (filePath);       
        fileSize = file1.Size;      
    } else {      
        fileSize = file.size;       
    }     

    var size = fileSize / 1024*1024;   

    if(size>(1024*1024)){    
    document.all.saveImg.disabled=true;
        swal('提示信息','文件大小不能超过1M','error');
    }else{
	    document.all.saveImg.disabled=false;
	    var reader = new FileReader();
	    //将文件以Data URL形式读入页面
	    reader.readAsDataURL(file);
	    reader.onload=function(e){
	        var result=document.getElementById("img-vessel");
	        
	        result.innerHTML='<img id="myHead" src="'+this.result+'" />';
	    }
    }  
}

function showImg(){
	var myHead = $("#myHead").attr("src");
	$.ajax({
		url:"../SubmitImgServlet",
		type:"post",
		data:"source="+myHead,
		success:function(result){
			if(result){
				swal('提示信息',"上传成功",'success');
				$(".closeImg").click();
				window.location.reload();
			} else {
				swal('提示信息','上传失败！','error');
			}
		},
		error:function(){
			swal('提示信息','网络错误！','error');
		}
	});
}

/**
 * 动态加载订单
 * @returns
 */
function showOrders(type){
	$.ajax({
		url:"../ShowOrderServlet",
		type:"post",
		data:{orderIsPay:type},
		success:function(result){
			var orders = $.parseJSON(result);
			for(i in orders){
				var isPay = orders[i].orderIsPay;
				var isChargeback = orders[i].isChargeback;
				var showIsPay;
				var showisChargeback;
//				alert("orders[i].hotelImg:"+orders[i].hotelImg);
				if(isPay == 1){
					showIsPay = "已支付";
				} else {
					showIsPay = "未支付";
				}
				
				if(isChargeback == 1){
					showisChargeback = "已退单";
				} else {
					showisChargeback = "退单";
				}
				
				$(".orderModel").append(
						'<div class="showOrder">'+
					    '<div class="orderTime_Id">'+
					        '<h4 class="myOrder_Time">'+orders[i].orderTime+'</h4>'+
					        '<p class="myOrder_Id">订单号：</p>'+
					        '<p class="myOrder_Id2">'+orders[i].orderId+'</p>'+
					    '</div>'+
					    '<div class="myOrder_ifm">'+
					        '<div class="myOrder_hotel"><img src="'+orders[i].hotelImg+'" class="myhotel_Img" style="height:130px;weight:200px;"></div>'+
					        '<div class="order_Hotel_Ifm">'+
					            '<div class="myhotel_Name">'+
					                '<h2 class="myhotel_Name_Name">'+orders[i].hotelName+'</h2>'+
					                '<p class="myhotel_Name_Adress">'+orders[i].hotelAdress+'</p>'+
					            '</div>'+
					            '<div class="myOrder_Room">'+
					                '<p class="myOrder_Room_p">房间类型：</p><h3 class="myOrder_Room_Type">'+orders[i].hotelType+'</h3>'+
					                '<p class="myOrder_Room_p">入住人数：</p><h3 class="myOrder_PeopleNum">'+orders[i].peopleNum+'</h3>'+
					                '<p class="myOrder_Room_p">房间数量：</p><h3 class="myOrder_RoomNum">'+orders[i].roomNum+'</h3>'+
					            '</div>'+
					            '<div class="myOrderTime">'+
					                '<p class="myOrder_Time_p">入住时间：</p><h3 class="myOrder_InTime">'+orders[i].inDate+'</h3>'+
					                '<p class="myOrder_Time_p">退房时间：</p><h3 class="myOrder_OutTime">'+orders[i].outDate+'</h3>'+
					            '</div>'+
					            '<div class="myOrder_Money">￥'+orders[i].orderMoney+'</div>'+
					            '<div class="myOrder_Pay">'+
//					                '<a href="../OrderUpdate?OrderId='+orders[i].orderId+'&isPay=0" class="myOrder_Pay_a2" onclick="return OrderUpdate('+orders[i].orderId+')">退单</a>'+
					                '<a href="#" class="myOrder_Pay_a2" onclick="return OrderUpdate('+orders[i].orderId+','+orders[i].isChargeback+')">'+showisChargeback+'</a>'+
					                '<a href="#" class="myOrder_Pay_a" >'+showIsPay+'</a>'+
					          	'</div></div></div></div>'
				);
			}
		},
		error:function(){
			swal('提示信息','网络错误！','error');
		}
	});
}
$(document).ready(function(){
	$("#myOrders").click(function(){
//		清空原来的元素
		$(".showOrder").remove();
		showOrders(2);
	});
	$(".orderHead-select").change(function(){
		var orderIsPay = $(".orderHead-select option:selected").val();
//		清空原来的元素
		$(".showOrder").remove();
		showOrders(orderIsPay);
	});
	
	
//		var orderIsPay = $(".orderHead-select option:selected").val();	
//		alert("orderIsPay:"+orderIsPay);	
//		$.ajax({
//			url:"../ShowOrderServlet",
//			type:"post",
//			data:{orderIsPay:orderIsPay},
//			success:function(result){
//				var jsonObj = $.parseJSON(result);
//				
//			},
//			error:function(){
//				alert("我的订单错误！");
//			}
//		});
});


function OrderUpdate(OrderId,showisChargeback){
	if(showisChargeback=="1"){
		swal('提示信息','该订单已退，无法操作！','error');
		return false;
	}else{
		swal({ 
			  title: "确定要退单吗？", 
			  type: "warning",
			  showCancelButton: true, 
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "确定", 
			  cancelButtonText: '取消',
			  closeOnConfirm: false
		},function(){
			$.ajax({
				url: "../OrderUpdate",
				cache: false, //是否启用缓存
				type: "POST", //提交方式
				data: {OrderId:OrderId,isPay:0,isChargeback:1},
				dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
				success: function(obj){
					var orders = $.parseJSON(obj);
					if(orders == '0' || orders == 0){
						swal('提示信息','操作失败!','error');
					}else{
						swal('提示信息','操作成功！','success');
						setTimeout(function () {
							 window.location.reload();   //刷新整个页面
						},3000)
						clearTimeout();
					}
				},
				error : function() {
					swal('提示信息','操作失败!','error');
				}
			});
		});
		return true;
	}
}


$(document).ready(function(){
	$(".row_input").blur(function(){
		var nickName = $("#userNickName").val();
		var userName = $("#userName").val();
		var userSurnme = $("#userSurnme").val();
		var userPhoneNumber = $("#userPhoneNumber").val();
		var userEmail = $("#userEmail").val();
		var tip = $(this).siblings(".row_name_tip");
		tip.text("正在保存");
		$.ajax({
			url:"../ChangeInfoServlet",
			data:{
				userNickName:nickName,
				userName:userName,
				userSurnme:userSurnme,
				userPhoneNumber:userPhoneNumber,
				userEmail:userEmail
			},
			success:function(result){
				if(result){
					tip.text("保存成功");
				} else {
					tip.text("保存失败");
				}
			},
			error: function(){
				tip.text("保存失败");
			}
		})
	});
	$(".row_select").blur(function(){
		var day = $("#select_day").val();
		var month = $("#select_month").val();
		var year = $("#select_year").val();
		var birthday = null;
		var country = $("#select_country").val();
		var title = $("#select_title").val();//称谓
		if(day!="" && month!="" && year!=""){
			birthday = year+"-"+month+"-"+day;
		}
		var tip = $(this).siblings(".row_name_tip");
		tip.text("正在保存");
		$.ajax({
			url:"../ChangeInfoServlet",
			data:{
				userBirthday:birthday,
				userCountry:country,
				userSex:title
			},
			success:function(result){
				if(result){
					tip.text("保存成功");
				} else {
					tip.text("保存失败");
				}
			},
			error: function(){
				tip.text("保存失败");
			}
		});
	});
});


