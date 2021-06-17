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
	<div id="ajaxResponse1">여기에 반환메세지 저장!</div>
	<script>
		$("#exam03").on("click",function(){
			$.ajax({
				url:"exam03.ajax",
				type:"get"			
			}).done(function(resp){
				$("#ajaxResponse1").text(resp);
			}).fail(function(a,b,c){
				$("#ajaxResponse1").text("서버와의 통신이 불안정");
			}).always(function(){
				
			})
		})
	</script>
	<hr>
	
	반환하는 값이 객체<br>
	<button id="exam04">Exam04</button>
	<div id="ajaxResponse2">여기에 반환메세지 저장!</div>
	<script>
		$("#exam04").on("click",function(){
			$.ajax({
				url:"exam04.ajax",
				type:"get",
				data:"json"
			}).done(function(resp){
				let result = JSON.parse(resp);
				console.log(result.id);
				console.log(result.name);
				console.log(result.message);
				//$("#ajaxResponse2").text(result.id);
			})
		})
	</script>
	<hr>
	
	반환하는 값이 배열<br>
	<button id="exam05">Exam05</button>
	<script>
		$("#exam05").on("click",function(){
			$.ajax({
				url:"exam05.ajax",
				type:"get",
				dataType:"json"
			}).done(function(resp){
				console.log(resp);
				console.log(resp[0]);
				console.log(resp[1]);
			})
		})
	</script>
	<hr>
	
	반환하는 값이 객체배열<br>
	<button id="exam06">Exam06</button>
	<script>
		$("#exam06").on("click",function(){
			$.ajax({
				url:"exam06.ajax",
				type:"get",
				dataType:"json"
			}).done(function(resp){
				console.log(resp);
				console.log(resp[1].name);
				console.log(resp[0].message);
			})
		})
	</script>
	<hr>
	
	반환하는 값이 객체배열<br>
	<button id="exam07">Exam07</button>
	<script>
		$("#exam07").on("click",function(){
			$.ajax({
				url:"exam07.ajax",
				type:"get",
				dataType:"json"
			}).done(function(resp){
				console.log(resp);
				console.log(resp[0].id);
				console.log(resp[0].name);
				console.log(resp[0].message);
				console.log(resp[1].id);
				console.log(resp[1].name);
				console.log(resp[1].message);
			})
		})
	</script>
</body>
</html>