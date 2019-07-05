<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="com.nier.Booking.entity.User" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="../resources/js/JQuery/JQuery3.3.1.js"></script>
    <script src="//at.alicdn.com/t/font_788386_e8anycfk24u.js" ></script>
	<!-- 	弹窗框架           -->
	<link href="../resources/css/sweetalert/sweetalert.css" rel="stylesheet">
	<script src="../resources/js/sweetalert/sweetalert.min.js"></script>
    <link rel="stylesheet" href="../resources/css/NavBar.css">
    <link rel="stylesheet" href="../resources/css/searchCard.css">
    <link href="../resources/res/icon/index_icon/iconfont.css" rel="stylesheet">
    <link href="../resources/css/index_container.css" rel="stylesheet">
    <link href="../resources/css/PersonalCenter.css" rel="stylesheet">
    <link href="../resources/res/icon/PersonalCenter/iconfont.css" rel="stylesheet">
	<link rel="SHORTCUT ICON" href="../resources/res/images/Mlogo.icon"/>

    <title>个人中心</title>

</head>
<body>
<!--最高头部-->
<div id="registertip" class="index_tip"></div>
<div id="none_img_id" >
    <img src="../resources/res/images/wechat_img.png" id="none_img_id2" >
</div>
<div class="top">

    <div class="head">
        <a href="../index.jsp"><img id="Booking_logo" class="logo" src="../resources/res/images/logo.png"><a>
        <div class="user-bar">
            <ul class="user-ul">
                <li class="user-li_1" >
                    <a id="mon_tex" href="#"  class="user-tex" data-title="选择您使用的货币">元</a>
                    <div class="mon_box" id="mon_id_box">
                        <div class="mon_trigon"></div>
                        <h3>常用货币</h3>
                        <ul class="mon_ul">
                            <li class="mon_li_other"><span>元</span><small>人民币</small></li>
                            <li class="mon_li"><span>€£$</span><small>住宿地使用的货币</small></li>
                            <li class="mon_li"><span>US$</span><small>美元</small></li>
                            <li class="mon_li"><span>€</span><small>欧元</small></li>
                            <li class="mon_li"><span>TWD</span><small>新台币</small></li>
                            <li class="mon_li"><span>HK$</span><small>港币</small></li>
                            <li class="mon_li"><span>£</span><small>英镑</small></li>
                        </ul>

                        <h3>所有货币</h3>
                        <ul class="mon_ul_2">
                            <li class="mon_li"><span>UAH</span><small>乌克兰赫夫米</small></li>
                            <li class="mon_li_other"><span>元</span><small>人民币</small></li>
                            <li class="mon_li"><span>₪</span><small>以色列新谢克尔</small></li>
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
                            <li class="mon_li"><span>Kč</span><small>捷克克朗</small></li>


                            <li class="mon_li"><span>MDL</span><small>摩尔多瓦列伊</small></li>
                            <li class="mon_li"><span>FJD</span><small>斐济元</small></li>
                            <li class="mon_li"><span>S$</span><small>新元</small></li>
                            <li class="mon_li"><span>TWD</span><small>新台币</small></li>
                            <li class="mon_li"><span>TL</span><small>新土耳其里拉</small></li>
                            <li class="mon_li"><span>NZD</span><small>新西兰元</small></li>
                            <li class="mon_li"><span>¥</span><small>智利比索</small></li>
                            <li class="mon_li"><span>CL$</span><small>墨西哥比索</small></li>
                            <li class="mon_li"><span>GEL</span><small>格鲁吉亚拉里</small></li>
                            <li class="mon_li"><span>€</span><small>欧元</small></li>
                            <li class="mon_li"><span>SAR</span><small>沙特阿拉伯里亚尔</small></li>
                            <li class="mon_li"><span>zł</span><small>波兰兹罗提</small></li>

                            <li class="mon_li"><span>THB</span><small>泰铢</small></li>
                            <li class="mon_li"><span>HK$</span><small>港币</small></li>
                            <li class="mon_li"><span>AUD</span><small>澳元</small></li>
                            <li class="mon_li"><span>SEK</span><small>瑞典克朗</small></li>
                            <li class="mon_li"><span>CHF</span><small>科威特第纳尔</small></li>
                            <li class="mon_li"><span>JOD</span><small>约旦第纳尔</small></li>
                            <li class="mon_li"><span>NAD</span><small>纳米比亚元</small></li>
                            <li class="mon_li"><span>lei</span><small>罗马尼亚新列伊</small></li>
                            <li class="mon_li"><span>US$</span><small>美元</small></li>
                            <li class="mon_li"><span>£</span><small>英镑</small></li>
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
                    <a href="javascript:void(0)" onclick="" class="user-btn-2">上线我的住宿</a>
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
						<img src="../resources/res/images/personIfm/person.png" style="width: 37px;height: 37px" class="personImg_class">
<%
		} else {
%>
						<img src="../${sessionScope.loginUser.userPicture }" style="width: 37px;height: 37px" class="personImg_class">
<%
		}
%>
                        <p class="user_name">${sessionScope.loginUser.userNickName }</p></a>
                    <div class="showIfm_none">
                        <div class="showIfm_none_tri"></div>
                        <ul class="showIfm_none_ul">
                            <li><a href="PersonalCenter.jsp">我的个人中心</a></li>
                            <li><a href="#">我的订单</a></li>
                            <li><a href="#">报表</a></li>
                            <li><a href="#">评语</a></li>
                            <li><a href="#">我的收藏</a></li>
                            <li><a href="#">下载app</a></li>
                            <li><a href="#">客服帮助</a></li>
                            <li><a href="#">设置</a></li>
                            <li class="user_quit"><a href="../UserExitServlet" >退出</a></li>
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

<!--头部选项卡菜单~~~~~~~~~~-->
<div class="NavBar">
    <div class="BarContent">
        <ul class="BarUl">
            <a href="#" onclick="openModel(event, 'personalCenter')">
                <li class="BarLi">我的个人中心</li>
            </a>
            <a href="#" id="myOrders" onclick="openModel(event, 'myOrder')">
                <li class="BarLi">我的订单</li>
            </a>
            <a href="#">
                <li class="BarLi">评语</li>
            </a>
            <a href="#" onclick="openModel(event, 'install')">
                <li class="BarLi">设置</li>
            </a>
            <a href="#">
                <li class="BarLi">上线我的住宿</li>
            </a>
        </ul>
    </div>
</div>

<!--单个选项卡内容：个人中心-->
<div class="Model" id="personalCenter">
    <div class="PC-model">
        <div class="PC-left">
        <div class="modifyPD">
            <div class="modifyPD-head">
                <div class="modifyPD-head-img">
<%
	if(loginUser.getUserPicture() == null) {
%>
					<img src="../resources/res/images/PersonCenter/cricleHead.png">
<%
	} else {
%>
					<img src="../${sessionScope.loginUser.userPicture }">
<%
	}
%>
                </div>
                <div class="modifyPD-head-btn">
                    <a href="#" onclick="openModel(event, 'install')">修改个人资料</a>
                </div>
            </div>
            <div class="modifyPD-body">
                <div class="modifyPD-body-proBar">
<%
	int finish = 5;
	if(loginUser.getUserSurnme()!=null || loginUser.getUserName()!=null){
		finish += 5;
	}
	if(loginUser.getUserEmail()!=null){
		finish += 5;
	}
	if(loginUser.getUserPhoneNumber()!=null){
		finish += 5;
	}
	if(loginUser.getUserCountry()!=null){
		finish += 5;
	}
	if(loginUser.getUserPicture()!=null){
		finish += 10;
	}
	if(loginUser.getUserNickName()!=null){
		finish += 5;
	}
	if(loginUser.getUserBirthday()!=null){
		finish += 5;
	}
	if(loginUser.getUserSex()!=null){
		finish += 5;
	}
%>
                    <p>已完成<%=finish %>%</p>
                    <div class="porBar">
                        <div class="finish" style="width:<%=finish %>%"></div>
                    </div>
                </div>
<% 
	if(loginUser.getUserSurnme()==null || loginUser.getUserName()==null){
%>
				<div class="modifyPD-body-con">
                    <a href="#PI"  onclick="openModel(event, 'install')" class="iconfont icon-icontj"> 填写名字</a>
                    <p>告诉我们该如何称呼你</p>
                </div>
<%
	}
	if(loginUser.getUserCountry()==null){
%>
				<div class="modifyPD-body-con">
                    <a href="#PI"  onclick="openModel(event, 'install')" class="iconfont icon-icontj"> 填写国家</a>
                    <p>告诉我们你来自哪里</p>
                </div>
<%
	}
	if(loginUser.getUserPicture()==null){
%>
				<div class="modifyPD-body-con">
                    <a href="#PI"  onclick="openModel(event, 'install')" class="iconfont icon-icontj"> 上传头像照</a>
                    <p>选好头像照秀出你的高颜值。 </p>
                </div>
<%
	}
	if(loginUser.getUserNickName()==null){
%>
				<div class="modifyPD-body-con">
                    <a href="#PI"  onclick="openModel(event, 'install')" class="iconfont icon-icontj"> 填写昵称</a>
                    <p>你可以随时修改显示在点评中的昵称。</p>
                </div>
<%
	}
%>
       		</div>
        </div>

        <div class="leftcontainer">
	        <div class="three">
	            <div class="header">特价搜不停</div>
	            <span class="span1">目的地/住宿名称:</span>
	            <input type="text" class="text1"  placeholder="广州">
	            <span class="span2">入住日期:</span>
	
	            <div class="indate">
	                <svg class="icon icon-rili" aria-hidden="true">
	                    <use xlink:href="#icon-rili"></use>
	                </svg>
	                <input class="datein" type="text"  placeholder="入住日期">
	                <svg class="icon icon-iconfonticonfonti2" aria-hidden="true">
	                    <use xlink:href="#icon-iconfonticonfonti2"></use>
	                </svg>
	            </div>
	            <!--选入住的日期-->
	            <div class="calenderin">
	                <div class="header">入住日期
	                    <svg class="icon icon-cha2" aria-hidden="true">
	                        <use xlink:href="#icon-cha2"></use>
	                    </svg>
	                </div>
	                <div class="cut"></div>
	                <div class="bodyleft">
	                    <h3></h3>
	                    <div class="pre"><</div>
	                    <ul>
	                        <li>周日</li><li>周一</li><li>周二</li><li>周三</li><li>周四</li><li>周五</li><li>周六</li>
	                        <li></li><li></li><li></li><li></li><li></li><li></li><li></li>
	                        <li></li><li></li><li></li><li></li><li></li><li></li><li></li>
	                        <li></li><li></li><li></li><li></li><li></li><li></li><li></li>
	                        <li></li><li></li><li></li><li></li><li></li><li></li><li></li>
	                        <li></li><li></li><li></li><li></li><li></li><li></li><li></li>
	                        <li></li><li></li><li></li><li></li><li></li><li></li><li></li>
	                    </ul>
	                </div>
	                <div class="bodyright">
	                    <h3></h3>
	                    <div class="next">></div>
	                    <ul>
	                        <li>周日</li><li>周一</li><li>周二</li><li>周三</li><li>周四</li><li>周五</li><li>周六</li>
	                        <li></li><li></li><li></li><li></li><li></li><li></li><li></li>
	                        <li></li><li></li><li></li><li></li><li></li><li></li><li></li>
	                        <li></li><li></li><li></li><li></li><li></li><li></li><li></li>
	                        <li></li><li></li><li></li><li></li><li></li><li></li><li></li>
	                        <li></li><li></li><li></li><li></li><li></li><li></li><li></li>
	                        <li></li><li></li><li></li><li></li><li></li><li></li><li></li>
	                    </ul>
	                </div>
	            </div>
	
	            <span class="span3">退房日期:</span>
	            <div class="outdate">
	                <svg class="icon icon-rili" aria-hidden="true">
	                    <use xlink:href="#icon-rili"></use>
	                </svg>
	                <input class="dateout" type="text"  placeholder="退房日期">
	                <svg class="icon icon-iconfonticonfonti2" aria-hidden="true">
	                    <use xlink:href="#icon-iconfonticonfonti2"></use>
	                </svg>
	            </div>
	
	            <div class="calenderout">
	                <div class="header">退房日期
	                    <svg class="icon icon-cha2" aria-hidden="true">
	                        <use xlink:href="#icon-cha2"></use>
	                    </svg>
	                </div>
	                <div class="cut"></div>
	                <div class="bodyleft">
	                    <h3></h3>
	                    <div class="pre"><</div>
	                    <ul>
	                        <li>周日</li><li>周一</li><li>周二</li><li>周三</li><li>周四</li><li>周五</li><li>周六</li>
	                        <li></li><li></li><li></li><li></li><li></li><li></li><li></li>
	                        <li></li><li></li><li></li><li></li><li></li><li></li><li></li>
	                        <li></li><li></li><li></li><li></li><li></li><li></li><li></li>
	                        <li></li><li></li><li></li><li></li><li></li><li></li><li></li>
	                        <li></li><li></li><li></li><li></li><li></li><li></li><li></li>
	                        <li></li><li></li><li></li><li></li><li></li><li></li><li></li>
	                    </ul>
	                </div>
	                <div class="bodyright">
	                    <h3></h3>
	                    <div class="next">></div>
	                    <ul>
	                        <li>周日</li><li>周一</li><li>周二</li><li>周三</li><li>周四</li><li>周五</li><li>周六</li>
	                        <li></li><li></li><li></li><li></li><li></li><li></li><li></li>
	                        <li></li><li></li><li></li><li></li><li></li><li></li><li></li>
	                        <li></li><li></li><li></li><li></li><li></li><li></li><li></li>
	                        <li></li><li></li><li></li><li></li><li></li><li></li><li></li>
	                        <li></li><li></li><li></li><li></li><li></li><li></li><li></li>
	                        <li></li><li></li><li></li><li></li><li></li><li></li><li></li>
	                    </ul>
	                </div>
	            </div>
	
	            <div class="adultnum">
	                <span>2位成人</span>
	                <svg class="icon icon-iconfonticonfonti2" aria-hidden="true">
	                    <use xlink:href="#icon-iconfonticonfonti2"></use>
	                </svg>
	            </div>
	
	            <div class="adultnumchoose">
	                <li></li><li></li><li></li><li></li><li></li><li></li>
	                <li></li><li></li><li></li><li></li><li></li><li></li>
	                <li></li><li></li><li></li><li></li><li></li><li></li>
	                <li></li><li></li><li></li><li></li><li></li><li></li>
	                <li></li><li></li><li></li><li></li><li></li><li></li>
	            </div>
	
	            <div class="childnum">
	                <span>两位儿童</span>
	                <svg class="icon icon-iconfonticonfonti2" aria-hidden="true">
	                    <use xlink:href="#icon-iconfonticonfonti2"></use>
	                </svg>
	            </div>
	            <div class="childnumchoose">
	                <li></li><li></li><li></li><li></li><li></li><li></li>
	                <li></li><li></li><li></li><li></li><li></li><li></li>
	                <li></li><li></li><li></li><li></li><li></li><li></li>
	                <li></li><li></li><li></li><li></li><li></li><li></li>
	                <li></li><li></li><li></li><li></li><li></li><li></li>
	            </div>
	
	            <div class="roomnum">
	                <span>两间房</span>
	                <svg class="icon icon-iconfonticonfonti2" aria-hidden="true">
	                    <use xlink:href="#icon-iconfonticonfonti2"></use>
	                </svg>
	            </div>
	
	            <div class="roomnumchoose">
	                <li></li><li></li><li></li><li></li><li></li><li></li>
	                <li></li><li></li><li></li><li></li><li></li><li></li>
	                <li></li><li></li><li></li><li></li><li></li><li></li>
	                <li></li><li></li><li></li><li></li><li></li><li></li>
	                <li></li><li></li><li></li><li></li><li></li><li></li>
	            </div>
	
	            <input type="checkbox" class="checkbox1"/>
	            <span class="span4">我是出差</span>
	            <svg class="icon icon-wenhao-fill" aria-hidden="true">
	                <use xlink:href="#icon-wenhao-fill"></use>
	            </svg>
	            <button>搜特价</button>
	        </div>
	    </div>
    </div>
        <div class="PC-right">
        <div class="PCInfo">
            <div class="info-head">
                <p>欢迎来到Booing.com!</p>
            </div>
            <div class="info-body">
                <div class="first-info-con">
                    <a href="../index.jsp" name="search" class="first-info-con-a">
                        <div class="first-info-con-icon">
                            <img src="../resources/res/images/PersonCenter/sousuo.png">
                        </div>
                        <p class="first-info-con-p1">网罗全球特价</p>
                        <p class="first-info-con-p2">登录后即可解锁专属优惠</p>
                    </a>
                    <a href="#" onclick="openModel(event, 'install')" name="addPI" class="first-info-con-a">
                        <div class="first-info-con-icon">
                            <img src="../resources/res/images/PersonCenter/head.png">
                        </div>
                        <p class="first-info-con-p1">添加个人信息</p>
                        <p class="first-info-con-p2">添加个人信息，助你快读预订，还可以根据你的设置为你特别推荐哦！</p>
                    </a>
                    <a href="#" name="download" class="first-info-con-a">
                        <div class="first-info-con-icon">
                            <img src="../resources/res/images/PersonCenter/app.png">
                        </div>
                        <p class="first-info-con-p1">下载移动app</p>
                        <p class="first-info-con-p2">电子确认信在手，查看订单更便捷！</p>
                    </a>
                </div>
            </div>
        </div>
        <div class="PCInfo">
            <div class="info-head">
                <p>即刻下载iPhone、iPad或安卓app</p>
            </div>
            <div class="info-body">
                <div class="second-info-con">
                    <p>电子确认信、每日优惠和更多便利功能一手把握！</p>
                    <div class="PhoneAndEmail">
                        <div class="second-Model">
                            <input type="text" placeholder="您的手机号码">
                            <a href="javascript:void(0)">发送短信</a>
                        </div>
                        <p>或</p>
                        <div class="second-Model">
                            <input type="text" placeholder="您的电子邮箱地址">
                            <a href="javascript:void(0)">发送电子邮件</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</div>

<!--单个选项卡内容：我的订单-->
<div class="Model" id="myOrder" >
    <div class="orderModel">
        <div class="orderTitle">
            <h1>我的订单</h1>
            <div class="orderHead">
                <p class="orderHead-info">显示</p>
                <select class="orderHead-select">
                    <option value="2">全部订单</option>
                    <option value="1">已完成的订单</option>
                    <option value="0">未完成的订单</option>
                </select>
            </div>
            <a href="#" class="orderHead-un">找不到你的订单?</a>
        </div>
<!--  
<div class="showOrder">
    <div class="orderTime_Id">
        <h4 class="myOrder_Time">订单时间</h4>
        <p class="myOrder_Id">订单号：</p>
        <p class="myOrder_Id2">订单号码</p>
    </div>


    <div class="myOrder_ifm">
        <div class="myOrder_hotel"><img src="#" class="myhotel_Img"></div>
        <div class="order_Hotel_Ifm">
                <div class="myhotel_Name">
                    <h2 class="myhotel_Name_Name">酒店名</h2>
                    <p class="myhotel_Name_Adress">酒店地址</p>
                </div>

                <div class="myOrder_Room">
                    <p class="myOrder_Room_p">房间类型：</p><h3 class="myOrder_Room_Type">豪华型</h3>
                    <p class="myOrder_Room_p">入住人数：</p><h3 class="myOrder_PeopleNum">豪华型</h3>
                    <p class="myOrder_Room_p">房间数量：</p><h3 class="myOrder_RoomNum">豪华型</h3>
                </div>

            <div class="myOrderTime">
                <p class="myOrder_Time_p">入住时间：</p><h3 class="myOrder_InTime">2018-9-8</h3>
                <p class="myOrder_Time_p">退房时间：</p><h3 class="myOrder_OutTime">2018-9-10</h3>
            </div>

            <div class="myOrder_Money">1000元</div>

            <div class="myOrder_Pay">
                <a href="#" class="myOrder_Pay_a2">退单</a>
                <a href="#" class="myOrder_Pay_a">已支付</a>

            </div>
        </div>
    </div>

</div>-->
   		 </div>

</div>

<!--单个选项卡内容：设置-->
<div class="Model" id="install">
    <div class="install-model">
        <!--设置：左边菜单-->
        <div class="InstallBar">
            <ul class="InstallBarUl">
                <a href="#PI">
                    <li>个人信息 <div class="InstallBaricon iconfont icon-icon-touxiang"></div></li>
                </a>
                <a href="#CC">
                    <li>信用卡 <div class="InstallBaricon iconfont icon-xinyongka"></div></li>
                </a>
                <a href="#PS">
                    <li>支付设置 <div class="InstallBaricon iconfont icon-shezhi"></div></li>
                </a>
                <a href="#TP">
                    <li>您的旅行偏好 <div class="InstallBaricon iconfont icon-icon-life-bag"></div></li>
                </a>
                <a href="#PACS">
                    <li>密码和货币设置 <div class="InstallBaricon iconfont icon-shezhi"></div></li>
                </a>
                <a href="#SNS">
                    <li>社交网络设置 <div class="InstallBaricon iconfont icon-phone-copy"></div></li>
                </a>
            </ul>
        </div>
        <!--设置：右边信息：个人信息-->
        <div class="ISInfo">
            <a name="PI"></a>
            <div class="ISInfo_head">
                <div class="ISInfo_title">
                    你的Booking.com账号
                </div>
                <div class="ISInfo_subheading">
                    下列信息将显示在您发布的点评、评分、照片等旁边。如有任何信息更新，已发布点评旁的相关信息也会随之更新。
                </div>
            </div>
            <div class="ISInfo_content">
                <div class="ISInfo_content_row">
                    <p class="row_name">个人照片</p>
                    <div class="first_row_headImg">
<%
	if(loginUser.getUserPicture() != null){
%>
						<img src="../${sessionScope.loginUser.userPicture }">
<%		
	} else {
%>
						<img src="../resources/res/images/PersonCenter/bigHead.png">
<%		
	}
%>
                    </div>
                    <a href="#" class="row_button first_row_setHeadImg iconfont icon-xiangji"> 更改照片</a>
                    <p class="row_tip first_row_tip_Img iconfont icon-zlicontips01"> 上传一张美美的个人照吧</p>
                </div>

                <div class="ISInfo_content_row">
                    <p class="row_name">显示名称</p>
                    <input type="text" id="userNickName" name="userNickName" class="row_input" value="${sessionScope.loginUser.userNickName }">
                    <p class='row_name_tip'></p>
                    <p class="row_tip first_row_tip_name iconfont icon-zlicontips01"> 昵称可以随时修改</p>
                </div>

                <div class="ISInfo_content_row">
<%
	String[] days = {"","",""};
	if(loginUser.getUserBirthday() != null){
		days = loginUser.getUserBirthday().split("-");
	}
%>
                    <p class="row_name">生日</p>
                    <select id="select_day" class="row_select">
                        <option value="<%=days[2]%>"><%=days[2]%></option>
                    </select>
                    <select id="select_month" class="row_select">
                        <option value="<%=days[1]%>"><%=days[1]%>月</option>
                    </select>
                    <select id="select_year" class="row_select">
                        <option value="<%=days[0]%>"><%=days[0]%></option>
                    </select>
                    <p class='row_name_tip'></p>
                    <p class="row_tip first_row_tip_name iconfont icon-zlicontips01"> 请放心，我们仅显示你的年龄范围（如："25-30岁"）</p>
                </div>
                <div class="ISInfo_content_row">
                    <p class="row_name">国家/地区</p>
                    <select id="select_country" class="row_select">
                            <option value="${sessionScope.loginUser.userCountry }" selected>${sessionScope.loginUser.userCountry }</option>
                            <option value="乌拉圭">乌拉圭</option>
                            <option value="美国">美国</option>
                            <option value="俄罗斯">俄罗斯</option>
                            <option value="英国">英国</option>
                            <option value="法国">法国</option>
                            <option value="日本">日本</option>
                            <option value="德国">德国</option>
                            <option value="丹麦">丹麦</option>
                            <option value="乌兹别克斯坦">乌兹别克斯坦</option>
                            <option value="乌干达">乌干达</option>
                            <option value="哥斯达黎加">哥斯达黎加</option>
                            <option value="澳大利亚">澳大利亚</option>
                            <option value="印度">印度</option>
                            <option value="危地马拉">危地马拉</option>
                            <option value="中国">中国</option>
                            
                    </select>
                    <p class='row_name_tip'></p>
                    <p class="row_tip first_row_tip_name iconfont icon-zlicontips01"> 告诉大家您来自哪里</p>
                </div>
            </div>
        </div>
        <!--设置：右边信息：个人信息-预定过程-->
        <div class="ISInfo">
            <div class="ISInfo_head">
                <div class="ISInfo_title">
                    个人信息-预定过程
                </div>
                <div class="ISInfo_subheading">
                    该信息仅用于自动填写您的资料，加快预定流程。您的信息已被安全保存且不会泄露。
                </div>
            </div>
            <div class="ISInfo_content">
                <div class="ISInfo_content_row">
                    <p class="row_name">称谓</p>
                    <select id="select_title" class="row_select">
                        <option value=""></option>
<%
	if(loginUser.getUserSex() != null){
		if(loginUser.getUserSex().equals("男")){
%>
						<option value="男" selected>先生</option>
                        <option value="女">女士</option>
<%
		} else if(loginUser.getUserSex().equals("女")){
%>
						<option value="男">先生</option>
                        <option value="女" selected>女士</option>
<%
		} else {
%>
						<option value="男">先生</option>
                        <option value="女">女士</option>
<%
		}
	} else {
%>
						<option value="男">先生</option>
                        <option value="女">女士</option>
<%
	}
%>
                    </select>
                    <p class='row_name_tip'></p>
                </div>
                <div class="ISInfo_content_row">
                    <p class="row_name">名</p>
                    <input id="userName" type="text" class="row_input" value="${sessionScope.loginUser.userName }">
                    <p class='row_name_tip'></p>
                </div>
                <div class="ISInfo_content_row">
                    <p class="row_name">姓</p>
                    <input id="userSurnme" type="text" class="row_input" value="${sessionScope.loginUser.userSurnme }">
                    <p class='row_name_tip'></p>
                </div>
                <div class="ISInfo_content_row">
                    <p class="row_name">电话</p>
                    <input id="userPhoneNumber" type="text" class="row_input" value="${sessionScope.loginUser.userPhoneNumber }">
                    <p class='row_name_tip'></p>
                </div>
                <div class="ISInfo_content_row">
                    <p class="row_name">邮箱地址</p>
                    <input id="userEmail" type="text" class="row_input" value="${sessionScope.loginUser.userEmail }">
                    <p class='row_name_tip'></p>
                </div>
                <div class="ISInfo_content_row">
                    <p class="row_name">地址</p>
                    <p class="second_row_address" id="showAddress">
                       中国
                    </p>
                    <a href="javascript:void(0)" class="row_button second_row_changeAd iconfont icon-bi-copy" id="changAdBtn"> 更改家庭住址</a>
                    <div class="second_Ad_card">
                        <p>地址</p>
                        <input type="text" id="address">
                        <p>城市</p>
                        <input type="text" id="city">
                        <p>国家/地区</p>
                        <select id="country">
                            <option value="">中国</option>
                            <option value="">美国</option>
                            <option value="">法国</option>
                        </select>
                        <p>邮政编码</p>
                        <input type="text" id="postal">
                        <a href="javascript:void(0)" class="row_button" name="save">保存</a>
                        <a href="javascript:void(0)" class="row_button" name="exit">取消</a>
                    </div>
                </div>
            </div>
        </div>
        <!--设置：右边信息：信用卡-->
        <div class="ISInfo">
            <a name="CC"></a>
            <div class="ISInfo_head">
                <div class="ISInfo_title">
                    信用卡
                </div>
                <div class="ISInfo_subheading iconfont icon-suoding">
                    您的信用卡信息已妥善保存。为方便今后通过Booking.com预订住宿和附加服务，系统将自动为您填写信用卡信息。
                </div>
            </div>
            <div class="ISInfo_content">
                <div class="ISInfo_content_row">

                </div>
                <div class="ISInfo_content_row">
                    <hr>
                </div>
                <div class="ISInfo_content_row">
                    <a href="javascript:void(0)" class="row_button third_row_addCard iconfont icon-icontj"> 添加卡片</a>
                </div>
            </div>
        </div>
        <!--设置：右边信息：支付设置-->
        <div class="ISInfo">
            <a name="PS"></a>
            <div class="ISInfo_head">
                <div class="ISInfo_title">
                    支付设置
                </div>
                <div class="ISInfo_subheading">
                    请选择您的付款偏好，优化预订流程
                </div>
            </div>
            <div class="ISInfo_content">
                <div class="ISInfo_content_row">
                    <p class="row_name">您希望用哪种方式在线付款？</p>
                    <select class="row_select">
                        <option value="0">请选择</option>
                        <option value="Diners Club">Diners Club</option>
                        <option value="Discover">Discover</option>
                    </select>
                </div>
                <div class="ISInfo_content_row">
                    <p class="row_name">您希望何时支付房费？</p>
                    <select class="row_select">
                        <option value="0">请选择</option>
                        <option value="online">预订时网上支付</option>
                        <option value="outline">到店付款</option>
                    </select>
                </div>
            </div>
        </div>
        <!--设置：右边信息：您的旅行偏好-->
        <div class="ISInfo">
            <a name="TP"></a>
            <div class="ISInfo_head">
                <div class="ISInfo_title">
                    您的旅行偏好
                </div>
                <div class="ISInfo_subheading">
                    设置您的旅行偏好，我们将会向您呈现更个性化的搜索结果
                </div>
            </div>
            <div class="ISInfo_content">
                <div class="ISInfo_content_row">
                    <p class="row_name">是否吸烟</p>
                    <select class="row_select">
                        <option value="none">无偏好</option>
                        <option value="no">禁烟</option>
                        <option value="yes">吸烟</option>
                    </select>
                </div>
                <div class="ISInfo_content_row">
                    <p class="row_name">首选星级</p>
                    <select class="row_select">
                        <option value="any">任何星级</option>
                        <option value="star5">五星级</option>
                        <option value="star4">四星级及以上</option>
                        <option value="star3">三星级及以上</option>
                        <option value="star2">二星级及以上</option>
                    </select>
                </div>
                <div class="ISInfo_content_row">
                    <p class="row_name">无障碍设施需求</p>
                    <input type="checkbox" class="four_row_checkbox"> 带无障碍设施
                </div>
                <div class="ISInfo_content_row">
                    <p class="row_name">首选设施</p>
                    <p class="second_row_address" id="facilities">您认为哪些设施最为必要？可多选</p>
                    <a href="javascript:void(0)" class="row_button second_row_changeAd iconfont icon-bi-copy" id="addFacility"> 添加设施</a>
                    <div class="four_setFacility">
                        <div class="four_row_facility_model">
                            <input type="checkbox" value="餐厅"> 餐厅<br>
                            <input type="checkbox" value="禁烟客房"> 禁烟客房<br>
                            <input type="checkbox" value="停车场"> 停车场<br>
                            <input type="checkbox" value="无线网络"> 无线网络<br>
                            <input type="checkbox" value="机场班车"> 机场班车<br>
                            <input type="checkbox" value="酒吧"> 酒吧<br>
                            <input type="checkbox" value="24小时前台"> 24小时前台<br>
                        </div>
                        <div class="four_row_facility_model">
                            <input type="checkbox" value="上网服务"> 上网服务<br>
                            <input type="checkbox" value="健身中心"> 健身中心<br>
                            <input type="checkbox" value="准许携带宠物"> 准许携带宠物<br>
                            <input type="checkbox" value="Spa及健康中心"> Spa及健康中心<br>
                            <input type="checkbox" value="室内游泳池"> 室内游泳池<br>
                            <input type="checkbox" value="免费无线网络连接"> 免费无线网络连接<br>
                            <input type="checkbox" value="行李寄存"> 行李寄存<br>
                        </div>
                        <div class="four_button">
                            <a href="javascript:void(0)" class="row_button four_button-a" name="save">保存</a>
                            <a href="javascript:void(0)" class="row_button four_button-a" name="exit">取消</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--设置：右边信息：密码和货币设置-->
        <div class="ISInfo">
            <a name="PACS"></a>
            <div class="ISInfo_head">
                <div class="ISInfo_title">
                    密码和货币设置
                </div>
                <div class="ISInfo_subheading">
                    设置您的常用货币或进行密码修改
                </div>
            </div>
            <div class="ISInfo_content">
                <div class="ISInfo_content_row">
                    <p class="row_name">货币</p>
                    <select class="row_select">
                        <option value="any">住宿地使用的货币</option>
                        <option value="RMB">元  人民币</option>
                        <option value="DKK">DKK 丹麦克朗</option>
                    </select>
                </div>
                <div class="ISInfo_content_row">
                    <p class="row_name">密码</p>
                    <p class="second_row_address">想要修改密码？点击下方按钮，我们会通过电子邮件提供重设密码的链接。</p>
                    <a href="javascript:void(0)" class="row_button second_row_changeAd">修改密码</a>
                </div>
            </div>
        </div>
        <!--设置：右边信息：社交网络-->
        <div class="ISInfo">
            <a name="SNS"></a>
            <div class="ISInfo_head">
                <div class="ISInfo_title">
                    社交网络
                </div>
                <div class="ISInfo_subheading">
                    在这里通过关联其他社交平台，用于快速登录
                </div>
            </div>
            <div class="ISInfo_content">
                <div class="ISInfo_content_row">
                    <p class="row_name">用其他账号登录</p>
                    <p class="second_row_address">关联其他平台帐号，一键轻松登录 </p>
                    <a href="javascript:void(0)" class="row_button second_row_changeAd"><img src="../resources/res/images/weichar.png" class="weixinIcon">微信登录</a>
                </div>
            </div>
        </div>
        <!--设置：最后的一行提示-->
        <div class="ISInfo last">
            <span><a href="#">点击此处</a>以删除您的Booking.com帐户。感谢您的使用，期待未来还能与您相见。</span>
        </div>
    </div>
</div>
<!--点击修改照片，弹出修改窗口-->
<div class="changeHeadImg">
    <div class="CHIModel">
        <div class="CHIBody">
            <a href="#" class="closeImg">×</a>
            <div class="first_row_headImg newImg" id="img-vessel">
                <img src="../resources/res/images/PersonCenter/bigHead.png" id="myHead" />
            </div>
            <div class="chooseFile">
                <h3 class="fileTitle">选择文件上传</h3>
                <input type="file" id="imgfile" name="newHead" class="fileValue" onchange="readAsDataURL()" >
                <button id="saveImg" class="saveHeadBtn" onclick="showImg()">保存</button>
            </div>
        </div>
    </div>
</div>

<script src="../resources/js/searchCard.js"></script>
<script src="../resources/js/PersonalCenter.js"></script>
<script src="../resources/js/NavBar.js"></script>
<script src="../resources/js/index_container.js"></script>
</body>
</html>