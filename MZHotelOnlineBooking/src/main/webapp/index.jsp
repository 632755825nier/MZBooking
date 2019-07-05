<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="com.nier.Booking.entity.User" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 设置一个项目路径的变量  -->
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
	<link href="resources/css/booking_com.css" rel="stylesheet">
	<link rel="stylesheet" href="resources/css/NavBar.css?v=<%= System.currentTimeMillis()%>">
	<link href="resources/res/icon/index_icon/iconfont.css" rel="stylesheet">
	<link href="resources/res/icon/personifm/iconfont.css" rel="stylesheet">
	<link href="resources/css/index_container.css" rel="stylesheet">
	<link href="resources/css/index_container_yuan.css" rel="stylesheet">
	<link href="resources/res/icon/index_icon/index_yuan/iconfont.css">
	<link rel="stylesheet" href="resources/css/searchResult.css">
	<!-- 	弹窗框架           -->
	<link href="resources/css/sweetalert/sweetalert.css" rel="stylesheet">
	<script src="resources/js/sweetalert/sweetalert.min.js"></script>
	
	<link rel="SHORTCUT ICON" href="resources/res/images/Mlogo.icon"/>
	<link href="resources/css/messageRegister.css" rel="stylesheet" type="text/css">
	<script src="//at.alicdn.com/t/font_781787_zjbt04eeo.js" type="text/javascript"></script>
	<script src="//at.alicdn.com/t/font_788386_tzd56uglegn.js" type="text/javascript"></script>
<!-- 	<script src="resources/js/booking_com.js" type="text/javascript"></script> -->
	<script src="resources/js/NavBar.js" type="text/javascript"></script>
	<script src="resources/js/index_container.js" type="text/javascript"></script>
	<script src="resources/js/AutoComplete.js" type="text/javascript"></script>
	<script src="resources/js/messageRegister.js" type="text/javascript"></script>
	<title>梅州旅馆在线预定</title>
</head>
<body>
<div id="registertip" class="index_tip"></div>
<div id="none_img_id" >
	<img src="resources/res/images/wechat_img.png" id="none_img_id2" >
</div>
<div class="top">
	<div class="head">
		<img id="Booking_logo" class="logo" src="resources/res/images/logo.png">
		<div class="user-bar">
			<ul class="user-ul">
				<li class="user-li_1" >
					<a id="mon_tex" href="javascript:void(0)"  class="user-tex" data-title="选择您使用的货币">元</a>
					<div class="mon_box" id="mon_id_box">
						<div class="mon_trigon"></div>
						<h3>货币</h3>
						<ul class="mon_ul">
							<li class="mon_li_other"><span>元</span><small>人民币</small></li>
							<li class="mon_li"><span>€￡$</span><small>住宿地使用的货币</small></li>
							<li class="mon_li"><span>US$</span><small>美元</small></li>
							<li class="mon_li"><span>€</span><small>欧元</small></li>
							<li class="mon_li"><span>TWD</span><small>新台币</small></li>
							<li class="mon_li"><span>HK$</span><small>港币</small></li>
							<li class="mon_li"><span>￡</span><small>英镑</small></li>
						</ul>

						<h3>所有货币</h3>
						<ul class="mon_ul_2">
							<li class="mon_li"><span>UAH</span><small>乌克兰赫夫米</small></li>
							<li class="mon_li_other"><span>元</span><small>人民币</small></li>
							<li class="mon_li"><span>?</span><small>以色列新谢克尔</small></li>
							<li class="mon_li"><span>RUB</span><small>俄罗斯卢布</small></li>
							<li class="mon_li"><span>BGN</span><small>保加利亚新列弗</small></li>
							<li class="mon_li"><span>CAD</span><small>加元</small></li>
							<li class="mon_li"><span>HUF</span><small>匈牙利福林</small></li>
							<li class="mon_li"><span>ZAR</span><small>南非兰特</small></li>
							<li class="mon_li"><span>QAR</span><small>卡塔尔里亚尔</small></li>
							<li class="mon_li"><span>Rp</span><small>印尼卢比</small></li>
							<li class="mon_li"><span>Rs.</span><small>印度卢比</small></li>
							<li class="mon_li"><span>KZT</span><small>哈萨克斯坦坚戈</small></li>
							<li class="mon_li"><span>EGP</span><small>埃及镑</small></li>
							<li class="mon_li"><span>MXN</span><small>墨西哥比索</small></li>
							<li class="mon_li"><span>BHD</span><small>巴林第纳尔</small></li>
							<li class="mon_li"><span>R$</span><small>巴西雷阿尔</small></li>
							<li class="mon_li"><span>NOK</span><small>挪威克朗</small></li>
							<li class="mon_li"><span>K?</span><small>捷克克朗</small></li>


							<li class="mon_li"><span>MDL</span><small>摩尔多瓦列伊</small></li>
							<li class="mon_li"><span>FJD</span><small>斐济元</small></li>
							<li class="mon_li"><span>S$</span><small>新元</small></li>
							<li class="mon_li"><span>TWD</span><small>新台币</small></li>
							<li class="mon_li"><span>TL</span><small>新土耳其里拉</small></li>
							<li class="mon_li"><span>NZD</span><small>新西兰元</small></li>
							<li class="mon_li"><span>￥</span><small>智利比索</small></li>
							<li class="mon_li"><span>CL$</span><small>墨西哥比索</small></li>
							<li class="mon_li"><span>GEL</span><small>格鲁吉亚拉里</small></li>
							<li class="mon_li"><span>€</span><small>欧元</small></li>
							<li class="mon_li"><span>SAR</span><small>沙特阿拉伯里亚尔</small></li>
							<li class="mon_li"><span>z?</span><small>波兰兹罗提</small></li>

							<li class="mon_li"><span>THB</span><small>泰铢</small></li>
							<li class="mon_li"><span>HK$</span><small>港币</small></li>
							<li class="mon_li"><span>AUD</span><small>澳元</small></li>
							<li class="mon_li"><span>SEK</span><small>瑞典克朗</small></li>
							<li class="mon_li"><span>CHF</span><small>科威特第纳尔</small></li>
							<li class="mon_li"><span>JOD</span><small>约旦第纳尔</small></li>
							<li class="mon_li"><span>NAD</span><small>纳米比亚元</small></li>
							<li class="mon_li"><span>lei</span><small>罗马尼亚新列伊</small></li>
							<li class="mon_li"><span>US$</span><small>美元</small></li>
							<li class="mon_li"><span>￡</span><small>英镑</small></li>
							<li class="mon_li"><span>XOF</span><small>西非法郎</small></li>
							<li class="mon_li"><span>AZN</span><small>阿塞拜疆新马纳特</small></li>

							<li class="mon_li"><span>OMR</span><small>阿曼里亚尔</small></li>
							<li class="mon_li"><span>AR$</span><small>阿根廷比索</small></li>
							<li class="mon_li"><span>AED</span><small>阿联酋迪拉姆</small></li>
							<li class="mon_li"><span>KRW</span><small>韩元</small></li>
							<li class="mon_li"><span>MYR</span><small>马来西亚令吉</small></li>
						</ul>
					</div>
				</li>
				<li class="user-li_2">
					<a href="javascript:void(0)" id="lang-i" class="user-tex" data-title="选择您使用的语言" >
						<i class="iconfont icon-uk lang-i-cla"  ></i>
					</a>

					<div class="language_cla" id="language_id">
						<div class="mon_trigon"></div>
						<h3>中国的客人最常使用的语言</h3>
						<ul class="ul_lang">
							<li class="li_lang"><a href="#"><i class="iconfont icon-jiantizhongwen"></i><span>简体中文</span></a></li>
							<li class="li_lang"><a href="#"><i class="iconfont icon-fantizhongwen"></i><span>繁体中文</span></a></li>
							<li class="li_lang"><a href="#"><i class="iconfont icon-Nederland"></i><span>Nederland</span></a></li>
							<li class="li_lang"><a href="#"><i class="iconfont icon-uk"></i><span>UK</span></a></li>
							<li class="li_lang"><a href="#"><i class="iconfont icon-US"></i><span>US</span></a></li>
							<li class="li_lang"><a href="#"><i class="iconfont icon-riben"></i><span>日本语</span></a></li>
							<li class="li_lang"><a href="#"><i class="iconfont icon-Deutsch-flag"></i><span>Deutsch</span></a></li>
							<li class="li_lang"><a href="#"><i class="iconfont icon-arrow-left"></i><span>arrow</span></a></li>
							<li class="li_lang"><a href="#"><i class="iconfont icon-shang"></i><span>Shang</span></a></li>
						</ul>

					</div>
				</li>
				<li class="user-li_3">
					<i class="iconfont icon-weixin " id="wechat-i" ></i>
				</li>
				<li class="user-li_4">
					<a href="#" onclick="" class="user-btn-2">上线我的住宿</a>
				</li>
<%
	User loginUser = (User) session.getAttribute("loginUser");
	if(loginUser == null){
%>
				<li class="user-li_5">
					<a id="reg-btn" href="#" class="user-btn" data-title="成为会员，享受专属隐藏优惠">注册</a>
				</li>
				<li class="user-li_6">
					<a id="log-btn" href="#" class="user-btn" data-title="使用已存信息，预订更快捷">登录</a>
				</li>
<%
	} else {
%>
				<li class="person_class">
                    <a href="#" class="person_class_a">
<%
		if(loginUser.getUserPicture() == null) {
%>
						<img src="resources/res/images/personIfm/person.png" style="width: 37px;height: 37px" class="personImg_class">
<%
		} else {
%>
						<img src=${sessionScope.loginUser.userPicture } style="width: 37px;height: 37px" class="personImg_class">
<%
		}
%>
                        
                        <p class="user_name">${sessionScope.loginUser.userNickName }</p></a>
                    <div class="showIfm_none">
                        <div class="showIfm_none_tri"></div>
                        <ul class="showIfm_none_ul">
                            <li><a href="view/PersonalCenter.jsp">我的个人中心</a></li>
                            <li><a href="view/PersonalCenter.jsp">我的订单</a></li>
                            <li><a href="view/PersonalCenter.jsp">报表</a></li>
                            <li><a href="view/PersonalCenter.jsp">评语</a></li>
                            <li><a href="view/PersonalCenter.jsp">我的收藏</a></li>
                            <li><a href="view/PersonalCenter.jsp">下载app</a></li>
                            <li><a href="view/PersonalCenter.jsp">客服帮助</a></li>
                            <li><a href="view/PersonalCenter.jsp">设置</a></li>
                            <li class="user_quit"><a href="UserExitServlet" >退出</a></li>
                        </ul>
                    </div>
                </li>
<%		
	}
%>
			</ul>
		</div>
	</div>
</div>
	<div class="top_deown">
	<div class="head_dowm">
		<ul class="nav_ul">
			<li class="nav_li_1"><a href="#">住宿</a></li>
			<li class="nav_li_2"><a href="#">机票</a></li>
			<li class="nav_li_2"><a href="#">租车</a></li>
			<li class="nav_li_3"><a href="#">机场出租车</a></li>

		</ul>
		</div>
	</div>
</div>
<!-- 搜索功能模块-->
<div class="search">
	<div class="search_tex">
		<h2 class="search_tex_h2">去旅行总不会错。查找优惠！</h2>
		<p class="search_tex_p">从舒适的乡村民宿到时髦的都市公寓</p>
	</div>
	
	<form action="view/indexAdress.jsp" method="post">
	<div class="search_container">
		<div class="search_container_one" style="width: 970px;">
			<svg class="icon icon-chuang1" aria-hidden="true" >
				<use xlink:href="#icon-chuang1"></use>
			</svg>
			<input class="search_container_one_input" style="width: 928px; " placeholder="请输入：梅州市,广东省,中国" name="adress" >
			<div id="word">
			</div>
		</div>
<!-- 		<div class="search_container_two"> -->
<!-- 			<svg class="icon icon-rili" aria-hidden="true"> -->
<!-- 				<use xlink:href="#icon-rili"></use> -->
<!-- 			</svg> -->
<!-- 			<span class="search_container_two_span1" onclick="checkclick(1)">入住</span> -->
<!-- 			<span class="search_container_two_span2">-</span> -->
<!-- 			<span class="search_container_two_span3" onclick="checkclick(-1)">退房</span> -->
<!-- 			<div class="search_container_three_calendar_container"> -->
<!-- 				<span class="search_container_three_calendar_container_span"></span> -->
<!-- 				<div class="leftmonth_container"> -->
<!-- 					<ul> -->
<!-- 						<li class="prev" onclick="change_page(-1)"><</li> -->
<!-- 						<li class="leftmonth_month"> -->
<!-- 							2018年8月 -->
<!-- 						</li> -->
<!-- 					</ul> -->
<!-- 				</div> -->

<!-- 				<div class="week"> -->
<!-- 					<ul> -->
<!-- 						<li>周一</li> -->
<!-- 						<li>周二</li> -->
<!-- 						<li>周三</li> -->
<!-- 						<li>周四</li> -->
<!-- 						<li>周五</li> -->
<!-- 						<li>周六</li> -->
<!-- 						<li>周日</li> -->
<!-- 					</ul> -->
<!-- 				</div> -->

<!-- 				<div class="day"> -->
<!-- 					<ul> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-0')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-1')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-2')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-3')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-4')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-5')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-6')"></li> -->

<!-- 						<li class="day_enum" onclick="choosedate('1-7')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-8')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-9')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-10')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-11')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-12')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-13')"></li> -->

<!-- 						<li class="day_enum" onclick="choosedate('1-14')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-15')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-16')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-17')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-18')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-19')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-20')"></li> -->

<!-- 						<li class="day_enum" onclick="choosedate('1-21')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-22')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-23')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-24')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-25')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-26')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-27')"></li> -->

<!-- 						<li class="day_enum" onclick="choosedate('1-28')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-29')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-30')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-31')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-32')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-33')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-34')"></li> -->

<!-- 						<li class="day_enum" onclick="choosedate('1-35')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-36')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-37')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-38')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-39')"></li> -->
<!-- 						<li class="day_enum" onclick="choosedate('1-40')"></li> -->
<!-- 					</ul> -->

<!-- 				</div> -->

<!-- 				<div class="rightmonth_container"> -->
<!-- 					<ul> -->
<!-- 						<li class="rightprev" onclick="change_page(1)">></li> -->
<!-- 						<li class="rightmonth_month"> -->
<!-- 							2018年9月 -->
<!-- 						</li> -->

<!-- 					</ul> -->
<!-- 				</div> -->

<!-- 				<div class="right_week"> -->
<!-- 					<ul> -->

<!-- 						<li>周一</li> -->
<!-- 						<li>周二</li> -->
<!-- 						<li>周三</li> -->
<!-- 						<li>周四</li> -->
<!-- 						<li>周五</li> -->
<!-- 						<li>周六</li> -->
<!-- 						<li>周日</li> -->

<!-- 					</ul> -->
<!-- 				</div> -->

<!-- 				<div class="right_day"> -->
<!-- 					<ul> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-0')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-1')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-2')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-3')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-4')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-5')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-6')"></li> -->

<!-- 						<li class="right_day_enum" onclick="choosedate('2-7')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-8')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-9')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-10')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-11')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-12')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-13')"></li> -->

<!-- 						<li class="right_day_enum" onclick="choosedate('2-14')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-15')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-16')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-17')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-18')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-19')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-20')"></li> -->

<!-- 						<li class="right_day_enum" onclick="choosedate('2-21')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-22')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-23')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-24')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-25')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-26')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-27')"></li> -->

<!-- 						<li class="right_day_enum" onclick="choosedate('2-28')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-29')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-30')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-31')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-32')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-33')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-34')"></li> -->

<!-- 						<li class="right_day_enum" onclick="choosedate('2-35')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-36')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-37')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-38')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-39')"></li> -->
<!-- 						<li class="right_day_enum" onclick="choosedate('2-40')"></li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="search_container_three"> -->
<!-- 			<svg class="icon icon-ren " aria-hidden="true \" onclick="opencontainer2(1)"> -->
<!-- 				<use xlink:href="#icon-ren"></use> -->
<!-- 			</svg> -->
<!-- 			<span class="search_container_three_span" onclick="opencontainer2(1)">1名成人&1名儿童</span> -->
<!-- 			<svg class="icon icon-shangxiajiantou" aria-hidden="true" onclick="opencontainer2(1)"> -->
<!-- 				<use xlink:href="#icon-shangxiajiantou"></use> -->
<!-- 			</svg> -->
<!-- 			<div class="user_choose_container"> -->
<!-- 				<div class="user_choose_one"> -->
<!-- 					<span>客房</span> -->
<!-- 					<div class="user_choose_one_num" onclick="opennumdiv(1)"> -->
<!-- 						<span class="roomnum">1</span> -->
<!-- 						<div class="choose_roomnum"> -->
<!-- 							<ul> -->
<!-- 								<li onclick="choosenum('0-0')">1</li> -->
<!-- 								<li onclick="choosenum('0-1')">2</li> -->
<!-- 								<li onclick="choosenum('0-2')">3</li> -->
<!-- 								<li onclick="choosenum('0-3')">4</li> -->
<!-- 								<li onclick="choosenum('0-4')">5</li> -->

<!-- 								<li onclick="choosenum('0-5')">6</li> -->
<!-- 								<li onclick="choosenum('0-6')">7</li> -->
<!-- 								<li onclick="choosenum('0-7')">8</li> -->
<!-- 								<li onclick="choosenum('0-8')">9</li> -->
<!-- 								<li onclick="choosenum('0-9')">10</li> -->

<!-- 								<li onclick="choosenum('0-10')">11</li> -->
<!-- 								<li onclick="choosenum('0-11')">12</li> -->
<!-- 								<li onclick="choosenum('0-12')">13</li> -->
<!-- 								<li onclick="choosenum('0-13')">14</li> -->
<!-- 								<li onclick="choosenum('0-14')">15</li> -->

<!-- 								<li onclick="choosenum('0-15')">16</li> -->
<!-- 								<li onclick="choosenum('0-16')">17</li> -->
<!-- 								<li onclick="choosenum('0-17')">18</li> -->
<!-- 								<li onclick="choosenum('0-18')">19</li> -->
<!-- 								<li onclick="choosenum('0-19')">20</li> -->

<!-- 								<li onclick="choosenum('0-20')">21</li> -->
<!-- 								<li onclick="choosenum('0-21')">22</li> -->
<!-- 								<li onclick="choosenum('0-22')">23</li> -->
<!-- 								<li onclick="choosenum('0-23')">24</li> -->
<!-- 								<li onclick="choosenum('0-24')">25</li> -->

<!-- 								<li onclick="choosenum('0-25')">26</li> -->
<!-- 								<li onclick="choosenum('0-26')">27</li> -->
<!-- 								<li onclick="choosenum('0-27')">28</li> -->
<!-- 								<li onclick="choosenum('0-28')">29</li> -->
<!-- 								<li onclick="choosenum('0-29')">30</li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="user_choose_two"> -->
<!-- 					<span>成人</span> -->
<!-- 					<div class="user_choose_two_num" onclick="opennumdiv(2)"> -->
<!-- 						<span class="adultnum">1</span> -->
<!-- 						<div class="choose_adultnum"> -->
<!-- 							<ul> -->
<!-- 								<li onclick="choosenum('1-0')">1</li> -->
<!-- 								<li onclick="choosenum('1-1')">2</li> -->
<!-- 								<li onclick="choosenum('1-2')">3</li> -->
<!-- 								<li onclick="choosenum('1-3')">4</li> -->
<!-- 								<li onclick="choosenum('1-4')">5</li> -->

<!-- 								<li onclick="choosenum('1-5')">6</li> -->
<!-- 								<li onclick="choosenum('1-6')">7</li> -->
<!-- 								<li onclick="choosenum('1-7')">8</li> -->
<!-- 								<li onclick="choosenum('1-8')">9</li> -->
<!-- 								<li onclick="choosenum('1-9')">10</li> -->

<!-- 								<li onclick="choosenum('1-10')">11</li> -->
<!-- 								<li onclick="choosenum('1-11')">12</li> -->
<!-- 								<li onclick="choosenum('1-12')">13</li> -->
<!-- 								<li onclick="choosenum('1-13')">14</li> -->
<!-- 								<li onclick="choosenum('1-14')">15</li> -->

<!-- 								<li onclick="choosenum('1-15')">16</li> -->
<!-- 								<li onclick="choosenum('1-16')">17</li> -->
<!-- 								<li onclick="choosenum('1-17')">18</li> -->
<!-- 								<li onclick="choosenum('1-18')">19</li> -->
<!-- 								<li onclick="choosenum('1-19')">20</li> -->

<!-- 								<li onclick="choosenum('1-20')">21</li> -->
<!-- 								<li onclick="choosenum('1-21')">22</li> -->
<!-- 								<li onclick="choosenum('1-22')">23</li> -->
<!-- 								<li onclick="choosenum('1-23')">24</li> -->
<!-- 								<li onclick="choosenum('1-24')">25</li> -->

<!-- 								<li onclick="choosenum('1-25')">26</li> -->
<!-- 								<li onclick="choosenum('1-26')">27</li> -->
<!-- 								<li onclick="choosenum('1-27')">28</li> -->
<!-- 								<li onclick="choosenum('1-28')">29</li> -->
<!-- 								<li onclick="choosenum('1-29')">30</li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="user_choose_three"> -->
<!-- 					<span>儿童</span> -->
<!-- 					<div class="user_choose_three_num" onclick="opennumdiv(3)"> -->
<!-- 						<span class="childnum">0</span> -->
<!-- 						<div class="choose_childnum"> -->
<!-- 							<ul> -->
<!-- 								<li onclick="choosenum('2-0')">0</li> -->
<!-- 								<li onclick="choosenum('2-1')">1</li> -->
<!-- 								<li onclick="choosenum('2-2')">2</li> -->
<!-- 								<li onclick="choosenum('2-3')">3</li> -->
<!-- 								<li onclick="choosenum('2-4')">4</li> -->
<!-- 								<li onclick="choosenum('2-5')">5</li> -->

<!-- 								<li onclick="choosenum('2-6')">6</li> -->
<!-- 								<li onclick="choosenum('2-7')">7</li> -->
<!-- 								<li onclick="choosenum('2-8')">8</li> -->
<!-- 								<li onclick="choosenum('2-9')">9</li> -->
<!-- 								<li onclick="choosenum('2-10')">10</li> -->

<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<input class="search_container_four" type="submit" value="搜索">
	</div>
	</form>
	<div class="search_input">
		<input type="checkbox" id="allSelect" class="chkbox" /> <label for="allSelect" class="search_checkbox"> 我是出差</label>
	</div>
</div>
<!-- 内容区1-->
<div class="container_box">
	<div class="container">
		<div id="container_holiday">
			<i class="iconfont icon-Deutsch-flag"></i>
			<span class="holiday_span">度假在即？<a href="#">年中优惠,省15%+</a>，了解一下!</span>
			<i  id="hide_i">X</i>
		</div>
		<div class="fuSongXian">
			<!-- 用于连接到目的地-->
			<a href="LookingroomInitServlet?hotelId=17" class="link_id">

				<h2>梅江区</h2>
				<p>泮坑酒店</p>
				<a href="#" class="fuSongXian_a">
					<small>均价</small>
					<span>258元</span>
				</a>
				<div class="fusongxian_none">
					<div class="fsx_trigon"></div>
					<span>搜索比较该目的地的住宿</span>
				</div>
			</a>
		</div>

		<div class="sanya">
			<a href="LookingroomInitServlet?hotelId=13" class="link_id">

				<h2>梅江区</h2>
				<p>维也纳国际酒店</p>
				<a href="#" class="sanya_a">
					<small>均价</small>
					<span>508元</span>
				</a>
				<div class="sanya_none">
					<div class="sy_trigon"></div>
					<span>搜索比较该目的地的住宿</span>
				</div>
			</a>
		</div>

		<div class="eryuan">
			<a href="LookingroomInitServlet?hotelId=9" class="link_id" >

				<h2>梅江区</h2>
				<p>爱丽丝庄园民宿</p>
				<a href="#" class="eryuan_a">
					<small>均价</small>
					<span>168元</span>
				</a>
				<div class="eryuan_none">
					<div class="ey_trigon"></div>
					<span>搜索比较该目的地的住宿</span>
				</div>
			</a>
		</div>

		<div class="dali">
			<a href="LookingroomInitServlet?hotelId=20" class="link_id">
				<h2>梅县区</h2>
				<p>碧桂园假日酒店</p>
				<a href="#" class="dali_a">
					<small>均价</small>
					<span>468元</span>
				</a>
				<div class="dali_none">
					<div class="dl_trigon"></div>
					<span>搜索比较该目的地的住宿</span>
				</div>
			</a>
		</div>

		<div class="jinghongshi">
			<a href="LookingroomInitServlet?hotelId=21" class="link_id">
				<h2>梅县区</h2>
				<p>雁鸣湖旅游度假村</p>
				<a href="#" class="jinghongshi_a">
					<small>均价</small>
					<span>498元</span>
				</a>
				<div class="jinghongshi_none">
					<div class="jhs_trigon"></div>
					<span>搜索比较该目的地的住宿</span>
				</div>
			</a>
		</div>


	</div>
</div>

<div class="container_box2">

	<div class="tip2"></div>

	<div class="container2">

		<div class="container2_left">

			<img src="resources/res/images/index/booking_reg.jpg" class="img_reg">
			<p>在MZHotel注册您的住宿</p>
			<h3>注册、赚钱，为梦想买单。</h3>
			<button><a href="#">了解更多</a></button>
		</div>
		<div class="container2_right">
			<div class="container2_right_up">
				<img src="resources/res/images/index/reg_logo.png" class="img_reg_logo">
				<a href="#" class="container2_right_up_a">
					<p>注册即可体验最佳旅行</p>
					<h5>我们的电子报帮你提早计划，获取最佳住宿选择</h5>
				</a>
			</div>
			<div class="container2_right_dowm">
				<form action="#" method="get">
					<input type="text" placeholder="输入电子邮箱地址" class="container2_right_dowm_inp user_email" data-title="您的电子邮箱地址">
					<button class="container2_right_dowm_btn">订阅电子报!</button>
				</form>
			</div>
		</div>
	</div>
</div>

<div>

	<div class="container_box3">
		<div class="container3">
			<h1 class="container3_h1">精彩下一站，灵感这里找</h1>
			<div class="container3_01">
				<div class="container3_img1">
					<a href="#" class="container3_img1_a" >
						<p class="container3_img1_date">2018年1月2日</p>
						<h3 class="container3_img1_h3">情迷美利坚 | 最美自然风光</h3>
						<p class="container3_img1_p1">如果你不曾到过美国,不曾为其壮丽的大自然感动</p>
						<p class="container3_img1_p2">过,一定要收下这篇旅行者攻略</p>
					</a>
				</div>
			</div>
			<div class="container3_02">
				<div class="container3_img2">
					<a href="#" class="container3_img2_a" >
						<p class="container3_img2_date">2017年12月28日</p>
						<h3 class="container3_img2_h3">澳大利亚不可错过的自然之美</h3>
						<p class="container3_img2_p1">在这些旅友们甄选的人气目的地，发现澳大利亚令人</p>
						<p class="container3_img2_p2">惊叹的自然美景</p>
					</a>
				</div>
			</div>

			<div class="container3_03">
				<div class="container3_img3">
					<a href="#" class="container3_img3_a" >
						<p class="container3_img3_date">2017年12月14日</p>
						<h3 class="container3_img3_h3">咖啡狂人旅行宝典</h3>
						<p class="container3_img3_p1"></p>
						<p class="container3_img3_p2">6大终极目的地，只为那一口馥郁香醇</p>
					</a>
				</div>
			</div>


			<div class="container3_04">
				<div class="container3_img4">
					<a href="#" class="container3_img4_a" >
						<p class="container3_img4_date">2017年12月14日</p>
						<h3 class="container3_img4_h3">7快蛋糕带你环游世界</h3>
						<p class="container3_img4_p1"></p>
						<p class="container3_img4_p2">以地名命名的美味蛋糕,边走边吃不怕胖</p>
					</a>
				</div>
			</div>

			<div class="container3_05">
				<div class="container3_img5">
					<a href="#" class="container3_img5_a" >
						<p class="container3_img5_date">2017年12月4日</p>
						<h3 class="container3_img5_h3">来一场冰川征服之旅</h3>
						<p class="container3_img5_p1"></p>
						<p class="container3_img5_p2">遇见大野洋子曾经唱过的景象：冰 冰 冰 冰 冰 冰</p>
					</a>
				</div>
			</div>

			<div class="container3_06">
				<a href="#" class="container3_06_a">查看更多</a>
			</div>


		</div>
	</div>
	<div class="container_box4">
		<div class="container4">
			<p class="p1">不仅有酒店...还有更多度假屋和公寓等你体验这份舒适</p>
			<ul class="container4list">
				<li class="container4list_0"><img src="resources/res/images/index_foot/hotel/01.jpg"><br><div><p style="font-size: 13px">休格公寓式酒店</p><p style="font-size: 13px;color: #707070">里约热内卢</p><br><p style="color: #383838;font-size: 14px">353元起</p><p style="color: #003580;font-size: 13px">9.3好极了..296条住客点评</p></div></li>
				<li class="container4list_1"><img src="resources/res/images/index_foot/hotel/02.jpg"><div><p style="font-size: 13px">希亚多梅西公寓|里斯本最佳公寓</p><p style="font-size: 13px;color: #707070">里斯本</p><br><p style="color: #383838;font-size: 14px">1802起</p><p style="color: #003580;font-size: 13px">9.5优异的..768条住客点评</p></div></li>
				<li class="container4list_2"><img src="resources/res/images/index_foot/hotel/03.jpg"><div><p style="font-size: 13px">市中心优雅时尚公寓</p><p style="font-size: 13px;color: #707070">布达佩斯</p><br><p style="color: #383838;font-size: 14px">862元起</p><p style="color: #003580;font-size: 13px">9.6优异的..57条住客点评</p></div></li>
				<li class="container4list_3"><img src="resources/res/images/index_foot/hotel/04.jpg"><div><p style="font-size: 13px">海滨美丽公寓</p><p style="font-size: 13px;color: #707070">尼斯</p><br><p style="color: #383838;font-size: 14px">1952元起</p><p style="color: #003580;font-size: 13px">9.7优异的..26条住客点评</p></div></li>
				<li class="container4list_4"><img src="resources/res/images/index_foot/hotel/05.jpg"><div><p style="font-size: 13px">考文特花园公寓</p><p style="font-size: 13px;color: #707070">伦敦</p><br><p style="color: #383838;font-size: 14px">31622元起</p><p style="color: #003580;font-size: 13px">9.3很棒..286条住客点评</p></div></li>
				<li class="container4list_5"><span >你可能会喜欢这些度假屋和公寓</span><input type="text" placeholder="搜索度假屋及公寓"></li>
			</ul>
			<div class="slideLeftBtn4"id="slideLeftBtn4">&#xe60f;</div>
			<div class="slideRightBtn4" id="slideRightBtn4">&#xe60e</div>
		</div>
	</div>
	<div class="container_box5">
		<div class="container5">
			<p class="p1">无论任何住宿类型，只要你想，我们都有...</p>
			<ul class="container5list">
				<li class="container5list_0"><img src="resources/res/images/index_foot/hotel_2/04.jpg"><div><p style="font-size: 13px">木屋</p><p style="font-size: 12px;color: #707070">10309间木屋</p></div></li>
				<li class="container5list_1"><img src="resources/res/images/index_foot/hotel_2/05.jpg"><div><p style="font-size: 13px">乡村别墅</p><p style="font-size: 12px;color: #707070">10439栋别墅</p></div></li>
				<li class="container5list_2"><img src="resources/res/images/index_foot/hotel_2/06.jpg"><div><p style="font-size: 13px">豪华帐篷</p><p style="font-size: 12px;color: #707070">10129处豪华帐篷地</p></div></li>
				<li class="container5list_3"><img src="resources/res/images/index_foot/hotel_2/07.jpg"><div><p style="font-size: 13px">公寓式酒店</p><p style="font-size: 12px;color: #707070">25309家公寓式酒店</p></div></li>
				<li class="container5list_4"><img src="resources/res/images/index_foot/hotel_2/08.jpg"><div><p style="font-size: 13px">度假屋</p><p style="font-size: 12px;color: #707070">63309间度假屋</p></div></li>
				<li class="container5list_5"><img src="resources/res/images/index_foot/hotel_2/09.jpg"><div><p style="font-size: 13px">旅馆</p><p style="font-size: 12px;color: #707070">45309家旅馆</p></div></li>

				<li class="container5list_6"><img src="resources/res/images/index_foot/hotel_2/01.jpg"><div><p style="font-size: 13px">公寓</p><p style="font-size: 12px;color: #707070">45681栋公寓</p></div></li>
				<li class="container5list_7"><img src="resources/res/images/index_foot/hotel_2/02.jpg"><div><p style="font-size: 13px">度假村</p><p style="font-size: 12px;color: #707070">45561个度假村</p></div></li>
				<li class="container5list_8"><img src="resources/res/images/index_foot/hotel_2/03.jpg"><div><p style="font-size: 13px">别墅</p><p style="font-size: 12px;color: #707070">10789栋别墅</p></div></li>
				<li class="container5list_9"><img src="resources/res/images/index_foot/hotel_2/10.jpg"><div><p style="font-size: 13px">青旅</p><p style="font-size: 12px;color: #707070">108994间青旅</p></div></li>
				<li class="container5list_10"><img src="resources/res/images/index_foot/hotel_2/11.jpg"><div><p style="font-size: 13px">汽车旅馆</p><p style="font-size: 12px;color: #707070">10378间汽车旅馆</p></div></li>
				<li class="container5list_11"><img src="resources/res/images/index_foot/hotel_2/12.jpg"><div><p style="font-size: 13px">住宿加早餐旅馆</p><p style="font-size: 12px;color: #707070">40309家住宿加早餐旅馆</p></div></li>

			</ul>
			<div id="slideLeftBtn5">&#xe60f;</div>
			<div id="slideRightBtn5">&#xe60e</div>
		</div>
	</div>

	<div class="container_box6">
		<div class="container6"><p style="font-size: 20px;padding: 15px 15px;">分享对旅行的热爱！160,370,000条真实住客点评为你带来更多灵感。</p>
			<ul class="container6list1">
				<li>一位来自美国的客人评价<b >威尼斯人度假赌场酒店</b>：“吃，住，游乐一条龙服务方便”</li>
				<li>一位来自韩国的客人评价<b>布克乔娜旅馆</b>：“早餐特别棒，做的很漂亮又很好吃，老板也非常好。”</li>
				<li>一位来自日本的客人评价道<b>顿堀韦连娜酒店</b>：“离地铁，心斋桥和道顿觉特别近，走路没多久到了，非常方便”</li>
			</ul>
			<ul class="container6list2">
				<li>一位来自美国的客人评价<b>加利福尼亚州阿纳海姆卡尔森乡村套房酒店</b>：“离迪士尼近，房间很大！”</li>
				<li>一位来自中国的客人评价<b>拾得水石间</b>：“环境很好，老板人也nice”</li>
				<li>一位来自马来西亚的客人评价<b>OYO 336 Bintang Garden Hotel</b>：“just so so”</li>
			</ul>
		</div>
	</div>
	<div class="container_box7">
		<div class="container7">
			<p style="font-size: 24px;color: black;" ><b>还没想好住哪里？</b></p>
			<span style="font-size: 14px; color: #757575">让你轻松下决定！超过160,260,000条真实住客点评，帮你找到理想住宿。</span>
			<div class="tab">
				<ul class="tab_menu">
					<li class="change">酒店点评</li>
					<li>宾馆/旅馆点评</li>
					<li>度假/住宿点评</li>
				</ul>
				<div style="width: 1111px;height: 1px;background-color:#73aac7;"></div>
				<div class="tab_box">
					<div class="tab_box1">
						<ul>
							<li>东京<p style="color:#757575; font-size: 13px">487856条酒店点评</p></li>
							<li>大阪<p style="color:#757575; font-size: 13px">4874848条酒店点评</li>
							<li>苏州<p style="color:#757575; font-size: 13px">968856条酒店点评</li>
							<li>京都<p style="color:#757575; font-size: 13px">4655856条酒店点评</li>
						</ul>

						<ul>
							<li>香港<p style="color:#757575; font-size: 13px">57856条酒店点评</li>
							<li>上海<p style="color:#757575; font-size: 13px">155856条酒店点评</li>
							<li>吉隆坡<p style="color:#757575; font-size: 13px">487858条酒店点评</li>
							<li>洛杉矶<p style="color:#757575; font-size: 13px">487446条酒店点评</li>
						</ul>

						<ul>
							<li>曼谷<p style="color:#757575; font-size: 13px">487856条酒店点评</li>
							<li>马六甲<p style="color:#757575; font-size: 13px">487856条酒店点评</li>
							<li>巴黎<p style="color:#757575; font-size: 13px">487856条酒店点评</li>
							<li>纽约<p style="color:#757575; font-size: 13px">487856条酒店点评</li>
						</ul>

						<ul>
							<li>北京<p style="color:#757575; font-size: 13px">5656条酒店点评</li>
							<li>新加坡<p style="color:#757575; font-size: 13px">487856条酒店点评</li>
							<li>清迈<p style="color:#757575; font-size: 13px">47856条酒店点评</li>
							<li>广州<p style="color:#757575; font-size: 13px">1256条酒店点评</li>
						</ul>

						<ul>
							<li>首尔<p style="color:#757575; font-size: 13px">188856条酒店点评</li>
							<li>台北<p style="color:#757575; font-size: 13px">842856条酒店点评</li>
							<li>伦敦<p style="color:#757575; font-size: 13px">24856条酒店点评</li>
							<li>长滩岛<p style="color:#757575; font-size: 13px">1856条酒店点评</li>
						</ul>
					</div>
					<div class="tab_box2">
						<ul>
							<li>东京<p style="color:#757575; font-size: 13px">2876条B&B和旅馆点评</p></li>
							<li>大阪<p style="color:#757575; font-size: 13px">6876条B&B和旅馆点评</li>
							<li>苏州<p style="color:#757575; font-size: 13px">486条B&B和旅馆点评</li>
							<li>京都<p style="color:#757575; font-size: 13px">466条B&B和旅馆点评</li>
						</ul>

						<ul>
							<li>香港<p style="color:#757575; font-size: 13px">44876条B&B和旅馆点评</li>
							<li>上海<p style="color:#757575; font-size: 13px">476条B&B和旅馆点评</li>
							<li>吉隆坡<p style="color:#757575; font-size: 13px">9676条B&B和旅馆点评</li>
							<li>洛杉矶<p style="color:#757575; font-size: 13px">4876条B&B和旅馆点评</li>
						</ul>

						<ul>
							<li>曼谷<p style="color:#757575; font-size: 13px">376条B&B和旅馆点评</li>
							<li>马六甲<p style="color:#757575; font-size: 13px">5276条B&B和旅馆点评</li>
							<li>巴黎<p style="color:#757575; font-size: 13px">9876条B&B和旅馆点评</li>
							<li>纽约<p style="color:#757575; font-size: 13px">4826条B&B和旅馆点评</li>
						</ul>

						<ul>
							<li>北京<p style="color:#757575; font-size: 13px">176条B&B和旅馆点评</li>
							<li>新加坡<p style="color:#757575; font-size: 13px">576条B&B和旅馆点评</li>
							<li>清迈<p style="color:#757575; font-size: 13px">6876条B&B和旅馆点评</li>
							<li>广州<p style="color:#757575; font-size: 13px">4876条B&B和旅馆点评</li>
						</ul>

						<ul>
							<li>首尔<p style="color:#757575; font-size: 13px">8876条B&B和旅馆点评</li>
							<li>台北<p style="color:#757575; font-size: 13px">47876条B&B和旅馆点评</li>
							<li>伦敦<p style="color:#757575; font-size: 13px">4896条B&B和旅馆点评</li>
							<li>长滩岛<p style="color:#757575; font-size: 13px">2876条B&B和旅馆点评</li>
						</ul>
					</div>
					<div class="tab_box3">
						<ul>
							<li>东京<p style="color:#757575; font-size: 13px">8575条度假屋点评</p></li>
							<li>大阪<p style="color:#757575; font-size: 13px">1745条度假屋点评</li>
							<li>吉隆坡<p style="color:#757575; font-size: 13px">2575条度假屋点评</li>
							<li>洛杉矶<p style="color:#757575; font-size: 13px">1575条度假屋点评</li>
						</ul>

						<ul>
							<li>香港<p style="color:#757575; font-size: 13px">575条度假屋点评</li>
							<li>上海<p style="color:#757575; font-size: 13px">5875条度假屋点评</li>
							<li>巴黎<p style="color:#757575; font-size: 13px">1575条度假屋点评</li>
							<li>纽约<p style="color:#757575; font-size: 13px">4775条度假屋点评</li>
						</ul>

						<ul>
							<li>曼谷<p style="color:#757575; font-size: 13px">575条度假屋点评</li>
							<li>马六甲<p style="color:#757575; font-size: 13px">1575条度假屋点评</li>
							<li>清迈<p style="color:#757575; font-size: 13px">855条度假屋点评</li>
							<li>广州<p style="color:#757575; font-size: 13px">9575条度假屋点评</li>
						</ul>

						<ul>
							<li>北京<p style="color:#757575; font-size: 13px">4175条度假屋点评</li>
							<li>台北<p style="color:#757575; font-size: 13px">635条度假屋点评</li>
							<li>伦敦<p style="color:#757575; font-size: 13px">4175条度假屋点评</li>
							<li>长滩岛<p style="color:#757575; font-size: 13px">6375条度假屋点评</li>
						</ul>

						<ul>
							<li>首尔<p style="color:#757575; font-size: 13px">8575条度假屋点评</li>
							<li>苏州<p style="color:#757575; font-size: 13px">32275条度假屋点评</li>
							<li>京都<p style="color:#757575; font-size: 13px">41375条度假屋点评</li>

						</ul>
					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="container_box8">
		<div class="container8">
			<p style="font-size: 24px;color: black;" ><b>热门目的地</b></p>
			<div class="tab8">
				<ul class="tab_menu8">
					<li class="change">区域</li>
					<li>城市</li>
					<li>周边地标/景点</li>
				</ul>
				<div style="width: 1111px;height: 1px;background-color:#73aac7;"></div>
				<div class="tab_box8">
					<div>
						<ul>
							<li>北海道<p style="color:#757575; font-size: 13px">8574137家住宿</p></li>
							<li>尼亚加拉瀑布<p style="color:#757575; font-size: 13px">14137家住宿</li>
							<li>普吉府<p style="color:#757575; font-size: 13px">2574137家住宿</li>
							<li>民丹岛<p style="color:#757575; font-size: 13px">154137家住宿</li>
						</ul>

						<ul>
							<li>济州岛<p style="color:#757575; font-size: 13px">5754137家住宿</li>
							<li>圣托里尼<p style="color:#757575; font-size: 13px">5874137家住宿</li>
							<li>巴淡岛<p style="color:#757575; font-size: 13px">1574137家住宿</li>
							<li>金马仑高原<p style="color:#757575; font-size: 13px">474127家住宿</li>
						</ul>

						<ul>
							<li>槟城州<p style="color:#757575; font-size: 13px">5741397家住宿</li>
							<li>马六甲<p style="color:#757575; font-size: 13px">154137家住宿</li>
							<li>北京地区<p style="color:#757575; font-size: 13px">854177家住宿</li>
							<li>巴厘岛<p style="color:#757575; font-size: 13px">954137家住宿</li>
						</ul>

						<ul>
							<li>曼谷<p style="color:#757575; font-size: 13px">414137家住宿</li>
							<li>夏威夷<p style="color:#757575; font-size: 13px">4139家住宿</li>
							<li>伊维萨<p style="color:#757575; font-size: 13px">4137家住宿</li>
							<li>兰卡威<p style="color:#757575; font-size: 13px">4137家住宿</li>
						</ul>

						<ul>
							<li>登嘉楼州<p style="color:#757575; font-size: 13px">4147家住宿</li>
							<li>卡普里岛<p style="color:#757575; font-size: 13px">41395家住宿</li>
							<li>柔佛州<p style="color:#757575; font-size: 13px">4137家住宿</li>

						</ul>
					</div>
					<div>
						<ul>
							<li>曼谷<p style="color:#757575; font-size: 13px">15741家住宿</p></li>
							<li>伦敦<p style="color:#757575; font-size: 13px">5413家住宿</li>
							<li>波德申<p style="color:#757575; font-size: 13px">4137家住宿</li>
							<li>迪沙鲁<p style="color:#757575; font-size: 13px">1363家住宿</li>
						</ul>

						<ul>
							<li>台艾<p style="color:#757575; font-size: 13px">4139家住宿</li>
							<li>新山<p style="color:#757575; font-size: 13px">74137家住宿</li>
							<li>乔治市<p style="color:#757575; font-size: 13px">15747家住宿</li>
							<li>三亚<p style="color:#757575; font-size: 13px">1257家住宿</li>
						</ul>

						<ul>
							<li>台北<p style="color:#757575; font-size: 13px">1352家住宿</li>
							<li>麻坡<p style="color:#757575; font-size: 13px">41447家住宿</li>
							<li>吉隆坡<p style="color:#757575; font-size: 13px">4175家住宿</li>
							<li>西安<p style="color:#757575; font-size: 13px">5418家住宿</li>
						</ul>

						<ul>
							<li>台中市<p style="color:#757575; font-size: 13px">4124家住宿</li>
							<li>怡保<p style="color:#757575; font-size: 13px">4239家住宿</li>
							<li>关丹<p style="color:#757575; font-size: 13px">895137家住宿</li>
							<li>厦门<p style="color:#757575; font-size: 13px">5247家住宿</li>
						</ul>

						<ul>
							<li>高雄<p style="color:#757575; font-size: 13px">8147家住宿</li>
							<li>马六甲<p style="color:#757575; font-size: 13px">7895家住宿</li>
							<li>广州<p style="color:#757575; font-size: 13px">567家住宿</li>

						</ul>
					</div>
					<div>
						<ul>
							<li>KLIA机场<p style="color:#757575; font-size: 13px">9215741家住宿</p></li>
							<li>火车站<p style="color:#757575; font-size: 13px">1413家住宿</li>
							<li>双威水上乐园<p style="color:#757575; font-size: 13px">4137家住宿</li>
							<li>云顶高原<p style="color:#757575; font-size: 13px">137家住宿</li>
						</ul>

						<ul>
							<li>加州乐高乐园<p style="color:#757575; font-size: 13px">4137家住宿</li>
							<li>上海迪士尼乐园<p style="color:#757575; font-size: 13px">74137家住宿</li>
							<li>机场街<p style="color:#757575; font-size: 13px">15747家住宿</li>
							<li>马六甲中央<p style="color:#757575; font-size: 13px">127家住宿</li>
						</ul>

						<ul>
							<li>逢甲夜市<p style="color:#757575; font-size: 13px">1352家住宿</li>
							<li>圣淘沙<p style="color:#757575; font-size: 13px">1541447家住宿</li>
							<li>合您广场<p style="color:#757575; font-size: 13px">854175家住宿</li>
							<li>巴黎迪士尼乐园<p style="color:#757575; font-size: 13px">95418家住宿</li>
						</ul>

						<ul>
							<li>第一世界广场<p style="color:#757575; font-size: 13px">414124家住宿</li>
							<li>迪士尼乐园<p style="color:#757575; font-size: 13px">2239家住宿</li>
							<li>奥兰多迪士尼乐园<p style="color:#757575; font-size: 13px">85137家住宿</li>
							<li>优美胜地国家公园<p style="color:#757575; font-size: 13px">2437家住宿</li>
						</ul>

						<ul>
							<li>加州云霄乐园<p style="color:#757575; font-size: 13px">8147家住宿</li>
							<li>尼亚加拉大瀑布<p style="color:#757575; font-size: 13px">4595家住宿</li>
							<li>马来西亚乐高公园<p style="color:#757575; font-size: 13px">4537家住宿</li>

						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container_box9">
		<div class="container9">
			<div class="container9_1">
				<p style="font-size: 17px;margin: 6px"><b>探索目的地</b></p>
				<ul class="tab_menu9">
					<li class="change">1</li>
					<li>2</li>
					<li>3</li>
					<li>4</li>
					<li>5</li>
					<li>6</li>
				</ul>
			</div>
			<div class="tab_box9">
				<div>
					<ul>
						<li><img src="resources/res/images/index_foot/destinat/01.jpg"><p>美国</p></li>
						<li><img src="resources/res/images/index_foot/destinat/02.jpg"><p>意大利</p></li>
						<li><img src="resources/res/images/index_foot/destinat/03.jpg"><p>法国</p></li>
						<li><img src="resources/res/images/index_foot/destinat/04.jpg"><p>西班牙</p></li>
						<li><img src="resources/res/images/index_foot/destinat/05.jpg"><p>俄罗斯</p></li>
					</ul>
				</div>
				<div>
					<ul>
						<li><img src="resources/res/images/index_foot/destinat/06.jpg"><p>英国</p></li>
						<li><img src="resources/res/images/index_foot/destinat/07.jpg"><p>克罗地亚</p></li>
						<li><img src="resources/res/images/index_foot/destinat/08.jpg"><p>德国</p></li>
						<li><img src="resources/res/images/index_foot/destinat/09.jpg"><p>中国</p></li>
						<li><img src="resources/res/images/index_foot/destinat/10.jpg"><p>巴西</p></li>
					</ul>
				</div>
				<div>
					<ul>
						<li><img src="resources/res/images/index_foot/destinat/11.jpg"><p>印度</p></li>
						<li><img src="resources/res/images/index_foot/destinat/12.jpg"><p>希腊</p></li>
						<li><img src="resources/res/images/index_foot/destinat/13.jpg"><p>波兰</p></li>
						<li><img src="resources/res/images/index_foot/destinat/14.jpg"><p>南非</p></li>
						<li><img src="resources/res/images/index_foot/destinat/15.jpg"><p>奥地利</p></li>
					</ul>
				</div>
				<div>
					<ul>
						<li><img src="resources/res/images/index_foot/destinat/16.jpg"><p>葡萄牙</p></li>
						<li><img src="resources/res/images/index_foot/destinat/17.jpg"><p>澳大利亚</p></li>
						<li><img src="resources/res/images/index_foot/destinat/18.jpg"><p>日本</p></li>
						<li><img src="resources/res/images/index_foot/destinat/19.jpg"><p>泰国</p></li>
						<li><img src="resources/res/images/index_foot/destinat/20.jpg"><p>丹麦</p></li>
					</ul>
				</div>
				<div>
					<ul>
						<li><img src="resources/res/images/index_foot/destinat/21.jpg"><p>加拿大</p></li>
						<li><img src="resources/res/images/index_foot/destinat/22.jpg"><p>墨西哥</p></li>
						<li><img src="resources/res/images/index_foot/destinat/23.jpg"><p>印尼</p></li>
						<li><img src="resources/res/images/index_foot/destinat/24.jpg"><p>荷兰</p></li>
						<li><img src="resources/res/images/index_foot/destinat/25.jpg"><p>阿根廷</p></li>
					</ul>

				</div>
				<div>
					<ul>
						<li><img src="resources/res/images/index_foot/destinat/26.jpg"><p>智利</p></li>
						<li><img src="resources/res/images/index_foot/destinat/27.jpg"><p>格鲁吉亚</p></li>
						<li><img src="resources/res/images/index_foot/destinat/28.jpg"><p>罗马尼亚</p></li>
						<li><img src="resources/res/images/index_foot/destinat/29.jpg"><p>匈牙利</p></li>
						<li><img src="resources/res/images/index_foot/destinat/30.jpg"><p>土耳其</p></li>
					</ul>
				</div>
			</div>
		</div>
	</div>


	<!--****底部模块 by luozhiyuan***-->
	<div class="clear"></div>
	<div class="buttom">
		<div class="buttom_top1_bg">
			<div class="buttom_top1">
				<div class="temp"></div>
				<div class="buttom_top1_content">

					<div class="buttom_top1_content_left">
						<img src="resources/res/images/searchResult/phone.png">
						<h3>24小时客服助您安心出行</h3>
						<p class="p1">订单有问题？我们来帮您！</p>
						<div class="chinese">
							<p class="p2">中文客服热线</p>
							<p class="p3">常见问题</p>
						</div>
						<div class="clear"></div>
						<div class="hits">
							<a class="a1">点击了解更多客户帮忙</a>
							<p class="p4">去<a class="a2">帮助中心</a>看看</p>
						</div>
					</div>
					<div class="buttom_top1_content_right">
						<h2 class="bar1">方便又省钱！</h2>
						<div class="bar2">立即注册，即可获取优惠好价！</div>
						<div class="emailandbtn">
							<input type="email" class="to" placeholder="您的邮箱地址">
							<button class="subscription">订阅！</button>
						</div>
						<label class="label1">
							<input type="checkbox" class="get_address">
							<p class="label_p">请同时给我发送MZHotel免费App下载链接</p>
						</label>
					</div>
				</div>

			</div>
		</div>

		<div class="buttom_top2_bg">
			<div class="buttom_top2">
				<div class="buttom_top2_relbar"></div>
				<div class="online">上线我的住宿</div>
				<hr class="hrline" />
				<ul class="ul_mol">
					<li><a>平板电脑视图</a></li>
					<li><a>手机版视图</a></li>
					<li><a>您的账户</a></li>
					<li><a>在线修改订单</a></li>
					<li><a>联系客服</a></li>
					<li><a>成为分销合作伙伴</a></li>
					<li><a>MZHotel商旅服务</a></li>
					<li><a>关注MZHotel官方微信</a><img src="resources/res/images/searchResult/wechat.png" class="wechat_logo"></li>
				</ul>
			</div>
		</div>
		<div class="buttom_top3">
			<ul>
				<li><a class="li_a_text">国家/地区</a></li>
				<li><a class="li_a_text">区域</a></li>
				<li><a class="li_a_text">城市</a></li>
				<li><a class="li_a_text">区</a></li>
				<li><a class="li_a_text">机场</a></li>
				<li><a class="li_a_text">酒店</a></li>
				<li><a class="li_a_text">周边地标/景点</a></li>

			</ul>

			<ul>
				<li><a class="li_a_text">度假屋</a></li>
				<li><a class="li_a_text">公寓</a></li>
				<li><a class="li_a_text">度假村</a></li>
				<li><a class="li_a_text">别墅</a></li>
				<li><a class="li_a_text">青旅</a></li>
				<li><a class="li_a_text">住宿加早餐旅馆</a></li>
				<li><a class="li_a_text">旅馆</a></li>

			</ul>

			<ul>
				<li><a class="li_a_text">全球独特住宿</a></li>
				<li><a class="li_a_text">客人点评</a></li>
				<li><a class="li_a_text">游记攻略</a></li>

			</ul>

			<ul>
				<li><a class="li_a_text">租车服务</a></li>
				<li><a class="li_a_text">订机票</a></li>
				<li><a class="li_a_text">订餐订位</a></li>
				<li><a class="li_a_text">MZHotel旅游代理机构中心</a></li>

			</ul>
			<ul>
				<li><a class="li_a_text">关于MZHotel</a></li>
				<li><a class="li_a_text">提供网站</a></li>
				<li><a class="li_a_text">客服帮助</a></li>
				<li><a class="li_a_text">酒店自助平台</a></li>
				<li><a class="li_a_text">Careers</a></li>
				<li><a class="li_a_text">新闻中心</a></li>
				<li><a class="li_a_text">投资者关系</a></li>
				<li><a class="li_a_text">相关条款</a></li>
				<li><a class="li_a_text">隐私和Cookie声明</a></li>
				<li><a class="li_a_text">其他问题查询</a></li>
				<li><a class="li_a_text">价格更放心</a></li>


			</ul>
		</div>

		<div class="buttom_top4">
			<p>MZHotel公司以荷兰阿姆斯特丹为总部，并由全球 <a class="li_a_text">70个国家及地区</a> 的 <a class="li_a_text">198个办公室</a> 提供支持。</p>
		</div>

<!-- 		<div class="buttom_top5"> -->
<!-- 			<p class="login_background">登录后台</p> -->
<!-- 		</div> -->

		<div class="buttom_top6">版权 ? 2018–2019 MZHotel?. 版权所有.</div>

		<p class="buttom_top7">MZHotel隶属于Nier Holdings Inc.，该集团是全球领先的在线旅行及周边服务供应商。</p>


		<ul class="buttom_top8">
			<li><img src="resources/res/images/searchResult/bookingcom.png"></li>
			<li><img src="resources/res/images/searchResult/priceline.png"></li>
			<li><img src="resources/res/images/searchResult/kayak.png"></li>
			<li><img src="resources/res/images/searchResult/agodacom.png"></li>
			<li><img src="resources/res/images/searchResult/rentilcors.png"></li>
			<li><img src="resources/res/images/searchResult/opentable.png"></li>



		</ul>

		<div class="most_buttom"></div>
	</div>
	<!--**********-->

	<!--  登录模块代码-->
	<div id="LARid" class="LAR-Background">
		<div class="LAR-Container">
			<ul class="LAR-ul">
				<a href="javascript:void(0)">
					<li id="loginLi" class="LAR-li">登录</li>
					<li id="registerLi" class="LAR-li">注册</li>
				</a>
			</ul>
			<div id="closebtn" class="closeButton"><a href="#" title="关闭"><img src="resources/res/images/close.png" class="closeImg"></a></div>
			<div id="LAR-login">
				<div class="LAR-contant">
					<form name="loginForm" action="LoginServlet?url=/index.jsp" method="POST" class="LAR_form">
						<span class="login_span">电子邮箱/手机号<i id="eoplogin" class="input_tip"></i></span>
						<input id="eopInput" class="emailInput" type="text" name="emailOrphone"><br>
						<span class="login_span">MZHotelBooking密码</span>
						<input class="pwdInput" type="password" name="pwd"><br>
						<a href="#" class="lar_a">想不起密码？</a><br>
						<input type="submit" class="sub-btn" value="登录"><br>
					</form>
					<span class="span-line">
						&nbsp;———————————&nbsp;&nbsp;或一键登录&nbsp;&nbsp;————————————
					</span>
					<a href="javascript:void(0)" class="weicharLogin"><img src="resources/res/images/iphone.png" class="login_login">短信登录</a>
				</div>
				<hr>
				<span class="span-tip">输入<a href="" class="font_a">订单确认号和PIN码</a>即可管理订单</span>
				<span class="span-tip2">登录帐户即代表您同意本公司的<a href="#" class="font_a">相关条款</a>以及<a href="#" class="font_a">隐私声明</a></span>
			</div>

			<div id="LAR-register">
				<div class="LAR-contant">
					<form name="registerForm" action="" method="post" onsubmit="" class="LAR_form">
						<span class="login_span">电子邮箱/手机号<i id="eop" class="input_tip"></i></span>
						<input id="eopReg" class="emailInput2" type="text" name="emailOrphone"><br>
						<span class="login_span">创建密码</span>
						<input class="pwdInput2" type="password" name="pwd" ><br>
						<span class="login_span verify_code">请输入验证码<i id="verifyCode" class="input_tip"></i></span>
						<input type="text" name="verifyName1" size="4" style="height:35px;" class="register_inp">
						<img src="GetImage" alt="图片没显示" id="verifyImage" style="width:70px;height:35px;"> <br>
						<a href="#" onclick="refershVerify()" class="register_a">换一张</a>
						
						
						<script type="text/javascript">
						//刷新验证码
						function refershVerify(){
							var imgEle = document.getElementById("verifyImage");
							imgEle.src="GetImage?a="+new Date().getTime();
						}
						</script>
						<br>
						<br>
						<input type="button" name="reginsterBtn" class="subRegister" value="注册账号"><br>
					</form>
					<span class="span-line">
						——————————————&nbsp;&nbsp;或&nbsp;&nbsp;——————————————
					</span>
					<a href="javascript:void(0)" class="weicharLogin"><img src="resources/res/images/iphone.png" class="login_login">短信登录</a>
				</div> 
				<hr>
				<span class="span-tip">
						还没试过<a href="#" class="font_a">MZHotel商旅服务？</a><br>
						输入<a href="#" class="font_a">订单确认号和PIN码</a>即可管理订单
				</span>
				<span class="span-tip2">登录帐户即代表您同意本公司的<a href="#" class="font_a">相关条款</a>以及<a href="#" class="font_a">隐私声明</a></span>
				<br>
				<hr>
				<span class="span-tip">
						在MZHotel出租你的住宿 <a href="#" class="font_a">上线我的住宿</a>
				</span>
			</div>
		</div>
	</div>
</div>

<div id="LARidphone" class="LAR-Backgroundphone">
    <div class="LAR-Containerphone">
        <ul class="LAR-ulphone">
            <a href="javascript:void(0)">
                <li id="loginLiphone" class="LAR-liphone">手机</li>
                <li id="registerLiphone" class="LAR-liphone">登录</li>
            </a>
            <svg class="icon-cha2" aria-hidden="true">
                <use xlink:href="#icon-cha2"></use>
            </svg>
        </ul>

        <div id="closebtnphone" class="closeButtonphone"></div>
        <div id="LAR-loginphone">
            <div class="LAR-contantphone">
                <form name="loginForm" action="LoginServlet?url=/index.jsp" method="POST" class="LAR_formphone">
                    <span class="login_spanphone">手机号码</span>
                    <input id="emailInputphone" type="text" name="phoneNum">
                    <button type="button" class="acquireMaphone">获取验证码</button><br>
                    <span class="login_spanphone">输入验证码</span>
                    <input id="pwdInputphone" type="text" name="pwd"><br><br>

                    <input type="submit" class="sub-btnphone " value="登录" disabled><br>
                </form>
					<span class="span-linephone">
					&nbsp;———————————&nbsp;&nbsp;或账号登录&nbsp;&nbsp;———————————
					</span>
                <a href="javascript:void(0)" class="weicharLoginphone">账号密码登录</a>
            </div>
            <hr>
            <span class="span-tipphone">输入<a href="#" class="font_a">订单确认号和PIN码</a>即可管理订单</span>
            <span class="span-tip2phone">登录帐户即代表您同意本公司的<a href="#" class="font_aphone">相关条款</a>以及<a href="#" class="font_aphone">隐私声明</a></span>
        </div>
    </div>
</div>
</body>
</html>