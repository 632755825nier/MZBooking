/**
 * Created by xiaoxin on 2018/8/11.
 */
$(document).ready(function(){
    var imgs = ["../resources/res/images/GZBYBG/34980273.jpg","../resources/res/images/GZBYBG/34980275.jpg","../resources/res/images/GZBYBG/34980276.jpg","../resources/res/images/GZBYBG/34980277.jpg","../resources/res/images/GZBYBG/34980278.jpg","../resources/res/images/GZBYBG/34980280.jpg",
        "../resources/res/images/GZBYBG/34980281.jpg","../resources/res/images/GZBYBG/34980282.jpg","../resources/res/images/GZBYBG/34980283.jpg","../resources/res/images/GZBYBG/34980365.jpg","../resources/res/images/GZBYBG/34980368.jpg","../resources/res/images/GZBYBG/34980369.jpg",
        "../resources/res/images/GZBYBG/34980370.jpg","../resources/res/images/GZBYBG/34980381.jpg","../resources/res/images/GZBYBG/34980444.jpg","../resources/res/images/GZBYBG/34980445.jpg","../resources/res/images/GZBYBG/34980448.jpg","../resources/res/images/GZBYBG/34980454.jpg",
        "../resources/res/images/GZBYBG/34980456.jpg","../resources/res/images/GZBYBG/34980489.jpg","../resources/res/images/GZBYBG/34980490.jpg","../resources/res/images/GZBYBG/34980492.jpg","../resources/res/images/GZBYBG/34980493.jpg","../resources/res/images/GZBYBG/34980495.jpg",
        "../resources/res/images/GZBYBG/34980496.jpg","../resources/res/images/GZBYBG/34980498.jpg","../resources/res/images/GZBYBG/34980672.jpg","../resources/res/images/GZBYBG/34980673.jpg","../resources/res/images/GZBYBG/34980676.jpg","../resources/res/images/GZBYBG/34980679.jpg",
        "../resources/res/images/GZBYBG/34980680.jpg","../resources/res/images/GZBYBG/44116174.jpg","../resources/res/images/GZBYBG/44116181.jpg","../resources/res/images/GZBYBG/44116187.jpg","../resources/res/images/GZBYBG/44116192.jpg","../resources/res/images/GZBYBG/44116193.jpg",
        "../resources/res/images/GZBYBG/44116194.jpg","../resources/res/images/GZBYBG/44116199.jpg","../resources/res/images/GZBYBG/44116201.jpg","../resources/res/images/GZBYBG/44116202.jpg","../resources/res/images/GZBYBG/44116203.jpg","../resources/res/images/GZBYBG/44116205.jpg",
        "../resources/res/images/GZBYBG/44116209.jpg","../resources/res/images/GZBYBG/44116224.jpg","../resources/res/images/GZBYBG/44116226.jpg","../resources/res/images/GZBYBG/44116229.jpg","../resources/res/images/GZBYBG/44116240.jpg","../resources/res/images/GZBYBG/44116246.jpg",
        "../resources/res/images/GZBYBG/44116256.jpg","../resources/res/images/GZBYBG/66422120.jpg","../resources/res/images/GZBYBG/7082835.jpg","../resources/res/images/GZBYBG/73901522.jpg"];
    flush();
    initimg();
    var n=0;
    var clear;
    function flush(){

        clear=setInterval(function(){
            n++;
            if(n>=50){
                n=0;
            }
            $(".img1>img:nth-child(1)").attr('src',imgs[n]);

            for(var i=0;i<50;i++){
                $(".manyimg>li").eq(i).css({
                    "border-color": "rgba(0,0,0,0)"
                });
            }
            $(".manyimg>li").eq(n).css({
                "border-color": "#0077cc"
            });


        },4000)
    }


    $(".slide>.pre").click(function(){
        clearInterval(clear);
        n--;
        if(n==-1){
            n=49;
        }
        $(".img1 img").attr('src',imgs[n]);
        for(var i=0;i<50;i++){
            $(".manyimg>li").eq(i).css({
                "border-color": "rgba(0,0,0,0)"
            });
        }
        $(".manyimg>li").eq(n).css({
            "border-color": "#0077cc"
        });
        flush();

    });
    $(".slide>.next").click(function(){
        clearInterval(clear);
        n++;
        if(n==51){
            n=0;
        }
        $(".img1 img").attr('src',imgs[n]);
        for(var i=0;i<50;i++){
            $(".manyimg>li").eq(i).css({
                "border-color": "rgba(0,0,0,0)"
            });
        }

        $(".manyimg>li").eq(n).css({
            "border-color": "#0077cc"
        });
        flush();
    });

    //hover所在的图片
    var hoverin;
    $(".manyimg>li").hover(function(){
        for(var i=0;i<50;i++){
            if($(".manyimg>li").eq(i).css("font-weight") == "100"){
                hoverin = i;
                clearInterval(clear);
                $(".img1 img").attr('src',imgs[i]);
                $(".manyimg>li").eq(i).css({
                    "border-color": "#0077cc"
                });

            }
        }
    },function(){
        $(".manyimg>li").eq(hoverin).css({
            "border-color": "rgba(0,0,0,0)"
        }

    );
    flush();
    });


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
        $(".calenderin").fadeToggle("fast");
    });
    $(".calenderin>.indate").click(function(){
        $(".calenderin").fadeToggle("fast");
    });

    $(".calenderout>.header>.icon-cha2").click(function(){
        $(".calenderout").fadeToggle("fast");
    });
    $(".calenderout>.indate").click(function(){
        $(".calenderout").fadeToggle("fast");
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
            $(".adultnumchoose li").eq(i+1).text((i)+"位成人");
        }
    }

    $(".adultnumchoose li").click(function(){
        for(var i=0;i<30;i++){
            if(($(".adultnumchoose li").eq(i+1).css("color"))=="rgb(2, 54, 129)"){
                $(".adultnum span").text((i)+"位成人");
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
            $(".roomnumchoose li").eq(i+1).text((i)+"间房");
        }
    }

    $(".roomnumchoose li").click(function(){
        for(var i=0;i<30;i++){
            if(($(".roomnumchoose li").eq(i+1).css("color"))=="rgb(2, 54, 129)"){
                $(".roomnum span").text((i)+"间房");
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
            $(".childnumchoose li").eq(i+1).text((i)+"位儿童");
        }
    }

    $(".childnumchoose li").click(function(){
        for(var i=0;i<30;i++){
            if(($(".childnumchoose li").eq(i+1).css("color"))=="rgb(2, 54, 129)"){
                $(".childnum span").text((i)+"位儿童");
            }
        }
    });

    $(".childnum").click(function(){
        $(".childnumchoose").fadeToggle("slow");
    });

    //吐槽
    $(".midd>.tip>.renxin").click(function(){

        $(".midd>.tip>.renxin").animate({color:'white',top:'-60px'},1500,function () {
                var times=(-1);
                $(".midd>.tip").css("background","linear-gradient(to right, #cce1ff , pink)");
                var clear = setInterval(function(){
                    times +=1;
                    if(times==7){
                        times=(0);
                        clearInterval(clear);
                    }
                    $(".midd>.tip li").eq(times).fadeIn(),css({'display':'block'});
                },500)




            }
        );
    });

    
    
    //底部定时刷新评论
    flushComment();
  
    function flushComment(){
    	  var n=0;
        setInterval(function(){
            n=(n+1);

            if(n==9){
                n=1;
            };
          
            $.getJSON('../LookingroomServlet',
                {num:n},
                function(result){
     
                   var comment = eval(result.leftComment);
                   if(n%2==1){
     
                	  
                        $(".CommentFoot").fadeOut("slow");
                        $(".CommentFootCopy>.span1").text(comment.userNickName);
                        $(".CommentFootCopy>.span2").text(comment.commentWord);
                        $(".CommentFoot").animate({top:'2080px'});
                        $(".CommentFootCopy").fadeIn("slow").animate({top:'2070px'});
                   }
                   if(n%2==0){
           
              
                       $(".CommentFootCopy").fadeOut("slow");
                  	   $(".CommentFoot>.span1").text(comment.userNickName);                       
                       $(".CommentFoot>.span2").text(comment.commentWord);
                       $(".CommentFoot").fadeIn("slow").animate({top:'2070px'});
                       $(".CommentFootCopy").animate({top:'2080px'});
                   }
                   
                }
            );
        },5000
        );
    }
    
  
    
    
  //设置订单单元格的内容
    orderInit();
    function orderInit(){
        setInterval(function(){
            var datein = $(".indate>.datein").attr("placeholder");
            //入住日期cookie
            $.cookie("datein",datein);  
            for(var i = 1;i<6;i++){
                $(".order").find("tr").eq(i).find("td").eq(5).text(datein);
            }
            var dateout = $(".outdate>.dateout").attr("placeholder");
            //离开日期cookie
            $.cookie("dateout",dateout);
            for(var i = 1;i<6;i++){
                $(".order").find("tr").eq(i).find("td").eq(6).text(dateout);
            }
            var adultnum = $(".adultnum span").eq(0).text();
            var childnum = $(".childnum span").eq(0).text();
            //成人人数和儿童人数cookie
            $.cookie("adultnum",adultnum);
            $.cookie("chilenum",childnum);
            for(var i = 1;i<6;i++){
                $(".order").find("tr").eq(i).find("td").eq(7).text(adultnum+"和"+childnum);
            }
            var roomnum = $(".roomnum span").eq(0).text();
            //房间数cookie
            $.cookie("roomnum",roomnum);
            for(var i = 1;i<6;i++){
                $(".order").find("tr").eq(i).find("td").eq(4).text(roomnum);
            }
       
            $(".order").find("tr").eq(1).find("td").eq(0).text($.cookie("roomType1"));
            $(".order").find("tr").eq(2).find("td").eq(0).text($.cookie("roomType2"));
            $(".order").find("tr").eq(3).find("td").eq(0).text($.cookie("roomType3"));
            $(".order").find("tr").eq(4).find("td").eq(0).text($.cookie("roomType4"));
            $(".order").find("tr").eq(5).find("td").eq(0).text( $.cookie("roomType5"));
            
            $(".order").find("tr").eq(1).find("td").eq(1).text( $.cookie("surplusRoomNumber1"));
            $(".order").find("tr").eq(2).find("td").eq(1).text( $.cookie("surplusRoomNumber2"));
            $(".order").find("tr").eq(3).find("td").eq(1).text( $.cookie("surplusRoomNumber3"));
            $(".order").find("tr").eq(4).find("td").eq(1).text( $.cookie("surplusRoomNumber4"));
            $(".order").find("tr").eq(5).find("td").eq(1).text( $.cookie("surplusRoomNumber5"));
            
            
            
            $(".order").find("tr").eq(1).find("td").eq(2).text($.cookie("roomPrice1"));
            $(".order").find("tr").eq(2).find("td").eq(2).text($.cookie("roomPrice2"));
            $(".order").find("tr").eq(3).find("td").eq(2).text($.cookie("roomPrice3"));
            $(".order").find("tr").eq(4).find("td").eq(2).text($.cookie("roomPrice4"));
            $(".order").find("tr").eq(5).find("td").eq(2).text($.cookie("roomPrice5"));


          
           

        },2000)

    }
    
    
    //刷新总价
    flushPrices()
    function flushPrices(){
    	 setInterval(function(){
    		 for(var i = 1;i<6;i++){
    			var datein = $(".order").find("tr").eq(i).find("td").eq(5).text();
    			var dateout = $(".order").find("tr").eq(i).find("td").eq(6).text();
    			var price = $(".order").find("tr").eq(i).find("td").eq(2).text();
    			var roomnum = $(".order").find("tr").eq(i).find("td").eq(4).text().split("间")[0];
    		
    			if(datein != "入住日期"&&dateout != "退房日期"){
    				var yearin = datein.split("年")[0];
    				var monthin = datein.split("年")[1].split("月")[0];
    				var dayin = datein.split("年")[1].split("月")[1].split("日")[0];
    				
    				var yearout = dateout.split("年")[0];
    				var monthout = dateout.split("年")[1].split("月")[0];
    				var dayout = dateout.split("年")[1].split("月")[1].split("日")[0];
    				
    				var datepre = yearin+"-"+monthin+"-"+dayin;
    				var datenext = yearout+"-"+monthout+"-"+dayout;
    		
    				var days = dateDiff("D",datepre,datenext);
    				
    				var sum = price*roomnum*days;
    				 $(".order").find("tr").eq(i).find("td").eq(3).text(sum);
    				 
    				 if(days<=0){
    				    swal('提示信息','请选择正确的住房日期！！','error');
    				 }
    				
       			     $.cookie("allday",days);//订单天数
       			     	
    			}
    		 }
    	 },3000);
    }
    
//    function DelayTime(len){
//    	for(i = 0;i<len;i++){
//    		(function(a){
//    			setTimeout(function(){
//    			},1000)
//    		})
//    	}
//    }
    
    //计算日期间的天数
    function dateDiff(interval, date1, date2)
    {
        var objInterval = {'D' : 1000 * 60 * 60 * 24, 'H' : 1000 * 60 * 60,
                           'M' : 1000 * 60, 'S' : 1000, 'T' : 1};
        interval = interval.toUpperCase();
        var dt1 = Date.parse(date1.replace(/-/g, '/'));
        var dt2 = Date.parse(date2.replace(/-/g, '/'));
        try
        {
            return Math.round((dt2 - dt1) / eval('(objInterval.' + interval + ')'));
        }
        catch (e)
        {
            return e.message;
        }
    }
    
 //订单监听事件
    
    $(".order").find("td").click(function(){
    	for(var i=1;i<6;i++){
        		
        	if($(".order").find("tr").eq(i).find("td").eq(8).css("color")=="rgb(0, 0, 255)"){

        		var orderRoomType = $(".order").find("tr").eq(i).find("td").eq(0).text();
        		var orderSurplusRoomNumber = $(".order").find("tr").eq(i).find("td").eq(1).text();
        		var orderPrice = $(".order").find("tr").eq(i).find("td").eq(2).text();
        		var orderprices = $(".order").find("tr").eq(i).find("td").eq(3).text();
        		var orderRoomnum = $(".order").find("tr").eq(i).find("td").eq(4).text();
        		var orderRoomin = $(".order").find("tr").eq(i).find("td").eq(5).text();
        		var orderRoomout = $(".order").find("tr").eq(i).find("td").eq(6).text();
        		var orderNumber = $(".order").find("tr").eq(i).find("td").eq(7).text();

        		if(orderRoomin == "入住日期"){
        			toastr.warning('请选择入住日期！');
        		} else if(orderRoomout == "退房日期"){
        			toastr.warning('请选择退房日期！');
        			
        		} else {
        			$.cookie("orderRoomType",orderRoomType);//订单房间类型
            		$.cookie("orderSurplusRoomNumber",orderSurplusRoomNumber);//订单房间剩余数量
            		$.cookie("orderPrice",orderPrice);//单价
            		$.cookie("orderprices",orderprices);//总价
            		$.cookie("orderRoomnum",orderRoomnum);//订房数量  
            		$.cookie("orderRoomin",orderRoomin);//入住日期
            		$.cookie("orderRoomout",orderRoomout);//退房日期
            		$.cookie("orderNumber",orderNumber);//人数（成人+儿童）
            		
            		location.href = "personInfor.jsp"
        		}
        	}
        }
    });
    
  //右侧评论初始化
    rightComment();
    function rightComment(){
    	$(".comment1>.nickName").text($.cookie("nickName1"));
    	$(".comment1>.touxiang").text($.cookie("nickName1").substring(1,2));
//     	$(".comment1>.country").text($.cookie("userCountry1"));
     	$(".comment1>.pingfeng").text($.cookie("rating1"));
//     	$(".comment1>.date").text("评论日期"+$.cookie("commentDate1"));
     	$(".comment1>.pinglun").text($.cookie("commentWord1"));
     	$(".comment1>.pinglundate").text("入住日期"+$.cookie("inDate1"));
    	$(".comment1>.zang>.zangNum").text($.cookie("likeNumber1")+"人点赞");
    	
//    	$(".comment2>.nickName").text($.cookie("nickName2"));
//    	$(".comment2>.touxiang").text($.cookie("nickName2").substring(1,2));
//     	$(".comment2>.country").text($.cookie("userCountry2"));
//     	$(".comment2>.pingfeng").text($.cookie("rating2"));
//     	$(".comment2>.date").text("评论日期"+$.cookie("commentDate2"));
//     	$(".comment2>.pinglun").text($.cookie("commentWord2"));
//     	$(".comment2>.pinglundate").text("入住日期"+$.cookie("inDate2"));
//    	$(".comment2>.zang>.zangNum").text($.cookie("likeNumber2")+"人点赞");
    	
    	 $(".pageDisplay li").eq(2).css({"font-size":"18px"});
    }
    
    //评论分页
    //当前页数
    var pageNowin = 1;
    var pages = 5;
    $(".pageDisplay li").click(function(){
    
        for(var i = 0;i<pages+4;i++){
            if( $(".pageDisplay li").eq(i).css("color")=="rgb(0, 107, 188)"){
       
                if( $(".pageDisplay li").eq(i).text()=="上一页"){
                    pageNowin = pageNowin -1;
                    if(pageNowin == 0){
                    	pageNowin = pageNowin + 1;
                    	return false;
                    }
                    for(var j=0;j<(pages+3);j++){
                  	  $(".pageDisplay li").eq(j).css({"font-size":"14px"});
                  }
                    $(".pageDisplay li").eq(pageNowin+1).css({"font-size":"18px"});
                }else if( $(".pageDisplay li").eq(i).text()=="末页"){
                	pageNowin=pages;
               	 for(var j=0;j<(pages+2);j++){
                    	  $(".pageDisplay li").eq(j).css({"font-size":"14px"});
                    }
                      $(".pageDisplay li").eq(pages+1).css({"font-size":"18px"});
                }else if( $(".pageDisplay li").eq(i).text()=="首页"){
                	pageNowin=1;
                	 for(var j=0;j<(pages+2);j++){
                     	  $(".pageDisplay li").eq(j).css({"font-size":"14px"});
                     }
                       $(".pageDisplay li").eq(2).css({"font-size":"18px"});
                }else if( $(".pageDisplay li").eq(i).text()=="下一页"){
                	
                    pageNowin = pageNowin + 1;
                    if(pageNowin==pages+1){
                    	pageNowin = pageNowin-1;
                    	return false;
                    }
                    for(var j=0;j<(pages+2);j++){
                  	  $(".pageDisplay li").eq(j).css({"font-size":"14px"});
                  }
                    $(".pageDisplay li").eq(pageNowin+1).css({"font-size":"18px"});
                }else{
                    pageNowin = i-1;
                    for(var j=0;j<(pages+2);j++){
                    	  $(".pageDisplay li").eq(j).css({"font-size":"14px"});
                    }
                  
                    $(".pageDisplay li").eq(pageNowin+1).css({"font-size":"18px"});
                }
                var nickName1;var userCountry1;var rating1;var commentDate1;var commentWord1;var inDate1;var likeNumber1;
				var nickName2;var userCountry2;var rating2 ;var commentDate2;var commentWord2;var inDate2;var likeNumber2;
                
                $.getJSON('../CommentPageServlet',
                    {pageNow:pageNowin,pageNum:2},
                    function(result){                                
                    	
                    	 $.each(result, function(k, v){
                             $.each(v,function(kk, vv){
                            	 if(kk==0){
                            		nickName1 = vv.userNickName;
//                  					userCountry1 = vv.userCountry;
                  					rating1 = vv.positionRating;
//                  					 commentDate1 = vv.commentDate;
                  					commentWord1 = vv.commentWord;
                  					inDate1 = vv.inDate;
                  					likeNumber1 = vv.likeNumber;
                            	 }
                            	  if(kk==1){
                            		  nickName2 = vv.userNickName;
                   					 userCountry2 = vv.userCountry;
                   					rating2 = vv.positionRating;
                   					commentDate2 = vv.commentDate;
                   					commentWord2 = vv.commentWord;
                   					inDate2 = vv.inDate;
                   					 likeNumber2 = vv.likeNumber;
                            	 }
                            		
                            	  
                                  $(".comment1>.nickName").text(nickName1);
                               	$(".comment1>.touxiang").text(encodeURIComponent(nickName1).substring(1,2));
//                                	$(".comment1>.country").text(userCountry1);
                                	$(".comment1>.pingfeng").text(rating1);
//                                	$(".comment1>.date").text("评论日期"+commentDate1);
                                	$(".comment1>.pinglun").text(commentWord1);
                                	$(".comment1>.pinglundate").text("入住日期"+inDate1);
                               	$(".comment1>.zang>.zangNum").text(likeNumber1+"人点赞");
                               	
//                               	$(".comment2>.nickName").text(nickName2);
//                               	$(".comment2>.touxiang").text(encodeURIComponent(nickName2).substring(1,2));
//                                	$(".comment2>.country").text(userCountry2);
//                                	$(".comment2>.pingfeng").text(rating2);
//                                	$(".comment2>.date").text("评论日期"+commentDate2);
//                                	$(".comment2>.pinglun").text(commentWord2);
//                                	$(".comment2>.pinglundate").text("入住日期"+inDate2);
//                               	$(".comment2>.zang>.zangNum").text(likeNumber2+"人点赞"); 	
                            	  
                                 
                             });
                         });
                    	
                                      	
                    }
                );
  
                                        
            }
        }      
        

    });
    

    //显示评论数据
    $(".midd a").eq(4).click(function(){
    	$(".CommentRightContainer").fadeToggle();
    	$(".concentContainer").fadeToggle();
    });
    
    //
    $(".concentContainer>.hidden").click(function(){
    	$(".CommentRightContainer").fadeToggle();
    	$(".concentContainer").fadeToggle();
    })
    
    
    
    //弹幕
    var state = 0;
    $(".tucao").unbind("click").click(function(){
    	state++;
    	 $(".screen_dibu").fadeToggle();
         $(".screen_container").fadeToggle();
         $(".screen_toolbar").fadeToggle();
         var tucaoArray = new Array();
         if(state%2 == 1){
        	 
        	// 创建弹幕
        	 var jqueryDom = createScreenbullet("一大群吐槽水军即将杀到");
        	 // 添加定时任务
             addInterval(jqueryDom);
    		  $.getJSON('../TucaoServlet',
                      {opeartion:"getTucao"},
                      function(result){
                         var tuCao = eval(result.tuCao);
                         $.each(result, function(k, v){
              
                             $.each(v,function(kk, vv){
                            	 	tucaoArray.push(vv.tucaoWord);
                            
                          	  
                             	
                             });
                        
                         });
                         var i=0;
                         var length = tucaoArray.push("弹药不足，撤退撤退。。。。。");
                         clear = setInterval(function(){
                        	 if(tucaoArray[i] == "弹药不足，撤退撤退。。。。。"){
 
                            	 clearInterval(clear);
                             }
                        	 // 创建弹幕
                        	  jqueryDom = createScreenbullet(tucaoArray[i]);
                        	 // 添加定时任务
                             addInterval(jqueryDom);
                             i++;
                             
                         },4000)
                        
                      }
                  );
    	
        
        	 
        }
     
    });


    // 弹幕定时器
    var timers = [];
// 控制弹幕显隐变量
    var isShow = true;
// 监听发送按钮
    $(".send").on("click", function () {
        // 创建弹幕
        var jqueryDom = createScreenbullet($("#screenBulletText").val());
        
        //保存弹幕
        $.getJSON('../TucaoServlet',
                {opeartion:"setTucao",
                data:$("#screenBulletText").val()},
                function(result){
                  
                   
                  
                }
            );
       
        // 添加定时任务
        addInterval(jqueryDom);
    });
// 监听关闭弹幕按钮
    $(".clear").on("click", function () {
        if (isShow) {
            $(".bullet").css("opacity", 0);
            isShow = false;
        } else {
            $(".bullet").css("opacity", 1);
            isShow = true;
        }
    });
// 新建一个弹幕
    function createScreenbullet(text) {
        var jqueryDom = $("<div class='bullet'>" + text + "</div>");
        var fontColor = "rgb(" + Math.floor(Math.random() * 256) + "," + Math.floor(Math.random() * 256) + "," + Math.floor(Math.random()) + ")";
        var fontSize = Math.floor((Math.random() + 1) * 24) + "px";
        var left = $(".screen_container").width() + "px";
        var top = Math.floor(Math.random() * 600) + "px";
        top = parseInt(top) > 600 ? "600px" : top;
        jqueryDom.css({
            "position": 'absolute',
            "color": fontColor,
            "width": "1900px",
            "height":"30px",
            "left": left,
            "top": top
        });
        $(".screen_container").append(jqueryDom);
        return jqueryDom;
    }
// 为弹幕添加定时任务
    function addInterval(jqueryDom) {
        var left = jqueryDom.offset().left - $(".screen_container").offset().left;
        var timer = setInterval(function () {
            left--;
            jqueryDom.css("left", left + "px");
            if (jqueryDom.offset().left + jqueryDom.width() < $(".screen_container").offset().left) {
                jqueryDom.remove();
                clearInterval(timer);
            }
        }, 20);
        timers.push(timer);
    }

    //添加上个页面的日期信息
    
    
    
});



