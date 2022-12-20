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
	#enroll-form {
		margin-top: 50px;
		margin-left: 600px;
		
		
	}

    /* 버튼 스타일 */
    button { 
        width: 200px;
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
        <div id="content_container" style="height:100%;">

            <!-- 비밀번호 재설정 -->
            <p class="main_text" style="margin-left:600px; margin-top:100px;">비밀번호 재설정</p>
            <p style="margin-left:600px;">비밀번호 잊어버렸을때 이메일 인증 후 비밀번호 재설정을 통해 비밀번호를 다시 설정하실수 있습니다.</p>
            <div class="EnrollUser">
				<form id="enroll-form" action="updatePassword.me" method="post">
                                <table>
                                   <tr>
                                        <th style="height:80px;">* 이메일 주소</th> <!-- 이메일 선택해서 인풋에 넣기 -->
                                        <td colspan="3">
                                            <input type="text" id="email_id" name= "emailBno" class="form-control" maxlength="18" value="" style="width:188px; height:100%; display:inline-block;" required> @
                                            <select class="custom-select" name="emailAno" title="이메일 도메인 주소 선택" style="width:188px; display:inline-block; height:100%; margin-bottom:3px;" onclick="setEmailDomain(this.value);return false;" required>
                                                <option>선택</option>
                                                    <option value="naver.com">naver.com</option>
                                                    <option value="gmail.com">gmail.com</option>
                                                    <option value="hanmail.net">hanmail.net</option>
                                                    <option value="hotmail.com">hotmail.com</option>
                                                    <option value="korea.com">korea.com</option>
                                                    <option value="nate.com">nate.com</option>
                                                    <option value="yahoo.com">yahoo.com</option>
                                            </select>
                                            <td><button type="button" id="checkbutton" class="btn btn-info" data-toggle="modal" data-target="#emailCheck" style="margin-left:20px;">이메일인증</button></td>
                                        </td>
                                        <td width="80px" style="display:inline-block;"></td>
                                    </tr>
                                    <tr style="height:80px;">
                                        <th>* 비밀번호</th>
                                        <td colspan="3"><input type="password" class="form-control" id ="memPwd" name="userPwd" maxlength="30" style="width:400px" placeholder="영문자,숫자,특수문자로된 총 8 ~ 15자 이내로 입력 " required></td>
                                    </tr>
                                    <tr style="height:80px;">
                                        <th>* 비밀번호 확인</th>
                                        <td  colspan="3"><input type="password" class="form-control" id="checkPwd" name="checkPwd" maxlength="30" style="width:400px" required></td>
                                    </tr>
                                                      
                                </table>
                                
                                <div style="margin-top:100px; margin-left:300px;">
                                    <button type="submit" class="btn btn-info" style="width:250px;" onclick="return validate();" disabled>비밀번호 재설정</button>
                                </div>
                               </form>
                </div>     

           </div>
           



		<!-- 푸터 영역 -->
        <jsp:include page="../common/footer.jsp" />

    
    
    <!-- 이메일 인증용 모달창 -->
    <!-- The Modal -->
	<div class="modal" id="emailCheck">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">이메일 인증</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        
            <form action="" method="post" align="center">
                <input type="hidden" name="memId" value="">
                <table>
                    <tr>
                        <td>이메일인증코드</td>
                        <td><input type="password" name="memPwd" id="memPwd" required></td>
                    </tr>
                </table>

                <br>

                <button type="submit" class="btn btn-secondary btn-sm" onclick="return validatePwd();">인증완료</button>
            </form>
	
			<%--
            <script>
                function validatePwd() {

                    if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()) {
                        alert("비밀번호가 일치하지 않습니다.");
                        return false;
                    }
                }
            </script>
             --%>
            
            </div>
	    </div>
	  </div>
	</div>
   </div>
</body>
</html>