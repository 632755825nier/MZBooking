/**
 * Created by xiaoxin on 2018/8/7.
 */
var date = new Date();
var change_white;
var prev_flag = 11;
var number_flag = 1;
var now_day;
var calendar_open = 1;
//pre按键是否起作用
var preOpeartion = 0;

setInterval(loopchangecolor, 100);

function flush(yearin, monthin) {

    //判断是否是第一次传入
    if (yearin == 0) {
        date = new Date();


    } else {
        date = new Date(yearin, monthin);
    }

    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var rightmonth = month;
    var rightyear = year;
    if (rightmonth > 11) {
        rightyear = year + 1;
        rightmonth = 0;
    }

    var rightdate = new Date(rightyear, rightmonth);
    //此月的第一天是星期几，返回是0的话表示星期日
    var date1 = date;
    var day_begin = new Date(date1.setDate(1)).getDay();
    //下个月的第一天是星期几
    var rightdate1 = rightdate;
    var rightday_begin = new Date(rightdate1.setDate(1)).getDay();


    var change_enum1 = document.getElementsByClassName("leftmonth_month");
    var change_enum2 = document.getElementsByClassName("rightmonth_month");
    var change_enum3 = document.getElementsByClassName("day_enum");
    var change_enum4 = document.getElementsByClassName("right_day_enum");
    var change_prev = document.getElementsByClassName("prev");
    var change_rightprev = document.getElementsByClassName("rightprev");


    //记住获得的是类的文档对象是，引用记得用数组形式
    change_enum1[0].innerHTML = year + "年" + month + "月";

    change_enum2[0].innerHTML = rightyear + "年" + (rightdate.getMonth() + 1) + "月";

    //此月总天数
    var month_day = new Date(year, month, 0).getDate();
    //下月总天数
    var rightmonth_day = new Date(rightyear, rightdate.getMonth() + 1, 0).getDate();


    //清空数据
    for (var i = 0; i < 41; i++) {
        change_enum3[i].innerHTML = null;
        change_enum4[i].innerHTML = null;
    }
    //判断是否为0,是则改为7，即星期日
    if (day_begin == 0) {
        day_begin = 7;
    }
    //把此月的天数数据填入
    for (var i = 0; i < month_day; i++) {
        change_enum3[day_begin + i - 1].innerHTML = i + 1;
    }


    if (rightday_begin == 0) {
        rightday_begin = 7;
    }
    for (var i = 0; i < rightmonth_day; i++) {

        change_enum4[rightday_begin + i - 1].innerHTML = i + 1;
    }
    //判断是否是今天，是则把今天的日的字体色改变
    var datetext = new Date();
  
    if ((datetext.getFullYear() == year && (datetext.getMonth() + 1) == month)) {
   
        flush_day(new Date().getDate());
    }

    //可查的最小年月份
    var minyear = new Date().getFullYear()
    var minmonth = new Date().getMonth() + 1;
//可查的最大年月份
    var maxyear = new Date().getFullYear() + 1;
    var maxmonth = new Date().getMonth() + 1 + 3;
    if (12 - maxmonth < 0) {
        maxmonth = maxmonth - 12;
        maxyear++;
    }
    if ((maxyear == rightyear && maxmonth == (rightdate.getMonth() + 1))
        || (minyear == year && minmonth == month)) {
        if (minyear == year && minmonth == month) {
            change_prev[0].style.cursor = "default";
            change_prev[0].style.color = "#ACD3EE";
            prev_flag = 01;

        }
        if (maxyear == rightyear && maxmonth == (rightdate.getMonth() + 1)) {
            change_rightprev[0].style.cursor = "default";
            change_rightprev[0].style.color = "#ACD3EE";

            prev_flag = 10;

        }

    } else {
        change_rightprev[0].style.cursor = "pointer";
        change_rightprev[0].style.color = "#005999";
        change_prev[0].style.cursor = "pointer";
        change_prev[0].style.color = "#005999";
        prev_flag = 11;
    }


}


//用于记录今天所在的容器的位置
var nowday_position;
var change;
//改变传入的日的背景色
function flush_day(dayin) {
 
    var day = dayin;
    nowday_position = dayin;
    var day_enum = document.getElementsByClassName("day_enum");

    for (var i = 0; i < 41; i++) {

        if (day == day_enum[i].innerText) {
            change = i;
            change_white = change;
        }

    }

    for (var i = 0; i < (change); i++) {
        day_enum[i].style.color = "gray";
        day_enum[i].style.cursor = "default";
        preOpeartion = 0;
    }


    day_enum[change].style.color = "red";
    number_flag = 0;
    now_day = day;

}


//根据传入的参数把日历往上翻一页或往下翻一页
function change_page(n) {

    if (number_flag == 0) {
        var day_enum = document.getElementsByClassName("day_enum")

        for (var i = 0; i < change; i++) {
            day_enum[i].style.color = "#73aac7";
            day_enum[i].style.cursor = "pointer";
            preOpeartion = 1;

        }
        number_flag = 1;
    }


    if (n == 1) {
        //prev是否起作用
        if (prev_flag == 10) {
    
        	
            return false;
        }
        
        //把背景色变白
        document.getElementsByClassName("day_enum")[change_white].style.color = "#73aac7";
        //得到年月
        var yearnow = date.getFullYear();
        var monthnow = date.getMonth() + n + 1;

        //是否需要改变年月
        if (monthnow == 12) {
            yearnow += 1;
            monthnow = 0;
        }
        if (monthnow == 13) {
            yearnow += 1;
            monthnow = 1;
        }
    }

    if (n == -1) {
        //prev是否起作用
        if (prev_flag == 01) {       	
for (var i = 0; i < (change); i++) {
            	
                day_enum[i].style.color = "gray";
                day_enum[i].style.cursor = "default";
      
            }

        	
            return false;
        }
        //把背景色变白
        document.getElementsByClassName("day_enum")[change_white].style.backgroundColor = "white";
        //得到年月
        var yearnow = date.getFullYear();
        var monthnow = date.getMonth() + n - 1;

       
        if (monthnow == (-1)) {
            yearnow -= 1;
            monthnow = 11;
        }
    }
    //刷新日历
    flush(yearnow, monthnow);
}


//flag1为-2时，关闭"退房日期"的日历,为2时，关闭"入住日期"日历，为1时，打开"入住日期"日历，
//为-1时，打开"退房日期"的日历，为1时，在"退房日期"和"入住日期"中来回切换。
var flag1 = 0;
var flag2 = 0;
function checkclick(n) {

    flag1 = n + flag1;
    flag2++;
    if (flag1 == 2) {
        document.getElementsByClassName("search_container_three_calendar_container")[0].style.display = "none";
        flag1 = 0;
        flag2 = 0;
    }

    if (flag1 == 1) {
        document.getElementsByClassName("search_container_three_calendar_container")[0].style.display = "block";
        document.getElementsByClassName("search_container_three_calendar_container_span")[0].innerHTML = "入住日期";
        flush(0, 0);

    }

    if (flag1 == (-1)) {
        document.getElementsByClassName("search_container_three_calendar_container")[0].style.display = "block";
        document.getElementsByClassName("search_container_three_calendar_container_span")[0].innerHTML = "退房日期";
        flush(0, 0);
    }

    if (flag1 == (-2)) {
        document.getElementsByClassName("search_container_three_calendar_container")[0].style.display = "none";
        flag1 = 0;
        flag2 = 0;
    }

    if (flag1 == 0) {
        if (document.getElementsByClassName("search_container_three_calendar_container_span")[0].innerHTML == "入住日期") {
            document.getElementsByClassName("search_container_three_calendar_container_span")[0].innerHTML = "退房日期";
        }

        if (document.getElementsByClassName("search_container_three_calendar_container_span")[0].innerHTML == "退房日期") {
            document.getElementsByClassName("search_container_three_calendar_container_span")[0].innerHTML == "入住日期";
        }
    }
}


function choosedatein(n) {
	
    var type = n.split("-")[0];
    var number = n.split("-")[1];
    if(document.getElementsByClassName("day_enum")[number].style.color=="gray"&&type == "1"){
    
		return false;
	}
    document.getElementsByClassName("search_container_one")[0].style.width = "420px";
    document.getElementsByClassName("search_container_two")[0].style.width = "330px";
    document.getElementsByClassName("search_container_two")[0].style.left = "430px";
    document.getElementsByClassName("search_container_two_span1")[0].style.width = "120px";
    document.getElementsByClassName("search_container_two_span2")[0].style.left = "165px";
    document.getElementsByClassName("search_container_two_span3")[0].style.left = "190px";
   
	

    var text = document.getElementsByClassName("search_container_three_calendar_container_span")[0].innerText;
    var date1 = document.getElementsByClassName("leftmonth_month")[0].innerText;
    var year = date1.split("年")[0];

    if (text == '入住日期') {

        if (type == 1) {
            var day1 = document.getElementsByClassName("day_enum")[number].innerText;
            var day = parseInt(day1);
            number = parseInt(number);
            var month = date.getMonth() + 1;

        }

        if (type == 2) {
            var day1 = document.getElementsByClassName("right_day_enum")[number].innerText;
            var day = parseInt(day1);
            number = parseInt(number);
            var month = date.getMonth() + 2;
        }
        var week = (number + 1) % 7;
        if (week == 7) {
            week = 0;
        }
        switch (week) {
            case 1:
                week = '一';
                break;
            case 2:
                week = '二';
                break;
            case 3:
                week = '三';
                break;
            case 4:
                week = '四';
                break;
            case 5:
                week = '五';
                break;
            case 6:
                week = '六';
                break;
            case 0:
                week = '日';
                break;
        }

        var intext = document.getElementsByClassName("search_container_two_span3")[0].innerText;

        if (intext == '退房' || flag2 == 1) {

            var outmonth = month;
            var outweek = (number + 1) % 7 + 1;
            var outday = day + 1;
            //获得当月总天数
            var month_day = new Date(year, month, 0).getDate();
            if (day == month_day) {
                outmonth += 1;
                if (outmonth >= 12) {
                    outmonth = 1;
                }
                outday = 1;

            }
            if (week == 6) {
                outweek = 0;
            }
            switch (outweek) {
                case 1:
                    outweek = '一';
                    break;
                case 2:
                    outweek = '二';
                    break;
                case 3:
                    outweek = '三';
                    break;
                case 4:
                    outweek = '四';
                    break;
                case 5:
                    outweek = '五';
                    break;
                case 6:
                    outweek = '六';
                    break;
                case 0:
                    outweek = '日';
                    break;
            }
            var outdate = document.getElementsByClassName("search_container_two_span3")[0];
            outdate.innerHTML = outmonth + '月' + outday + '日星期' + outweek;
        }


        var a = month + '月' + day + '日星期' + week;
        var b = document.getElementsByClassName("search_container_two_span3")[0].innerText;
        if (datecompared(a, b) == false){
        	
            return false;
        }
        	
     
        var indate = document.getElementsByClassName("search_container_two_span1")[0];
        indate.innerHTML = a;

    }


    if (text == '退房日期') {
        if (type == 1) {
            var day1 = document.getElementsByClassName("day_enum")[number].innerText;
            var outday = parseInt(day1);
            number = parseInt(number);
            var outmonth = date.getMonth() + 1;

        }

        if (type == 2) {
            var day1 = document.getElementsByClassName("right_day_enum")[number].innerText;
            var outday = parseInt(day1);
            number = parseInt(number);
            var outmonth = date.getMonth() + 2;
        }

        var outweek = (number + 1) % 7;
        if (outweek == 7) {
            outweek = 0;
        }
        switch (outweek) {
            case 1:
                outweek = '一';
                break;
            case 2:
                outweek = '二';
                break;
            case 3:
                outweek = '三';
                break;
            case 4:
                outweek = '四';
                break;
            case 5:
                outweek = '五';
                break;
            case 6:
                outweek = '六';
                break;
            case 0:
                outweek = '日';
                break;
        }

        var intext = document.getElementsByClassName("search_container_two_span1")[0].innerText;


        if (intext == '入住') {
            var inmonth = outmonth;
            var inday = outday - 1;
            var inweek = (number + 1) % 7 - 1;
            if (inday == 0) {
                inmonth--;
                inday = new Date(year, inmonth, 0).getDate();
            }
            if (inweek == (-1)) {
                inweek = 6;
            }
            switch (inweek) {
                case 1:
                    inweek = '一';
                    break;
                case 2:
                    inweek = '二';
                    break;
                case 3:
                    inweek = '三';
                    break;
                case 4:
                    inweek = '四';
                    break;
                case 5:
                    inweek = '五';
                    break;
                case 6:
                    inweek = '六';
                    break;
                case 0:
                    inweek = '日';
                    break;
            }

            var indate = document.getElementsByClassName("search_container_two_span1")[0];
            indate.innerHTML = inmonth + '月' + inday + '日星期' + inweek;

        }

        var a = document.getElementsByClassName("search_container_two_span1")[0].innerText;
        var b = outmonth + '月' + outday + '日星期' + outweek;
        if (datecompared(a, b) == false){
        	
            return false;
        }
        
        var outdate = document.getElementsByClassName("search_container_two_span3")[0];
        outdate.innerHTML = b;


    }
    //清除背景颜色
    for (var i = 0; i < 41; i++) {
        document.getElementsByClassName("day_enum")[i].style.backgroundColor = "white";
        document.getElementsByClassName("right_day_enum")[i].style.backgroundColor = "white";
    }

}


//比较日期大小
function datecompared(a, b) {
    var amonth = parseInt(a.split('月')[0]);
    var aday = parseInt((a.split('日')[0]).split('月')[1]);
    var bmonth = parseInt(b.split('月')[0]);
    var bday = parseInt((b.split('日')[0]).split('月')[1]);

    if (amonth >= bmonth) {
        if (aday >= bday) {
       
            return false;
        }
    }
}
//判断点击的日期，点击已过的日期则返回false
var onclickyear;
function choosedate(n) {
    var type = n.split("-")[0];
    var number = n.split("-")[1];
    var year = date.getFullYear();
    onclickyear = year;
    var month = date.getMonth() + 1;
    if (type == 1 && month == (new Date().getMonth() + 1) && year == (new Date().getFullYear())) {
        for (var i = 0; i < (nowday_position + 1); i++) {
            if (i == number) {
            
                return false;
            }
        }
    }
    choosedatein(n);
}

//实时更新颜色块
function loopchangecolor() {
    //扩大空间
    var text1 = document.getElementsByClassName("search_container_two_span1")[0].innerText;
    var day_position1 = document.getElementsByClassName("day_enum");
    var day_position2 = document.getElementsByClassName("right_day_enum");
    var text2 = document.getElementsByClassName("search_container_two_span3")[0].innerText;
    var text3 = document.getElementsByClassName("leftmonth_month")[0].innerText;
    var text4 = document.getElementsByClassName("rightmonth_month")[0].innerText;

    var month1 = text1.split('月')[0];
    var day1 = (text1.split('日')[0]).split('月')[1];

    var month2 = text2.split('月')[0];
    var day2 = (text2.split('日')[0]).split('月')[1];

    var year1 = text3.split('年')[0];
    var year2 = text4.split('年')[0];

    month3 = date.getMonth() + 1;
    year3 = onclickyear;
    for (var i = 0; i < 41; i++) {
        day_position1[i].style.backgroundColor = "white";
        day_position2[i].style.backgroundColor = "white";
    }

    if ((month1 % 2) != 1 && month3 == month1 && year1 == year3) {
        for (var i = 0; i < 41; i++) {
            if (day_position1[i].innerText == day1) {
                day_position1[i].style.backgroundColor = "#005999";
            }
        }
    }
    if ((month1 % 2) == 1 && (month3 + 1) == month1 && year2 == year3) {
        for (var i = 0; i < 41; i++) {
            if (day_position2[i].innerText == day1) {
                day_position2[i].style.backgroundColor = "#005999";
            }
        }
    }


    if ((month2 % 2) != 1 && month3 == month2 && year1 == year3) {
        for (var i = 0; i < 41; i++) {
            if (day_position1[i].innerText == day2) {
                day_position1[i].style.backgroundColor = "#005999";
            }
        }
    }
    if ((month2 % 2) == 1 && (month3 + 1) == month2 && year2 == year3) {
        for (var i = 0; i < 41; i++) {
            if (day_position2[i].innerText == day2) {
                day_position2[i].style.backgroundColor = "#005999";
            }
        }
    }


}

/*****/
var who;
var whattime = 0;

/******/
function choosenum(n) {
    var kind = n.split('-')[0];
    var number = parseInt(n.split('-')[1]);
    number++;
    if (kind == "0") {
        document.getElementsByClassName("roomnum")[0].innerText = number;
    }
    if (kind == "1") {
        document.getElementsByClassName("adultnum")[0].innerText = number;
    }
    if (kind == "2") {
        number--;
        document.getElementsByClassName("childnum")[0].innerText = number;
        document.getElementsByClassName("choose_childnum")[0].style.display = "none";
    }


}
/****/
var who1;
var whattime1 = 0;
function opennumdiv(n) {

    whattime1++;


    if (n == 1) {
        if (whattime1 == 1) {
            document.getElementsByClassName("choose_roomnum")[0].style.display = "block";
            who1 = n;
        }

        if (whattime1 == 2) {
            if (who1 == n) {
                document.getElementsByClassName("choose_roomnum")[0].style.display = "none";
                whattime1 = 0;
            } else {
                whattime1 = 1;

                return false;
            }
        }
    }

    if (n == 2) {
        if (whattime1 == 1) {
            document.getElementsByClassName("choose_adultnum")[0].style.display = "block";
            who1 = n;
        }

        if (whattime1 == 2) {
            if (who1 == n) {
                document.getElementsByClassName("choose_adultnum")[0].style.display = "none";
                whattime1 = 0;
            } else {
                whattime1 = 1;
             
                return false;
            }
        }
    }

    if (n == 3) {
        if (whattime1 == 1) {
            document.getElementsByClassName("choose_childnum")[0].style.display = "block";
            who1 = n;
        }

        if (whattime1 == 2) {
            if (who1 == n) {
                document.getElementsByClassName("choose_childnum")[0].style.display = "none";
                whattime1 = 0;
            } else {
                whattime1 = 1;
         
                return false;
            }
        }
    }
}
/******/
setInterval(flushindate, 100);
function flushindate() {
    var childnum = document.getElementsByClassName("childnum")[0].innerText;
    var adultnum1 = document.getElementsByClassName("adultnum")[0].innerText;
    var a = adultnum1 + "名成人" + "&" + childnum + "名儿童";
    document.getElementsByClassName("search_container_three_span")[0].innerText = a;
}
/*******/
var opencontainer = 0;
function opencontainer2(n) {
    opencontainer = n + opencontainer;
    if (opencontainer == 1) {
        document.getElementsByClassName("user_choose_container")[0].style.display = "block";
        document.getElementsByClassName("user_choose_container2")[0].style.display = "block";
    } else {
        document.getElementsByClassName("user_choose_container")[0].style.display = "none";
        document.getElementsByClassName("user_choose_container2")[0].style.display = "none";
        opencontainer = 0;
    }
}



