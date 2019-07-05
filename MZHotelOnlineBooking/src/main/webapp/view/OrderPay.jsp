<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="java.io.*,java.net.*" %>
<%@ page import="com.nier.Booking.entity.User" %>
<%@ page isELIgnored="false" %>
<!DOCtype html>
<html>
<head>
    <title>Booking.com：订单预定</title>
    <script src="../resources/js/JQuery/JQuery3.3.1.js"></script>
    <script type="text/javascript" src="../resources/js/jquery.cookie.js"></script>    
    <link rel="stylesheet" href="../resources/css/NavBar.css">
    <link rel="stylesheet" href="../resources/css/OrderPay.css">
    <link href="../resources/res/icon/index_icon/iconfont.css" rel="stylesheet">
    <link href="../resources/res/icon/personifm/iconfont.css" rel="stylesheet">
    	<!-- 	弹窗框架           -->
	<link href="../resources/css/sweetalert/sweetalert.css" rel="stylesheet">
	<script src="../resources/js/sweetalert/sweetalert.min.js"></script>
    <script src="../resources/js/index_container.js"></script>
    <script src="../resources/js/NavBar.js"></script>
    <script src="../resources/js/personIfm.js"></script>
    <script src="../resources/js/OrderPay.js"></script>
	<link rel="SHORTCUT ICON" href="../resources/res/images/Mlogo.icon"/>

    
</head>
<body>
<div  class="tips"></div>
<div id="registertip" class="index_tip"></div>
<div class="tip3"></div>
<!--实现图片移动-->
<div  class="modal">
    <img class="model-content" id="img01" src="../resources/res/images/personIfm/xlhkz.jpg">
</div>

<div class="modal2">
    <img class="model-content" id="img02" src="../resources/res/images/personIfm/xlhkz1.jpg">
</div>
<div class="modal3">
    <img class="model-content" id="img03" src="../resources/res/images/personIfm/xlhkz2.jpg">
</div>
<div class="modal4">
    <img class="model-content" id="img04" src="../resources/res/images/personIfm/xlhkz3.jpg">
</div>
<div class="modal5">
    <img class="model-content" id="img05" src="../resources/res/images/personIfm/xlhkz4.jpg">
</div>

<div id="none_img_id" >
    <img src="../resources/res/images/wechat_img.png" id="none_img_id2" >
</div>
<div class="top">

    <div class="head">
        <a href="../index.jsp"><img id="Booking_logo" class="logo" src="../resources/res/images/logo.png"><a>
        <div class="user-bar">
            <ul class="user-ul">
                <li class="user-li_1" >
                    <a id="mon_tex" href="javascript:void(0)"  class="user-tex" data-title="选择您使用的货币">元</a>
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

<div class="flow">
    <div class="flow_up">
        <div class="flow_up_1 flow_up_left"><i class="iconfont icon-gou"></i></div>
        <div class="flow_up_2 flow_up_left">选择您的客房</div>
        <div class="flow_up_3 flow_up_left">
            <hr>
        </div>
        <div class="flow_up_4 flow_up_left"><i class="iconfont icon-gou"></i></div>
        <div class="flow_up_5 flow_up_left">填写您的信息</div>
        <div class="flow_up_6 flow_up_left">
            <hr>
        </div>
        <div class="flow_up_7 flow_up_left"><i class="iconfont icon-gou"></i></div>
        <div class="flow_up_8 flow_up_left">最终信息</div>
    </div>

    <div class="flow_down">
        <span class="flow_down_userName">${sessionScope.loginUser.userNickName}</span>
        <span class="flow_down_span">，完成预订！</span>
    </div>
</div>
<div class="container">
    <div class="container_order_ifm_box">
        <div class="container_order_ifm"> 
            <div class="container_order_ifm_left">
                <div class="container_order_ifm_img" >
                </div>
                <div class="container_order_ifm_r_img">
                    <ul class="order_ifm_r_ul">
                        <li class="order_ifm_r_img1 order_ifm_li">
                            <img src="../resources/res/images/personIfm/xlhkz1.jpg" style="height: 100%;width: 100% ">
                        </li>
                        <li class="order_ifm_r_img2 order_ifm_li">
                            <img src="../resources/res/images/personIfm/xlhkz2.jpg" style="height: 100%;width: 100% ">
                        </li>
                        <li class="order_ifm_r_img3 order_ifm_li">
                            <img src="../resources/res/images/personIfm/xlhkz3.jpg" style="height: 100%;width: 100% ">
                        </li>
                        <li class="order_ifm_r_img4 order_ifm_li">
                            <img src="../resources/res/images/personIfm/xlhkz4.jpg" style="height: 100%;width: 100% ">
                        </li>
                    </ul>
                </div>
            </div>
             <div class="container_order_ifm_right">
                <h1 class="order_ifm_h1 order_hotelName">心灵海客栈（海口海甸店）</h1>

                <p class="order_ifm_p1" data-title="预定后，您可以在预订确认信和您的账户中找到该住宿的详细信息（包括电话和地址）"><i class="iconfont icon-weizhi" style="color: #58B8FF; padding-right: 5px;"></i><i class="order_hotel_adress">海口, 美兰, 海甸六西路万美街万美花园 ，近万恒城市花园</i></p>

                <p class="order_ifm_p2"><i class="order_adress">海口</i> &nbsp;最热门住宿之一</p>

                <p class="order_ifm_p3"><i class="order_yearsindate">2018年8月12日</i>下午6:00前可免费取消</p>
            </div>
        </div>

        <div class="container_ensure">
            <i class="iconfont icon-iconfontright2" ></i>
            <p class="container_ensure_p1"><b>担保此项预订无需任何费用</b>。您将于入住期间付款。</p>
        </div>

        <div class="container_ensure2">
            <i class="iconfont icon-gou2"></i>

        <p class="container_ensure2_p1">运气真不错！你已锁定<b class="order_hotelName">心灵海客栈（海口海甸店）</b>最便宜的房型。好价不错过，立即支付吧！</p>

        </div>
        
        <%
        Cookie[] allCookies = request.getCookies();
        String HotelId = "";
        String orderNumber = "";
		if(allCookies!=null) {
			for(Cookie cookies:allCookies) {
				if(cookies.getName().equals("hotelId")) {
					//获取USER_NAME的值，需要解码（通过URLDecoder下的decode方法）
					HotelId = cookies.getValue();
				}
				if(cookies.getName().equals("orderNumber")) {
					orderNumber = URLDecoder.decode(cookies.getValue(),"UTF-8");
					//System.out.print("orderNumber:"+orderNumber);
				}
				
			 }
			}	
        %>
        
        
        <p class="input_user_ifm">您的订单信息 &nbsp;&nbsp;&nbsp;Confirm your order information</p>
<%--             <form method="post" action="../PayServlet?HotelId=<%=HotelId %>&orderNumber=<%=orderNumber %>"> --%>
            <form method="post" action="../PayServlet2?HotelId=<%=HotelId %>&orderNumber=<%=orderNumber %>">
            <div class="order_ifm">
                <div class="order_user_list"> 
                <div class="order_list_ifm ">订单号</div>
                <div class="order_list_ifms ORDER_ID"><input type="text" name="ORDER_ID" value="<%=session.getAttribute("OrderId") %>" readonly="readonly"></div>
                <div class="order_user_ifm ">联系人</div>
                <div class="order_user_ifms USER_NAME"><input type="text" name="USER_NAME" value="" readonly="readonly"></div>
                <div class="order_user_ifm ">订单联系电话</div>
                <div class="order_user_ifms CONTACT_NUM"><input type="text" name="CONTACT_NUM" value="" readonly="readonly"></div>
                <div class="order_user_ifm order_back">房间数量</div>
                <div class="order_user_ifms ROOM_NUM"><input type="text" name="ROOM_NUM" value="" readonly="readonly"></div>
                <div class="order_user_ifm order_back">房间类型</div>
                <div class="order_user_ifms ROOM_TYPE"><input  type="text" name="ROOM_TYPE" value="" readonly="readonly"></div>
                <div class="order_user_ifm order_back">房间单价</div>
                <div class="order_user_ifms ROOM_PRICE"><input type="text" name="ROOM_PRICE" value="" readonly="readonly"></div></div>
 

            <div class="order_list">
                <div class="order_list_ifm ">入住时间</div>
                <div class="order_list_ifms IN_DATE"><input type="text" name="IN_DATE" value="" readonly="readonly"></div>
                <div class="order_list_ifm ">退房时间</div>
                <div class="order_list_ifms OUT_DATE"><input type="text" name="OUT_DATE" value="" readonly="readonly"></div>
                <div class="order_list_ifm ">订单总金额</div>
                <div class="order_list_ifms ORDER_MONEY"><input type="text" name="ORDER_MONEY" value="" readonly="readonly"></div>
                <div class="order_list_ifm order_back">订单时间</div>
                <div class="order_list_ifms ORDER_TIME"><input type="text" name="ORDER_TIME" value="" readonly="readonly"></div>
                <div class="order_hotel_ifm order_back">订单邮箱</div>
                <div class="order_hotel_ifms ORDER_EMAIL"><input type="text" name="ORDER_EMAIL" value="" readonly="readonly"></div>
                <div class="order_list_ifm order_back">入住天数</div>
                <div class="order_list_ifms ORDER_Allday"><input type="text" name="ORDER_Allday" value="" readonly="readonly"></div>      
            </div>
            </div>
            
                  <div class="payMethod">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" >
                <tr>
                    <td colspan="4" align="center" style="width:100px; font-weight: bold">请您选择在线支付银行</td>
                </tr>
                <tr >
                    <td><input type="radio" name="pd_FrpId" value="BOC-NET-B2C" checked>中国银行 </td>
                    <td><input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C">招商银行</td>
                    <td><input type="radio" name="pd_FrpId" value="ABC-NET">农业银行</td>
                    <td><input type="radio" name="pd_FrpId" value="CCB-NET">建设银行 </td>
                </tr>
                <tr >
                    <td><input type="radio" name="pd_FrpId" value="CMBC-NET">中国民生银行总行</td>
                    <td><input type="radio" name="pd_FrpId" value="CEB-NET" >光大银行 </td>
                    <td><input type="radio" name="pd_FrpId" value="BOCO-NET">交通银行</td>
                    <td><input type="radio" name="pd_FrpId" value="SDB-NET">深圳发展银行</td>
                </tr>
                <tr >
                    <td><input type="radio" name="pd_FrpId" value="BCCB-NET">北京银行</td>
                    <td><input type="radio" name="pd_FrpId" value="POST-NET-B2C">中国邮政 </td>
                    <td><input type="radio" name="pd_FrpId" value="CZ-NET-B2C ">浙商银行 </td>
                    <td><input type="radio" name="pd_FrpId" value="ECITIC-NET">中信银行</td>
                </tr>
            </table>

        </div>
            

        <div class="order_information_next_box">
            <div class="order_information_next">
                <div class="order_information_next1">
                    <div class="order_information_next1_tri"></div>

                    <p class="order_information_next1_p" data-title="低廉的价格-不收取预订手续费-别处找到了更便宜的价格？差价核实后将予以补偿"><a href="#"> <i class="iconfont icon-gou2" style="color: #003580;background: white; border-radius: 50%;"></i> 价格更放心</a></p>
                </div>
                <div class="order_information_next2">
                   <button type="submit" onclick="return OrderPaySuccess()">去支付&#10095;</button>
                </div>

            </div>

        </div>
</form>





    </div>
</div>
<div class="footer">
    <div class="footer_up">
        <h2 class="footer_up_h2">大家喜爱Booking.com的理由</h2>
        <ul class="footer_lover_ul">
            <li class="footer_lover_li1"></li>
            <li class="footer_lover_li2"></li>
            <li class="footer_lover_li3"></li>
            <li class="footer_lover_li4"></li>
        </ul>
    </div>

    <div class="footer_middle">
        <div class="footer_middle_tex">上个月，超过<b>一百万</b>名用户说他们愿意向亲朋好友推荐<small style="font-size: 15px">Booking.com</small>。</div>
    </div>

    <div class="footer_down">
        <div class="footer_idea">
            <ul class="footer_idea_ul">
                <li class="footer_idea_li1"><a href="">关于Booking.com</a></li>
                <li class="footer_idea_li2"><a href="">客户服务</a></li>
                <li class="footer_idea_li2" style="margin-left: 5px"><a href="">相关条款</a></li>
                <li class="footer_idea_li3"><a href="">隐私和Cookie声明</a></li>
            </ul>
        </div>

        <div class="footer_copyright">版权 © 1996–2018 Booking.com. 版权所有.</div>

    </div>


</div>

</body>

</html>