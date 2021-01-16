<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/resources/main.css">
	<title>분양임대 정보 제공 서비스</title>
</head>
<body>
	<div class="container">
		<div id="home-titleArea">
			<p>분양임대 정보 제공 서비스</p>
		</div>
		<div id="home-contentArea">
			<button type="button" class="btn btn-default" onclick="location.href='/account/signin'">로그인</button>
			<button type="button" class="btn btn-default" onclick="location.href='/account/signup'">회원가입</button>
		</div>
	</div>
</body>
</html>
<style>
	body {
		width: 90%;
		height: 500px;
		background: url("/resources/img/lichtraum-1560788_1920.jpg") no-repeat center center;
	}

	#home-titleArea {
		width: 100%;
		height: 80%;
		text-align: center;
		color: black;
		margin: 0 auto;
		display: flex;
		align-items: center;
		justify-content: center;
	}

	#home-titleArea p {
		margin: 0;
		font-size: 50px;
		font-weight: bold;
	}

	#home-contentArea {
		width: 100%;
		height: 100px;
		margin: 20px auto;
		text-align: center;
		vertical-align: top;
	}

	button {
		margin: 0 20px auto;
	}
</style>
