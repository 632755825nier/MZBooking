/**
 * 订单显示模块
 */
$(document).ready(function(){  
	//OrderPay.jsp获取cookie表单的值

	$(".USER_NAME>input").attr("value",$.cookie("Order_User_Name"));  //订单联系人
	$(".CONTACT_NUM>input").attr("value",$.cookie("ORDER_CONTACT_NUM"));	//订单联系人号码
	$(".IN_DATE>input").attr("value",$.cookie("orderRoomin"));//入住日期
	$(".OUT_DATE>input").attr("value",$.cookie("orderRoomout"));//退房日期

	
	
//	var allday = $.cookie("allday");
//	alert("allday"+allday);
	$(".ORDER_Allday>input").attr("value",$.cookie("allday")+"天");	//订单总天数
	$(".ROOM_NUM>input").attr("value",$.cookie("orderRoomnum"));//房间数量	
	$(".ROOM_TYPE>input").attr("value",$.cookie("orderRoomType"));//房间类型	 
	
	$(".ORDER_MONEY>input").attr("value",$.cookie("orderprices")+"元");//订单总金额	 
	$(".ROOM_PRICE>input").attr("value",$.cookie("orderPrice")+"元");//房间单价	
	$(".ORDER_TIME>input").attr("value",$.cookie("ORDER_Time"));//订单时间
	$(".ORDER_EMAIL>input").attr("value",$.cookie("Order_User_Email"));//订单邮箱
	$(".order_yearsindate>input").attr("value",inday);//年月日 
	 
	
});

function OrderPaySuccess(){
		swal('提示信息',"支付成功！",'success');
		return true;
}

