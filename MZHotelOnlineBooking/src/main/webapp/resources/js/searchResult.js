//点击右上角地图就浮现地图搜索模块
$(document).ready(function () {
    $(".rightBox_mapSearch").click(function () {
        $(".Map-Background").show();
        selectHotels(0);
    });
})

//点击左下角地图就浮现地图搜索模块
$(document).ready(function () {
    $(".map_search").click(function () {
        $(".Map-Background").show();
        selectHotels(0);
    });
})
//点击价格从低到高模块就显示酒店结果
$(document).ready(function(){
		$("#pricedowntoup").click(function(){
			$(".rightBox_navBar li").eq(0).css("background-color", "white");
			 $(".rightBox_navBar li").eq(0).css("color", "rgb(0,53,128)");
		        $(this).css("background-color", "rgb(10,178,27)");   
		        $(this).css("color", "white");   
			var currentPage = "1";
			 var strCookie = document.cookie;
			 var serchAdress = null;
		     var arrCookie = strCookie.split("; ");
		     for(var i = 0; i < arrCookie.length; i++){
		         var arr = arrCookie[i].split("=");
		         if("inputAdress" == arr[0]){
		             searchAdress = arr[1];
		         }
		     }
		     
		     
		     var behavior = $("#pricedowntoup").text();
		   
		     var arrCookie = strCookie.split("; ");
		     for(var i = 0; i < arrCookie.length; i++){
		         var arr = arrCookie[i].split("=");
		         if("behavior" == arr[0]){
		             arr[1] = behavior;
		         }
		     }
		     
		     
		     
		     document.cookie = 'currentNum=1'; 
		     
		     
//		     ************************
		     
				$.post('../SearchResultServlet',
						{searchadress:searchAdress,currentpage:currentPage,behavior:behavior},
						function(result){
							var jsonObj = $.parseJSON(result);
//							清空原来的元素
							$(".search_hotel").siblings().remove();
							
							var flag = false;
							for (var i in jsonObj) {
								flag = true;
								var src = jsonObj[i].hotelPicture;
								var hotelId = Number( jsonObj[i].hotelId);
								var hotelName = jsonObj[i].hotelName;
								var hotelType = jsonObj[i].hotelType;
								var hotelAdress = jsonObj[i].hotelAdress;
								var hotelPer = (jsonObj[i].hotelPer).substring(0,80);
								var roomMin = Number(jsonObj[i].roomMin);
								var evaSum = Number(jsonObj[i].evaSum);
								var sumScore = (Number(jsonObj[i].sumScore)).toFixed(1);
								var userName = jsonObj[i].userName;
								var userCountry = jsonObj[i].userCountry;
								var commentWord = (jsonObj[i].commentWord).substring(0,40);
								var hotelArea = jsonObj[i].hotelArea;
								var hotelProvince = jsonObj[i].hotelProvince;
								var hotelDowntown = jsonObj[i].hotelDowntown;
								var spanIcon = "";
								var point = "";
								var mapa = "";
								var remark = "";
								if(userName != ""){
									spanIcon = new String("&#9787;");
									point = new String(",");
								}
								if(hotelPer != ""){
									hotelPer += "..."
								}
								
								if(commentWord != ""){
									commentWord = '"'+commentWord+'"'+'...';
									
								}else{
									commentWord = "该酒店暂无评论！"
								}
								var hotelTypePoint = new String();;
								//酒店类型
								if("尊贵型" == hotelType){
									hotelTypePoint = "&#9679;&#9679;&#9679;&#9679;&#9679;";
									
								}else if("豪华型" == hotelType){
									hotelTypePoint = "&#9679;&#9679;&#9679;&#9679;";
								}else if("舒适型" == hotelType){
									hotelTypePoint = "&#9679;&#9679;&#9679;";
								}else if("经济型" == hotelType){
									hotelTypePoint = "&#9679;&#9679;";
								}else if("实惠型" == hotelType){
									hotelTypePoint = "&#9679;";
								}
								
								mapa = hotelArea+","+hotelDowntown;
								
								if(sumScore >= 8.6){
									remark = "极好";
								}else if(sumScore >= 8.0 && sumScore < 8.6){
									remark = "很好";
								}else if(sumScore >= 7 && sumScore < 8){
									remark = "可以";
								}else{
									remark = "一般";
								}
								
								//动态改变地址栏
		                        //$(".address").html(hotelDowntown+":"+"共"+hotelCount+"家住宿");
//								alert(hotelProvince);
								$("#searchprovince").html(hotelProvince);
								$("#searchdowntown").html(hotelDowntown);
//								if(hotelProvince == "" || hotelProvince == null){
//									$("#sp").html("");
//								}
//								if(hoteldowntown == "" || hoteldowntown == null){
//									$("#sd").html("");
//								}
								//动态加载
								$(".rightBox_containers").append(
										
										'<div class="search_hotel">'+
										'<div class="hotelId" >'+hotelId+'</div>'+
										'<img src='+src+' class="search_hotel_pic">'+
										'<div class="search_hotel_message">'+
										' <div class="shm_left">'+
										'<p class="hotel_name">'+hotelName+'<span class="hotel_type">'+hotelType+'</span><span class="hotel_type_point">'+hotelTypePoint+'</span></span></p>'+
										'<p class="look_map"><span class="look_map_icon">&#9829;</span><a href="#" class="map_a">'+mapa+'-显示在地图上</a><span class="distance_icon">&#9808;</span><span class="distance">(离中心地区11km)</span></p>'+
										'<div class="hotel_desc">'+hotelPer+'</div>'+
										'</div>'+
										' <div class="shm_right">'+
										' <span class="shm_right_text">'+remark+'</span>'+
										' <span class="shm_right_subtext">'+evaSum+'条住客点评</span>'+
										'<span class="score">'+sumScore+'</span>'+
										' <span class="shm_right_scoresubtext">住客至爱</span>'+
										' <button class="show_price ">￥'+roomMin+'</button>'+
										'</div>'+
										'<div class="clear"></div>'+
										'  <div class="shm_buttom">'+
										'<p class="shm_buttom_text"><a href="#">'+commentWord+'</a></p>'+
										'<p class="shm_buttom_submsg"><span class="shm_buttom_submsg_icon">'+spanIcon+'</span><i>'+userName+'</i><span class="county">'+point+' '+userCountry+'</span></p>'+
										'</div>'+
										'</div>'+
										' </div>'
								)
							 $.cookie("hotelTypePoint",hotelTypePoint); 

								if(hotelId==0){
									hotelId=20;
								}
							}
							
							//酒店的总数
							var hotelCount;
							//分页的底部
							var strcookie = document.cookie;//获取cookie字符串
							var arrcookie = strcookie.split("; ");//分割
							//遍历匹配
							for ( var i = 0; i < arrcookie.length; i++) {
									var arr = arrcookie[i].split("=");
									if (arr[0] == "hotelcount"){
										hotelCount = arr[1];
									}
							}
							//分页的页数
							var pageCount = Math.floor((hotelCount % 7 == 0) ? (hotelCount/7) : (hotelCount/7+1)); 
							//分页的详细信息
							if(flag){
								
								$(".rightBox_containers").append(
						      '<div class="rb_containers_bottom">'+
			                    '<div class="rb_containers_bottom_left">'+
			                        '<div class="rbcbl_words">在'+hotelDowntown+'搜索出'+hotelCount+'家住宿.</div>'+
			                    '</div>'+
			                    '<div class="rb_containers_bottom_right">'+
			                       ' <div class="rbcbr_words">未找到理想的酒店？</div>'+
			                        '<a href="../index.jsp">返回搜索页面。</a>'+
			                    '</div>'+
			                    '<div class="clear"></div>'+
			                    '<div class="rb_containers_bottom_buttom">'+
			                        '<span class="first">&#8249;</span>'+
			                        '<div class="numSet">'+
			                        	'<span class="second">1</span>'+
			                       '</div>'+
			                        '<span class="third">&#8250;</span>'+
			                        '<span class="forth">显示1---'+pageCount+'</span>'+
			                    '</div>'+
			                '</div>'
			                    )
							}
							
							//加载分页码
								for(var i = 2;i <= pageCount; i++){
									$(".numSet").append(
										'<span class="second">'+i+'</span>'
									)
								}
//								if(pageCount > 5){
//									$(".numSet").append(
//											'<span class="second">...</span>'
//									)
//								}
								
							//在相应的页面数字显示出外框
							var sEls = document.getElementsByClassName("second");
							sEls[0].style.border = "1px solid";
							sEls[0].style.color = "red";
//							var thisPage = sEls[0].innerText;
//							alert(thisPage);
					
							//在头部显示地点及总的酒店数量
							$(".address").html(hotelDowntown+":"+"共"+hotelCount+"家住宿");
						}
						
						
				);
				  if(behavior == "价格从低到高"){
				    	 behavior = $("#pricedowntoup").text("价格从高到低");
				     }else{
				    	 behavior = $("#pricedowntoup").text("价格从低到高");
				     }
		     
		})
		
		
		
		
		
		
		
		
		
})
//从首页搜索跳到本页面所加载的方法
$(document).ready(function(){
	var behavior = "热门推荐";
	var currentPage = "1";
	 var strCookie = document.cookie;
	 var serchAdress = null;
     var arrCookie = strCookie.split("; ");
     for(var i = 0; i < arrCookie.length; i++){
         var arr = arrCookie[i].split("=");
         if("inputAdress" == arr[0]){
             searchAdress = arr[1];
         }
     }

     document.cookie = 'currentNum=1'; 

		$.post('../SearchResultServlet',
				{searchadress:searchAdress,currentpage:currentPage,behavior:behavior},
				function(result){
					var jsonObj = $.parseJSON(result);

//					清空原来的元素
					$(".search_hotel").siblings().remove();
					
					var flag = false;
					for (var i in jsonObj) {
						flag = true;
						var src = jsonObj[i].hotelPicture;
						var hotelId = Number( jsonObj[i].hotelId);
						var hotelName = jsonObj[i].hotelName;
						var hotelType = jsonObj[i].hotelType;
						var hotelAdress = jsonObj[i].hotelAdress;
						var hotelPer = (jsonObj[i].hotelPer).substring(0,80);
						var roomMin = Number(jsonObj[i].roomMin);
						var evaSum = Number(jsonObj[i].evaSum);
						var sumScore = (Number(jsonObj[i].sumScore)).toFixed(1);
						var userName = jsonObj[i].userName;
						var userCountry = jsonObj[i].userCountry;
						var commentWord = (jsonObj[i].commentWord).substring(0,40);
						var hotelArea = jsonObj[i].hotelArea;
						var hotelProvince = jsonObj[i].hotelProvince;
						var hotelDowntown = jsonObj[i].hotelDowntown;
						var spanIcon = "";
						var point = "";
						var mapa = "";
						var remark = "";
						if(userName != ""){
							spanIcon = new String("&#9787;");
							point = new String(",");
						}
						if(hotelPer != ""){
							hotelPer += "..."
						}
						if(hotelId==0){
							hotelId = 1;
						}
						
						if(commentWord != ""){
							commentWord = '"'+commentWord+'"'+'...';
							
						}else{
							commentWord = "该酒店暂无评论！"
						}
						var hotelTypePoint = new String();;
						//酒店类型
						if("尊贵型" == hotelType){
							hotelTypePoint = "&#9679;&#9679;&#9679;&#9679;&#9679;";
							
						}else if("豪华型" == hotelType){
							hotelTypePoint = "&#9679;&#9679;&#9679;&#9679;";
						}else if("舒适型" == hotelType){
							hotelTypePoint = "&#9679;&#9679;&#9679;";
						}else if("经济型" == hotelType){
							hotelTypePoint = "&#9679;&#9679;";
						}else if("实惠型" == hotelType){
							hotelTypePoint = "&#9679;";
						}
						
						mapa = hotelArea+","+hotelDowntown;
						
						if(sumScore >= 8.6){
							remark = "极好";
						}else if(sumScore >= 8.0 && sumScore < 8.6){
							remark = "很好";
						}else if(sumScore >= 7 && sumScore < 8){
							remark = "可以";
						}else{
							remark = "一般";
						}
						
						//动态改变地址栏
                        //$(".address").html(hotelDowntown+":"+"共"+hotelCount+"家住宿");
//						alert(hotelProvince);
						$("#searchprovince").html(hotelProvince);
						$("#searchdowntown").html(hotelDowntown);
//						if(hotelProvince == "" || hotelProvince == null){
//							$("#sp").html("");
//						}
//						if(hoteldowntown == "" || hoteldowntown == null){
//							$("#sd").html("");
//						}
						//动态加载
						$(".rightBox_containers").append(
								
								'<div class="search_hotel">'+
								'<div class="hotelId" >'+hotelId+'</div>'+
								'<img src='+src+' class="search_hotel_pic">'+
								'<div class="search_hotel_message">'+
								' <div class="shm_left">'+
								'<p class="hotel_name">'+hotelName+'<span class="hotel_type">'+hotelType+'</span><span class="hotel_type_point">'+hotelTypePoint+'</span></span></p>'+
								'<p class="look_map"><span class="look_map_icon">&#9829;</span><a href="#" class="map_a">'+mapa+'-显示在地图上</a><span class="distance_icon">&#9808;</span><span class="distance">(离中心地区11km)</span></p>'+
								'<div class="hotel_desc">'+hotelPer+'</div>'+
								'</div>'+
								' <div class="shm_right">'+
								' <span class="shm_right_text">'+remark+'</span>'+
								' <span class="shm_right_subtext">'+evaSum+'条住客点评</span>'+
								'<span class="score">'+sumScore+'</span>'+
								' <span class="shm_right_scoresubtext">住客至爱</span>'+
								' <button class="show_price ">￥'+roomMin+'</button>'+
								'</div>'+
								'<div class="clear"></div>'+
								'  <div class="shm_buttom">'+
								'<p class="shm_buttom_text"><a href="#">'+commentWord+'</a></p>'+
								'<p class="shm_buttom_submsg"><span class="shm_buttom_submsg_icon">'+spanIcon+'</span><i>'+userName+'</i><span class="county">'+point+' '+userCountry+'</span></p>'+
								'</div>'+
								'</div>'+
								' </div>'
						)
					}
					
					//设置hotelTypePoint星星的cookie
					 $.cookie("hotelTypePoint",hotelTypePoint); 
					
					//酒店的总数
					var hotelCount;
					//分页的底部
					var strcookie = document.cookie;//获取cookie字符串
					var arrcookie = strcookie.split("; ");//分割
					//遍历匹配
					for ( var i = 0; i < arrcookie.length; i++) {
							var arr = arrcookie[i].split("=");
							if (arr[0] == "hotelcount"){
								hotelCount = arr[1];
							}
					}
					//分页的页数
					var pageCount = Math.floor((hotelCount % 7 == 0) ? (hotelCount/7) : (hotelCount/7+1)); 
					//分页的详细信息
					if(flag){
						
						$(".rightBox_containers").append(
				      '<div class="rb_containers_bottom">'+
	                    '<div class="rb_containers_bottom_left">'+
	                        '<div class="rbcbl_words">在'+hotelDowntown+'搜索出'+hotelCount+'家住宿.</div>'+
	                    '</div>'+
	                    '<div class="rb_containers_bottom_right">'+
	                       ' <div class="rbcbr_words">未找到理想的酒店？</div>'+
	                        '<a href="../index.jsp">返回搜索页面。</a>'+
	                    '</div>'+
	                    '<div class="clear"></div>'+
	                    '<div class="rb_containers_bottom_buttom">'+
	                        '<span class="first">&#8249;</span>'+
	                        '<div class="numSet">'+
	                        	'<span class="second">1</span>'+
	                       '</div>'+
	                        '<span class="third">&#8250;</span>'+
	                        '<span class="forth">显示1---'+pageCount+'</span>'+
	                    '</div>'+
	                '</div>'
	                    )
					}
					
					//加载分页码
						for(var i = 2;i <= pageCount; i++){
							$(".numSet").append(
								'<span class="second">'+i+'</span>'
							)
						}
//						if(pageCount > 5){
//							$(".numSet").append(
//									'<span class="second">...</span>'
//							)
//						}
						
					//在相应的页面数字显示出外框
					var sEls = document.getElementsByClassName("second");
					sEls[0].style.border = "1px solid";
					sEls[0].style.color = "red";
//					var thisPage = sEls[0].innerText;
//					alert(thisPage);
			
					//在头部显示地点及总的酒店数量
					$(".address").html(hotelDowntown+":"+"共"+hotelCount+"家住宿");
				}
		);
});

	//点击当前数字显示相关的酒店结果页面
$(document).ready(function () {
//	$("div").delegate("p","click",function()
	$("div").delegate('.second','click',function(evt){
		 	evt.stopPropagation(); 			//阻止事件冒泡
			var clickNum = $(this).text();
			
//			alert($(this).index());
			document.cookie = "currentNum="+clickNum;

			
//			*****************************
			var behavior = "";
			 var strCookie = document.cookie;
			 var serchAdress = null;
		     var arrCookie = strCookie.split("; ");
		     for(var i = 0; i < arrCookie.length; i++){
		         var arr = arrCookie[i].split("=");
		         if("behavior" == arr[0]){
		             behavior = arr[1];
		         }
		     }
			
//			*****************************
			
			
			
			
//				清空原来的元素
				$(".search_hotel").siblings().remove();
			
//			//隐藏酒店
//		$(".search_hotel").remove();
//			*********************************
			$.post('../SearchResultServlet',
					{searchadress:searchAdress,currentpage:clickNum,behavior:behavior},
					function(result){
						var jsonObj = $.parseJSON(result)
						var flag = false;
						for (var i in jsonObj) {
							flag = true;
							var src = jsonObj[i].hotelPicture;
							var hotelId = Number( jsonObj[i].hotelId);
							var hotelName = jsonObj[i].hotelName;
							var hotelType = jsonObj[i].hotelType;
							var hotelAdress = jsonObj[i].hotelAdress;
							var hotelPer = (jsonObj[i].hotelPer).substring(0,80);
							var roomMin = Number(jsonObj[i].roomMin);
							var evaSum = Number(jsonObj[i].evaSum);
							var sumScore = (Number(jsonObj[i].sumScore)).toFixed(1);
							var userName = jsonObj[i].userName;
							var userCountry = jsonObj[i].userCountry;
							var commentWord = (jsonObj[i].commentWord).substring(0,40);
							var hotelArea = jsonObj[i].hotelArea;
							var hotelDowntown = jsonObj[i].hotelDowntown;
							var spanIcon = "";
							var point = "";
							var mapa = "";
							var remark = "";
							if(userName != ""){
								spanIcon = new String("&#9787;");
								point = new String(",");
							}
							if(hotelPer != ""){
								hotelPer += "..."
							}
							if(hotelId==0){
								hotelId=20;
							}
							if(commentWord != ""){
								commentWord = '"'+commentWord+'"'+'...';
								
							}else{
								commentWord = "该酒店暂无评论！"
							}
							var hotelTypePoint = new String();;
							//酒店类型
							if("尊贵型" == hotelType){
								hotelTypePoint = "&#9679;&#9679;&#9679;&#9679;&#9679;";
								
							}else if("豪华型" == hotelType){
								hotelTypePoint = "&#9679;&#9679;&#9679;&#9679;";
							}else if("舒适型" == hotelType){
								hotelTypePoint = "&#9679;&#9679;&#9679;";
							}else if("经济型" == hotelType){
								hotelTypePoint = "&#9679;&#9679;";
							}else if("实惠型" == hotelType){
								hotelTypePoint = "&#9679;";
							}
							
							mapa = hotelArea+","+hotelDowntown;
							
							if(sumScore >= 8.6){
								remark = "极好";
							}else if(sumScore >= 8.0 && sumScore < 8.6){
								remark = "很好";
							}else if(sumScore >= 7 && sumScore < 8){
								remark = "可以";
							}else{
								remark = "一般";
							}
							
							//动态加载
							$(".rightBox_containers").append(
									
									'<div class="search_hotel">'+
									'<div class="hotelId" >'+hotelId+'</div>'+
									'<img src='+src+' class="search_hotel_pic" >'+
									'<div class="search_hotel_message">'+
									' <div class="shm_left">'+
									'<p class="hotel_name">'+hotelName+'<span class="hotel_type">'+hotelType+'</span><span class="hotel_type_point">'+hotelTypePoint+'</span></span></p>'+
									'<p class="look_map"><span class="look_map_icon">&#9829;</span><a href="#" class="map_a">'+mapa+'-显示在地图上</a><span class="distance_icon">&#9808;</span><span class="distance">(离中心地区11km)</span></p>'+
									'<div class="hotel_desc">'+hotelPer+'</div>'+
									'</div>'+
									' <div class="shm_right">'+
									' <span class="shm_right_text">'+remark+'</span>'+
									' <span class="shm_right_subtext">'+evaSum+'条住客点评</span>'+
									'<span class="score">'+sumScore+'</span>'+
									' <span class="shm_right_scoresubtext">住客至爱</span>'+
									' <button class="show_price ">￥'+roomMin+'</button>'+
									'</div>'+
									'<div class="clear"></div>'+
									'  <div class="shm_buttom">'+
									'<p class="shm_buttom_text"><a href="#">'+commentWord+'</a></p>'+
									'<p class="shm_buttom_submsg"><span class="shm_buttom_submsg_icon">'+spanIcon+'</span><i>'+userName+'</i><span class="county">'+point+' '+userCountry+'</span></p>'+
									'</div>'+
									'</div>'+
									' </div>'
							)

						}
						 $.cookie("hotelTypePoint",hotelTypePoint); 

						
						
//						*******************改**************************
						
						//酒店的总数
						var hotelCount;
						//分页的底部
						var strcookie = document.cookie;//获取cookie字符串
						var arrcookie = strcookie.split("; ");//分割
						//遍历匹配
						for ( var i = 0; i < arrcookie.length; i++) {
								var arr = arrcookie[i].split("=");
								if (arr[0] == "hotelcount"){
									hotelCount = arr[1];
								}
						}
						//分页的页数
						var pageCount = Math.floor((hotelCount % 7 == 0) ? (hotelCount/7) : (hotelCount/7+1)); 
						//分页的详细信息
						if(flag){
							
							$(".rightBox_containers").append(
					      '<div class="rb_containers_bottom">'+
		                    '<div class="rb_containers_bottom_left">'+
		                        '<div class="rbcbl_words">在'+hotelDowntown+'搜索出'+hotelCount+'家住宿.</div>'+
		                    '</div>'+
		                    '<div class="rb_containers_bottom_right">'+
		                       ' <div class="rbcbr_words">未找到理想的酒店？</div>'+
		                        '<a href="../index.jsp">返回搜索页面。</a>'+
		                    '</div>'+
		                    '<div class="clear"></div>'+
		                    '<div class="rb_containers_bottom_buttom">'+
		                        '<span class="first">&#8249;</span>'+
		                        '<div class="numSet">'+
		                        	'<span class="second">1</span>'+
		                       '</div>'+
		                        '<span class="third">&#8250;</span>'+
		                        '<span class="forth">显示1---'+pageCount+'</span>'+
		                    '</div>'+
		                '</div>'
		                    )
						}
						
						//加载分页码
							for(var i = 2;i <= pageCount; i++){
								$(".numSet").append(
									'<span class="second">'+i+'</span>'
								)
							}
//							if(pageCount > 5){
//								$(".numSet").append(
//										'<span class="second">...</span>'
//								)
//							}
							
						
//						*******************改**************************
						
//						+++++++++++++++++
							
							//在相应的页面数字显示出外框
							var sEls = document.getElementsByClassName("second");
							for(var x = 0;x < sEls.length;x ++){
								sEls[x].style.border = "none";
								sEls[x].style.color = "black";
							}
							for(var c = 0;c < sEls.length;c ++){
								if(sEls[c].innerHTML == clickNum){
									sEls[c].style.border = "1px solid";
									sEls[c].style.color = "red";
								}
							}
//							*********************************
							
//						++++++++++++++++
						
							
							
					}
					
			);
			
			
		
			
			
	})
})

//点击<
$(document).ready(function(){
	$("div").delegate('.first','click',function(evt){
	 	    evt.stopPropagation(); 			//阻止事件冒泡
			var currentNumber;
//			alert($(this).index());
			//获取指定名称的cookie的值
			var arrStr = document.cookie.split("; ");

            for (var i = 0; i < arrStr.length; i++) {

                var temp = arrStr[i].split("=");

                if (temp[0] == "currentNum") {

                    currentNumber =  Number(temp[1]);

                }

            }
//            alert(currentNumber);
            if(currentNumber == 1){
            	swal('提示信息','当前页为首页！','error');
            }else{
            	/*document.cookie = currentNum+"="+escape(currentNumber-1);*/
            	document.cookie = "currentNum="+(currentNumber-1);
            	
            	
//    			*****************************
    			var behavior = "";
    			 var strCookie = document.cookie;
    			 var serchAdress = null;
    		     var arrCookie = strCookie.split("; ");
    		     for(var i = 0; i < arrCookie.length; i++){
    		         var arr = arrCookie[i].split("=");
    		         if("behavior" == arr[0]){
    		             behavior = arr[1];
    		         }
    		     }
    			
//    			*****************************
            	
// 				清空原来的元素
 				$(".search_hotel").siblings().remove();
    		     
//            	//隐藏酒店
//        		$(".search_hotel").remove();
        		var currentNumStr = (currentNumber-1);
//        		alert(currentNumStr);
//        		alert(typeof currentNumStr);
//    			*********************************
    			
    			$.post('../SearchResultServlet',
    					{searchadress:searchAdress,currentpage:currentNumStr,behavior:behavior},
    					function(result){
    						var jsonObj = $.parseJSON(result)
    						var flag = false;
    						for (var i in jsonObj) {
    							flag = true;
    							var src = jsonObj[i].hotelPicture;
    							var hotelId = Number( jsonObj[i].hotelId);
    							var hotelName = jsonObj[i].hotelName;
    							var hotelType = jsonObj[i].hotelType;
    							var hotelAdress = jsonObj[i].hotelAdress;
    							var hotelPer = (jsonObj[i].hotelPer).substring(0,80);
    							var roomMin = Number(jsonObj[i].roomMin);
    							var evaSum = Number(jsonObj[i].evaSum);
    							var sumScore = (Number(jsonObj[i].sumScore)).toFixed(1);
    							var userName = jsonObj[i].userName;
    							var userCountry = jsonObj[i].userCountry;
    							var commentWord = (jsonObj[i].commentWord).substring(0,40);
    							var hotelArea = jsonObj[i].hotelArea;
    							var hotelDowntown = jsonObj[i].hotelDowntown;
    							var spanIcon = "";
    							var point = "";
    							var mapa = "";
    							var remark = "";
    							if(userName != ""){
    								spanIcon = new String("&#9787;");
    								point = new String(",");
    							}
    							if(hotelPer != ""){
    								hotelPer += "..."
    							}
    							if(hotelId==0){
    								hotelId=20;
    							}
    							if(commentWord != ""){
    								commentWord = '"'+commentWord+'"'+'...';
    								
    							}else{
    								commentWord = "该酒店暂无评论！"
    							}
    							var hotelTypePoint = new String();;
    							//酒店类型
    							if("尊贵型" == hotelType){
    								hotelTypePoint = "&#9679;&#9679;&#9679;&#9679;&#9679;";
    								
    							}else if("豪华型" == hotelType){
    								hotelTypePoint = "&#9679;&#9679;&#9679;&#9679;";
    							}else if("舒适型" == hotelType){
    								hotelTypePoint = "&#9679;&#9679;&#9679;";
    							}else if("经济型" == hotelType){
    								hotelTypePoint = "&#9679;&#9679;";
    							}else if("实惠型" == hotelType){
    								hotelTypePoint = "&#9679;";
    							}
    							
    							mapa = hotelArea+","+hotelDowntown;
    							
    							if(sumScore >= 8.6){
    								remark = "极好";
    							}else if(sumScore >= 8.0 && sumScore < 8.6){
    								remark = "很好";
    							}else if(sumScore >= 7 && sumScore < 8){
    								remark = "可以";
    							}else{
    								remark = "一般";
    							}
    							
    							//动态加载
    							$(".rightBox_containers").append(
    									
    									'<div class="search_hotel">'+
    									'<img src='+src+' class="search_hotel_pic">'+
    									'<div class="search_hotel_message">'+
    									' <div class="shm_left">'+
    									'<p class="hotel_name">'+hotelName+'<span class="hotel_type">'+hotelType+'</span><span class="hotel_type_point">'+hotelTypePoint+'</span></span></p>'+
    									'<p class="look_map"><span class="look_map_icon">&#9829;</span><a href="#" class="map_a">'+mapa+'-显示在地图上</a><span class="distance_icon">&#9808;</span><span class="distance">(离中心地区11km)</span></p>'+
    									'<div class="hotel_desc">'+hotelPer+'</div>'+
    									'</div>'+
    									' <div class="shm_right">'+
    									' <span class="shm_right_text">'+remark+'</span>'+
    									' <span class="shm_right_subtext">'+evaSum+'条住客点评</span>'+
    									'<span class="score">'+sumScore+'</span>'+
    									' <span class="shm_right_scoresubtext">住客至爱</span>'+
    									' <button class="show_price ">￥'+roomMin+'</button>'+
    									'</div>'+
    									'<div class="clear"></div>'+
    									'  <div class="shm_buttom">'+
    									'<p class="shm_buttom_text"><a href="#">'+commentWord+'</a></p>'+
    									'<p class="shm_buttom_submsg"><span class="shm_buttom_submsg_icon">'+spanIcon+'</span><i>'+userName+'</i><span class="county">'+point+' '+userCountry+'</span></p>'+
    									'</div>'+
    									'</div>'+
    									' </div>'
    							)
    						}
    						 $.cookie("hotelTypePoint",hotelTypePoint); 

    						
//    						*******************改**************************
    						
    						//酒店的总数
    						var hotelCount;
    						//分页的底部
    						var strcookie = document.cookie;//获取cookie字符串
    						var arrcookie = strcookie.split("; ");//分割
    						//遍历匹配
    						for ( var i = 0; i < arrcookie.length; i++) {
    								var arr = arrcookie[i].split("=");
    								if (arr[0] == "hotelcount"){
    									hotelCount = arr[1];
    								}
    						}
    						//分页的页数
    						var pageCount = Math.floor((hotelCount % 7 == 0) ? (hotelCount/7) : (hotelCount/7+1)); 
    						//分页的详细信息
    						if(flag){
    							
    							$(".rightBox_containers").append(
    					      '<div class="rb_containers_bottom">'+
    		                    '<div class="rb_containers_bottom_left">'+
    		                        '<div class="rbcbl_words">在'+hotelDowntown+'搜索出'+hotelCount+'家住宿.</div>'+
    		                    '</div>'+
    		                    '<div class="rb_containers_bottom_right">'+
    		                       ' <div class="rbcbr_words">未找到理想的酒店？</div>'+
    		                        '<a href="../index.jsp">返回搜索页面。</a>'+
    		                    '</div>'+
    		                    '<div class="clear"></div>'+
    		                    '<div class="rb_containers_bottom_buttom">'+
    		                        '<span class="first">&#8249;</span>'+
    		                        '<div class="numSet">'+
    		                        	'<span class="second">1</span>'+
    		                       '</div>'+
    		                        '<span class="third">&#8250;</span>'+
    		                        '<span class="forth">显示1---'+pageCount+'</span>'+
    		                    '</div>'+
    		                '</div>'
    		                    )
    						}
    						
    						//加载分页码
    							for(var i = 2;i <= pageCount; i++){
    								$(".numSet").append(
    									'<span class="second">'+i+'</span>'
    								)
    							}
//    							if(pageCount > 5){
//    								$(".numSet").append(
//    										'<span class="second">...</span>'
//    								)
//    							}
    							
    						
//    						*******************改**************************
//    			    			**************************
    			    			
    			    			//在相应的页面数字显示出外框
    			    			var sEls = document.getElementsByClassName("second");
    			    			for(var x = 0;x < sEls.length;x ++){
    			    				sEls[x].style.border = "none";
    			    				sEls[x].style.color = "black";
    			    			}
    			    			for(var c = 0;c < sEls.length;c ++){
    			    				if(sEls[c].innerHTML == (currentNumber-1)){
    			    					sEls[c].style.border = "1px solid";
    			    					sEls[c].style.color = "red";
    			    				}
    			    			}
    			    			
//    			    			**************************
    						
    						
 					
    					}
    					
    			);
    			
//    			*********************************
////    			**************************
//    			
//    			//在相应的页面数字显示出外框
//    			var sEls = document.getElementsByClassName("second");
//    			for(var x = 0;x < sEls.length;x ++){
//    				sEls[x].style.border = "none";
//    				sEls[x].style.color = "black";
//    			}
//    			for(var c = 0;c < sEls.length;c ++){
//    				if(sEls[c].innerHTML == (currentNumber-1)){
//    					sEls[c].style.border = "1px solid";
//    					sEls[c].style.color = "red";
//    				}
//    			}
//    			
////    			**************************
            	
            }
            
            
		})
})

//点击>
$(document).ready(function(){
	$("div").delegate('.third','click',function(evt){
	 	    evt.stopPropagation(); 			//阻止事件冒泡
			var currentNumber = 0;
			
			//获取指定名称的cookie的值
			var arrStr = document.cookie.split("; ");

            for (var i = 0; i < arrStr.length; i++) {

                var temp = arrStr[i].split("=");

                if (temp[0] == "currentNum") {

                    currentNumber = Number(temp[1]);

                }

            }
            
        	//酒店的总数
			var hotelCount;
			//分页的底部
			var strcookie = document.cookie;//获取cookie字符串
			var arrcookie = strcookie.split("; ");//分割
			//遍历匹配
			for ( var i = 0; i < arrcookie.length; i++) {
					var arr = arrcookie[i].split("=");
					if (arr[0] == "hotelcount"){
						hotelCount = arr[1];
					}
			}
			//分页的页数
			var pageCount = Math.floor((hotelCount % 7 == 0) ? (hotelCount/7) : (hotelCount/7+1)); 
            
//            alert(currentNumber);
//            alert(typeof currentNumber);
            if(currentNumber == pageCount){
            	swal('提示信息','当前页为最后一页！','error');
            }else{
            	/*document.cookie = currentNum+"="+escape(currentNumber-1);*/
            	document.cookie = "currentNum="+(currentNumber+1);
            	
            	
//    			*****************************
    			var behavior = "";
    			 var strCookie = document.cookie;
    			 var serchAdress = null;
    		     var arrCookie = strCookie.split("; ");
    		     for(var i = 0; i < arrCookie.length; i++){
    		         var arr = arrCookie[i].split("=");
    		         if("behavior" == arr[0]){
    		             behavior = arr[1];
    		         }
    		     }
    			
//    			*****************************
            	
            	
            	
//  				清空原来的元素
  				$(".search_hotel").siblings().remove();
        		var currentNumStr = (currentNumber+1);
//        		alert(currentNumStr);
//        		alert(typeof currentNumStr);
//    			*********************************
    			
    			$.post('../SearchResultServlet',
    					{searchadress:searchAdress,currentpage:currentNumStr,behavior:behavior},
    					function(result){
    						var jsonObj = $.parseJSON(result)
    						var flag = false;
    						for (var i in jsonObj) {
    							flag = true;
    							var src = jsonObj[i].hotelPicture;
    							var hotelId = Number( jsonObj[i].hotelId);
    							var hotelName = jsonObj[i].hotelName;
    							var hotelType = jsonObj[i].hotelType;
    							var hotelAdress = jsonObj[i].hotelAdress;
    							var hotelPer = (jsonObj[i].hotelPer).substring(0,80);
    							var roomMin = Number(jsonObj[i].roomMin);
    							var evaSum = Number(jsonObj[i].evaSum);
    							var sumScore = (Number(jsonObj[i].sumScore)).toFixed(1);
    							var userName = jsonObj[i].userName;
    							var userCountry = jsonObj[i].userCountry;
    							var commentWord = (jsonObj[i].commentWord).substring(0,40);
    							var hotelArea = jsonObj[i].hotelArea;
    							var hotelDowntown = jsonObj[i].hotelDowntown;
    							var spanIcon = "";
    							var point = "";
    							var mapa = "";
    							var remark = "";
    							if(userName != ""){
    								spanIcon = new String("&#9787;");
    								point = new String(",");
    							}
    							if(hotelPer != ""){
    								hotelPer += "..."
    							}
    							if(hotelId==0){
    								hotelId=20;
    							}
    							if(commentWord != ""){
    								commentWord = '"'+commentWord+'"'+'...';
    								
    							}else{
    								commentWord = "该酒店暂无评论！"
    							}
    							var hotelTypePoint = new String();;
    							//酒店类型
    							if("尊贵型" == hotelType){
    								hotelTypePoint = "&#9679;&#9679;&#9679;&#9679;&#9679;";
    								
    							}else if("豪华型" == hotelType){
    								hotelTypePoint = "&#9679;&#9679;&#9679;&#9679;";
    							}else if("舒适型" == hotelType){
    								hotelTypePoint = "&#9679;&#9679;&#9679;";
    							}else if("经济型" == hotelType){
    								hotelTypePoint = "&#9679;&#9679;";
    							}else if("实惠型" == hotelType){
    								hotelTypePoint = "&#9679;";
    							}
    							
    							mapa = hotelArea+","+hotelDowntown;
    							
    							if(sumScore >= 8.6){
    								remark = "极好";
    							}else if(sumScore >= 8.0 && sumScore < 8.6){
    								remark = "很好";
    							}else if(sumScore >= 7 && sumScore < 8){
    								remark = "可以";
    							}else{
    								remark = "一般";
    							}
    							
    							//动态加载
    							$(".rightBox_containers").append(
    									
    									'<div class="search_hotel">'+
    									'<img src='+src+' class="search_hotel_pic">'+
    									'<div class="search_hotel_message">'+
    									' <div class="shm_left">'+
    									'<p class="hotel_name">'+hotelName+'<span class="hotel_type">'+hotelType+'</span><span class="hotel_type_point">'+hotelTypePoint+'</span></span></p>'+
    									'<p class="look_map"><span class="look_map_icon">&#9829;</span><a href="#" class="map_a">'+mapa+'-显示在地图上</a><span class="distance_icon">&#9808;</span><span class="distance">(离中心地区11km)</span></p>'+
    									'<div class="hotel_desc">'+hotelPer+'</div>'+
    									'</div>'+
    									' <div class="shm_right">'+
    									' <span class="shm_right_text">'+remark+'</span>'+
    									' <span class="shm_right_subtext">'+evaSum+'条住客点评</span>'+
    									'<span class="score">'+sumScore+'</span>'+
    									' <span class="shm_right_scoresubtext">住客至爱</span>'+
    									' <button class="show_price ">￥'+roomMin+'</button>'+
    									'</div>'+
    									'<div class="clear"></div>'+
    									'  <div class="shm_buttom">'+
    									'<p class="shm_buttom_text"><a href="#">'+commentWord+'</a></p>'+
    									'<p class="shm_buttom_submsg"><span class="shm_buttom_submsg_icon">'+spanIcon+'</span><i>'+userName+'</i><span class="county">'+point+' '+userCountry+'</span></p>'+
    									'</div>'+
    									'</div>'+
    									' </div>'
    							)
    						}
    						 $.cookie("hotelTypePoint",hotelTypePoint); 

    						
    						
    						//酒店的总数
    						var hotelCount;
    						//分页的底部
    						var strcookie = document.cookie;//获取cookie字符串
    						var arrcookie = strcookie.split("; ");//分割
    						//遍历匹配
    						for ( var i = 0; i < arrcookie.length; i++) {
    								var arr = arrcookie[i].split("=");
    								if (arr[0] == "hotelcount"){
    									hotelCount = arr[1];
    								}
    						}
    						//分页的页数
    						var pageCount = Math.floor((hotelCount % 7 == 0) ? (hotelCount/7) : (hotelCount/7+1)); 
    						//分页的详细信息
    						if(flag){
    							
    							$(".rightBox_containers").append(
    					      '<div class="rb_containers_bottom">'+
    		                    '<div class="rb_containers_bottom_left">'+
    		                        '<div class="rbcbl_words">在'+hotelDowntown+'搜索出'+hotelCount+'家住宿.</div>'+
    		                    '</div>'+
    		                    '<div class="rb_containers_bottom_right">'+
    		                       ' <div class="rbcbr_words">未找到理想的酒店？</div>'+
    		                        '<a href="../index.jsp">返回搜索页面。</a>'+
    		                    '</div>'+
    		                    '<div class="clear"></div>'+
    		                    '<div class="rb_containers_bottom_buttom">'+
    		                        '<span class="first">&#8249;</span>'+
    		                        '<div class="numSet">'+
    		                        	'<span class="second">1</span>'+
    		                       '</div>'+
    		                        '<span class="third">&#8250;</span>'+
    		                        '<span class="forth">显示1---'+pageCount+'</span>'+
    		                    '</div>'+
    		                '</div>'
    		                    )
    						}
    						
    						//加载分页码
    							for(var i = 2;i <= pageCount; i++){
    								$(".numSet").append(
    									'<span class="second">'+i+'</span>'
    								)
    							}
//    							if(pageCount > 5){
//    								$(".numSet").append(
//    										'<span class="second">...</span>'
//    								)
//    							}
    							
    						
//    						*******************改**************************
//    			    			**************************
    			    			
    			    			//在相应的页面数字显示出外框
    			    			var sEls = document.getElementsByClassName("second");
    			    			for(var x = 0;x < sEls.length;x ++){
    			    				sEls[x].style.border = "none";
    			    				sEls[x].style.color = "black";
    			    			}
    			    			for(var c = 0;c < sEls.length;c ++){
    			    				if(sEls[c].innerHTML == (currentNumber+1)){
    			    					sEls[c].style.border = "1px solid";
    			    					sEls[c].style.color = "red";
    			    				}
    			    			}
    			    			
//    			    			**************************
    						
    						
 					
    					}
    					
    			);
    			
//    			*********************************
//    			**********************************
    			
//    			
//    			//在相应的页面数字显示出外框
//    			var sEls = document.getElementsByClassName("second");
//    			for(var x = 0;x < sEls.length;x ++){
//    				sEls[x].style.border = "none";
//    				sEls[x].style.color = "black";
//    			}
//    			for(var c = 0;c < sEls.length;c ++){
//    				if(sEls[c].innerHTML == (currentNumber+1)){
//    					sEls[c].style.border = "1px solid";
//    					sEls[c].style.color = "red";
//    				}
//    			}
    			
    			
    			
            	
            }
            
            
		})
})


//点击图片就将酒店ID保存到cookie中
$(document).ready(function(){
	var hotelId = 20;
	//点击图片事件
//	$(".search_hotel_pic").click(function(){
	$("div").delegate('.search_hotel_pic','click',function(evt){
 	    evt.stopPropagation(); 			//阻止事件冒泡
 	    
 	    for(var i = 0;i < 7; i ++){
 	    if($(".search_hotel").eq(i).css("background-color")  == "rgb(233, 240, 250)"){
 	    	document.cookie = "hotelId="+($(".hotelId").eq(i).html());
 	    	 hotelId = $(".hotelId").eq(i).html();
 	    	var hotelname = ($(".hotel_name").eq(i).html()).split('<')[0];
 	    	document.cookie = "hotelName="+(hotelname);
 	    	} 
 	    }

 	    
 	    //将搜特价模块的信息放进cookie中
//  	    document.cookie = "destination="+$(".text1").val();
//  	    document.cookie = "checkInDate="+$(".datein").attr('placeholder');
//  	    document.cookie = "checkOutDate="+$(".dateout").attr('placeholder');
// // 	    alert($("#adults").text());
//  	    document.cookie = "adultNum="+$("#adults").text();
// 	    document.cookie = "childNum="+$(".childnum > span").html();
// 	    document.cookie = "roomNum="+$(".roomnum > span").html();
 	    
 	    
 	    
// 	   var url =servletName?参数名=值,多个参数之间用&连接
 	   window.location.href="../LookingroomInitServlet?hotelId="+hotelId;     //在同当前窗口中打开窗口1233
	})
})

//点击显示在地图上的链接就浮现地图模块
$(document).ready(function () {
	$("div").delegate('.map_a','click',function(evt){
 	    evt.stopPropagation(); 			//阻止事件冒泡
 	   $(".Map-Background").show();
       selectHotels(0);
	});
//    $(".map_a").click(function () {
//        $(".Map-Background").show();
//        selectHotels(0);
//    });
})