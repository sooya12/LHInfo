<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<%@ include file="/resources/main.html" %>
	<link rel="stylesheet" href="/resources/main.css">
	<title>분양임대 정보 제공 서비스</title>
</head>
<body>
	<div class="container">
		<div id="home-titleArea">
			<p>분양임대 정보 제공 서비스</p>
		</div>
		<div id="home-contentArea">
			<div class="form">
				<ul class="tab-group">
					<li class="tab active"><a href="#login">로그인</a></li>
					<li class="tab"><a href="#signup">회원가입</a></li>
				</ul>
				<div class="tab-content">
					<div id="login">
						<h3>서비스 사용을 위해<br> 로그인해주세요</h3>
						<form id="loginForm" action="/account/" method="get">
							<div class="field-wrap">
								<label>
									아이디<span class="req">*</span>
								</label>
								<input type="text" id="login-identify" required autocomplete="off"/>
							</div>
							<div class="field-wrap">
								<label>
									비밀번호<span class="req">*</span>
								</label>
								<input type="password" id="login-password" required autocomplete="off"/>
							</div>
							<p class="forgot"><a href="#">비밀번호를 모르시나요?</a></p>
							<button type="button" class="button button-block" id="login-button" onclick="checkAccount();">로그인</button>
							<input type="hidden" id="accountId" name="id"/>
						</form>
					</div>
					<div id="findPwd">
						<h3>비밀번호 찾기</h3>
						<div class="field-wrap">
							<label>
								아이디<span class="req">*</span>
							</label>
							<input type="text" required autocomplete="off" name="identify" id="findPwd-identify"/>
						</div>
						<div class="field-wrap">
							<label>
								이메일<span class="req">*</span>
							</label>
							<input type="text" required autocomplete="off" name="email" id="findPwd-email"/>
						</div>
						<button class="button button-block" id="findPwd-button">임시 비밀번호 발급</button>
						<input type="text" readonly disabled id="tempPwd"/>
					</div>
					<div id="signup">
						<h2>회원정보를 입력해주세요</h2>
						<form id="signupForm" action="/account/" method="post">
							<div class="top-row">
								<div class="field-wrap">
									<label>
										아이디<span class="req">*</span>
									</label>
									<input type="text" required autocomplete="off" name="identify" id="signup-identify"/>
								</div>
								<div class="field-wrap">
									<input type="text" id="checkIdentifyNotice" readonly onfocus="this.blur();"/>
								</div>
							</div>
							<div class="field-wrap">
								<label>
									비밀번호<span class="req">*</span>
								</label>
								<input type="password" required autocomplete="off" name="password" id="signup-password"/>
							</div>
							<div class="field-wrap">
								<label id="signup-repeat-password-label">
									비밀번호 확인<span class="req">*</span>
								</label>
								<input type="password" required autocomplete="off" id="signup-repeat-password"/>
							</div>
							<div class="field-wrap">
								<label>
									이름<span class="req">*</span>
								</label>
								<input type="text" required autocomplete="off" name="name" id="signup-name"/>
							</div>
							<div class="field-wrap">
								<label>
									이메일<span class="req">*</span>
								</label>
								<input type="email" required autocomplete="off" name="email" id="email"/>
							</div>
							<button class="button button-block" id="signup-button">가입하기</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script>
	$('.form').find('input, textarea').on('keyup blur focus', function (e) {

		var $this = $(this),
			label = $this.prev('label');

		if (e.type === 'keyup') {
			if ($this.val() === '') {
				label.removeClass('active highlight');
			} else {
				label.addClass('active highlight');
			}
		} else if (e.type === 'blur') {
			if( $this.val() === '' ) {
				label.removeClass('active highlight');
			} else {
				label.removeClass('highlight');
			}
		} else if (e.type === 'focus') {
			if( $this.val() === '' ) {
				label.removeClass('highlight');
			}
			else if( $this.val() !== '' ) {
				label.addClass('highlight');
			}
		}
	});

	$('.tab a').on('click', function (e) {
		e.preventDefault();

		$(this).parent().addClass('active');
		$(this).parent().siblings().removeClass('active');

		target = $(this).attr('href');

		$('.tab-content > div').not(target).hide();

		$(target).fadeIn(600);
	});

	$(document).ready(function() {
		$("#findPwd").hide();
		$("#tempPwd").hide();
		$("#findPwd-button").attr("disabled", "true");
	});

	$(".forgot").click(function() {
		$("#login").hide();
		$("#findPwd").show();
	});

	function checkAccount() {
		$.ajax({
			type: "POST",
			async: false,
			url: "/account/checkExistence",
			data: {identify: $("#login-identify").val(), password: $("#login-password").val()},
			dataType: "text",
			success: function(data) {
				if(data != "re-enter") {
					$("#accountId").val(data);
					$("#loginForm").submit();
				} else if(data == "re-enter") {
					$("#login h3").text("틀렸습니다. 다시 입력해주세요.");
				}
			}
		});
	};

	$("#signup-identify").on("change keyup paste", function() {
		$.ajax({
			type: "GET",
			async: false,
			url: "/account/checkIdentify",
			data: {identify: $(this).val()},
			dataType: "text",
			success: function(data) {
				console.log(data);
				if(data == "available") {
					$("#checkIdentifyNotice").val("");
					$("#signup-button").attr("disabled", false);
					$("button").css("background-color", "#CDC4B3");
				} else if(data == "re-enter") {
					$("#checkIdentifyNotice").val("중복된 아이디입니다.");
					$("#signup-button").attr("disabled", true);
					$("button").css("background-color", "#d9d9d9");
				}
			}
		});
	});

	$("#signup-repeat-password").on("change keyup paste", function() {
		if($(this).val() && $(this).val().length >= $("#signup-password").val().length) {
			if($(this).val() == $("#signup-password").val()) {
				$("#signup-button").attr("disabled", false);
				$("button").css("background-color", "#CDC4B3");
			} else {
				$("#signup-repeat-password-label").val("틀렸습니다. 다시 입력해주세요.");
				$("#signup-button").attr("disabled", true);
				$("button").css("background-color", "#d9d9d9");
			}
		} else {
			$("#signup-button").attr("disabled", true);
			$("button").css("background-color", "#d9d9d9");
		}
	});

	$("#findPwd-identify").on("change keyup paste", function() {
		if($("#findPwd-identify").val().length > 0 && $("#findPwd-email").val().length > 0) {
			$("#findPwd-button").attr("disabled", false);
			$("#findPwd-button").css("background-color", "#CDC4B3");
		} else {
			$("#findPwd-button").attr("disabled", true);
			$("#findPwd-button").css("background-color", "#d9d9d9");
		}
	});

	$("#findPwd-email").on("change keyup paste", function() {
		if($("#findPwd-identify").val().length > 0 && $("#findPwd-email").val().length > 0) {
			$("#findPwd-button").attr("disabled", false);
			$("#findPwd-button").css("background-color", "#CDC4B3");
		} else {
			$("#findPwd-button").attr("disabled", true);
			$("#findPwd-button").css("background-color", "#d9d9d9");
		}
	});

	$("#findPwd-button").click(function() {
		$.ajax({
			type: "GET",
			url: "/account/checkExistenceByEmail",
			data: {identify: $("#findPwd-identify").val(), email: $("#findPwd-email").val()},
			dataType: "text",
			success: function(data) {
				if(data == "re-enter") {
					$("#findPwd h3").text("잘못된 회원정보입니다.");
					$("#findPwd-button").attr("disabled", true);
					$("#findPwd-button").css("background-color", "#d9d9d9");
				} else if(data != "re-enter" && data != null) {
					$.ajax({
						type: "PUT",
						url: "/account/updatePassword",
						data: data,
						dataType: "text",
						success: function(data) {
							if(data == "fail") {
								location.href = "/error";
							} else {
								$("#findPwd h3").text("비밀번호가 변경되었습니다.");
								$("#findPwd-button").hide();
								$("#tempPwd").val("임시 비밀번호는 " + data + "입니다.");
								$("#tempPwd").show();
							}
						},
						error: function(err) {
							console.log(err);
						}
					});
				}
			},
			error: function(err) {
				console.log(err);
			}
		});
	})
</script>
<style>
	body {
		width: 90%;
		height: 500px;
		background-image: url("/resources/img/jack-prommel-T2wAe8qXy4w-unsplash_opacity.jpg");
		background-position: top;
		background-size: cover;
		background-repeat: no-repeat;
		background-color: #CDC4B3;
	}

	#home-titleArea {
		width: 100%;
		height: 50%;
		text-align: center;
		color: black;
		margin: 0 auto;
		display: flex;
		align-items: center;
		justify-content: center;
	}

	#home-titleArea p {
		margin-top: 80px;
		margin-bottom: 0;
		font-size: max(4vw, 50px);
		font-weight: bold;
	}

	#home-contentArea {
		width: 100%;
		height: auto;
		margin: 0 auto;
		text-align: center;
		display: flex;
		align-items: center;
		justify-content: center;
	}

	*, *:before, *:after {
		box-sizing: border-box;
	}

	html {
		overflow-y: scroll;
	}

	a {
		text-decoration: none;
		color: #CDC4B3;
		transition: .5s ease;
	}
	a:hover {
		color: #CDC4B3;
	}

	.form {
		background: rgba(19, 35, 47, 0.9);
		padding: 40px;
		/*max-width: 600px;*/
		width: 400px;
		margin: 40px auto;
		border-radius: 4px;
		box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);
	}

	.tab-group {
		list-style: none;
		padding: 0;
		margin: 0 0 40px 0;
	}
	.tab-group:after {
		content: "";
		display: table;
		clear: both;
	}
	.tab-group li a {
		display: block;
		text-decoration: none;
		padding: 15px;
		background: rgba(160, 179, 176, 0.25);
		color: #a0b3b0;
		font-size: 20px;
		float: left;
		width: 50%;
		text-align: center;
		cursor: pointer;
		transition: .5s ease;
	}
	.tab-group li a:hover {
		background: #CDC4B3;
		color: #000000;
	}
	.tab-group .active a {
		background: #CDC4B3;
		color: #000000;
	}

	.tab-content > div:last-child {
		display: none;
	}

	h2, h3 {
		text-align: center;
		color: #ffffff;
		font-weight: 300;
		margin: 0 0 40px;
	}

	label {
		position: absolute;
		transform: translateY(6px);
		left: 10px;
		color: rgba(255, 255, 255, 0.5);
		transition: all 0.25s ease;
		-webkit-backface-visibility: hidden;
		pointer-events: none;
		font-size: 15px;
	}
	label .req {
		margin: 2px;
		color: #CDC4B3;
	}

	label.active {
		transform: translateY(30px);
		left: 2px;
		font-size: 14px;
	}
	label.active .req {
		opacity: 0;
	}

	label.highlight {
		color: #ffffff;
	}

	input, textarea {
		font-size: 15px;
		display: block;
		width: 100%;
		height: 100%;
		padding: 5px 10px;
		background: none;
		border: 1px solid #a0b3b0;
		color: #ffffff;
		border-radius: 0;
		transition: border-color .25s ease, box-shadow .25s ease;
	}
	input:focus, textarea:focus {
		outline: 0;
		border-color: #CDC4B3;
	}

	textarea {
		border: 2px solid #a0b3b0;
		resize: vertical;
	}

	.field-wrap {
		position: relative;
		margin-bottom: 40px;
	}

	.top-row:after {
		content: "";
		display: table;
		clear: both;
	}
	.top-row > div {
		float: left;
		width: 48%;
		margin-right: 4%;
	}
	.top-row > div:last-child {
		margin: 0;
	}

	.button {
		border: 0;
		outline: none;
		border-radius: 0;
		padding: 15px 0;
		font-size: 2rem;
		font-weight: 600;
		text-transform: uppercase;
		letter-spacing: .1em;
		background: #CDC4B3;
		color: #000000;
		transition: all 0.5s ease;
		-webkit-appearance: none;
	}
	.button:hover, .button:focus {
		background: #CDC4B3;
	}

	.button-block {
		display: block;
		width: 100%;
	}

	.forgot {
		margin-top: -20px;
		text-align: right;
	}

	#checkIdentifyNotice, #tempPwd {
		width: 100%;
		height: 30px;
		float: right;
		color: #ffffff;
		border: none;
	}

</style>
