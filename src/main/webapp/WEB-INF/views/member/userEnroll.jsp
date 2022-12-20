<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ur Favorite OTT</title>

	<script src="https://kit.fontawesome.com/6ff74efdc8.js" crossorigin="anonymous"></script>
	
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
		margin-right: 250px;
		
	}
	
	/* 약관동의 영역(form_2_center_bottom)을 
        전체약관동의 영역(agreeTotal), 
        세부약관동의 영역1(agreeDetail_1), 
        세부약관동의 영역2(agreeDetail_2), 
        세부약관동의 영역3(agreeDetail_3)
        다섯 영역으로 나눔
    */
    #form_2_center_bottom>div { width: 100%;}
    #agreeTotal { height: 30%; padding-top: 25px; font-size: 20px;} /* 전체약관동의 영역 스타일 */
    #agreeDetail_1, #agreeDetail_2, #agreeDetail_3 { height: 20%; }

    /* 세부약관동의 영역 스타일 */
    #agreeDetail_1>div, #agreeDetail_2>div, #agreeDetail_3>div { height: 100%; }
    .left { 
        width: 90%;
        float: left; 
        padding-left: 2px;
        font-size: 15px;
    }
    .right { 
        width: 10%; 
        float: left; 
        text-decoration: underline; 
        color: rgb(165, 165, 165); 
        font-size: 13px; 
        text-align: right;
        padding-right: 10px;
        cursor : pointer;
    }

    /* 전체약관동의 체크박스 스타일 */
    #ag { zoom: 1.5; } 

    /* 세부약관동의 영역 스타일 */
    #agreeTotal, #agreeDetail_1>div, #agreeDetail_2>div, #agreeDetail_3>div { padding-left: 10px; }

    /* 버튼 스타일 */
    button { 
        width: 200px;
    }
    button[class*=btn-primary] { background-color: #3970B3; }

    /* 약관 전문 스타일 */
    #form_2_center_bottom>div>div>p {
        border : 1px solid gray;
        width : 100%px;
        height : 100px;
        margin-top : 5px;
        border-radius : 10px;
        padding : 10px;
        box-sizing : border-box;
        display : none;
    }
    
    /*  조건 미충족 모달 스타일 */
    #modal.modal-overlay {
    	margin-left:850px;
    	margin-top:600px;
        position: absolute;
        display: none;
        flex-direction: column;
        align-items: center;
        justify-content: center;

	}
	#modal .modal-window {
	    background: rgba(185, 212, 221);
	    border-radius: 10px;
	    width: 350px;
	    height: 110px;
	    position: relative;
	    top: 78%;
	    padding: 20px;
	}
	#modal .title {
	    padding-left: 10px;
	    display: inline;
	    color: black;
	    
	}
	#modal .title h2 {
	    display: inline;
	    font-size: 20px;
	   
	}
	#modal .close-area {
	    display: inline;
	    float: right;
	    padding-right: 10px;
	    cursor: pointer;
	    color: black;
	}
	
	#modal .content {
	    margin-top: 20px;
	    padding: 0px 10px;
	    color: black;
	    font-size: 15px;
	}

	/* 세부약관 모달 스타일 */
	#modal1 .title, #modal2 .title, #modal3 .title {
	    padding-left: 5px;
	    display: inline;
	    color: black;
	    
	}
	#modal1 .title h2, #modal2 .title h2, #modal3 .title h2 {
	    display: inline;
	    font-size: 30px;
	   
	}
	#modal1 .close-area, #modal2 .close-area, #modal3 .close-area {
	    display: inline;
	    float: right;
	    padding-right: 10px;
	    cursor: pointer;
	    color: black;
	}
	
	#modal1 .content, #modal2 .content, #modal3 .content {
	    padding-left: 30px;
        margin-top: 20px;
	    padding: 0px 10px;
	    color: black;
	    font-size: 16px;
	}

    /* 세부약관1 창 크기 조절 스타일 */
    #modal1 .modal-window {
	    background: rgba(185, 212, 221);
	    border-radius: 10px;
	    width: 1000px;
	    height: 700px;
	    position: relative;
	    padding: 20px;
	    left:20%;
	    bottom:7%;
	}

    /* 세부약관2 창 크기 조절 스타일 */
    #modal2 .modal-window {
	    background: rgba(185, 212, 221);
	    border-radius: 10px;
	    width: 700px;
	    height: 270px;
	    position: relative;
	    padding: 20px;
	    left:30%;
	    top:20%;
	}

    /* 세부약관3 창 크기 조절 스타일 */
    #modal3 .modal-window {
    	
	    background: rgba(185, 212, 221); 
	    border-radius: 10px;
	    width: 700px;
	    height: 300px;
	    position: relative;
	    padding: 20px;
	    left:30%;
	    top:20%;
	}

    /* 세부약관1 창 노출 조절 스타일 */
    #modal1.modal-overlay {
        width: 100%;
        height: 100%;
        position: absolute;
        left: 0;
        top: 0;
        display: none;
        flex-direction: column;
        align-items: center;
        justify-content: center;

	}

    /* 세부약관2 창 노출 조절 스타일 */
    #modal2.modal-overlay {
        width: 100%;
        height: 100%;
        position: absolute;
        left: 0;
        top: 0;
        display: none;
        flex-direction: column;
        align-items: center;
        justify-content: center;

	}

    /* 세부약관3 창 노출 조절 스타일 */
    #modal3.modal-overlay {
        width: 100%;
        height: 100%;
        position: absolute;
        left: 0;
        top: 0;
        display: none;
        flex-direction: column;
        align-items: center;
        justify-content: center;

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
        <div id="modal" class="modal-overlay">
               <div class="modal-window">
                   <div class="title">
                       <h2>회원가입 실패!</h2>
                   </div>
                   <div class="close-area">X</div>
                   <div class="content">
                       <p>필수약관 동의를 해주세요!</p>                               
                   </div>
               </div>
          </div>

            <!-- 회원 가입 -->
            <p class="main_text" style="margin-left:600px; margin-top:100px;">회원가입</p>
            <div class="EnrollUser">
				<form id="enroll-form" action="insert.me" method="post" onsubmit="return join()">
                                <table>
                                   <tr>
                                        <th style="height:80px;">* 이메일 주소</th> <!-- 이메일 선택해서 인풋에 넣기 -->
                                        <td colspan="3">
                                            <input type="text" id="email_id" name= "userId1" class="form-control" maxlength="18" value="" style="width:188px; height:100%; display:inline-block;" required> @
                                            <select class="custom-select" name="userId2" title="이메일 도메인 주소 선택" style="width:188px; display:inline-block; height:100%; margin-bottom:3px;" onclick="setEmailDomain(this.value);return false;" required>
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
                                        <td colspan="3"><input type="password" class="form-control" id ="userPwd" name="userPwd" maxlength="30" style="width:400px" placeholder="영문자,숫자,특수문자로된 총 8 ~ 15자 이내로 입력 " required></td>
                                    </tr>
                                    <tr style="height:80px;">
                                        <th>* 비밀번호 확인</th>
                                        <td  colspan="3"><input type="password" class="form-control" id="checkPwd" name="checkPwd" maxlength="30" style="width:400px" required></td>
                                    </tr>
                                    <tr style="height:80px;">
                                        <th>* 닉네임</th>
                                        <td colspan="3"><input type="text" class="form-control" id="userNickname" name="userNickname" minlength="2" maxlength="15" style="width:400px" required ></td>
                                    	<td id="checkResult" style="font-size:0.9em; display:none;"></td>    
                                    </tr>
                                    
                                                      
                                </table>
                                
                                
                            <div id="form_2_center_bottom">
                                <div id="agreeTotal">
                                    <input type="checkbox" id="ag" name="agree_status" value="agree">
                                    <label for="agree" id="agreeTotalText" style="font-weight: bold;">전체 약관에 동의합니다.</label>
                                </div>
                                
                                <div id="agreeDetail_1">
                                    <div class="left">
                                        <input type="checkbox" id="ag_1" name="agree_status" value="agree">
                                        <label for="agree1">urfavoriteott 이용약관에 동의합니다. <span style="color:rgb(221, 1, 1);">(필수)</span></label>
                                    </div>
                                    <div class="right" id="right_1" onclick="detail_1();">자세히</div>
                                    <div id="modal1" class="modal-overlay">
                                        <div class="modal-window">
                                            <div class="title">
                                                <h2>이용약관</h2>
                                            </div>
                                            <div class="close-area">X</div>
                                            <div class="content">
                                                <p>
                                                    이용약관<br>
                                                    <br>
                                                    제1장 총칙<br>
                                                    <br>
                                                    제 1조 (목적)<br>
                                                    <br>
                                                    본 약관은 urfavoriteott가 관리 및 운영하는 웹사이트(“웹사이트”)에서 이용자에게 제공하는 제반 서비스와 관련하여 위원회와 이용자 간의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.<br>
                                                    <br>
                                                    제2조 (정의)<br>
                                                    <br>
                                                    본 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
                                                    “서비스”라 함은 구현되는 단말기와 관계없이 “웹사이트”에서 이용할 수 있는 일체 서비스를 의미합니다.<br>
                                                    “이용자”라 함은 “웹사이트”에 접속하여 제공되는 “서비스”를 이용하는 개인, 단체 또는 법인을 의미합니다.<br>
                                                    “회원”이라 함은 “웹사이트”에서 본 약관에 따라 “계정”과 “비밀번호”를 생성하여 등록하거나 자신의 SNS 계정으로 로그인하여 “서비스”를 이용할 수 있는 개인, 단체 또는 법인을 의미합니다.<br>
                                                    “계정”, “ID” 또는” 아이디”라 함은 회원의 식별 등을 위하여 “회원”이 선정하고 “웹사이트”에서 부여하는 문자와 숫자 등의 조합을 의미합니다.<br>
                                                    “비밀번호”라 함은 회원과 “계정”이 일치하는지 여부를 확인하고 통신상 비밀보호를 위하여 “회원”이 선정한 문자와 숫자 등의 조합을 의미합니다.<br>
                                                    “콘텐츠”라 함은 “웹사이트”에 게시된 모든 이미지, 삽화, 영상, 텍스트, 오디오 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크를 의미합니다.<br>
                                                </p>                               
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="agreeDetail_2">
                                    <div class="left">
                                        <input type="checkbox" id="ag_2" name="agree_status" value="agree">
                                        <label for="agree2">개인정보 수집 및 이용에 동의합니다. <span style="color:rgb(221, 1, 1);">(필수)</span></label>
                                    </div>
                                    <div class="right" id="right_2" onclick="detail_2();">자세히</div>
                                    <div id="modal2" class="modal-overlay">
                                        <div class="modal-window">
                                            <div class="title">
                                                <h2>개인정보 수집 및 이용</h2>
                                            </div>
                                            <div class="close-area">X</div>
                                            <div class="content">
                                                <p>
                                                    목적 : 회원, 상담, 관리, 소식지 및 서비스 제공<br>
                                                    항목 : 성명, 아이디, 비밀번호, 전화번호, 이메일, 생년월일<br>
                                                    보유 기간 :	웹회원 탈퇴시까지<br>
                                                    <br>
                                                    * 위의 개인정보 수집∙이용에 대한 동의를 거부할 권리가 있으나, 동의를 거부할 경우 회원가입이 불가합니다.<br>
                                                </p>                               
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="agreeDetail_3">
                                    <div class="left">
                                        <input type="checkbox" id="ag_3" name="agree_status" value="agree">
                                        <label for="agree3">urfavoriteott 소식 및 안내를 위한 개인정보 수집 및 이용 동의 <span style="color:rgb(221, 1, 1);">(선택)</span></label>
                                    </div>
                                    <div class="right" id="right_3" onclick="detail_3();">자세히</div>
                                    <div id="modal3" class="modal-overlay">
                                        <div class="modal-window">
                                            <div class="title">
                                                <h2>안내를 위한 개인정보 수집 및 이용 동의</h2>
                                            </div>
                                            <div class="close-area">X</div>
                                            <div class="content">
                                                <p>
                                                    urfavoriteott는 회원가입 시 수집된 개인정보를 이용하여 탈퇴 시까지 각종 및 안내 등의 목적으로 본인에게 정보, 광고를 전달합니다.<br>
                                                    <br>
                                                    의무적으로 안내되어야 하는 정보성 내용은 수신동의 여부와 무관하게 제공됩니다.<br>
                                                    <br>
                                                    개인정보보호법 제22조 제4항에 의해 동의하지 않을 권리가 있으며, 동의하지 않는 경우에도 회원 가입이 가능합니다.<br>
                                                </p>                               
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                
                                

                                <div style="margin-top:150px; margin-left:300px;">
                                    <button type="submit" id="submitButton" class="btn btn-info" style="width:250px;" disabled>가입하기</button>
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

                <button type="button" class="btn btn-secondary btn-sm" onclick="return validatePwd();">인증완료</button>
            </form>
	       
            </div>
	    </div>
	  </div>
	</div>
   </div> 
    
        <script>
        // 전체체크박스 함수
        $(document).ready(function() {
			
        	$("#ag").click(function() {
				if($("#ag").is(":checked")) $("input[name=agree_status]").prop("checked", true);
				else $("input[name=agree_status]").prop("checked", false);
			});
			
			$("input[name=agree_status]").click(function() {
				var total = $("input[name=agree_status]").length;
				var checked = $("input[name=agree_status]:checked").length;
				
				if(total != checked) $("#ag").prop("checked", false);
				else $("#ag").prop("checked", true); 
			});
		});
        
    	// 회원가입버튼 함수
    	function join() {
    		 
   			var agree1 = document.getElementById("ag_1");
   			var agree2 = document.getElementById("ag_2");
   			
   			var agreeChecked1 = agree1.checked;
   			var agreeChecked2 = agree2.checked;

   			const modal = document.getElementById("modal");
   			const closeBtn = modal.querySelector(".close-area")
			
   			if(agreeChecked1 == true && agreeChecked2 == true)
   				
   			{ // 조건 충족시 유효성 검사 들어감
   				
            	var userPwd = document.getElementById("userPwd");
            	var checkPwd = document.getElementById("checkPwd");
            	
                // 비밀번호 정규식
                // 영문자, 숫자, 특수문자(!@#$%^) 로 총 8 ~ 15 자 로 이루어져야함
                regExp = /^[a-z\d!@#$%^]{8,15}$/i;
                if(!regExp.test(userPwd.value)) {
                    alert("비밀번호를 영문자,숫자,특수문자로 총 8 ~ 15 자로 입력해주세요.");
                    userPwd.value = "";
                    userPwd.focus(); // 재입력 유도
                    return false;
                }
                
            	// 비밀번호 유효성 검사
                if($("input[name=userPwd]").val() != $("input[name=checkPwd]").val()) {
                    alert("비밀번호가 일치하지 않습니다.");
                    checkPwd.select(); // 재입력 유도
                    return false;
                }
   				
   			}
   			
   			else { // 조건 미충족 시 모달
   			
   				modal.style.display = "flex"
				closeBtn.addEventListener("click", e => {
				    modal.style.display = "none"
				});
				window.addEventListener("keyup", e => {
				    if(modal.style.display === "flex" && e.key === "Escape") {
				        modal.style.display = "none"
				    }
				});
				return false;
   			}
		}
        
        // 세부 약관 모달 함수
        function detail_1() {

            const modal1 = document.getElementById("modal1");
            const closeBtn1 = modal1.querySelector(".close-area");

            modal1.style.display = "flex"
            closeBtn1.addEventListener("click", e => {
                modal1.style.display = "none"
            });
            window.addEventListener("keyup", e => {
                if(modal1.style.display === "flex" && e.key === "Escape") {
                    modal1.style.display = "none"
                }
            });

        }

        function detail_2() {

        const modal2 = document.getElementById("modal2");
        const closeBtn2 = modal2.querySelector(".close-area");

        modal2.style.display = "flex"
        closeBtn2.addEventListener("click", e => {
            modal2.style.display = "none"
        });
        
        window.addEventListener("keyup", e => {
            if(modal2.style.display === "flex" && e.key === "Escape") {
                modal2.style.display = "none"
            }
        });
        }

        function detail_3() {

        const modal3 = document.getElementById("modal3");
        const closeBtn3 = modal3.querySelector(".close-area");

        modal3.style.display = "flex"
        closeBtn3.addEventListener("click", e => {
            modal3.style.display = "none"
        });
        window.addEventListener("keyup", e => {
            if(modal3.style.display === "flex" && e.key === "Escape") {
                modal3.style.display = "none"
            }
        });
        }
    </script>
    
    <!-- 닉네임 중복체크 -->
    <script>
			$(function() {
				
				// 닉네임을 입력받는 input 요소 객체를 변수에 담아두기 => keyup 이벤트 걸기
				var $nicknameInput = $("#enroll-form input[name=userNickname]");
				var regExp = /^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣\d]{2,15}$/i;
				
				$nicknameInput.keyup(function() {
					
					// 1글자 이상일때 ajax요청
					if(regExp.test($nicknameInput.val())) {
					// ajax 를 요청하여 중복체크
						$.ajax({
							url : "nickNameCheck.me",
							data : {checkNickname : $nicknameInput.val()},
							success : function(result) {
								
								if(result == "NNNNN") { // 사용 불가능
									
									// 빨간색 메세지 출력
									$("#checkResult").show();
									$("#checkResult").css("color", "red").text("중복된 닉네임이 존재합니다. 다시 입력해주세요.");							
									
									// 버튼 비활성화
									$("#enroll-form button[type=submit]").attr("disabled", true);
								
									
								} else { // 사용 가능
									
									// 초록색 메세지 출력
									$("#checkResult").show();
									$("#checkResult").css("color", "white").text("멋진 닉네임이네요!");
									
									// 버튼 활성화
									$("#enroll-form button[type=submit]").attr("disabled", false);
									
								}
								
							},
							error : function() {
								console.log("닉네임 중복 체크용 ajax 통신 실패!");
							}
						});
					} else {
						
						$("#checkResult").hide();
						$("#enroll-form button[type=submit]").attr("disabled", true);
					}
				});
			});	
	</script>
    
    

  
    

</body>
</html>