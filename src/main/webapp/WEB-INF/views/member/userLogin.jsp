<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ur Favorite OTT</title>

    <!-- jQuery 라이브러리 연결 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

    <!-- Bootstrap 프레임워크 연결 -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

    <!-- CSS 스타일시트 -->
    <link rel="stylesheet" href="resources/css/user.css">
    
<style>
	.Login {
		width: 50%;
		margin:auto;
		
	}
	#login-form>div {
	
		margin:auto;
		width: 50%;
	}
	#loginButton{
		width:400px;
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

			<br>
			<br>
			<br>
			<br>
			
            <div class="Login">
                    <form id="login-form" action="login.me" method="post">
                    	<p class="main_text" style="margin-left:240px;">회원로그인</p>
                        <div class="form-group" id="form_1" style="margin-top:50px;">
                           <p>&nbsp;아이디</p>
                           <input type="text" class="form-control" id="userId" name="userId" value="${ cookie.saveId.value }" style="width:400px"  required placeholder="아이디를 입력해주세요.">
                        </div>
                        <br>
                        <div class="form-group" id="form_2">
                           <p>&nbsp;비밀번호</p>
                           <input type="password" class="form-control" id="userPwd" name="userPwd" style="width:400px" required placeholder="비밀번호를 입력해주세요.">
                        </div>
                        
                        <br>
                        
                        <div class="form_group" id="idSave">
                           <c:choose>
                        	<c:when test="${ not empty cookie.saveId }">
                        		<!-- 만약 saveId 쿠기가 있다면 : 체크박스가 체크되게 -->
                        		<!-- 아이디 저장 체크박스 -->
                        		<input type="checkbox" id="saveId" name="saveId" value="y" checked> <label for="saveId">아이디 저장</label>
                        	</c:when>
                        	<c:otherwise>
                        		<!--  만약 saveId 쿠기가 없다면 : 체크박스가 체크되지 않게끔 -->
                        		<!-- 아이디 저장 체크박스 -->
                        		<input type="checkbox" id="saveId" name="saveId" value="y"> <label for="saveId">아이디 저장</label>
                        	</c:otherwise>
                      	  </c:choose>
                        </div>
                        
                        <div id="button">
                           <br>
                           <button id="loginButton" type="submit" class="btn btn-info">로그인</button>
                        </div>
                        
                        <div class="form-group" id="form_3">
                                <hr>
                                <div class="link" id="link_1" style="padding-left: 18%;">
                                    <a href="userEnrollForm.me" style="text-decoration:none; color:white;">회원가입</a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="updatePasswordForm.me" style="text-decoration:none; color:white;">비밀번호재설정</a>
                                </div>				
                        </div>
                        <br>
                        
                        <div>
                        <hr style="background:white; height:1px; width:400px; border:0; margin-left:4px;"> 
                        <br>
                        <a href=""><img src="resources/image/user/profile/kakao.png" style="width:400px; height:50px;"></a>
                        <hr>
                        <a href=""><img src="resources/image/user/profile/naver.png" style="width:400px; height:50px;"></a>
                        </div>

                        
                     </form>   
           </div>
           

        </div>
        

		<!-- 푸터 영역 -->
        <jsp:include page="../common/footer.jsp" />

    </div>
    
    

  
    

</body>
</html>