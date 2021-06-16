<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	
	AJAX<br>
	Asynchronous Javascript And XML<br>
	AJAX 통신은 코드 흐름에 block을 주지 않음<br>
	비동기 통신으로 데이터를 주고 받을 시 페이지 전환이 발행하지 않음<br>
	
	JSON -> JavaScriptObject Notation<br>
	{"key":"value","key":"value"}<Br>
	
	JSONArray<br>
	[1,2,3,4]<br>
	<hr>
	단순요청<br>
	<button id="exam01">Exam01</button>
	
	<script>
		$("#exam01").on("click",function(){
			$.ajax({
				url:"exam01.ajax",
				type:"get"
			});
		})
	</script>
	<hr>
	
	인자값이 있는 요청<br>
	<button id="exam02">Exam02</button>
	
	<script>
		$("#exam02").on("click",function(){
			$.ajax({
				url:"exam02.ajax",
				type:"get",
				data:{"param1":"Hello","param2":"World"},
			});
		})
	</script>
	<hr>
	
	응답을 받는 요청<br>
	<button id="exam03">Exam03</button>
	<div id="ajaxResponse">여기에 반환메세지 저장!</div>
	<script>
		$("#exam03").on("click",function(){
			$.ajax({
				url:"exam03.ajax",
				type:"get"			
			}).done(function(resp){
				$("#ajaxResponse").text(resp);
			});
		})
	</script>
</body>
</html>