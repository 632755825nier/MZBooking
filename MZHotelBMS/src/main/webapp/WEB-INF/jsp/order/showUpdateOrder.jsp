<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<title>梅州酒店——订单详情</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="This is my page" />
	<link href="${ctx}/css/css.css" type="text/css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="${ctx}/js/ligerUI/skins/Aqua/css/ligerui-dialog.css"/>
	<link href="${ctx}/js/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${ctx }/js/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="${ctx }/js/jquery-migrate-1.2.1.js"></script>
	<script src="${ctx}/js/ligerUI/js/core/base.js" type="text/javascript"></script>
	<script src="${ctx}/js/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script> 
	<script src="${ctx}/js/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
	<script src="${ctx}/js/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
	<link href="${ctx}/css/pager.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript">

	window.onload = function () { 

		var IsChargeback = $("#IsChargeback").val();
		var OrderIsPay = $("#OrderIsPay").val();

		if(IsChargeback == 1){
			$("#IsChargeback").val("已退单");
		}
		if(IsChargeback== 0){
			$("#IsChargeback").val("未退单");
		}
		
		
		if(OrderIsPay == '0'){
			$("#OrderIsPay").val("未支付");
		}
		if(OrderIsPay == '1'){
			$("#OrderIsPay").val("已支付");
		}



	}
	
	</script>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr><td height="10"></td></tr>
  <tr>
    <td width="15" height="32"><img src="${ctx}/images/main_locleft.gif" width="15" height="32"></td>
	<td class="main_locbg font2"><img src="${ctx}/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：订单管理  &gt; 订单详情</td>
	<td width="15" height="32"><img src="${ctx}/images/main_locright.gif" width="15" height="32"></td>
  </tr>
</table>
<table width="100%" height="90%" border="0" cellpadding="5" cellspacing="0" class="main_tabbor">
  <tr valign="top">
    <td>
    	 <form action="${ctx}/order/updateOrder" id="orderForm" method="post">
    	 	<!-- 隐藏表单，flag表示添加标记 -->
    	 	<input type="hidden" name="flag" value="2">
			<input type="hidden" name="orderId" value="${order.orderId }">
		  <table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
		    <tr><td class="font3 fftd">
		    	<table>
		    		<tr>
		    			<td class="font3 fftd">订单号：<input type="text" name="OrderId" id="OrderId" disabled="disabled" size="30" value="${requestScope.order.orderId}"/></td>
		    			<td class="font3 fftd">酒店名称：<input type="text" name="HotelName" id="HotelName" disabled="disabled" size="30" value="${requestScope.order.hotelName}"/></td>
		    			<td class="font3 fftd" rowspan="4" colspan="2" align="center" style="line-height: 20px;">酒店图片：<img id="HotelImg" src="${requestScope.order.hotelImg}" style="width: 300px;height: 300px;"></td>
		    		</tr>
		    		<tr>
		    			<td class="font3 fftd">订单时间：<input type="text" name="OrderTime" id="OrderTime" disabled="disabled" size="30" value="${requestScope.order.orderTime}"/></td>
		    			<td class="font3 fftd">酒店类型：<input type="text" name="HotelType" id="HotelType" disabled="disabled" size="30" value="${requestScope.order.hotelType}" height="200px" width="150px"/></td>
		    		</tr>
		    		<tr>
		    			<td class="font3 fftd">订单人：<input type="text" name="OrderUserName" id="OrderUserName" disabled="disabled" size="30" value="${requestScope.order.orderUserName}"/></td>
		    			<td class="font3 fftd">酒店等级：<input type="text" name="RoomGrade" id="RoomGrade" disabled="disabled" size="30" value="${requestScope.order.roomGrade}"/></td>
		    		</tr>
		    		<tr>
		    			<td class="font3 fftd">订单人手机号码：<input type="text" name="ContactNum" id="ContactNum" disabled="disabled" size="30" value="${requestScope.order.contactNum}"/></td>
		    			<td class="font3 fftd">酒店地址：<input type="text" name="HotelAdress" id="HotelAdress" disabled="disabled" size="30" value="${requestScope.order.hotelAdress}"/></td>
		    		
					</tr>	
					<tr>
		    			<td class="font3 fftd">订单人邮箱号码：<input type="text" name="OrderEmail" id="OrderEmail" disabled="disabled" size="30" value="${requestScope.order.orderEmail}"/></td>
		    			<td class="font3 fftd">房间类型：<input type="text" name="RoomType" id="RoomType" disabled="disabled" size="30" value="${requestScope.order.roomType}"/></td>
		    			<td class="font3 fftd">订单入房时间：<input type="text" name="InDate" id="InDate" disabled="disabled" size="30" value="${requestScope.order.inDate}"/></td>
		    			<td class="font3 fftd">房间数量：<input type="text" name="RoomNum" id="RoomNum" disabled="disabled" size="30" value="${requestScope.order.roomNum}"/></td>
		    		
		    		</tr>	
		    		<tr>	
			    		<td class="font3 fftd">订单人退房时间：<input type="text" name="OutDate" id="OutDate" disabled="disabled" size="30" value="${requestScope.order.outDate}"/></td>
			    		<td class="font3 fftd">儿童成人数量：<input type="text" name="PeopleNum" id="PeopleNum" disabled="disabled" size="30" value="${requestScope.order.peopleNum}"/></td>
			    		<td class="font3 fftd">订单总天数：<input type="text" name="OrderDay" id="OrderDay" disabled="disabled" size="30" value="${requestScope.order.orderDay}"/></td>
			    		<td class="font3 fftd">订单金额：<input type="text" name="OrderMoney" id="OrderMoney" disabled="disabled" size="30" value="${requestScope.order.orderMoney}"/></td>
		    		
		    		</tr>
		    		<tr>
		    			<td class="font3 fftd">订单是否退回：
		    			<input type="text" name="IsChargeback" id="IsChargeback" size="30" value="${requestScope.order.isChargeback}"/></td>
		    			<td class="font3 fftd">订单是否支付：<input type="text" name="OrderIsPay" id="OrderIsPay" size="30" value="${requestScope.order.orderIsPay}"/></td>
		    		</tr>
	    		
		    		
		    		
		    	</table>
		    </td></tr>
			<tr><td class="main_tdbor"></td></tr>
			
<!-- 			<tr><td align="left" class="fftd"><input type="submit" value="修改 ">&nbsp;&nbsp; -->
<!-- 			<input type="reset" value="取消 "></td></tr> -->
		  </table>
		 </form>
	</td>
  </tr>
</table>
<div style="height:10px;"></div>
</body>
</html>