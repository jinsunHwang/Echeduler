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
  	<form role="form" action="/cal/remove" method="post">
  	<input name="bno" type="hidden" value="${board.bno }">
  	<input name="start_day" type="hidden" value="${board.start_day }">
	    <header class="top-header">
	      <div class="header__top">
	      </div>
	      <div class="header__bottom">
	        <div class="header__column">
	          	<a data-oper='list' href="/cal/main">
					<i class="fa fa-chevron-left fa-lg"></i>
				</a>
	        </div>
	        <div class="header__column">
	          <span class="header__text">Echeduler</span>
	        </div>
	        <div class="header__column">
				<button type="submit" data-oper='remove' class="cal__remove">	<i class="far fa-trash-alt fa-lg"></i></button> 
	        </div>
	      </div>
	    </header>
	</form>
    <main class="cal__register">
      <form role="form" action="/cal/calmodify" method="post">
        <header class="carinfo__header">
    			<header class="register__header-header">
    				<label class="register__label">제목</label>
            		<input class="input__design" name="title" value='<c:out value="${board.title }"/>'>
            		<input name="bno" type="hidden" value="${board.bno }">
    			</header>
    			<div class="carinfo__header-container">
    				<div class="carinfo__header-container_item">
    					<label class="carinfo__item-title">시작</label>
    					<input id="fromDate" class="input__design" type="time" name="start_time" value='<c:out value="${board.start_time}"/>'>
    				</div>
    				<div class="carinfo__header-container_item">
    					<label class="carinfo__item-title">종료</label>
    					<input id="toDate" class="input__design" type="time" name="end_time"  value='<c:out value="${board.end_time}"/>'>
    					<input name="start_day" type="hidden" value="${board.start_day }">
    				</div>
    			</div>
  		  </header>
        <section class="cal__container">
          <div class="cal__container-main">
            <div class="container-text">
              <textarea name="content" id="" cols="30" rows="10" class="input__design" rows="10" style="width:100%;" ><c:out value="${board.content }"/></textarea>
            </div>
          </div>

        </section>

      
      <nav class="tab-bar-cal__register">
        <button type="submit" data-oper="modify" class="cal__container-action">
         
             	 작성
       
        </button>
      </nav>
      </form>
    </main>
<script type="text/javascript">
$(document).ready(function(){
	
	var formObj= $("form");
	
	$('button').on("click",function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'remove'){
			formObj.attr("action","/cal/remove");
		}else if(operation==='list'){
			//move to list
			formObj.attr("action","/cal/main").attr("method","get");
			formObj.empty();
		}
		formObj.submit();
	})
	
})

</script>
</body>
</html>
