<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fkjava" uri="/pager-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>梅州酒店-订单管理</title>
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
		$(function(){
	 	   /** 获取上一次选中的订单数据 */
	 	   var boxs  = $("input[type='checkbox'][id^='box_']");
	 	   
	 	  /** 给数据行绑定鼠标覆盖以及鼠标移开事件  */
	    	$("tr[id^='data_']").hover(function(){
	    		$(this).css("backgroundColor","#eeccff");
	    	},function(){
	    		$(this).css("backgroundColor","#ffffff");
	    	})
	    	
	    	
	 	   /** 删除订单绑定点击事件 */
	 	   $("#delete").click(function(){
	 		   /** 获取到订单选中的复选框  */
	 		   var checkedBoxs = boxs.filter(":checked");
	 		   if(checkedBoxs.length < 1){
	 			   $.ligerDialog.error("请选择一个需要删除的订单！");
	 		   }else{
	 			   /** 得到订单选中的所有的需要删除的ids */
	 			   var ids = checkedBoxs.map(function(){
	 				   return this.value;
	 			   })
	 			   
	 			   $.ligerDialog.confirm("确认要删除吗?","删除订单",function(r){
	 				   if(r){
	 					   // alert("删除："+ids.get());
	 					   // 发送请求
	 					   window.location = "${ctx }/order/removeOrder?ids=" + ids.get();
	 				   }
	 			   });
	 		   }
	 	   })
	    })
	</script>
</head>
<body>
	<!-- 导航 -->
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr><td height="10"></td></tr>
	  <tr>
	    <td width="15" height="32"><img src="${ctx}/images/main_locleft.gif" width="15" height="32"></td>
		<td class="main_locbg font2"><img src="${ctx}/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：订单管理 &gt; 订单查询</td>
		<td width="15" height="32"><img src="${ctx}/images/main_locright.gif" width="15" height="32"></td>
	  </tr>
	</table>
	
	<table width="100%" height="90%" border="0" cellpadding="5" cellspacing="0" class="main_tabbor">
	  <!-- 查询区  -->
	  <tr valign="top">
	    <td height="30">
		  <table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
		    <tr>
			  <td class="fftd">
			  	<form name="orderform" method="post" id="orderform" action="${ctx}/order/selectOrder">
				    <table width="100%" border="0" cellpadding="0" cellspacing="0">
					  <tr>
					    <td class="font3">
					    	订单号：<input type="text" name="OrderId">&nbsp;&nbsp;&nbsp;
<!-- 					    	订单是否支付（0否，1是）：<input type="text" name="OrderIsPay"> -->
					    	 <input type="submit" value="搜索"/>
					    	<input id="delete" type="button" value="删除"/>
					    </td>
					  </tr>
					</table>
				</form>
			  </td>
			</tr>
		  </table>
		</td>
	  </tr>
	  
	  <!-- 数据展示区 -->
	  <tr valign="top">
	    <td height="20">
		  <table width="100%" border="1" cellpadding="5" cellspacing="0" style="border:#c2c6cc 1px solid; border-collapse:collapse;">
		    <tr class="main_trbg_tit" align="center">
			  <td><input type="checkbox" name="checkAll" id="checkAll"></td>
			  <td>订单号</td>
			  <td>酒店名称</td>
			  <td>酒店类型</td>
			  <td>酒店等级</td>
			  <td>酒店地址</td>
			  <td>订单时间</td>
			  <td>订单房间数量</td>
			  <td>订单金额</td>		
			  <td>订单人</td>
			  <td>订单人联系电话</td>
			  <td>订单人邮箱号码</td>
			  <td>订单入房时间</td>
			  <td>订单退房时间</td>
			  <td>订单入房天数</td>
			  <td>订单入住人数</td>
			  <td>订单是否支付</td>
			  <td>订单是否退单</td>		
			  <td align="center">操作</td>
			</tr>
			<c:forEach items="${requestScope.orders}" var="order" varStatus="stat">
				<tr id="data_${stat.index}" align="center" class="main_trbg" onMouseOver="move(this);" onMouseOut="out(this);">
					<td><input type="checkbox" id="box_${stat.index}" value="${order.orderId}"></td>
					 <td>${order.orderId }</td>
					 <td>${order.hotelName }</td>
					 <td>${order.hotelType }</td>
					 <td>${order.roomGrade }</td>
					 <td>${order.hotelAdress }</td>
					 <td>${order.orderTime }</td>
					 <td>${order.roomNum }</td>
					 <td>${order.orderMoney }</td>
					 <td>${order.orderUserName }</td>
					 <td>${order.contactNum }</td>
					 <td>${order.orderEmail }</td>
					 <td>${order.inDate }</td>
					 <td>${order.outDate }</td>
					 <td>${order.orderDay }</td>
					 <td>${order.peopleNum }</td>
					 <td><c:if test="${order.orderIsPay == '0'}">未支付</c:if>
					  <c:if test="${order.orderIsPay == '1'}">已支付</c:if>
					  </td>
					  
					 <td><c:if test="${order.isChargeback == '1'}">已退单</c:if>
					  <c:if test="${order.isChargeback == '0'}">未退单</c:if>
					  </td>
					 <td align="center" width="40px;"><a href="${ctx}/order/updateOrder?flag=1&OrderId=${order.orderId}">
							<img title="修改" src="${ctx}/images/update.gif"/></a>
					  </td>
				</tr>
			</c:forEach>
		  </table>
		</td>
	  </tr>
	  <!-- 分页标签 -->
	  <tr valign="top"><td align="center" class="font3">
	  	 <fkjava:pager
	  	        pageIndex="${requestScope.pageModel.pageIndex}" 
	  	        pageSize="${requestScope.pageModel.pageSize}" 
	  	        recordCount="${requestScope.pageModel.recordCount}" 
	  	        style="digg"
	  	        submitUrl="${ctx}/order/selectOrder?pageIndex={0}"/>
	  </td></tr>
	</table>
	<div style="height:10px;"></div>
</body>
</html>