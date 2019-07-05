$(document).ready(function(){
	var calenderdate = new Date();
    var calenderdateout = new Date();
    //响应日历的向前翻页事件
    $(".calenderin>.bodyright>.next").click(function(){
        var year = calenderdate.getFullYear();
        var month = calenderdate.getMonth()+1;
        if(month==(new Date().getMonth()+3)&&year==(new Date().getFullYear()+1)){
            return false;
        }
        month+=2;
        if(month ==14){
            month = 2;
            year++;
        }
        if(month == 13){
            month = 1;
            year++;
        }
        calenderdate = new Date(year,month,0)
        initcalender(year,month);
    });
//响应日历的向前翻页事件，为当前月则不翻
    $(".calenderin>.bodyleft>.pre").click(function(){
        var year = calenderdate.getFullYear();
        var month = calenderdate.getMonth()+1;
        if(month==(new Date().getMonth()+1)&&year==(new Date().getFullYear())){
            return false;
        }
        month-=2;
        if(month ==0){
            month = 12;
            year--;
        }
        if(month == (-1)){
            month==11;
            year--;
        }
        calenderdate = new Date(year,month,0)
        initcalender(year,month);
    });

    //叉掉日历
    $(".header>.icon-cha2").hover(function(){
        $(".header>.icon-cha2").css({
            "color" : "red"
        })
    });
    $(".header>.icon-cha2").mouseleave(function(){
        $(".header>.icon-cha2").css({
            "color" : "white"
        })
    });
    $(".calenderin>.header>.icon-cha2").click(function(){
        $(".calenderin").fadeToggle("slow");
    });
    $(".calenderin>.indate").click(function(){
        $(".calenderin").fadeToggle("slow");
    });

    $(".calenderout>.header>.icon-cha2").click(function(){
        $(".calenderout").fadeToggle("slow");
    });
    $(".calenderout>.indate").click(function(){
        $(".calenderout").fadeToggle("slow");
    });


    function initimg(){
        $(".img1>img:nth-child(1)").attr('src',imgs[0]);
        $(".manyimg>li").eq(0).css({
            "border-color": "#0077cc"
        });
        for(var i=0;i<51;i++){
            $(".manyimg li img:nth-child(1)").eq(i).attr('src',imgs[i]);
        }
    };


    initcalender(0,0);
    var day;
    function initcalender(calenderyearnow,calendermonthnow){
        if(calenderyearnow==0){
            var datenow = new Date();
            day = datenow.getDate();
        }else{
            var datenow = new Date(calenderyearnow,calendermonthnow,0)
        }

        var yearnow = datenow.getFullYear();
        var monthnow = datenow.getMonth()+1;
        var yearnowright=yearnow;
        var monthnowright=monthnow+1;
        if(monthnowright==13){
            monthnowright=1;
            yearnowright++;
        }
        //此月的第一天是星期几，返回是0的话表示星期日
        var day_begin = new Date(datenow.setDate(1)).getDay();
        var day_begin_right =  new Date((new Date(yearnowright,monthnowright,0)).setDate(1)).getDay();
        if(day_begin_right==7){
            day_begin_right=0;
        }
        //此月总天数
        var month_day = new Date(yearnow, monthnow, 0).getDate();
        var month_day_right = new Date(yearnowright, monthnowright, 0).getDate();

        $(".calenderin>.bodyleft h3").text(yearnow+"年"+monthnow+"月");
        $(".calenderin>.bodyright h3").text(yearnowright+"年"+monthnowright+"月");
        for(var i=7;i<49;i++){
            $(".calenderin>.bodyleft li").eq(i).text("");
            $(".calenderin>.bodyright li").eq(i).text("");
        }
        var j=0;
        for(var i=(7+day_begin);i<(7+month_day+day_begin);i++){
            j++;
            $(".calenderin>.bodyleft li").eq(i).text(j);
        }
        j=0;
        for(var i=(7+day_begin_right);i<(7+month_day_right+day_begin_right);i++){
            j++;
            $(".calenderin>.bodyright li").eq(i).text(j);
        }

        //判断是否在允许的预定日期内
        //在当前月，当日之前的日子置灰，左按键置灰，否则是原来的颜色

        initblock(monthnow,yearnow,day_begin,day);

        //为每个日期添加点击事件
        $(".calenderin>.bodyleft li").eq(7+day_begin).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+1).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+1).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+1).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+2).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+2).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+2).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+3).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+3).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+3).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+4).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+4).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+4).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+5).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+5).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+5).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+6).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+6).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+6).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+7).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+7).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+7).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+8).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+8).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+8).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+9).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+9).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+9).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+10).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+10).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+10).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+11).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+11).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+11).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+12).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+12).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+12).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+13).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+13).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+13).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+14).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+14).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+14).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+15).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+15).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+15).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+16).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+16).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+16).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+17).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+17).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+17).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+18).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+18).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+18).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+19).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+19).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+19).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+20).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+20).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+20).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+21).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+21).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+21).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+22).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+22).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+22).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+23).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+23).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+23).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+24).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+24).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+24).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+25).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+25).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+25).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+26).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+26).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+26).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+27).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+27).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+27).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+28).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+28).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+28).text()) + "日");
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+29).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+29).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            if($(".calenderin>.bodyleft li").eq(7 + day_begin+29).text()!=""){
                $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+29).text()) + "日");
            }
        });
        $(".calenderin>.bodyleft li").eq(7+day_begin+30).click(function() {
            if($(".calenderin>.bodyleft li").eq(7+day_begin+30).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            if($(".calenderin>.bodyleft li").eq(7 + day_begin+30).text()!=""){
                $(".indate>.datein").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderin>.bodyleft li").eq(7 + day_begin+30).text()) + "日");
            }
        });




        $(".calenderin>.bodyright li").eq(7+day_begin_right).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+1).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+1).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+2).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+2).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+3).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+3).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+4).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+4).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+5).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+5).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+6).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+6).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+7).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+7).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+8).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+8).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+9).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+9).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+10).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+10).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+11).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+11).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+12).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+12).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+13).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+13).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+14).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+14).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+15).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+15).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+16).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+16).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+17).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+17).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+18).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+18).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+19).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+19).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+20).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+20).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+21).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+21).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+22).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+22).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+23).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+23).text()) + "日");
        }); $(".calenderin>.bodyright li").eq(7+day_begin_right+24).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+24).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+25).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+25).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+26).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+26).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+27).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+27).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+28).click(function() {
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+28).text()) + "日");
        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+29).click(function() {
            if($(".calenderin>.bodyright li").eq(7 + day_begin_right+29).text()==""){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+29).text()) + "日");

        });
        $(".calenderin>.bodyright li").eq(7+day_begin_right+30).click(function() {
            if($(".calenderin>.bodyright li").eq(7 + day_begin_right+30).text()==""){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+30).text()) + "日");

        });

        $(".calenderin>.bodyright li").eq(7+day_begin_right+31).click(function() {
            if($(".calenderin>.bodyright li").eq(7 + day_begin_right+31).text()==""){
                return false;
            }
            $(".indate>.datein").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderin>.bodyright li").eq(7 + day_begin_right+31).text()) + "日");

        });




    }
    function initblock(monthnow,yearnow,day_begin,day){
        if(monthnow==(new Date().getMonth()+1)&&yearnow==(new Date().getFullYear())){
            $(".calenderin>.bodyleft>.pre").css({
                "color" : "gray",
                "cursor" : "default"
            });

            $(".calenderin>.bodyleft li").eq(6+day_begin+day).css({
                "color" : "#0077cc"
            });

            for(var k=7;k<(day_begin+day+6);k++){
                $(".calenderin>.bodyleft li").eq(k).css({
                    "color" : "gray",
                    "cursor" : "default"
                });
            }


        }else{
            $(".calenderin>.bodyleft>.pre").css({
                "color" : "#0077cc",
                "cursor" : "pointer"
            });
            for(var k=6;k<(49);k++){
                $(".calenderin>.bodyleft li").eq(k).css({
                    "color" : "black",
                    "cursor" : "pointer"
                });
            }
        }

        if(monthnow==(new Date().getMonth()+3)&&yearnow==(new Date().getFullYear()+1)){
            $(".calenderin>.bodyright>.next").css({
                "color" : "gray",
                "cursor" : "default"
            });
        }else{
            $(".calenderin>.bodyright>.next").css({
                "color" : "#0077cc",
                "cursor" : "pointer"
            });
        }
    }


    initcalenderout(0,0);
    function initcalenderout(calenderyearnow,calendermonthnow){
        if(calenderyearnow==0){
            var datenow = new Date();
            day = datenow.getDate();
        }else{
            var datenow = new Date(calenderyearnow,calendermonthnow,0)
        }

        var yearnow = datenow.getFullYear();
        var monthnow = datenow.getMonth()+1;
        var yearnowright=yearnow;
        var monthnowright=monthnow+1;
        if(monthnowright==13){
            monthnowright=1;
            yearnowright++;
        }
        //此月的第一天是星期几，返回是0的话表示星期日
        var day_begin = new Date(datenow.setDate(1)).getDay();
        var day_begin_right =  new Date((new Date(yearnowright,monthnowright,0)).setDate(1)).getDay();
        if(day_begin_right==7){
            day_begin_right=0;
        }
        //此月总天数
        var month_day = new Date(yearnow, monthnow, 0).getDate();
        var month_day_right = new Date(yearnowright, monthnowright, 0).getDate();

        $(".calenderout>.bodyleft h3").text(yearnow+"年"+monthnow+"月");
        $(".calenderout>.bodyright h3").text(yearnowright+"年"+monthnowright+"月");
        for(var i=7;i<49;i++){
            $(".calenderout>.bodyleft li").eq(i).text("");
            $(".calenderout>.bodyright li").eq(i).text("");
        }
        var j=0;
        for(var i=(7+day_begin);i<(7+month_day+day_begin);i++){
            j++;
            $(".calenderout>.bodyleft li").eq(i).text(j);
        }
        j=0;
        for(var i=(7+day_begin_right);i<(7+month_day_right+day_begin_right);i++){
            j++;
            $(".calenderout>.bodyright li").eq(i).text(j);
        }

        //判断是否在允许的预定日期内
        //在当前月，当日之前的日子置灰，左按键置灰，否则是原来的颜色

        initblockout(monthnow,yearnow,day_begin,day);

        //为每个日期添加点击事件
        $(".calenderout>.bodyleft li").eq(7+day_begin).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+1).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+1).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+1).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+2).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+2).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+2).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+3).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+3).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+3).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+4).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+4).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+4).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+5).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+5).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+5).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+6).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+6).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+6).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+7).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+7).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+7).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+8).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+8).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+8).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+9).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+9).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+9).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+10).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+10).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+10).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+11).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+11).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+11).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+12).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+12).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+12).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+13).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+13).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+13).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+14).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+14).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+14).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+15).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+15).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+15).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+16).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+16).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+16).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+17).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+17).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+17).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+18).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+18).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+18).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+19).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+19).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+19).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+20).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+20).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+20).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+21).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+21).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+21).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+22).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+22).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+22).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+23).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+23).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+23).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+24).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+24).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+24).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+25).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+25).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+25).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+26).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+26).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+26).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+27).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+27).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+27).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+28).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+28).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+28).text()) + "日");
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+29).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+29).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            if($(".calenderout>.bodyleft li").eq(7 + day_begin+29).text()!=""){
                $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+29).text()) + "日");
            }
        });
        $(".calenderout>.bodyleft li").eq(7+day_begin+30).click(function() {
            if($(".calenderout>.bodyleft li").eq(7+day_begin+30).css("color")=="rgb(128, 128, 128)"){
                return false;
            }
            if($(".calenderout>.bodyleft li").eq(7 + day_begin+30).text()!=""){
                $(".outdate>.dateout").attr("placeholder", yearnow + "年" + monthnow + "月" + ($(".calenderout>.bodyleft li").eq(7 + day_begin+30).text()) + "日");
            }
        });




        $(".calenderout>.bodyright li").eq(7+day_begin_right).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+1).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+1).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+2).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+2).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+3).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+3).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+4).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+4).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+5).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+5).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+6).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+6).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+7).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+7).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+8).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+8).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+9).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+9).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+10).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+10).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+11).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+11).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+12).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+12).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+13).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+13).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+14).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+14).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+15).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+15).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+16).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+16).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+17).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+17).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+18).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+18).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+19).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+19).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+20).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+20).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+21).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+21).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+22).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+22).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+23).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+23).text()) + "日");
        }); $(".calenderout>.bodyright li").eq(7+day_begin_right+24).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+24).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+25).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+25).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+26).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+26).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+27).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+27).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+28).click(function() {
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+28).text()) + "日");
        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+29).click(function() {
            if($(".calenderout>.bodyright li").eq(7 + day_begin_right+29).text()==""){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+29).text()) + "日");

        });
        $(".calenderout>.bodyright li").eq(7+day_begin_right+30).click(function() {
            if($(".calenderout>.bodyright li").eq(7 + day_begin_right+30).text()==""){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+30).text()) + "日");

        });

        $(".calenderout>.bodyright li").eq(7+day_begin_right+31).click(function() {
            if($(".calenderout>.bodyright li").eq(7 + day_begin_right+31).text()==""){
                return false;
            }
            $(".outdate>.dateout").attr("placeholder", yearnowright + "年" + monthnowright + "月" + ($(".calenderout>.bodyright li").eq(7 + day_begin_right+31).text()) + "日");

        });




    }
    function initblockout(monthnow,yearnow,day_begin,day){
        if(monthnow==(new Date().getMonth()+1)&&yearnow==(new Date().getFullYear())){
            $(".calenderout>.bodyleft>.pre").css({
                "color" : "gray",
                "cursor" : "default"
            });

            $(".calenderout>.bodyleft li").eq(6+day_begin+day).css({
                "color" : "#0077cc"
            });

            for(var k=7;k<(day_begin+day+6);k++){
                $(".calenderout>.bodyleft li").eq(k).css({
                    "color" : "gray",
                    "cursor" : "default"
                });
            }


        }else{
            $(".calenderout>.bodyleft>.pre").css({
                "color" : "#0077cc",
                "cursor" : "pointer"
            });
            for(var k=6;k<(49);k++){
                $(".calenderout>.bodyleft li").eq(k).css({
                    "color" : "black",
                    "cursor" : "pointer"
                });
            }
        }

        if(monthnow==(new Date().getMonth()+3)&&yearnow==(new Date().getFullYear()+1)){
            $(".calenderout>.bodyright>.next").css({
                "color" : "gray",
                "cursor" : "default"
            });
        }else{
            $(".calenderout>.bodyright>.next").css({
                "color" : "#0077cc",
                "cursor" : "pointer"
            });
        }
    }

    //响应日历的向前翻页事件
    $(".calenderout>.bodyright>.next").click(function(){
        var year = calenderdateout.getFullYear();
        var month = calenderdateout.getMonth()+1;
        if(month==(new Date().getMonth()+3)&&year==(new Date().getFullYear()+1)){
            return false;
        }
        month+=2;
        if(month ==14){
            month = 2;
            year++;
        }
        if(month == 13){
            month = 1;
            year++;
        }
        calenderdateout = new Date(year,month,0)
        initcalenderout(year,month);
    });
//响应日历的向前翻页事件，为当前月则不翻
    $(".calenderout>.bodyleft>.pre").click(function(){
        var year = calenderdateout.getFullYear();
        var month = calenderdateout.getMonth()+1;
        if(month==(new Date().getMonth()+1)&&year==(new Date().getFullYear())){
            return false;
        }
        month-=2;
        if(month ==0){
            month = 12;
            year--;
        }
        if(month == (-1)){
            month==11;
            year--;
        }
        calenderdateout = new Date(year,month,0)
        initcalenderout(year,month);
    });
    $(".outdate").click(function(){
        $(".calenderout").fadeToggle("slow");
    });
    $(".indate").click(function(){
        $(".calenderin").fadeToggle("slow");
    });
//成人
    adultnumchooseinit();
    function adultnumchooseinit(){
        for(var i=0;i<30;i++){
            $(".adultnumchoose li").eq(i+1).text((i+1)+"位成人");
        }
    }

    $(".adultnumchoose li").click(function(){
        for(var i=0;i<30;i++){
            if(($(".adultnumchoose li").eq(i+1).css("color"))=="rgb(2, 54, 129)"){
                $(".adultnum span").text((i+1)+"位成人");
            }
        }
    });

    $(".adultnum").click(function(){
        $(".adultnumchoose").fadeToggle("slow");
    });


    //房间
    roomnumchooseinit();
    function roomnumchooseinit(){
        for(var i=0;i<30;i++){
            $(".roomnumchoose li").eq(i+1).text((i+1)+"间房");
        }
    }

    $(".roomnumchoose li").click(function(){
        for(var i=0;i<30;i++){
            if(($(".roomnumchoose li").eq(i+1).css("color"))=="rgb(2, 54, 129)"){
                $(".roomnum span").text((i+1)+"间房");
            }
        }
    });

    $(".roomnum").click(function(){
        $(".roomnumchoose").fadeToggle("slow");
    });



    //儿童
    childnumchooseinit();
    function childnumchooseinit(){
        for(var i=0;i<30;i++){
            $(".childnumchoose li").eq(i+1).text((i+1)+"位儿童");
        }
    }

    $(".childnumchoose li").click(function(){
        for(var i=0;i<30;i++){
            if(($(".childnumchoose li").eq(i+1).css("color"))=="rgb(2, 54, 129)"){
                $(".childnum span").text((i+1)+"位儿童");
            }
        }
    });

    $(".childnum").click(function(){
        $(".childnumchoose").fadeToggle("slow");
    });
});