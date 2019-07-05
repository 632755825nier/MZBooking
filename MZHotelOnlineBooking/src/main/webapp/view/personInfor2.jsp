<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="com.nier.Booking.entity.User" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link rel="SHORTCUT ICON" href="../resources/res/images/Mlogo.icon"/>
    <title>MZHotelOnlineBooking：最终信息</title>
    <script src="../resources/js/JQuery/JQuery3.3.1.js"></script>
    <script type="text/javascript" src="../resources/js/jquery.cookie.js"></script>    
    <link rel="stylesheet" href="../resources/css/NavBar.css">
    <link rel="stylesheet" href="../resources/css/personIfm2.css">
    <link href="../resources/res/icon/index_icon/iconfont.css" rel="stylesheet">
    <link href="../resources/res/icon/personifm/iconfont.css" rel="stylesheet">
    	<!-- 	弹窗框架           -->
	<link href="../resources/css/sweetalert/sweetalert.css" rel="stylesheet">
	<script src="../resources/js/sweetalert/sweetalert.min.js"></script>
    <script src="../resources/js/index_container.js"></script>
    <script src="../resources/js/NavBar.js"></script>
    <script src="../resources/js/personIfm.js"></script>
    <script src="../resources/js/personIfm2.js"></script>
    
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
        <div class="flow_up_7 flow_up_left">3</div>
        <div class="flow_up_8 flow_up_left">最终信息</div>
    </div>

    <!--<div class="flow_down">-->
        <!--<span class="flow_down_userName">用户名</span>-->
        <!--<span class="flow_down_span">，轻松两步，完成预订！</span>-->
    <!--</div>-->
</div>
<div class="container">
       <div class="container_order_details">    
        <div class="order_details_box"> 
            <div class="order_details">订单详情</div>
            <div class="order_details_up">
                <p class="order_details_p">入住时间:</p>
                <span class="order_details_in_time">（获取订单入住时间！）</span>

                <p class="order_details_p">退房时间:</p>
                <span class="order_details_out_time">（获取订单退房时间）</span>

                <p class="order_details_p">入住总天数:</p>
                <span class="order_details_in_day order_allday">（获取订单入住总天数）</span>
            </div>
            <div class="order_details_down">
                <p class="order_details_p">已选择:</p>
                <span class="order_details_in_day order_room_type">（获取订单床房类型）</span>
                <a href="looking_room.jsp" class="order_details_rechoose">重新选择</a>
            </div>
        </div>
        <div class="container_measure_box">
            <div class="container_measure">客房无障碍设施</div>
            <div class="container_measure_down">
                <span class="order_details_in_day fontweight order_room_type">（获取订单床房类型）</span>

                <p class="container_measure_p1">住宿尚未标注可提供的无障碍设施。请直接联系</p>

                <p class="container_measure_p2">住宿沟通具体需求。</p>
            </div>
        </div>
        <div class="container_price_box">
            <div class="container_price_left">
                <p class="container_price_p">价格</p>

                <p class="container_price_people">(所有客人)</p>
            </div>
            <div class="container_price"><i class="order_allprice">400</i>元</div>
        </div>

        <div class="container_pay_timing">
            <div class="container_pay_timing_up">付款安排</div>
            <div class="container_pay_timing_down">
                今日无需付款，到店付款即可。
            </div>
        </div>

        <div class="container_cancle_fee">
            <div class="container_cancle_fee_up">
                取消费用是多少?
            </div>
            <div class="container_cancle_fee_down">
                <p class="container_cancle_fee_span1"><i class="order_indate">8月12日</i>下午5:59前可以免费取消</p>
                <p class="container_cancle_fee_span3"><i class="order_indate">8月12日</i>下午6:00起</p>
                <p class="container_cancle_fee_span5 container_price"><i class="order_allprice">400</i>元</p>
            </div>
        </div>

        <div class="container_add_tax">
            <div class="container_add_tax_up">不含以下费用</div>
            <div class="container_add_tax_down">
                <p class="container_add_tax_down_p1">增值税</p>

                <p class="container_add_tax_down_p2 ">32元</p>
            </div>

        </div>
        <div class="container_nervous">
            <div class="container_nervous_left"><i class="iconfont icon-icon-xianmain"></i></div>
            <div class="container_nervous_right">
                <strong class="container_nervous_s"><i class="order_adress">海口</i>房量紧张: </strong>
                2家和<i class="order_hotelName">心灵海客栈（海口海甸店）</i>类似的旅馆无空房！
            </div>
        </div>

        <div class="container_loc_adv_box">
            <div class="container_loc_adv">
                位置超赞！特别优势：
            </div>
            <div class="container_loc_adv_left">
                <i class="iconfont icon-location"></i>
            </div>
            <div class="container_loc_adv_right">
                <strong class="container_loc_adv_s">靠近热门地标</strong>
                白沙门公园、Hainan University和<i class="order_adress">海口</i>世纪大桥就在附近
            </div>
        </div>

    </div>
   
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
            <p class="container_ensure_p1">担保此项预订无需任何费用。您将于入住期间付款。</p>
        </div>

        <div class="container_ensure2">
            <i class="iconfont icon-gou2"></i>
          <p class="container_ensure2_p1">运气真不错！你已锁定<b class="order_hotelName">心灵海客栈（海口海甸店）</b>最便宜的房型。好价不错过，立即预订吧！</p>
        </div>
        <p class="input_user_ifm">输入个人信息</p>
         <form action=" " method="post">
         <div class="input_ifm">           
            <div class="input_ifm_up">快完成啦！将带<p>*</p>的必填项填写完整即可</div>
            <div class="input_ifm_div"> 
                <p class="user_Name font_style">姓名</p>
                <span class="get_user_Name"></span>
                <p class="user_email font_style">电子邮箱</p>
                <span class="get_user_email"></span>
            </div>
            <h4 class="input_ifm_h4"><i class="iconfont icon-location"></i>请以中文或英文输入您的信息</h4>
            <div class="input_ifm_country">国家/地区</div>
            <select id="select_country" class="row_select">
                <option value="0"></option>
                <option value="China">中国</option>
                <option value="America">美国</option>
                <option value="Russia">俄罗斯</option>
                <option value="England">英国</option>
                <option value="France">法国</option>
                <option value="Japan">日本</option>
                <option value="Germany">德国</option>
                <option value="Denmark">丹麦</option>
                <option value="Uzbekistan">乌兹别克斯坦</option>
                <option value="Uruguay">乌拉圭</option>
                <option value="Uganda">乌干达</option>
                <option value="Bulgaria">保加利亚</option>
                <option value="Croatia">克罗地亚</option>
                <option value="Crimea">克里米亚</option>
                <option value="Palestine">巴勒斯坦</option>
                <option value="Pakistan">巴基斯坦</option>
                <option value="Columbia">哥伦比亚</option>
                <option value="Costa">哥斯达黎加</option>
                <option value="Australia">澳大利亚</option>
                <option value="India">印度</option>
                <option value="Guatemala">危地马拉</option>
            </select>
            <div class="input_ifm_tel">请填写您的电话号码<p>*</p></div>
            <div class="input_ifm_phone" >
                <select id="select_pre_phone" class="select_pre_tel" onchange="set_Pre_tel()" >
                    <option value="0"></option>
                    <option value="+86 ">中国大陆 +86</option>
                    <option value="+852 ">香港 +852</option>
                    <option value="+853 ">澳门 +853</option>
                    <option value="+886 ">台湾 +886</option>
                    <option value="+82 ">韩国 +82</option>
                    <option value="+81 ">日本 +81</option>
                    <option value="+1 ">美国 +1</option>
                    <option value="+1 ">加拿大 +1</option>
                    <option value="+44 ">英国 +44</option>
                    <option value="+65 ">新加坡 +65</option>
                    <option value="+60 ">马来西亚 +60</option>
                    <option value="+66 ">泰国 +66</option>
                    <option value="+84 ">越南 +84</option>
                    <option value="+63 ">菲律宾 +63</option>
                    <option value="+62 ">印度尼西亚 +62</option>
                    <option value="+39 ">意大利 +39</option>
                    <option value="+7 ">俄罗斯 +7</option>
                    <option value="+64 ">新西兰 +64</option>
                    <option value="+31 ">荷兰 +31</option>
                    <option value="+46 ">瑞典 +46</option>
                    <option value="+380 ">乌克兰 +380</option>
                    <option value="+61 ">澳大利亚 +61</option>
                    <option value="+33 ">法国 +33</option>
                    <option value="+49 ">德国 +49</option>
                    <option value="+54 ">阿根廷 +54</option>
                </select  >
                <input type="text" name="tel_phone" id="get_pre_tel" ></div>
            <div class="input_ifm_connet">以便住宿与您联系</div>
              
        </div>
 
        <div class="order_information_next_box">
            <div class="order_information_next">
                <div class="order_information_next1">
                    <div class="order_information_next1_tri"></div>
                        <p class="order_information_next_p">核对订单信息</p>
                </div>
                <div class="order_information_next2">
                    <a href="../OrderPayServlet"  onclick="return goOrderPay()">完成预定&#10095;</a>
<!--                     <a href="javascript:void(0);"  onclick="goOrderPay()">完成预定&#10095;</a> -->
                </div>
                <div class="order_information_next3">
                    别担心 - 现在不会收取费用！
                </div>
            </div>

        </div>
  		</form>

        <div class="container_foot_box">
            <i class="iconfont icon-iconfontright2"></i>

            <p class="container_foot_box_p1">请您在下一页添加更多信息。<b>无需信用卡</b>即可完成预订。您将于入住期间付费。</p>
        </div>

    </div> 
</div>
<div class="footer">
    <div class="footer_up">
        <h2 class="footer_up_h2">大家喜爱MZHotelOnlineBooking.com的理由</h2>
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

        <div class="footer_copyright">版权 © 2018–2019 MZHotelOnlineBooking.com  版权所有.</div>

    </div>


</div>

</body>

</html>