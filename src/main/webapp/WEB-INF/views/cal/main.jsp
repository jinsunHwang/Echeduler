<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%

Calendar cal = Calendar.getInstance();

 

String strYear = request.getParameter("year");

String strMonth = request.getParameter("month");

 

int year = cal.get(Calendar.YEAR);

int month = cal.get(Calendar.MONTH);

int date = cal.get(Calendar.DATE);

 

if(strYear != null)

{

  year = Integer.parseInt(strYear);

  month = Integer.parseInt(strMonth);

 

}else{

 

}

//년도/월 셋팅

cal.set(year, month, 1);

 

int startDay = cal.getMinimum(java.util.Calendar.DATE);

int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);

int start = cal.get(java.util.Calendar.DAY_OF_WEEK);

int newLine = 0;

 

//오늘 날짜 저장.

Calendar todayCal = Calendar.getInstance();

SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");

int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));

 

 

%> 
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
		  	<span class="header__text">Echeduler</span>
		</div>
			<div class="header__column">
			  
			</div>
     	</div>
   	</header>
   	<main class="home">
		<div class="cal_top">
		<%if(month!=0){ %>
			<a href="/cal/main?year=<%=year %>&amp;month=<%=month-1 %>" id="movePrevMonth"><span id="prevMonth" class="cal_tit">&lt;</span></a>
		<%}else{ %>
			<a href="/cal/main?year=<%=year-1 %>&amp;month=11" id="movePrevMonth"><span id="prevMonth" class="cal_tit">&lt;</span></a>
		<%} %>	
			<span id="cal_top_year"><%=year %></span>
			<span id="cal_top_month"><%=month+1 %></span>
		<%if(month==12){ %>	
			<a href="/cal/main?year=<%=year+1 %>&amp;month=0" id="moveNextMonth"><span id="nextMonth" class="cal_tit">&gt;</span></a>
		<%} else{%>
			<a href="/cal/main?year=<%=year %>&amp;month=<%=month+1 %>" id="moveNextMonth"><span id="nextMonth" class="cal_tit">&gt;</span></a>
		<%} %>
   		</div>
   	<div id="cal_tab" class="cal">
   		<table class="calendar">
   			<tr><th>SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th>SAT</th></tr>
			<tr height="100">
			<%
			for(int index=1;index< start; index++){
				out.println("<td class='dayid'>");
				out.println("<div id='dayid' class='cal-day'>");
				out.println("</div>");
				out.println("<div class='cal-schedule'>");
				out.println("</div>");
				out.println("</td>");
			
				newLine++;
			}
			
			for(int index=1;index<=endDay; index++){
				String color = "";
				if(newLine==0){
					color="RED";
				}else if(newLine == 6){
					color = "#529dbc";
				} else{
					color="BLACK";
				}
				
				String sUseDate= Integer.toString(year);
				String dayDate = Integer.toString(year);
				dayDate += "-";
				sUseDate += Integer.toString(month+1).length()==1?"0"+ Integer.toString(month+1) : Integer.toString(month+1);
				dayDate += Integer.toString(month+1).length()==1?"0"+ Integer.toString(month+1) : Integer.toString(month+1);
				dayDate += "-";
				dayDate += Integer.toString(index).length()==1?"0"+ Integer.toString(index) : Integer.toString(index);
				sUseDate += Integer.toString(index).length()==1?"0"+ Integer.toString(index) : Integer.toString(index);
				
				pageContext.setAttribute("dayDate", dayDate);
				int iUseDate = Integer.parseInt(sUseDate);
				
				String backColor = "#EFEFEF";
				
				if(iUseDate == intToday ) {

		             backColor = "#c9c9c9";

		       }
				out.println("<td class='dayid'>");
				out.println("<div id='dayid' class='cal-day'>");
				
			%>
				<font onclick="location.href='/cal/cal?start_day=${dayDate }'" color='<%=color%>'>
					<%=index %>
				</font>
			
				
				</div>
				<div class='cal-schedule'>
					<ul >
					
						<c:forEach items='${main}' var='board'>
							
								<c:if test="${board.start_day eq dayDate }">
								<li>
									<c:out value='${board.title}'/>
								</li>
								</c:if>
						
						</c:forEach>
					</ul>
				</div>
			</td>
			<%
			    newLine++;
				
			    if(newLine == 7)

			       {

			         out.println("</TR>");

			         if(index <= endDay)

			         {

			           out.println("<TR height='100'>");

			         }

			         newLine=0;

			       }
			    
			    
			}
			
			while(newLine > 0 && newLine < 7)

			{

			  out.println("<TD>&nbsp;</TD>");

			  newLine++;

			}
			
			
			%>
			
			
   		</table>
   	</div>
	
	

    </main>
  </body>
</html>
