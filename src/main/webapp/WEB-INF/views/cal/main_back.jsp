<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
   integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <link rel="stylesheet" href="/resources/css/style.css">
   <title>home</title>
   <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 </head>
 <body>
   	<header class="top-header">
		<div class="header__top">
		</div>
		<div class="header__bottom">
		<div class="header__column">
	
		</div>
		<div class="header__column">
		  	<span class="header__text">Eheduler</span>
		</div>
			<div class="header__column">
			  <i class="fas fa-plus"></i>
			</div>
     	</div>
   	</header>
   	<main class="home">
		<div class="cal_top">
			<a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit">&lt;</span></a>
			<span id="cal_top_year"></span>
			<span id="cal_top_month"></span>
			<a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit">&gt;</span></a>
   		</div>
   	<div id="cal_tab" class="cal">
   	</div>
	
	<script type="text/javascript">

    var today = null;
    var year = null;
    var month = null;
    var firstDay = null;
    var lastDay = null;
    var $tdDay = null;
    var $tdSche = null;
    
    $(document).ready(function() {
        drawCalendar();
        initDate();
        drawDays();
        $("#movePrevMonth").on("click", function(){movePrevMonth();});
        $("#moveNextMonth").on("click", function(){moveNextMonth();});
    });

    //calendar 그리기
    function drawCalendar(){
    	
        var setTableHTML = "";
        setTableHTML+='<table class="calendar">';
        setTableHTML+='<tr><th>SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th>SAT</th></tr>';
        for(var i=0;i<6;i++){
            setTableHTML+='<tr height="100">';
            for(var j=0;j<7;j++){
                setTableHTML+='<td class="dayid">';
                setTableHTML+='    <div id="dayid" class="cal-day"></div>';
                setTableHTML+='    <div class="cal-schedule">';
                setTableHTML+='			<ul>';
                setTableHTML+='				<c:forEach items='${main}' var="board">';
               	console.log(dday);
                setTableHTML+='	   				<li>';
                setTableHTML+='						<c:out value='${board.title}'/>';
                setTableHTML+='					<li>';
                setTableHTML+='				</c:forEach>';
                setTableHTML+='			<ul>';
                setTableHTML+='	   </div>';
                setTableHTML+='</td>';
            }
            setTableHTML+='</tr>';
        }
        setTableHTML+='</table>';
        $("#cal_tab").html(setTableHTML);
    }
    
    $(function() {
        // onclick을 없애고 제이쿼리의 이벤트 리스너를 등록하자
    	$("td.dayid").click(function() {
    		var _year = $("#cal_top_year").text();
    		var _month = $("#cal_top_month").text();
    		var day = $(this).text().trim();
    		dday=(_year + "-" + _month + "-" + day[0]+day[1]).trim();
            
    	});
    });

    //날짜 초기화
    function initDate(){
        $tdDay = $("td div.cal-day")
        $tdSche = $("td div.cal-schedule")
        dayCount = 0;
        today = new Date();
        year = today.getFullYear();
        month = today.getMonth()+1;
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
    }

    //calendar 날짜표시
    function drawDays(){
        $("#cal_top_year").text(year);
        $("#cal_top_month").text(month);
        for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
            $tdDay.eq(i).text(++dayCount);
        }
        for(var i=0;i<42;i+=7){
            $tdDay.eq(i).css("color","red");
        }
        for(var i=6;i<42;i+=7){
            $tdDay.eq(i).css("color","blue");
        }
    }

    //calendar 월 이동
    function movePrevMonth(){
        month--;
        if(month<=0){
            month=12;
            year--;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
        }

    function moveNextMonth(){
        month++;
        if(month>12){
            month=1;
            year++;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
    }


    function getNewInfo(){
        for(var i=0;i<42;i++){
            $tdDay.eq(i).text("");
        }
        dayCount=0;
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
        drawDays();
    }
    
</script>

    </main>
  </body>
</html>
