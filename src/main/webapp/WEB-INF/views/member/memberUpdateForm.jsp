<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	#content_container {
	    margin-left: 20%;
	    margin-right: 15%;
    }
    
    /* 버튼 효과 */
	#content_container button {
    	border: 1px solid #64FFDA;
    	background-color: rgb(23, 26, 33);
    	color: white;
    	height: 50px;
    	width: 200px;
    	font-size: 20px;
    	font-weight: bold;
    }
    #content_container button:hover {
    	background-color: #64FFDA;
    	color: gray;
    }
    
    /* 닉네임 입력 창 효과 */
	input[type=text] {
		height: 50px;
		border: 1px solid gray;
    	background-color: rgb(23, 26, 33);
    	color: gray;
    	font-size: 20px;
	}
	
	/* 프로필 선택 효과 */
	.active {
		border: 5px solid #64FFDA;
	}
</style>
</head>
<body>

	<!-- 전체 영역 -->
    <div class="wrap">

		<!-- 플로팅 버튼 영역 -->
        <jsp:include page="../common/floatingButton.jsp" />

		<!-- 헤더 영역 -->
        <jsp:include page="../common/header.jsp" />
	
		
        <!-- 컨텐츠 영역 (개별 구현 구역) -->
        <div id="content_container">
        	<h1>프로필 편집</h1>
        	
        	<form action="update.me" method="post" id="updateProfileForm">
	        	<h2>프로필 사진</h2> 
		        <table id="user_profile">
		        	<input type="hidden" name='userId' value="${ loginUser.userId }">
		        	<input type="hidden" name="userNo" value="${ loginUser.userNo }">
		        	<input type="hidden" name="userProfile" id="userProfile" value="${ loginUser.userProfile }">
		            <tr>
		            	<td><img src="resources/image/user/profile/profile1.jfif" value="1" width="170" height="170"></td>
		            	<td><img src="resources/image/user/profile/profile2.png" value="2" width="170" height="170"></td>
		            	<td><img src="resources/image/user/profile/profile3.png" value="3" width="170" height="170"></td>
		            	<td><img src="resources/image/user/profile/profile4.png" value="4" width="170" height="170"></td>
		            	<td><img src="resources/image/user/profile/profile5.jpg" value="5" width="170" height="170"></td>
		            </tr>
		            <tr>
		            	<td><img src="resources/image/user/profile/profile6.jpg" value="6" width="170" height="170"></td>
		            	<td><img src="resources/image/user/profile/profile7.jfif" value="7" width="170" height="170"></td>
		            	<td><img src="resources/image/user/profile/profile8.png" value="8" width="170" height="170"></td>
		            	<td><img src="resources/image/user/profile/profile9.jpg" value="9" width="170" height="170"></td>
		            	<td><img src="resources/image/user/profile/profile10.jpg" value="10" width="170" height="170"></td>
		            </tr>
		        </table>
		    	
		    	<br><br>
		    	
		    	<h2>닉네임</h2>
		    	<input type="text" name="userNickname" id="nickName" value="${ loginUser.userNickname }">
		    	<div style="color:gray; margin-top:10px">* 2자 이상 15자 이내의 한글, 영문, 숫자 입력 가능합니다.</div>
		    	<div id="checkResult" style="font-size:0.8em; display:none;"></div> 
		    	
		    	<br><br><br><br>
		    	
		    	<div align="center">
		    		<button type="submit" disabled">수정</button>
		    		<button type="button" onclick="location.href='myPage.me'">뒤로</button>
		    	</div>
	    	</form>
        </div>
		
		<script> 
			// 로그인한 사용자의 프로필 사진이 선택된 상태
			$(function() {
				
				$("#user_profile img").each(function(i) {
					if($(this).attr("value") == ${ loginUser.userProfile }) {
						$(this).addClass("active");
					}
					
				});
			});
			
			// 프로필 사진 변경
			$(function() {
				$("#user_profile img").click(function() {
					
					$("#user_profile img").removeClass("active");
					$(this).addClass("active");
					
					$("#userProfile").val($(this).attr("value"));
				});
			});
			
			// 닉네임 중복확인
			$(function() {
				
				var $nicknameInput = $("input[name=userNickname]");
				var regExp = /^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣\d]{2,15}$/i;
				
				$nicknameInput.keyup(function() {
					
					if(regExp.test($nicknameInput.val())) {
					
						$.ajax({
							url : "nicknameCheck.me",
							data : {checkNickName : $nicknameInput.val()},
							success : function(result) {
								
								if(result == "NNNNY") {
									
									$("#checkResult").show();
									$("#checkResult").css("color", "#64FFDA").text("사용 가능한 닉네임입니다.");
									
									$("#updateProfileForm button[type=submit]").attr("disabled", false);
								} else {
									
									$("#checkResult").show();
									$("#checkResult").css("color", "red").text("사용 불가능한 닉네임입니다.");
									
									$("#updateProfileForm button[type=submit]").attr("disabled", true);
								}
							},
							error : function() {
								console.log("ajax 통신 실패!");
							}
						});
					} else {
						
						$("#checkResult").show();
						$("#checkResult").css("color", "red").text("올바르지 않은 형식의 닉네임입니다.");
						$("#updateProfileForm button[type=submit]").attr("disabled", true);
					}
				});

			});
		</script>
		
		
		<!-- 푸터 영역 -->
        <jsp:include page="../common/footer.jsp" />

    </div>

</body>
</html>