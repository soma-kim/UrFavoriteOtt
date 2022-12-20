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
    <link rel="stylesheet" href="resources/css/community.css">

<style>

	.community{
		width: 100%; 
		height: 1500px;
	}
    #community-full{ /* 전체 요소를 담고 있는 div */
        width: 80%;
        height: 100%;
        margin: auto;
        border: 1px solid white;
        border-radius: 45px; 
    }

    #community-title{ /* 제목을 담고 있는 div Id */
        width: 100%;
        height: 15%;
        border: 1px solid orange;
    }

    #community-title1 { width: 100%; height: 60%; float: left; }
    #community-title2 { width: 100%; height: 20%; float: left; }

/*
    #community-content { 
        width: 100%;
        height: 100%;
        border : 1px solid blue;
        margin: auto;
    }
   */

    #community-content-sm {
        width: 75%;
        height: 50%;
        margin: auto;
        padding-top: 50px;
        font-size: 20px;
        word-spacing: 7px;
        letter-spacing: 1px;
    }
    
    #community-content-writeReply {
    	width : 75%;
    	height: 30%;
    	border : 1px solid yellow;
    	margin : auto;
    	
    }

    #community-content-ReplyList {
        width : 75%;
    	height : 10%;
    	border : 1px solid red;
    	margin : auto;
    }

    #community-title1>p {  
        width: 100%;
        height: 100%;
        font-size: 40px;
        text-align: center;
        line-height: 135px;
    }

    #community-title2>p { 
        width: 100%;
        height: 100%;
        text-align: left;
        font-size: medium;
        margin-left: 50px;
        margin-top: 30px;
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

            <!-- 최신 게임 -->
            <br><br><br><br><br><br><br><br>
            <div class="community" >
                            <!-- 커뮤니티 게시글 틀 시작 -->
                       <div id="community-full">
                          <div id="community-title">
                                    <div id="community-title1">
                                       <p>${ c.comTitle }</p>
                                    </div>
                                    <div id="community-title2">
                                        <p>작성일 : ${c.comRegisterDate} &emsp;|&emsp; 작성자 : ${ c.userNickname }  &emsp;|&emsp; 조회수 : ${ c.comHit }</p>
                                    </div>
		                           
                                    <!-- 우측 상단 버튼 관련 코드 시작 -->
		                           <c:choose>
		                           		<c:when test="${not empty loginUser.userNickname}">
		                           			<c:if test="${loginUser.userNickname eq c.userNickname}"> 
			                           			<!-- 로그인 상태이면서 본인이 작성한 글을 볼 때 -->
			                           			<div class="form-button" style="margin-left: 1300px;">
				                                    <a href="communityUpdateForm.co?cno=${c.comNo}" class="btn btn-warning">수정</a>
				                                    <a href="communityDelete.co?cno=${c.comNo}" class="btn btn-danger">삭제</a>
				                                    <a href="communityList.co" class="btn btn-info">목록</a>
		                                    	</div>
		                           			</c:if>
                                       
                                            <c:if test="${loginUser.userNickname ne c.userNickname}">
                                                <!-- 로그인 상태이면서 다른 사용자가 작성한 글을 볼 때 -->
                                                <c:forEach var="c" items="${ list }">
                                                <div class="form-button" style="margin-left: 1350px;">
                                                    <input type="hidden" name="communityUserNo" id="communityUserNo" value="${ c.userNo }">
                                                    <input type="hidden" name="comNo" id="comNo" value="${ c.comNo }">
                                                    <input type="hidden" name="loginUserNo" id="loginUserNo" value="${ loginUser.userNo }">
                                                    <a href="" class="btn btn-danger" id="btn-modal">신고</a>
                                                    <a href="communityList.co" class="btn btn-info">목록</a>
                                                </div>
                                            </c:forEach>
                                            </c:if>
		                           		</c:when>
		                           	</c:choose>	
									
                           		 	<c:if test="${empty loginUser.userNickname}"> 
                           		 		<!-- 미로그인 상태일 때-->
	                                    <div class="form-button" style="margin-left: 1400px;">
		                                    <a href="communityList.co" class="btn btn-info">목록</a>
	                                    </div>
                                    </c:if>
                                    <!-- 우측 상단 버튼 관련 코드 종료 -->
                          </div>
 									
                                <hr style="background:white; height:1px; border:0;">

                          <%--<div id="community-content" style="height:800px;"> --%>
                              <div id="community-content-sm" style="border: 1px solid green;">
                                        <p>
                                               ${c.comContent}
                                        </p>
                              </div>

                              
                              <!-- 댓글 영역 시작 -->
                              <div id="community-content-writeReply">
                                <c:choose>
                                    <c:when test="${ empty loginUser }">
                               <div style="width: 100%; height: 100px; border: 1px solid blue;"><!-- 댓글 작성칸  -->
                                     <div style="width: 100%; height: 50%; padding: 20px; margin: 0px;">
                                                  <textarea  class="form-control" name="" style="resize:none; width:85%; float: left; " readonly>로그인 후 댓글 작성이 가능합니다.</textarea>								                        
                                                  <button class="btn btn-secondary" style="float: left; margin-top: 12.5px; margin-left: 30px;" disabled>등록하기</button>
                                     </div>
                               </div>
                               </c:when>
                               
                               <c:otherwise>
                               <div style="width: 100%; height: 100px; border: 1px solid blue;"><!-- 댓글 작성칸  -->
                                     <div style="width: 100%; height: 50%; padding: 20px; margin: 0px;">
                                                  <textarea  class="form-control" id="Replycontent" name="" style="resize:none; width:85%; float: left;"></textarea>								                        
                                                  <button class="btn btn-secondary" style="float: left; margin-top: 12.5px; margin-left: 30px;" onclick="addReply();">등록하기</button>
                                     </div>
                               </div>
                               </c:otherwise>
                               </c:choose>
                               
                               
                               <div style="width: 100%; height: 500px; border: 1px solid green; margin-top: 20px;"><!-- 댓글이 보이는 칸   -->
                                       <div id="comreplyList" style="width: 100%; height: 80px; padding: 25px; margin: 0px;">
                                       
                                     </div>
                             </div>
                                     
                       </div>
                          <!-- 댓글 영역 종료 -->

                          <script>
        
        
                            $(function() {
                                
                                selectReplyList();
                            });
                            
                            function selectReplyList() { // 해당 게시글에 딸린 댓글리스트 조회용 ajax 요청
                                
                                
                 
                                $.ajax({
                                    url : "rlist.co",
                                    data : {cno:${ c.comNo }},
                                    success : function(result) {
                                        
                                        console.log(result);
                                        let userNickname = '${loginUser.userNickname}';
                                        
                                        var resultStr = "";
                                        
                                        for(var i = 0; i < result.length; i++) {
                                            
                                            if (userNickname == result[i].userNickname) {
                                        
                                            resultStr += 
                                                            "<div style='width: 50%; float: left; margin-left: 10px;'>" + result[i].userNickname + "</div>"
                                                            + "<div style='width: 10%; float: left;'>" + result[i].comRplContent + "</div>"
                                                            + "<div style='width: 10%; float: left;'>" + result[i].comRplRegisterDate + "</div>"
                                                            
                                                            + "<div style='width: 9%; float: left; margin-left: 7px; margin-top: -5px;'>"
                                                            + "<button class='btn btn-secondary'>수정</button>"
                                                            + "</div>"
                                                            
                                                            +"<div style='width: 9%; float: left; margin-left: 7px; margin-top: -5px;'>"
                                                            +"<button class='btn btn-secondary'>삭제</button>"
                                                               +"</div>"
                                                               
                                            }
                                            
                                            
                                            else if (userNickname == "") {
                                                        
                                            resultStr += 
                                                "<div style='width: 50%; float: left; margin-left: 10px;'>" + result[i].userNickname + "</div>"
                                                + "<div style='width: 10%; float: left;'>" + result[i].comRplContent + "</div>"
                                                + "<div style='width: 10%; float: left;'>" + result[i].comRplRegisterDate + "</div>";
                
                                            }
                                            
                                            else {
                                                
                                                resultStr += 
                                                    "<div style='width: 50%; float: left; margin-left: 10px;'>" + result[i].userNickname + "</div>"
                                                    + "<div style='width: 10%; float: left;'>" + result[i].comRplContent + "</div>"
                                                    + "<div style='width: 10%; float: left;'>" + result[i].comRplRegisterDate + "</div>"
                                                    
                                                    + "<div style='width: 9%; float: left; margin-left: 7px; margin-top: -5px;'>"
	                                                    + "<a>"
	                                                    	+ "<input type='hidden' id='comRplNo' name='comRplNo' value='" + result[i].comRplNo + "'>"
	                                                    	+ "<input type='hidden' id='comRplUserNo' name='comRplUserNo' value='" + result[i].userNo + "'>"
	                                                    	+ "<input type='hidden' id='loginUserNo' name='loginUserNo' value='" + ${ loginUser.userNo } + "'>"
	                                                    	+ "<button type='button' class='btn btn-secondary' id='replyReport' data-toggle='modal' data-target='#replyReportModal'>신고</button>"
	                                                    + "</a>"
                                                    + "</div>";
                                                    
                                                    // 여기까지 뽑힘 확인
                                                    // console.log(result[i].comRplNo);
                                                    // console.log(result[i].userNo); 
                                                    // console.log(${loginUser.userNo});
                
                                            }
                                            
                                            
                                        }
                                        
                                        $("#comreplyList").html(resultStr);
                                        
                                        // 댓글 갯수 출력
                                        // $("#rcount").text(result.length);
                                    },
                                    error : function() {
                                        console.log("댓글리스트 조회용 ajax 통신 실패!");
                                    }
                                });
                            }
                
                              
                           function addReply() { // 댓글 작성 요청용 ajax 
                               
                               // form 태그 내에서는 required 속성이 적용되지만, 
                               // form 태그 밖에서는 required 속성이 소용 없다.
                               // -> 댓글 내용이 있는지 먼저 검사 후에 있다면 ajax 요청 보내기 ! 
                               // 	 (textarea 요소에 value 속성값 기준으로 공백 제거 후 길이가 0이 아닌 경우)
                               if($("#Replycontent").val().trim().lenth != 0) {
                                   
                                   $.ajax({
                                       url : "rinsert.co",
                                       data : { // ajax 요청 또한 커맨드객체방식 가능 (키값을 필드명이랑 맞춰준다) 
                                            comNo : "${ c.comNo }",
                                            userNo : "${ loginUser.userNo }",
                                               comRplContent : $("#Replycontent").val() 
                                       },
                                       success : function(result) {
                                           
                                           // "success" 또는 "fail" 문자열이 들어있음
                                           if(result == "success") {
                                               
                                               // 댓글 작성 성공 시 새로이 댓글 리스트를 불러올 것
                                               selectReplyList();
                                               
                                               // 댓글 작성 창 초기화효과
                                               $("#Replycontent").val("");
                                           }
                                           
                                       },
                                       error : function() {
                                           console.log("댓글 작성용 ajax 통신 실패!");
                                       }
                                   }); 
                               } else {
                                   alert("댓글 작성 실패", "댓글 작성 후 등록을 요청해주세요.");
                               }
                            }
                        </script>
              <!-- 커뮤니티 게시글 틀 종료 -->
	           </div>
	        </div>
          
          <form id="replyReport-form" action="reportReply.co" method="post" name="replyReportForm">
                <!-- 댓글 신고 모달창 -->
                <div class="modal" id="replyReportModal">
                    <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                    
                        <!-- Modal Header -->
                        <div class="modal-header">
                        <h5 class="modal-title">댓글 신고</h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        
                        <!-- Modal body -->
                        <div class="modal-body">
                            <b>신고 사유</b><br>
                            <select name="reportReason">
                              <option value="욕설, 비방, 차별, 혐오" name="욕설, 비방, 차별, 혐오" selected>욕설, 비방, 차별, 혐오</option>
                              <option value="홍보, 영리 목적" name="홍보, 영리 목적">홍보, 영리 목적</option>
                              <option value="불법 정보" name="불법 정보">불법 정보</option>
                              <option value="음란, 청소년 유해" name="음란, 청소년 유해">음란, 청소년 유해</option>
                              <option value="개인 정보 노출, 유포, 거래" name="개인 정보 노출, 유포, 거래">개인 정보 노출, 유포, 거래</option>
                              <option value="도배, 스팸" name="도배, 스팸">도배, 스팸</option>
                            </select>
                        </div>
                        
                        <!-- Modal footer -->
                        <div class="modal-footer">
                           <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                           <button class="btn btn-info"  id="replyReportSubmitButton">신고</button>
                           <input type="hidden" id="form_comRplNo" name="form_comRplNo" value="">
                           <input type="hidden" id="form_comRplUserNo" name="form_comRplUserNo" value="">
                           <input type="hidden" id="form_loginUserNo" name="form_loginUserNo" value="">
                           <input type="hidden" id="form_cno" name="form_cno" value=${ c.comNo }>
                        </div>
 
                      <script>
                      
                             $("#community-content-writeReply").on("click", "#replyReport", function() {
      
                                 const comRplNo = $(this).siblings("#comRplNo").val();
                                 const comRplUserNo = $(this).siblings("#comRplUserNo").val();
                                 const loginUserNo = $(this).siblings("#loginUserNo").val();
                                 
                                 // 뽑힘 확인
                                 // console.log(comRplNo); 
                                 // console.log(comRplUserNo);
                                 // console.log(loginUserNo);
                                 // console.log($("#form_cno").val()); // 페이지 리로드 시 필요한 쿼리스트링
                                 
                                 // 자바스크립트로 뽑은 값을 신고 모달창의 input type="hidden"에 각각 넣어 주기 	
                                 $('input[name=form_comRplNo]').attr('value', comRplNo);
                                 $('input[name=form_comRplUserNo]').attr('value', comRplUserNo);
                                 $('input[name=form_loginUserNo]').attr('value', loginUserNo);
                                 
                                 // 값 뽑힘 확인
                                 // const a1 = $("#form_comRplNo").val();
                                 // const a2 = $("#form_comRplUserNo").val();
                                 // const a3 = $("#form_loginUserNo").val();
                                 
                                 // console.log(a1);
                                 // console.log(a2);
                                 // console.log(a3);
                             
                             });
                             
                          // 모달창의 신고 버튼 누르면 action 따라서 url 옮겨라
                          $("#replyReportSubmitButton").on("click", function() {
                              
                              document.getElementById("replyReport-form").submit();
                              
                          });
                      </script>
                        
                    </div>
                    </div>
                </div>
          </form> <!-- 댓글 신고 모달창 끝 -->

      <!-- 푸터 영역 -->
        <jsp:include page="../common/footer.jsp" />
    </div>
</body>
</html>
