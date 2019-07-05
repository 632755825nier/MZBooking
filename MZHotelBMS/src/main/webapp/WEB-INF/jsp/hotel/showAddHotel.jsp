<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<title>梅州酒店——添加酒店</title>
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
	<script type="text/JavaScript" src="${ctx }/js/My97DatePicker/WdatePicker.js"></script> 
	<script type="text/javascript">
	
	</script>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr><td height="10"></td></tr>
  <tr>
    <td width="15" height="32"><img src="${ctx}/images/main_locleft.gif" width="15" height="32"></td>
	<td class="main_locbg font2"><img src="${ctx}/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：酒店管理  &gt; 添加酒店</td>
	<td width="15" height="32"><img src="${ctx}/images/main_locright.gif" width="15" height="32"></td>
  </tr>
</table>
<table width="100%" height="90%" border="0" cellpadding="5" cellspacing="0" class="main_tabbor">
  <tr valign="top">
    <td>
    	 <form action="${ctx}/hotel/addHotel" id="hotelForm" method="post">
    	 	<!-- 隐藏表单，flag表示添加标记 -->
    	 	<input type="hidden" name="flag" value="2">
		  <table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
		    <tr><td class="font3 fftd">
		    	<table>
		    		<tr>
		    			<td class="font3 fftd">酒店名称：<input type="text" name="HotelName" id="HotelName"  size="30" /></td>
		    			<td class="font3 fftd">上线时间：
		    			<input name="OnlineTime" id="OnlineTime" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
		    			</td>
		    		</tr>
		    			
		    		<tr>
		    			<td class="font3 fftd">酒店简介：<textarea rows="3" cols="30" name="HotelPer" id="HotelPer">
													
													</textarea></td>
		    			<td class="font3 fftd">酒店地址：<input type="text" name="HotelAdress" id="HotelAdress"  size="30"/></td>
		    		</tr>
		    			
		    		<tr>
		    			<td class="font3 fftd">酒店类型：
		    			<select name="HotelType" id="HotelType">
						  <option value ="实惠型" selected = "selected" >实惠型</option>
						  <option value ="经济型">经济型</option>
						  <option value="舒适型">舒适型</option>
						  <option value="豪华型">豪华型</option>
						  <option value="尊贵型">尊贵型</option>
						</select>
		    			</td>
		    			<td class="font3 fftd">酒店等级：
		    			<select name="RoomGrade" id="RoomGrade">
						  <option value ="1" selected = "selected" >一星级</option>
						  <option value ="2">二星级</option>
						  <option value="3">三星级</option>
						  <option value="4">四星级</option>
						  <option value="5">五星级</option>
						</select>
		    			</td>
		    		</tr>
		    		
		    		<tr>
		    			<td class="font3 fftd">是否提供早餐：
		    			<select name="IsBreakfast" id="IsBreakfast">
						  <option value ="0" >不提供</option>
						  <option value ="1" selected = "selected" >提供</option>
						</select>
		    			</td>
		    			<td class="font3 fftd">是否可以携带宠物：
		    			<select name="Pet" id="Pet">
						  <option value ="0">不可以</option>
						  <option value ="1" selected = "selected" >可以</option>
						</select>
		    			</td>
		    		</tr>
		    		
		    		<tr>
		    			<td class="font3 fftd">注意事项：<textarea rows="3" cols="30" name="RePolicy" id="RePolicy">
													
													</textarea></td>
		    			<td class="font3 fftd">所在省：<input type="text" name="HotelProvince" id="HotelProvince" readonly="readonly" value="广东省" size="30" /></td>
		    		</tr>
		    		<tr>
		    			<td class="font3 fftd">所在市：<input type="text" name="HotelDowntown" id="HotelDowntown" readonly="readonly" value="梅州市" size="30" /></td>
		    			<td class="font3 fftd">所在县区：
		    			<select name="HotelArea " id="HotelArea ">
						  <option value ="梅江区" selected = "selected" >梅江区</option>
						  <option value ="兴宁市">兴宁市</option>
						  <option value="梅县">梅县</option>
						  <option value="大埔县">大埔县</option>
						  <option value="丰顺县">丰顺县</option>
						  <option value="五华县">五华县</option>
						  <option value="平远县">平远县</option>
						  <option value="蕉岭县">蕉岭县</option>
						</select>
		    			</td>
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