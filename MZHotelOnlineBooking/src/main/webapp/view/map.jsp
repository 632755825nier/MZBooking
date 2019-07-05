<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../resources/res/icon/map/iconfont.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/MapStyle.css">
	<!-- 	弹窗框架           -->
	<link href="../resources/css/sweetalert/sweetalert.css" rel="stylesheet">
	<script src="../resources/js/sweetalert/sweetalert.min.js"></script>
    <!-- 引用百度地图API文件 -->
<!--     <script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=1XXZ1hp42Ef2qHx8AheU08zIhhU7Sfe0"></script> -->
    <script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=3TqOSbPnyt1LYkOPPuIP5Yfy7fXTcGiY"></script>
	<link rel="SHORTCUT ICON" href="../resources/res/images/Mlogo.icon"/>

    <title>百度地图</title>

</head>
<body>
<div class="Map-Background" style="display: block">
    <div class="Map-Container">
        <!-- 第一个筛选栏 -->
        <div id="select1">
            <div class="nar-search">
                <div class="nar-search-top">
                    缩小搜索范围
                </div>
                <ul>
                    您的预算 <!-- 固定 -->
                    <li><label><input type="checkbox" name=""> 0元 - 390元（每晚）</label></li>
                    <li><label><input type="checkbox" name=""> 390元 - 790元（每晚）</label></li>
                    <li><label><input type="checkbox" name=""> 790元 - 1,100元（每晚）</label></li>
                    <li><label><input type="checkbox" name=""> 1,100元 - 1,500元（每晚）</label></li>
                    <li><label><input type="checkbox" name=""> 1,500元- 5,000元（每晚）</label></li>
                </ul>
                <ul>
                    热门筛选 <!-- 动态：为每个选项增加一个搜索量，选取搜索量最高的那几个，并在下方为其加粗 -->
                    <li><label><input type="checkbox" name=""> 公寓</label></li>
                    <li><label><input type="checkbox" name=""> 今日超值好价</label></li>
                    <li><label><input type="checkbox" name=""> 酒店</label></li>
                    <li><label><input type="checkbox" name=""> 免费取消</label></li>
                    <li><label><input type="checkbox" name=""> 黄浦区</label></li>
                </ul>
                <ul>
                    为你推荐 <!-- 动态：随机分配 -->
                    <li><label><input type="checkbox"> 健身中心</label></li>
                    <li><label><input type="checkbox"> 按摩</label></li>
                    <li><label><input type="checkbox"> 度假村</label></li>
                    <li><label><input type="checkbox"> 民宿</label></li>
                </ul>
                <ul>
                    住宿评级 <!-- 固定 -->
                    <li><label><input type="checkbox" name=""> 实惠型
                        <i class="iconfont icon-start zan_2"></i>
                        </label>
                    </li>
                    <li><label><input type="checkbox" name=""> 经济型
                        <i class="iconfont icon-start zan_2"></i>
                        <i class="iconfont icon-start zan_2"></i>
                        </label>
                    </li>
                    <li><label><input type="checkbox" name=""> 舒适型
                        <i class="iconfont icon-start zan_2"></i>
                        <i class="iconfont icon-start zan_2"></i>
                        <i class="iconfont icon-start zan_2"></i>
                        </label>
                    </li>
                    <li><label><input type="checkbox" name=""> 豪华型
                        <i class="iconfont icon-start zan_2"></i>
                        <i class="iconfont icon-start zan_2"></i>
                        <i class="iconfont icon-start zan_2"></i>
                        <i class="iconfont icon-start zan_2"></i>
                        </label>
                    </li>
                    <li><label><input type="checkbox" name=""> 尊贵型
                        <i class="iconfont icon-start zan_2"></i>
                        <i class="iconfont icon-start zan_2"></i>
                        <i class="iconfont icon-start zan_2"></i>
                        <i class="iconfont icon-start zan_2"></i>
                        <i class="iconfont icon-start zan_2"></i>
                        </label>
                    </li>
                    <li><label><input type="checkbox" name=""> 无评级</label></li>
                </ul>
                <ul>
                    休闲乐活 <!-- 动态：按地区显示 -->
                    <li><label><input type="checkbox"> 健身中心</label></li>
                    <li><label><input type="checkbox"> 按摩</label></li>
                    <li><label><input type="checkbox"> 自行车租赁（额外收费）</label></li>
                    <li><label><input type="checkbox"> 徒步活动</label></li>
                    <li><label><input type="checkbox"> 室内游泳池</label></li>
                </ul>
                <ul>
                    住宿房量
                    <li><label><input type="checkbox"> 只显示可预定住宿</label></li>
                </ul>
                <ul>
                    折扣优惠
                    <li><label><input type="checkbox"> 今日超值好价</label></li>
                </ul>
                <ul>
                    24小时前台
                    <li><label><input type="checkbox"> 7天24小时前台</label></li>
                </ul>
                <ul>
                    免费取消及更多
                    <li><label><input type="checkbox"> 免费取消</label></li>
                    <li><label><input type="checkbox"> 预定无需信用卡</label></li>
                    <li><label><input type="checkbox"> 无需预付</label></li>
                </ul>
                <ul>
                    餐点
                    <li><label><input type="checkbox"> 含早餐</label></li>
                    <li><label><input type="checkbox"> 包含早餐和晚餐</label></li>
                    <li><label><input type="checkbox"> 无需预付</label></li>
                </ul>
                <ul>
                    住处类型
                    <li><label><input type="checkbox"> 酒店</label></li>
                    <li><label><input type="checkbox"> 青旅</label></li>
                    <li><label><input type="checkbox"> 民宿</label></li>
                    <li><label><input type="checkbox"> 公寓</label></li>
                    <li><label><input type="checkbox"> 旅馆</label></li>
                    <li><label><input type="checkbox"> 别墅</label></li>
                    <a href="javascript:void(0)">显示所有12项</a>
                </ul>
                <ul>
                    地标    <!-- 动态：随地区显示 -->
                    <li><label><input type="checkbox"> 上海博物馆</label></li>
                    <li><label><input type="checkbox"> 豫园</label></li>
                    <li><label><input type="checkbox"> 新天地</label></li>
                    <li><label><input type="checkbox"> 东方明珠塔</label></li>
                    <li><label><input type="checkbox"> 上海动物园</label></li>
                </ul>
                <ul>
                    评分
                    <li><label><input type="checkbox"> 好极了： 9分以上</label></li>
                    <li><label><input type="checkbox"> 非常好： 8分以上</label></li>
                    <li><label><input type="checkbox"> 好： 7分以上</label></li>
                    <li><label><input type="checkbox"> 令人愉悦： 6分以上</label></li>
                    <li><label><input type="checkbox"> 尚无评分</label></li>
                </ul>
                <ul>
                    城市 <!-- 动态：随地区显示 -->
                </ul>
                <ul>
                    连锁酒店 <!-- 动态：随地区显示 -->
                    <li><label><input type="checkbox"> 全季酒店</label></li>
                    <li><label><input type="checkbox"> 如家快捷酒店</label></li>
                    <li><label><input type="checkbox"> 如家精选酒店</label></li>
                    <li><label><input type="checkbox"> 格林联盟</label></li>
                    <li><label><input type="checkbox"> 格林豪泰酒店</label></li>
                    <li><label><input type="checkbox"> 汉庭连锁酒店</label></li>
                    <li><label><input type="checkbox"> 海友酒店</label></li>
                    <li><label><input type="checkbox"> 莫泰酒店</label></li>
                    <li><label><input type="checkbox"> 铂涛集团7天连锁酒店</label></li>
                    <li><label><input type="checkbox"> 锦江之星</label></li>
                </ul>
            </div>
        </div>
        <!-- 第二个筛选栏 -->
        <div id="select2">
            <div class="sort-order">
                <div class="select-way">排序方式</div>
                <div id="select3">
                    <div id="selected-info" class="sort-order-content">热门推荐</div>
                    <div class="iconfont icon-B-shangxiasanjiaojiantou"></div>
                </div>
            </div>
            <div id="hotel-sort" class="dropdown-select">
                <a href="javascript:void(0)">热门推荐</a>
                <a href="javascript:void(0)">价格从低到高</a>
                <a href="javascript:void(0)">按评分和价格</a>
                <a href="javascript:void(0)">高点评分数及数量</a>
            </div>

            <!-- 酒店信息 -->
            <a href="javascript:void(0)">
                <div class="hotel">
                    <div class="hotel-img">
                        <img src="../resources/res/images/map/卓美亚喜马拉雅酒店.jpg">
                    </div>
                    <div class="hotel-info">
                        <h3>卓美亚喜马拉雅酒店</h3>
                        <div>
                            <div class="iconfont icon-start zan"></div>
                            <div class="iconfont icon-start zan"></div>
                            <div class="iconfont icon-start zan"></div>
                            <div class="iconfont icon-start zan"></div>
                            <div class="iconfont icon-start zan"></div>
                            <div class="iconfont icon-zan zan zan_1"></div>
                        </div>
                        <div class="grade">8.5 非常好</div>
                        <div class="grade-num">450条住客点评</div>
                        <div class="iconfont icon-rentouliangrense price"> 1,350元</div>
                    </div>
                    <div class="hotel-nar">
                        <div class="iconfont icon-sanjiao-copy-copy"></div>
                    </div>
                </div>
            </a>
            <a href="javascript:void(0)">
                <div class="hotel">
                    <div class="hotel-img">
                        <img src="../resources/res/images/map/上海帝盛酒店.jpg">
                    </div>
                    <div class="hotel-info">
                        <h3>上海帝盛酒店</h3>

                        <div>
                            <div class="iconfont icon-start zan"></div>
                            <div class="iconfont icon-start zan"></div>
                            <div class="iconfont icon-start zan"></div>
                            <div class="iconfont icon-start zan"></div>
                            <div class="iconfont icon-zan zan zan_1"></div>
                        </div>
                        <div class="grade">8.3 非常好</div>
                        <div class="grade-num">2,209条住客点评</div>
                        <div class="iconfont icon-rentouliangrense price"> 1,000元</div>
                        <div class="free">免费取消</div>
                        <div class="remain">仅剩2间</div>
                    </div>
                    <div class="hotel-nar">
                        <div class="iconfont icon-sanjiao-copy-copy"></div>
                    </div>
                </div>
            </a>
            <a href="javascript:void(0)">
                <div class="hotel">
                    <div class="hotel-img">
                        <img src="../resources/res/images/map/静安香格里拉大酒店.jpg">
                    </div>
                    <div class="hotel-info">
                        <h3>静安香格里拉大酒店</h3>

                        <div>
                            <div class="iconfont icon-start zan"></div>
                            <div class="iconfont icon-start zan"></div>
                            <div class="iconfont icon-start zan"></div>
                            <div class="iconfont icon-start zan"></div>
                            <div class="iconfont icon-start zan"></div>
                            <div class="iconfont icon-zan zan zan_1"></div>
                        </div>
                        <div class="grade">8.7 非常好</div>
                        <div class="grade-num">334条住客点评</div>
                        <div class="iconfont icon-rentouliangrense price"> 2,088元</div>
                    </div>
                    <div class="hotel-nar">
                        <div class="iconfont icon-sanjiao-copy-copy"></div>
                    </div>
                </div>
            </a>
        </div>
        <!-- 关闭地图的按钮 -->
        <div class="close">
            <a href="#">关闭地图 ×</a>
        </div>
        <!-- 地图、第二个筛选栏的滑入滑出按钮 -->
        <div class="showMap">
            <div id="container"></div>
            <a id="slide-btn" href="javascript:void(0)" class="slide">
                <div class="iconfont icon-sanjiao-copy"></div>
            </a>
        </div>
    </div>
</div>
</body>
<script>
    // 百度地图API功能
    var map = new BMap.Map("container");    // 创建Map实例
    map.centerAndZoom("北京", 15);      		// 用城市名设置地图中心点和缩放级别
    map.enableScrollWheelZoom(true);    	//开启鼠标滚轮缩放

    var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_BOTTOM_LEFT});	// 左上角，添加比例尺
    var top_right_navigation = new BMap.NavigationControl({
        anchor: BMAP_ANCHOR_BOTTOM_RIGHT,
        type: BMAP_NAVIGATION_CONTROL_SMALL
    }); //右上角，仅包含平移和缩放按钮
    map.addControl(top_left_control);        				//添加比例尺
    map.addControl(top_right_navigation);					//添加平移和缩放按钮

    var myIcon = new BMap.Icon("../resources/res/images/map/label.png", new BMap.Size(32, 32));		//自定义标注
    var marker;
    var sContent;
    var pts = new Array();
    for (var i = 0; i < 5; i++) {
        pts[i] = new BMap.Point(116.417 + (i * 0.01), 39.909 + (i * 0.005));
        marker = new BMap.Marker(pts[i], {icon: myIcon});   // 创建标注
        sContent =                     //信息窗口内容
            '<a href="#">'+
                '<div class="sContent-hotel-img">'+
                    '<img src="../resources/res/images/map/上海帝盛酒店.jpg">'+
                '</div>'+
                '<div class="sContent-hotel-info">'+
                    '<h3>上海帝盛酒店</h3>'+
                    '<div>'+
                        '<div class="iconfont icon-start zan"></div>'+
                        '<div class="iconfont icon-start zan"></div>'+
                        '<div class="iconfont icon-start zan"></div>'+
                        '<div class="iconfont icon-start zan"></div>'+
                        '<div class="iconfont icon-zan zan zan_1"></div>'+
                    '</div>'+
                    '<div class="sContent-grade">8.3 非常好</div>'+
                    '<div class="sContent-grade-num">334条住客点评</div>'+
                '</div>'+
            '</a>';
        var infoWindow = new BMap.InfoWindow(sContent);         // 创建信息窗口对象
        map.addOverlay(marker);                             //将标注添加到地图中
        marker.addEventListener("click", function(){
            this.openInfoWindow(infoWindow);
        });
    }
    // 让所有点在视野范围内
    map.setViewport(pts);

    // 多关键字搜索
    // var myKeys = ["景点"];
    // var local = new BMap.LocalSearch(map, {
    // 	renderOptions:{map: map, panel:"r-result"},
    // 	pageCapacity:5
    // });
    // local.searchInBounds(myKeys, map.getBounds());

    //单击获取点击的经纬度
//    map.addEventListener("click", function (e) {
//        alert(e.point.lng + "," + e.point.lat);
//    });
</script>
<script type="text/javascript" src="../resources/js/Map.js"></script>
</html>