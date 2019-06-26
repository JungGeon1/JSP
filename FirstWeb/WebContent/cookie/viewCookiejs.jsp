<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
쿠키이름<input type="text" id="cName">,쿠키 데이ㅓ <input type="text" id="cValue" >
<input type="button" id="createCookie" value="쿠키생성">
<input type="button" id="deleteCookie'" value="쿠키삭제">

<hr>
	<input value="쿠키값확인" type="button" id="viewCookie">
	<div id="view"></div>
	<script>
		$(document).ready(function() {
			var name='name';
			$('#deleteCookie').click(function(){
				var cName = $('#cName').val();
				deleteCookie(cName);
				alert('쿠키가 삭제되었습니다.');
			});
			$('#createCookie').click(function(){
				var cName=$('#cName').val();
				var cValue=$('#cValue').val();
				setCookie(cName,cValue,1);
			});
			
			var setCookie=function(name,value,day){
				var date=new Date();
				date.setTime(date.getTime()+day*60*60*24*1000);
				document.cookie=name+'='+value
				+';expires='+date.toUTCString()
				+';path=/';
				};
			
			$('#viewCookie').click(function() {
				var name=$('#cName').val();
				var value=document.cookie.match('(^|;)?'+name+'=([^;]*)(;|$)');
				value=value?value[2]:null;
				alert(value);
				$('#view').html('name'+value);
			});
			var deleteCookie=function(name){
				var date=newDate();
				document.cookie=name+"="+";expires="+date.toUTCString()+";path=/";
				}
		});
	</script>
</body>
</html>