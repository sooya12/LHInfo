<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/resources/main.css">
	<script src="https://kit.fontawesome.com/8962e3bb2c.js" crossorigin="anonymous"></script>
	<title>분양임대 정보 제공 서비스</title>
</head>
<body>
	<div class="container">
		<div id="home-titleArea">
			<p>분양임대 정보 제공 서비스</p>
		</div>
		<div id="home-contentArea">
			<div class="account-button">
				<span onclick="location.href='/account/signin'">
					<i class="fas fa-user-check"></i><br>
					로그인
				</span>
			</div>
			<div class="account-button">
				<span onclick="location.href='/account/signup'">
					<i class="fas fa-user-plus"></i><br>
					회원가입
				</span>
			</div>
		</div>
	</div>
</body>
</html>
<style>
	body {
		width: 90%;
		height: 500px;
		background-image: url("/resources/img/jack-prommel-T2wAe8qXy4w-unsplash_opacity.jpg");
		background-position: top;
		background-size: cover;
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
		font-size: max(4vw, 50px);
		font-weight: bold;
	}

	#home-contentArea {
		width: 100%;
		height: 100px;
		margin: 20px auto;
		text-align: center;
		display: flex;
		align-items: center;
		justify-content: center;
		font-size: 25px;
	}

	.account-button {
		width: 20%;
		float: left;
	}

	.account-button span {
		cursor: pointer;
		color: #000000;
		text-shadow: 0 0 4px #ffffff;
	}

	.account-button i {
		margin-bottom: 5px;
	}

</style>
