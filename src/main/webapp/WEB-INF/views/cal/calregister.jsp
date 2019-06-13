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

    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"></script>
  	<title>home</title>
  </head>
  <body>
    <header class="top-header">
      <div class="header__top">
      </div>
      <div class="header__bottom">
        <div class="header__column">
          <i class="fas fa-chevron-left"></i>
        </div>
        <div class="header__column">
          <span class="header__text">Echeduler</span>
        </div>
        <div class="header__column">

        </div>
      </div>
    </header>

    <main class="cal__register">
      <form role="form" action="/cal/calregister" method="post">
        <header class="carinfo__header">
    			<header class="register__header-header">
    				<label class="register__label">제목</label>
            <input class="input__design" type="text" name="title" placeholder="제목을 입력하세요">
    			</header>
    			<div class="carinfo__header-container">
    				<div class="carinfo__header-container_item">
    					<label class="carinfo__item-title">시작</label>
    					<input id="fromDate" class="input__design" type="time" name="start_time">
    				</div>
    				<div class="carinfo__header-container_item">
    					<label class="carinfo__item-title">종료</label>
    					<input id="toDate" class="input__design" type="time" name="end_time"  >
    					<input name="start_day" type="hidden" value="${start_day }">
    				</div>
    			</div>
  		  </header>
        <section class="cal__container">
          <div class="cal__container-main">
            <div class="container-text">
              <textarea name="content" id="" cols="30" rows="10" class="input__design" rows="10" style="width:100%;" placeholder="내용"></textarea>
            </div>
          </div>

        </section>

      
      <nav class="tab-bar-cal__register">
        <button type="submit" class="cal__container-action">
         
             	 작성
       
        </button>
      </nav>
      </form>
    </main>

</body>
</html>
