<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.net.URLDecoder"%>
<%@ page import="java.io.*" %>
<%@ page import="com.nier.Booking.entity.User" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <link href="../resources/css/looking_room.css" rel="stylesheet" type="text/css">
    <script src="//at.alicdn.com/t/font_788386_2i6kkukzw5q.js" ></script>
    <script src="//at.alicdn.com/t/font_788619_tgs1nmfyovk.js" ></script>
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="../resources/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="../resources/js/JQuery/main.js"></script>
    <script src="../resources/js/NavBar.js"></script>
    	<!-- 	弹窗框架           -->
	<link href="../resources/css/sweetalert/sweetalert.css" rel="stylesheet">
	<script src="../resources/js/sweetalert/sweetalert.min.js"></script>
	
	<link href="../resources/css/toastr/toastr.min.css" rel="stylesheet">
	<script src="../resources/js/toastr/toastr.min.js"></script>
    <link rel="stylesheet" href="../resources/css/NavBar.css?v=<%= System.currentTimeMillis()%>">
    <link href="../resources/res/icon/index_icon/iconfont.css" rel="stylesheet">
	<link rel="SHORTCUT ICON" href="../resources/res/images/Mlogo.icon"/>
    <script src="../resources/js/looking_room.js"></script>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
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

<div class="container">
    <ul class="list">
        <li><a href="">首页</a>
            <svg class="icon icon-youjiantou" aria-hidden="true">
                <use xlink:href="#icon-youjiantou"></use>
            </svg>
        </li>
        <li><a href="#">中国</a>
            <svg class="icon icon-youjiantou" aria-hidden="true">
                <use xlink:href="#icon-youjiantou"></use>
            </svg></li>
            <%
            	
      
            %>
        <li><a href="#"><% 
        String hotelProvice=null;
    	Cookie[] cookies = request.getCookies();
    	for(Cookie cookie:cookies){
    	
    	 if (cookie.getName().equals("hotelProvice")) {
             //使用URLDecode.decode()解码,防止中文乱码
             hotelProvice = URLDecoder.decode(cookie.getValue(), "utf-8");
      
         }    
        }
         	out.print(hotelProvice);
         %></a>
            <svg class="icon icon-youjiantou" aria-hidden="true">
                <use xlink:href="#icon-youjiantou"></use>
            </svg></li>
        <li><a href="#"><% 
        String hotelDowntown=null;
    	for(Cookie cookie:cookies){
    	
    	 if (cookie.getName().equals("hotelDowntown")) {
             //使用URLDecode.decode()解码,防止中文乱码
            hotelDowntown = URLDecoder.decode(cookie.getValue(), "utf-8");
      
         }    
        }
         	out.print(hotelDowntown);
         %></a>
            <svg class="icon icon-youjiantou" aria-hidden="true">
                <use xlink:href="#icon-youjiantou"></use>
            </svg></li>
        <li><% 
        String hotelArea=null;
    	for(Cookie cookie:cookies){
    	
    	 if (cookie.getName().equals("hotelArea")) {
             //使用URLDecode.decode()解码,防止中文乱码
           hotelArea = URLDecoder.decode(cookie.getValue(), "utf-8");
      
         }    
        }
         	out.print(hotelArea);
         %></li></ul>
    <div class="leftcontainer">
        <div class="one">
            <button class="onebutton1">现在就预定</button>
            <button class="onebutton2">保存至心愿单列表</button>
            <p>已被保存至5434份清单</p>
        </div>

        <div class="two">
            价格更放心
        </div>
        <div class="three">
            <div class="header">特价搜不停</div>
            <span class="span1">目的地/住宿名称:</span>
            <input type="text" class="text1"  placeholder="梅州">
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
                    <h3 class="bodyleft_h3"></h3>
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
                <span>2位儿童</span>
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
                <span>2间房</span>
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
        <div class="four">
            <svg class="icon icon-yanjing" aria-hidden="true">
                <use xlink:href="#icon-yanjing"></use>
            </svg>
            <span>666人正在搜索梅州的住宿</span>
        </div>
        <div class="five">
            <svg class="icon icon-dizhi" aria-hidden="true">
                <use xlink:href="#icon-dizhi"></use>
            </svg>
            <button>搜索周边</button>
        </div>

        <div class="six">
            <div class="text">从梅州碧桂园国际机场前往梅州碧桂园宾馆</div>
            <div class="search">
                <svg class="icon icon-chuzuche" aria-hidden="true">
                    <use xlink:href="#icon-chuzuche"></use>
                </svg>
                <span>出租车</span>
                <div class="time">40分钟</div>
            </div>
            <div class="search1">
                <svg class="icon icon-tingchechang1" aria-hidden="true">
                    <use xlink:href="#icon-tingchechang1"></use>
                </svg>
                <span>停车场</span>

            </div>

        </div>

        <div class="seven">
            <span>有一点动心，但是不太确定？</span>
            <button>查看类似住宿</button>
        </div>

        <div class="nearplace">
            <li>附近地标</li>
            <li><span>立柏广场</span> <a>0.1km</a></li>
            <li><span>梅州友谊商店</span> <a>0.1km</a></li>
            <li><span>环市路酒吧街</span> <a>0.3km</a></li>
            <li><span>华侨新城</span> <a>0.3km</a></li>
        </div>

    </div>
    <div class="midd">
        <a class="a1">客户信息&价格</a>
        <a  class="a2">设施</a>
        <a  class="a3">订前必读</a>
        <a  class="a4">预定须知</a>
        <a  class="a5">10用户点评</a>

        <div class="header">
            <span class="span1"><% 
        String hotelName=null;
    	for(Cookie cookie:cookies){
    	
    	 if (cookie.getName().equals("hotelName")) {
             //使用URLDecode.decode()解码,防止中文乱码
            hotelName = URLDecoder.decode(cookie.getValue(), "utf-8");
      
         }    
        }
         	out.print(hotelName);
         %></span>
            <span class="span2"><% 
        String hotelType=null;
    	for(Cookie cookie:cookies){
    	
    	 if (cookie.getName().equals("hotelType")) {
             //使用URLDecode.decode()解码,防止中文乱码
            hotelType = URLDecoder.decode(cookie.getValue(), "utf-8");
      
         }    
        }
         	out.print(hotelType);
         %></span>
<!--          这里修改星星数量 -->
<!--             <div class="pointer"> -->
<!--                 <li></li><li></li><li></li><li></li> -->
<!--                  <li></li>  -->
<!--             </div> -->

            <svg class="icon icon-zan" aria-hidden="true">
                <use xlink:href="#icon-zan"></use>
            </svg>
            <div class="double">
                <svg class="icon icon-renshu" aria-hidden="true">
                    <use xlink:href="#icon-renshu"></use>
                </svg>
                <span>推荐双人入住</span>
            </div>
            <div class="bus">
                <svg class="icon icon-chuansuojichangbanche" aria-hidden="true">
                    <use xlink:href="#icon-chuansuojichangbanche"></use>
                </svg>
                <span>机场班车</span>
            </div>
            <div class="nothing">
                <svg class="icon icon-wuzhangaisheshi" aria-hidden="true">
                    <use xlink:href="#icon-wuzhangaisheshi"></use>
                </svg>
                <span>无障碍</span>
            </div>
            <button>现在就预定</button>
            <div class="love">
                <svg class="icon icon-aixin" aria-hidden="true">
                    <use xlink:href="#icon-aixin"></use>
                </svg>
            </div>
            <div class="share">
                <svg class="icon icon-fenxiang" aria-hidden="true">
                    <use xlink:href="#icon-fenxiang"></use>
                </svg>
            </div>
            <div class="foot">
                <svg class="icon icon-dizhi" aria-hidden="true">
                    <use xlink:href="#icon-dizhi"></use>
                </svg>
                <span><% 
        String hotelAdress=null;
    	for(Cookie cookie:cookies){
    	
    	 if (cookie.getName().equals("hotelAdress")) {
             //使用URLDecode.decode()解码,防止中文乱码
            hotelAdress = URLDecoder.decode(cookie.getValue(), "utf-8");
      
         }    
        }
         	out.print(hotelAdress);
         %></span>
                <a>位置很赞-显示地图</a>
                <svg class="icon icon-duihaocheckmark17" aria-hidden="true">
                    <use xlink:href="#icon-duihaocheckmark17"></use>
                </svg>
                <h6 class="span1">价格更放心</h6>
            </div>
        </div>
        <div class="slide">
            <div class="img1" ><img src="" alt=""/></div>
            <div class="pre" > <svg class="icon icon-zuojiantou" aria-hidden="true">
                <use xlink:href="#icon-zuojiantou"></use>
            </svg></div>
            <div class="next" > <svg class="icon icon-zuojiantou-copy" aria-hidden="true">
                <use xlink:href="#icon-zuojiantou-copy"></use>
            </svg></div>

        </div>
        <div class="manyimg">
            <li><img src="" alt=""/></li><li><img src="" alt=""/></li> <li><img src="" alt=""/></li> <li><img src="" alt=""/></li><li><img src="" alt=""/></li>
            <li><img src="" alt=""/></li><li><img src="" alt=""/></li><li><img src="" alt=""/></li> <li><img src="" alt=""/></li> <li><img src="" alt=""/></li>
             <li><img src="" alt=""/></li><li><img src="" alt=""/></li> <li><img src="" alt=""/></li><li><img src="" alt=""/></li><li><img src="" alt=""/></li>
            <li><img src="" alt=""/></li> <li><img src="" alt=""/></li><li><img src="" alt=""/></li><li><img src="" alt=""/></li><li><img src="" alt=""/></li>
            <li><img src="" alt=""/></li> <li><img src="" alt=""/></li> <li><img src="" alt=""/></li><li><img src="" alt=""/></li><li><img src="" alt=""/></li>
            <li><img src="" alt=""/></li><li><img src="" alt=""/></li> <li><img src="" alt=""/></li><li><img src="" alt=""/></li><li><img src="" alt=""/></li>
            <li><img src="" alt=""/></li><li><img src="" alt=""/></li><li><img src="" alt=""/></li> <li><img src="" alt=""/></li> <li><img src="" alt=""/></li>
            <li><img src="" alt=""/></li> <li><img src="" alt=""/></li> <li><img src="" alt=""/></li> <li><img src="" alt=""/></li> <li><img src="" alt=""/></li>
            <li><img src="" alt=""/></li> <li><img src="" alt=""/></li><li><img src="" alt=""/></li> <li><img src="" alt=""/></li><li><img src="" alt=""/></li>
            <li><img src="" alt=""/></li><li><img src="" alt=""/></li> <li><img src="" alt=""/></li><li><img src="" alt=""/></li> <li><img src="" alt=""/></li>
        </div>
        <div class="speciality">
            <img src="../resources/res/images/GZBYBG/two.PNG" alt=""/>
            <button>现在就预定</button>
            <button>保存至心愿清单列表</button>
        </div>
        <div class="text">
            <h3>梅州精选推荐之一</h3>
            <span class="hotelPer" style="color:black;letter-spacing:2px; font-size: 18px"> <%=session.getValue("hotelPer")%></span>         
        </div>

        <div class="tip">
            <li>梅</li>
            <li>州</li>
            <li>--</li>
            <li>世</li>
            <li>界</li>
            <li>客</li>
            <li>都</li>
            <div class="renxin">我要下订单啦！
                <svg class="icon icon-guilian" aria-hidden="true">
                    <use xlink:href="#icon-guilian"></use>
                </svg>
            </div>
        </div>
        
        
         <table class="order" border="0.2" bordercolor="#4a98d7" width="1008px" frame="void">
     
            <tr style="background-color: #e8eff9">
                <th>房间类型</th><th>剩余房间数</th><th>单价</th><th>总价</th><th>预定客房数量</th><th>入住日期</th><th>离开日期</th><th>入住人数</th><th>预定选择</th>
            </tr>
            <tr style="background-color: white">
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>     
                 <button>预定</button></td>
            </tr>
            <tr style="background-color: white">
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td >   
                   <button>预定</button></td>
            </tr>
            <tr style="background-color: white">
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td >  
                  <button>预定</button></td>
            </tr>
            <tr style="background-color: white">
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td >  
                   <button>预定</button></td>
            </tr>
            <tr style="background-color: white">
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td >  
                <button>预定</button></td>
            </tr>
            <script>
            	$("td button").click(function(){
            		if(<%=session.getAttribute("loginUser") %> == null){
//             			alert("请去登录");
                        swal('提示信息','预订客房请先登录！','error');

            		}
            	});
            </script>
        </table>
        
        <div class="connectfoot">
            <h3>还没有找到合适的住宿?</h3>
            <a href="../index.jsp" class="searchother">继续搜索</a>
        </div>
        
            <div class="CommentFoot">
         	   <div class="fineComment">精彩评论</div>
            <div class="nickName">昵称：</div>
            <div class="comment">评语：</div>
            <span class="span1">小玲</span>
            <span class="span2">梅州碧桂园宾馆的4家餐厅提供美味的中国菜肴和意大利美食。大堂酒吧供应
各种饮料和咖啡。</span>
        </div>
        
            <div class="CommentFootCopy">
         	   <div class="fineComment">精彩评论</div>
            <div class="nickName">昵称：</div>
            <div class="comment">评语：</div>
            <span class="span1">小玲</span>
            <span class="span2">梅州碧桂园宾馆的4家餐厅提供美味的中国菜肴和意大利美食。大堂酒吧供应
各种饮料和咖啡。</span>
        </div>       
    </div>
    
    
     <div class="CommentRightContainer">

    </div>

    <div class="concentContainer">
        <div class="hidden">
            <svg class="icon icon-cha2" aria-hidden="true">
                <use xlink:href="#icon-cha2"></use>
            </svg>

        </div>
        <div class="comment">
            <div class="comment1">
                <div class="touxiang">L</div>
                <div class="nickName">linux</div>
                <div class="country">中国</div>
                <div class="pingfeng">7.3</div>
                <div class="date">点评日期：</div>
                <div class="pinglun"></div>
                <div class="pinglundate">于2018.2.12入住</div>
                <div class="zang">
                    <svg class="icon   icon-zan" aria-hidden="true">
                        <use xlink:href="#icon-zan"></use>
                    </svg>
                    <span class="zangNum">1223人点赞</span>
                </div>
                <div class="xian"></div>
            </div>

            <div class="comment2">
                <div class="touxiang">L</div>
                <div class="nickName">linux</div>
                <div class="country">中国</div>
                <div class="pingfeng">7.3</div>
                <div class="date">点评日期：</div>
                <div class="pinglun"></div>
                <div class="pinglundate">于2018.2.12入住</div>
                <div class="zang">
                    <svg class="icon   icon-zan" aria-hidden="true">
                        <use xlink:href="#icon-zan"></use>
                    </svg>
                    <span class="zangNum">1223人点赞</span>
                </div>
                <div class="xian"></div>
            </div>
            
             <div class="pageDisplay">
                <ul>
                	<li>首页</li>
                    <li>上一页</li>
                    <li>1</li>
                    <li>2</li>
                    <li>3</li>
                    <li>4</li>
                    <li>5</li>
                    <li>下一页</li>
                    <li>末页</li>
                </ul>
            </div>
    
            
        </div>
        
    </div>
    
         
    <img src="../resources/res/images/looking_room/dibu1.PNG"  alt="上海鲜花港 - 郁金香" 
    style="position:absolute;left:0px;top:2600px"/>
     <img src="../resources/res/images/looking_room/dibu2.PNG"  alt="上海鲜花港 - 郁金香" 
    style="position:absolute;left:0px;top:2958px"/>
    
     <!--弹幕-->
<!--       <div class="tucao"> -->
<!--         <svg class="icon icon-laba" aria-hidden="true"> -->
<!--         <use xlink:href="#icon-laba"></use> -->
<!--     </svg></div> -->
    <div class="screen_dibu"></div>
    <div class="screen_container"></div>
<!--     <div class="screen_toolbar"> -->
<!--         <input id="screenBulletText" type="text" placeholder="请输入弹幕内容"/> -->
<!--         <button class="send">发射</button> -->
<!--         <button class="clear">关闭弹幕</button> -->
<!--     </div> -->
</div>
<!--  登录模块代码-->
	<div id="LARid" class="LAR-Background">
		<div class="LAR-Container">
			<ul class="LAR-ul">
				<a href="javascript:void(0)">
					<li id="loginLi" class="LAR-li">登录</li>
					<li id="registerLi" class="LAR-li">注册</li>
				</a>
			</ul>
			<div id="closebtn" class="closeButton"><a href="#" title="关闭"><img src="../resources/res/images/close.png" class="closeImg"></a></div>
			<div id="LAR-login">
				<div class="LAR-contant">
					<form name="loginForm" action="../LoginServlet?url=/view/searchResult.jsp" method="POST" class="LAR_form">
						<span class="login_span">电子邮箱/手机号<i id="eoplogin" class="input_tip"></i></span>
						<input id="eopInput2" class="emailInput" type="text" name="emailOrphone"><br>
						<span class="login_span">Booking.com密码</span>
						<input class="pwdInput" type="password" name="pwd"><br>
						<a href="#" class="lar_a">想不起密码？</a><br>
						<input type="submit" class="sub-btn" value="登录"><br>
					</form>
					<span class="span-line">
						&nbsp;———————————&nbsp;&nbsp;或一键登录&nbsp;&nbsp;————————————
					</span>
					<a href="javascript:void(0)" class="weicharLogin"><img src="../resources/res/images/iphone.png" class="login_login">短信登录</a>
				</div>
				<hr>
				<span class="span-tip">输入<a href="" class="font_a">订单确认号和PIN码</a>即可管理订单</span>
				<span class="span-tip2">登录帐户即代表您同意本公司的<a href="#" class="font_a">相关条款</a>以及<a href="#" class="font_a">隐私声明</a></span>
			</div>

			<div id="LAR-register">
				<div class="LAR-contant">
					<form name="registerForm" action="" method="post" onsubmit="" class="LAR_form">
						<span class="login_span">电子邮箱/手机号<i id="eop" class="input_tip"></i></span>
						<input id="eopReg1" class="emailInput2" type="text" name="emailOrphone"><br>
						<span class="login_span">创建密码</span>
						<input class="pwdInput2" type="password" name="pwd" ><br>
						<span class="login_span verify_code">请输入验证码<i id="verifyCode" class="input_tip"></i></span>
						<input type="text" name="verifyName" size="4" style="height:35px;" class="register_inp">
						<img src="../GetImage" alt="图片没显示" id="verifyImage" style="width:70px;height:35px;"> <br>
						<a href="#" onclick="refershVerify()" class="register_a">换一张</a>
						
						
						<script type="text/javascript">
						//刷新验证码
						function refershVerify(){
							var imgEle = document.getElementById("verifyImage");
							imgEle.src="../GetImage?a="+new Date().getTime();
						}
						</script>
						<br>
						<br>
						<input type="button" name="reginsterBtn" class="subRegister" value="注册账号"><br>
					</form>
					<span class="span-line">
						——————————————&nbsp;&nbsp;或&nbsp;&nbsp;——————————————
					</span>
					<a href="javascript:void(0)" class="weicharLogin"><img src="../resources/res/images/iphone.png" class="login_login">短信登录</a>
				</div> 
				<hr>
				<span class="span-tip">
						还没试过<a href="#" class="font_a">Booking.com商旅服务？</a><br>
						输入<a href="#" class="font_a">订单确认号和PIN码</a>即可管理订单
				</span>
				<span class="span-tip2">登录帐户即代表您同意本公司的<a href="#" class="font_a">相关条款</a>以及<a href="#" class="font_a">隐私声明</a></span>
				<br>
				<hr>
				<span class="span-tip">
						在Booking.com出租你的住宿 <a href="#" class="font_a">上线我的住宿</a>
				</span>
			</div>
		</div>
	</div>
<!-- <div id="LARidphone" class="LAR-Backgroundphone"> -->
<!--     <div class="LAR-Containerphone"> -->
<!--         <ul class="LAR-ulphone"> -->
<!--             <a href="javascript:void(0)"> -->
<!--                 <li id="loginLiphone" class="LAR-liphone">手机</li> -->
<!--                 <li id="registerLiphone" class="LAR-liphone">登录</li> -->
<!--             </a> -->
<!--             <svg class="icon-cha2" aria-hidden="true"> -->
<!--                 <use xlink:href="#icon-cha2"></use> -->
<!--             </svg> -->
<!--         </ul> -->

<!--         <div id="closebtnphone" class="closeButtonphone"></div> -->
<!--         <div id="LAR-loginphone"> -->
<!--             <div class="LAR-contantphone"> -->
<!--                 <form name="loginForm" action="../LoginServlet?url=/index.jsp" method="POST" class="LAR_formphone"> -->
<!--                     <span class="login_spanphone">手机号码</span> -->
<!--                     <input id="emailInputphone" type="text" name="phoneNum"> -->
<!--                     <button type="button" class="acquireMaphone">获取验证码</button><br> -->
<!--                     <span class="login_spanphone">输入验证码</span> -->
<!--                     <input id="pwdInputphone" type="text" name="pwd"><br><br> -->

<!--                     <input type="submit" class="sub-btnphone " value="登录" disabled><br> -->
<!--                 </form> -->
<!-- 					<span class="span-linephone"> -->
<!-- 					&nbsp;———————————&nbsp;&nbsp;或账号登录&nbsp;&nbsp;——————————— -->
<!-- 					</span> -->
<!--                 <a href="javascript:void(0)" class="weicharLoginphone">账号密码登录</a> -->
<!--             </div> -->
<!--             <hr> -->
<!--             <span class="span-tipphone">输入<a href="#" class="font_a">订单确认号和PIN码</a>即可管理订单</span> -->
<!--             <span class="span-tip2phone">登录帐户即代表您同意本公司的<a href="#" class="font_aphone">相关条款</a>以及<a href="#" class="font_aphone">隐私声明</a></span> -->
<!--         </div> -->
<!--     </div> -->

</body>
</html>