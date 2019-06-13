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
  	<title>cal</title>
</head>
	<body>
	  <header class="top-header">
	    <div class="header__top">
	    </div>
	    <div class="header__bottom">
	      <div class="header__column">
			<a href="main">
	          <i class="fa fa-chevron-left fa-lg"></i>
	        </a>
	      </div>
	      <div class="header__column">
	        <span class="header__text">Echeduler</span>
	        <span class="header__text"></span>
	      </div>
	      <div class="header__column">
	      	<a href="/cal/calregister?start_day=${start_day }">
	        	<i class="fas fa-plus"></i>
	        </a>
	      </div>
	    </div>
	  </header>
	  <main class="home">
	    <section class="home__eheduler-board">
	      <ul class="eheduler-board__postings">
		      <c:forEach items="${cal }" var="board">
		      	<li class="eheduler-board__posting">
		          <a href='/cal/calmodify?bno=<c:out value="${board.bno }"/>'>
		            <div class="posting__content">
		              <div class="content__column">
		                <i class="far fa-calendar-alt fa-2x " style="color:#4374d9"></i>
		              </div>
		              <div class="content__column">
		                <div class="posting__preview">
		                  <h4 class="eheduler-board__posting-title"><c:out value="${board.start_time }"/> - <c:out value="${board.end_time }"/></h4>
		                  <h4 class="eheduler-board__posting-title"><c:out value="${board.title }"/></h4>
		                </div>
		              </div>
		              <div class="content__column">
		                <div>
		
		                </div>
		              </div>
		            </div>
		          </a>
		        </li>
		      </c:forEach> 
	      </ul>
	    </section>	
	  </main>
	</body>
</html>