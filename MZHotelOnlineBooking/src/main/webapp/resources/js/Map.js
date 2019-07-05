/**
 * Created by Mr.Z on 2018/8/11.
 */

// *********************************************************
// 滑动第二个筛选栏
$(document).ready(function () {
    var mapWidth = $(".Map-Container").outerWidth() - $("#select1").outerWidth();
    $("#container").css("width", mapWidth);

    $("#slide-btn").unbind('click').click(function () {
        if ($("#select2").css("display") == 'none') {
            mapWidth = $(".Map-Container").outerWidth() - $("#select1").outerWidth() - $("#select2").outerWidth() - 35;
            $("#container").animate({width: mapWidth}, 350);
            $("#select2").animate({width: 'show'}, 350);
            $("#slide-btn").html('<div class="iconfont icon-sanjiao-copy"></div>');
        } else {
            mapWidth = $(".Map-Container").outerWidth() - $("#select1").outerWidth() - 20;
            $("#select2").animate({width: 'hide'}, 350);
            $("#container").animate({width: mapWidth}, 350);
            $("#slide-btn").html('<div class="iconfont icon-sanjiao-copy-copy"></div>');
        }
    });
});

//选取第一个筛选栏信息
$(document).ready(function () {
    $("#searchForm>ul>li").click(function () {
        var cbx = $(this).find("input[type='checkbox']");
        if (cbx.is(":checked")) {
            $(this).css({"background-color": "#077812", "color": "white"});
        } else {
            $(this).css({"background-color": "#F9F9F9", "color": "#0077CC"});
        }
    });
});

// 下拉筛选条件
$(document).ready(function () {
    $("#select3").unbind('click').click(function () {
        $(this).css({"box-shadow": "0px 0px 6px #0077CC"});
        $(".dropdown-select").toggle();
    });
});
// 点击下拉菜单以外区域隐藏
window.onclick = function (event) {
    if (!event.target.matches('#select3')) {
        document.getElementById("hotel-sort").style.display = "none";
        document.getElementById("select3").style.boxShadow = "none";
    }
};
// 选择筛选条件
$(document).ready(function () {
    $(".dropdown-select a").click(function () {
        $("#selected-info").html($(".dropdown-select a").html());
    });
    $(".dropdown-select a:nth-child(2)").click(function () {
        $("#selected-info").html($(".dropdown-select a:nth-child(2)").html());
    });
    $(".dropdown-select a:nth-child(3)").click(function () {
        $("#selected-info").html($(".dropdown-select a:nth-child(3)").html());
    });
    $(".dropdown-select a:nth-child(4)").click(function () {
        $("#selected-info").html($(".dropdown-select a:nth-child(4)").html());
    });
});

// 关闭按钮
$(document).ready(function () {
    $(".close").click(function () {
        $(".Map-Background").hide();
    });
});

// 筛选栏里的hotel的hover事件
$(document).ready(function () {
    $(".hotel").hover(function () {
        $(this).children("div.hotel-info").find("h3").css({"color": "#FEBB02"});
        $(this).css({"background-color": "#F3F9FD"});
    });
    $(".hotel").mouseleave(function () {
    	$(this).children("div.hotel-info").find("h3").css({"color": "#0077CC"});
        $(this).css({"background-color": "white"});
    });
});

// 加载地图
$(document).ready(function(){
	map = new BMap.Map("container");    // 创建Map实例
    map.enableScrollWheelZoom(true);    	//开启鼠标滚轮缩放

    var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_BOTTOM_LEFT});	// 左上角，添加比例尺
    var top_right_navigation = new BMap.NavigationControl({
        anchor: BMAP_ANCHOR_BOTTOM_RIGHT,
        type: BMAP_NAVIGATION_CONTROL_SMALL
    }); //右上角，仅包含平移和缩放按钮
    map.addControl(top_left_control);        				//添加比例尺
    map.addControl(top_right_navigation);					//添加平移和缩放按钮
});

function selectHotels(sortType) {
	$.ajax({
		//几个参数需要注意一下
		type: "POST",//方法类型
//		dataType: "string",//预期服务器返回的数据类型
		url: "../ShowMapServlet" ,//url
		data: $('form').serialize(),
		success: function (result) {
			loadHotels(result,sortType);
		},
		error : function() {
			swal('提示信息','网络异常！','error');

		}
	});
}

//加载中间的酒店和地图的坐标点
function loadHotels(result, sortType){
	var hotel = $.parseJSON(result);
	
	//根据价格排序
	function sortprice(a,b){
        return a.roomMin-b.roomMin;
    }
	//根据评分降序
	function sortRating(a,b){
		return b.avgRating-a.avgRating;
	}
	
	if(sortType == 1){
		hotel.sort(sortprice);
	}
	if(sortType == 2){
		hotel.sort(sortRating);
	}
	
//	清空原来的元素
	$(".hotel").parent().remove();
	deletePoint();
	
    for(x in hotel){
    	var hotelId = hotel[x].hotelId;
    	var src = hotel[x].hotelPicture;
	    var hotelName = hotel[x].hotelName;
	    
	    var roomGrade = Number(hotel[x].roomGrade);
	    var zans = '';
	    for (var i = 0; i < roomGrade; i++) {
	        zans += '<div class="iconfont icon-start zan"></div>';
	    }
	    
	    var avgRating = Number(hotel[x].avgRating).toFixed(1);
	    if (avgRating > 9.0) {
	    	avgRating = avgRating.toString() + " 好极了";
	    } else if (avgRating > 8.0) {
	    	avgRating = avgRating.toString() + " 非常好";
	    } else if (avgRating > 7.0) {
	    	avgRating = avgRating.toString() + " 好";
	    } else if (avgRating > 6.0) {
	    	avgRating = avgRating.toString() + " 评分";
	    } else {
	    	avgRating = "暂无评分";
	    }
	    var evaluate = hotel[x].evaluationNum;
	    var price = Number(hotel[x].roomMin);

	    // 动态添加
	    $("#select2").append(
	        '<a href="../LookingroomInitServlet?hotelId='+hotelId+'"><div class="hotel">' +
	        '<div class="hotel-img">' +
	        '<img src="' + src + '">' +
	        '</div>' +
	        '<div class="hotel-info">' +
	        '<h3>' + hotelName + '</h3>' +
	        '<div>' +
	        zans +
	        '<div class="iconfont icon-zan zan zan_1"></div>' +
	        '</div>' +
	        '<div class="grade">' + avgRating + '</div>' +
	        '<div class="grade-num">' + evaluate + '条住客点评</div>' +
	        '<div class="iconfont icon-rentouliangrense price"> ' + formatCurrency(price) + '元</div>' +
	        '</div>' +
	        '<div class="hotel-nar">' +
	        '<div class="iconfont icon-sanjiao-copy-copy"></div>' +
	        '</div>' +
	        '</div></a>');
	    
	    var myIcon = new BMap.Icon("../resources/res/images/map/label.png", new BMap.Size(32, 32));		//自定义标注
	    var sContent;
	    var pts = new Array();
	    var infoWindow = new Array();
	    var marker;
	    map.centerAndZoom(hotel[x].hotelDowntown, 13);      		// 用城市名设置地图中心点和缩放级别
	    marker = new BMap.Marker(new BMap.Point(hotel[x].longitude, hotel[x].latitude), {icon: myIcon});   // 创建标注
	    sContent =                     //信息窗口内容
	        '<a href="../LookingroomInitServlet?hotelId='+hotelId+'">'+
	        '<div class="sContent-hotel-img">'+
	        '<img src="'+src+'">'+
	        '</div>'+
	        '<h3>'+hotelName+'</h3>';
	    for(var i=0; i<roomGrade; i++) {
	    	sContent +='<div class="iconfont icon-start zan"></div>';
	    }
	    sContent +=
	    	'</div>'+
	        '<div class="sContent-grade">'+avgRating+'</div>'+
	        '<div class="sContent-grade-num">'+evaluate+'条住客点评</div>'+
	        '</div></a>';
	    
	    map.addOverlay(marker);                             //将标注添加到地图中
	   
	    addClickHandler(sContent,marker);
	}
	function addClickHandler(content,marker){
		marker.addEventListener("click",function(e){
			openInfo(content,e)}
		);
	}
	function openInfo(content,e){
		var p = e.target;
		var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
		var infoWindow = new BMap.InfoWindow(content);  // 创建信息窗口对象 
		map.openInfoWindow(infoWindow,point); //开启信息窗口
	}
	function deletePoint(){
		var allOverlay = map.getOverlays();
		for (var i = 0; i < allOverlay.length -1; i++){
			map.removeOverlay(allOverlay[i]);
		}
	}
}

//点击筛选栏提交按钮，进行再搜索
$(document).ready(function(){
	$("#searchBtn").click(function(){
		$("input:checkbox:checked").each(function(){
			$(this).attr("name","checked");
		});
		selectHotels(0);
	});
});

//格式化货币 
function formatCurrency(num) {  
    num = num.toString().replace(/\$|\,/g,'');  
    if(isNaN(num))  
    num = "0";  
    sign = (num == (num = Math.abs(num)));  
    num = Math.floor(num*100+0.50000000001);  
    cents = num%100;  
    num = Math.floor(num/100).toString();  
    if(cents<10)  
    cents = "0" + cents;  
    for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)  
    num = num.substring(0,num.length-(4*i+3))+','+  
    num.substring(num.length-(4*i+3));  
    return (((sign)?'':'-') + num + '.' + cents);  
}  
