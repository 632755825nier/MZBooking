<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<title>梅州酒店——修改酒店</title>
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
		
		var RoomGrade = $("#RoomGrade").val();
		var IsBreakfast = $("#IsBreakfast").val();

		if(RoomGrade == 1){
			$("#RoomGrade").val("一星级");
		}else if(RoomGrade== 2){
			$("#RoomGrade").val("二星级");
		}else if(RoomGrade== 3){
			$("#RoomGrade").val("三星级");
		}else if(RoomGrade== 4){
			$("#RoomGrade").val("四星级");
		}else if(RoomGrade== 5){
			$("#RoomGrade").val("五星级");
		}
		
		if(IsBreakfast == '0'){
			$("#IsBreakfast").val("不提供");
		}
		if(IsBreakfast == '1'){
			$("#IsBreakfast").val("提供");
		}
		
	}
		

	</script>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr><td height="10"></td></tr>
  <tr>
    <td width="15" height="32"><img src="${ctx}/images/main_locleft.gif" width="15" height="32"></td>
	<td class="main_locbg font2"><img src="${ctx}/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：酒店管理  &gt; 修改酒店</td>
	<td width="15" height="32"><img src="${ctx}/images/main_locright.gif" width="15" height="32"></td>
  </tr>
</table>
<table width="100%" height="90%" border="0" cellpadding="5" cellspacing="0" class="main_tabbor">
  <tr valign="top">
    <td>
    	 <form action="${ctx}/hotel/updateHotel" id="hotelForm" method="post">
    	 	<!-- 隐藏表单，flag表示添加标记 -->
    	 	<input type="hidden" name="flag" value="2">
			<input type="hidden" name="hotelId" value="${hotel.hotelId }">
		  <table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
		    <tr><td class="font3 fftd">
		    	<table>
		    	<tr>
		    			<td class="font3 fftd">酒店名：<input type="text" name="HotelName" id="HotelName" size="20" value="${requestScope.hotel.hotelName}"/></td>
		    			<td class="font3 fftd">酒店地址：<input type="text" name="HotelAdress" id="HotelAdress" size="40" value="${requestScope.hotel.hotelAdress}"/></td>
		    			<td class="font3 fftd">酒店类型:<input type="text" name="HotelType" id="HotelType" size="10" value="${requestScope.hotel.hotelType}"/></td>
		    			<td class="font3 fftd">酒店等级:<input type="text" name="RoomGrade" id="RoomGrade" size="10" value="${requestScope.hotel.roomGrade}"/></td>
		    		</tr>
		    			
		    		<tr>
		    			<td class="font3 fftd">是否提供早餐:<input name="IsBreakfast" id="IsBreakfast" size="10" value="${requestScope.hotel.isBreakfast}"/></td>
		    			<td class="font3 fftd">所在省：<input name="HotelProvince" id="HotelProvince" size="10" value="${requestScope.hotel.hotelProvince}"/></td>
		    			<td class="font3 fftd">所在市：<input name="HotelDowntown" id="HotelDowntown" size="10" value="${requestScope.hotel.hotelDowntown}"/></td>
		    			<td class="font3 fftd">所在区：<input name="HotelArea" id="HotelArea" size="10" value="${requestScope.hotel.hotelArea}"/></td>
		    		</tr>
		    		<tr >
		    			<td style="text-indent :26px;width:100%; " colspan="4" style="border:1px;"><b>酒店简介：</b>
		    			${requestScope.hotel.hotelPer}
		    			</td>

		    		</tr>
		    		
		    	</table>
		    </td></tr>
			<tr><td class="main_tdbor"></td></tr>
			
			<tr><td align="left" class="fftd"><input type="submit" value="修改 ">&nbsp;&nbsp;<input type="reset" value="取消 "></td></tr>
		  </table>
		 </form>
	</td>
  </tr>
</table>
<div style="height:10px;"></div>
</body>
</html>