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
<h3> 
수치연사<br>
${10-1},${10+10},${10*10},${10/2},${10/3},${10%3}<br>
${10 div 2},${10 div 3},${10 mod 3}<br>
비교연산<br>
${1==1},${10!=10}, ${10>1},${ 10<1},${10>=1},${10<=1}<br>
${1eq 1},${10 ne 10}, ${10 gt 1},${ 10 lt 1},${10ge 1},${10le 1}<br>

</h3>
논리연산자<br>

${true&&true},${true||true},${!true}<br>
${true and true},${true or true},${ not true}<br>
</body>
</html>