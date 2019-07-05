$(document).ready(function(){
	//当键盘键被松开时发送Ajax获取数据
	$('.search_container_one_input').keyup(function(){
		var keywords = $(this).val();
		if (keywords=="") { $('#word').hide(); return };
		$.ajax({
				url:"AutoCompleteServlet",
				data:"keywords="+keywords,
				beforeSend:function(){
					$('#word').hide();
				},
				success:function(data){
				    //拼接html
					if(data == "" || data == null){
						 $('#word').hide(); return 
					}else{
						 var res=data.split("#");
						    var html="";
							    for(var i=0;i<res.length;i++){
							     //每一个div还有鼠标移出、移入点击事件
							    
							    		html+="<div id='click_word' onclick='setSearch_onclick(this)' onmouseout='changeBackColor_out(this)' onmouseover='changeBackColor_over(this)'>"+res[i]+"</div>";
							    }
							    $("#word").html(html);
							    //显示为块级元素
							    $("#word").css("display","block");
					}
					
					
				},
				error:function(){
					$('#word').hide();
				}
		})
		
		
	})
	
	
	//点击搜索数据复制给搜索框
		$(document).on('click','.click_work',function(){
			var word = $(this).text();
			$('.search_container_one_input').val(word);
			$('#word').hide();
		})
		
		
})



//而其三种事件对应的js代码如下：
//鼠标移动到内容上
function changeBackColor_over(div){
 $(div).css("background-color","#CCCCCC");
}
//鼠标离开内容
function changeBackColor_out(div){
 $(div).css("background-color","");
}
//将点击的内容放到搜索框
function setSearch_onclick(div){
 $(".search_container_one_input").val(div.innerText);
 $("#word").css("display","none");
}