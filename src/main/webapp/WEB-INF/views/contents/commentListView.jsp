<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>콘텐츠 코멘트 리스트 영역</title>
    <link href="resources/css/commentListView.css" rel="stylesheet">
     <!-- jQuery 라이브러리 -->
     <script src="https://code.jquery.com/jquery-3.5.1.js"></script>

     <!-- 부트스트랩 -->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
     <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

	<div class="wrap">
		
		<!-- 플로팅 버튼 영역 -->
	    <jsp:include page="../common/floatingButton.jsp" />

		<!-- 헤더 영역 -->
	   	<jsp:include page="../common/header.jsp" />
	   	
	   	<div id="contentsArea">
	   		<jsp:include page="movieDetailView.jsp" />
	
		    <div id="commentArea">
				<form id="loginUserForm" action="" method="post">
				  	<input type="hidden" name="loginUserNo" id="loginUserNo" value=${ loginUser.userNo }>
				</form>
		        <br>
		        	<c:choose>
					<c:when test="${ not empty loginUser }">
						<div id="starForm">
						<!-- 유저가 쓴 별점/코멘트가 없을 때: 별점 -->
						<br><br><br>
							<c:choose>
								<c:when test="${ not empty myComment }">
									<c:choose>
										<c:when test="${ empty myComment.reviewContent }">
											<!-- 유저가 쓴 별점만 있을 때 -->	
											<form id="starScoreArea" action="" method="get">
												<div id="commentTitle"><b>${ loginUser.userNickname }</b> 님의 평가입니다!</div>
												<span class="star"> ★★★★★
													<span>★★★★★</span>
													<input type="range" id="starRating" oninput="drawStar(this)" value="${ myComment.reviewStar }" step="0.5" min="0" max="10">
												</span>
												<br><br>
												<div id="loginUserCommentArea">
													<div id="loginUserComment">
														<textarea id="myCommentTextarea" name="myCommentTextarea" placeholder="어떻게 보셨나요? 회원님의 이야기를 들려주세요!" style="text-align:center; font-size:20px; background-color:white; color:black;">${ myComment.reviewContent }</textarea>
													</div>
													<br>
													<div>
														<input type="hidden" name="myReviewNo" id="myReviewNo" value="${ myComment.reviewNo }">
														<button type="button" onclick="myCommentSubmit(1);">작성</button>
													</div>
												</div>
											</form>
										</c:when>
										<c:when test="${ not empty myComment.reviewContent }">
											<!-- 유저가 쓴 별점/코멘트가 있을 때 -->	
											<form id="starScoreArea" action="" method="get">
												<div id="commentTitle"><b>${ loginUser.userNickname }</b> 님의 평가입니다!</div>
												<span class="star"> ★★★★★
													<span>★★★★★</span>
													<input type="range" id="starRating" oninput="drawStar(this)" value="${ myComment.reviewStar }" step="0.5" min="0" max="10">
												</span>
												<br><br>
												<c:if test="${ not empty myComment.reviewStar }">
													<div id="loginUserCommentArea">
														<div id="loginUserComment">
															<textarea id="myCommentTextarea" readonly>${ myComment.reviewContent }</textarea>
														</div>
														<br>
														<div>
															<input type="hidden" name="myReviewNo" id="myReviewNo" value="${ myComment.reviewNo }">
															<button type="button" id="updateMyCommentButton" data-toggle="modal" data-target="#myCommentModal">수정</button>
															&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="myCommentSubmit(2);">삭제</button>
														</div>
													</div>
												</c:if>
											</form>
										</c:when>
									</c:choose>
								</c:when>
								<c:otherwise>
									<form id="starScoreArea">
										<div id="commentTitle"><b>${ loginUser.userNickname }</b> 님, 이 콘텐츠 어떠셨나요?</div>
										<span class="star">
												★★★★★
											<span>★★★★★</span>
											<input type="range" id="starRating" oninput="drawStar(this)" value="0" step="0.5" min="0" max="10">
										</span>
									</form>
								</c:otherwise>
							</c:choose>
							<br>
							
						</div>
	
					</c:when>
					<c:otherwise>
						<br><br>
						<div style="text-align:center; font-size:20px;"><a href="loginForm.me">로그인</a> 후에 별점 및 코멘트를 남기실 수 있습니다.</div>
					</c:otherwise>
					</c:choose>
						
					<script>
					
						// 별점/코멘트 탭을 눌렀을 때 로그인 유저 정보를 넘기기
						// $("#content_tab").find("li").on("click", function(){ // 회차만 뽑힘
						// $(document.querySelectorAll('#content_tab > ul > li')[1]).on("click", function() { // 콘솔에만 찍히고 controller에 안 넘어감
							
						// window.onload=function() { // 페이지 무한 리로딩
						// $(function(){ // 페이지 무한 리로딩
						// $(document).ready(function(){ // 페이지 무한 리로딩
							
						// $("#rating_commentTab").on("click", function(){ // div 만들어서 집어 봄 안 됨
							
						$("#content_tab").find("li:eq(1)").on("click", function(){ // movieDetailView에서 a 태그 url mapping값 뺌
							
							const loginUserForm = $("#loginUserForm");
							// console.log(loginUserForm);
							
							const loginUserNo = $("#loginUserNo").val();
				        	// console.log(loginUserNo);
				            	
				            $("#loginUserForm").attr("action","commentList.co").submit();
					
						});
						
        				
						// 나의 별점 그리기
						let score = 0;
						
				        const drawStar = (target) => {
				        	
		                    var tmp = target.value * 10;
		                    $(".star span").css({ width: tmp + "%" });
		                    
							score = tmp;
		                    
		                    // console.log(tmp); // 움직일 때마다 0~100 10단위

				        };
				        
				        // "별점에서 마우스 나갔을 때=움직이다가 멈춘 마지막"의 값을 찍어야 함(데이터 소모 방지)
				        $("#starRating").mouseup(function() {
				        	
				        	const conversionScore = score / 20;
				        	const loginUserNo = $("#loginUserNo").val();
				        	const myReviewNo = $("#commentArea").find("#myReviewNo").val();
				        	
				        	// console.log("마우스 나갔어용"); // 현재 마우스 나갔을 때 콘솔이 뜸
				        	// console.log(conversionScore); // 100 단위를 0~5 0.5점 단위로 환산 완료
				        	// console.log(loginUserNo);
				        	
				        	// 별점 등록이 처음이라면 insert, 아니라면 update를 해 줘야 함
				        	$.ajax({
				        		url : "selectCondition.co",
				        		data : { loginUserNo : loginUserNo,
				        				 contentsId : 1427 
				        		}, 
				        		type : "post",
				        		success : function(result) {
				        	
				        			if(result > 0) {
				        				
				        				$.ajax({
				        				
				        					url: "updateMyStar.co",
				        					data : { myReviewNo : myReviewNo,
				        							 conversionScore : conversionScore
				        					},
				        					type : "get",
				        					success : function(result) {
				        						console.log("별점 업데이트용 ajax 통신 성공!");
				        						location.reload();
				        					
				        					},
				        					error : function() {
				        						console.log("별점 업데이트용 ajax 통신 실패!");
				        					}
				        					
				        				});
				        				
				        			} else {
				        				
				        				$.ajax({
					        				
				        					url: "insertMyStar.co",
				        					data : { conversionScore : conversionScore,
				        							 loginUserNo : loginUserNo,
				        							 contentsId : 1427
				        					},
				        					type : "get",
				        					success : function(result) {
				        						console.log("별점 인서트용 ajax 통신 성공!");
				        						location.reload();
				        					
				        					},
				        					error : function() {
				        						console.log("별점 인서트용 ajax 통신 실패!");
				        					}
				        					
				        				});
				        				
				        			}
				        		},
				        		error : function(){
				        			console.log("조건 검사용 ajax 통신 실패!");
				        		}
				        	
				        	});
				        	
				        	
				        });
				        
				       // 화면이 로드됐을 때 기본 설정
				        $(document).ready(function() {
				        	
				        	// 화면이 로드됐을 때 myComment의 별점만큼 색칠이 되어 있게끔 설정
		                    const defaultStar = $("#commentArea").find("#starRating").val()*20;
				        	// console.log(defaultStar);
		                    $(".star span").css({ width: defaultStar + "%" });
		
		                    // 코멘트 수정 모달창이 열렸을 때 textarea에 포커스
				        	$("#myCommentModal").on("shown.bs.modal", function () {		
					    		$("#updateMyComment").focus();
					    	});	
						});
				        
				        function myCommentSubmit(num) {
				        	
				        	const myReviewNo = $("#commentArea").find("#myReviewNo").val();
				        	const myComment = $("#commentArea").find("#myCommentTextarea").val();
				        	
				        	// console.log(myReviewNo);
				        	// console.log(myCommentTextarea);
				        	
				        	if(num == 1) {
				        		
				        		// console.log("작성 버튼 클릭");
				        		
				        		if(confirm("작성한 코멘트를 등록하시겠습니까?")) {
				        			
				        			$.ajax({
					        			
					        			url : "insertMyComment.co",
					        			data : {
					        				myReviewNo : myReviewNo,
					        				myComment : myComment
					        			},
					        			type : "post",
					        			success : function(result) {
					        				
					        				if(result > 0) {
					        					
					        					alert("코멘트가 성공적으로 등록되었습니다!");
					        					location.reload();
					        				
					        				} else {
					        					
					        					alert("코멘트 작성에 실패하였습니다. 잠시 후 다시 시도해 주세요.");
					        					location.reload();
					        					
					        				}
					        				
					        			},
					        			error : function() {
					        				
					        				console.log("코멘트 작성용 ajax 통신 실패!");
					        				
					        			}
					        			
					        		});
				        		}
				        		
				        	} else if(num == 2) {

				        		console.log("삭제 버튼 클릭");
				        		
				        		if(confirm("코멘트를 삭제하시겠습니까?")) {
				        			
				        			$("#starScoreArea").attr("action", "deleteMyComment.co").submit();
				        			
				        		}
				        	} else {
				        		
				        		console.log("수정 버튼 클릭");
				        		
				        		if(confirm("입력한 내용으로 코멘트를 수정하시겠습니까?")) {
				        			
				        			$("#updateMyCommentForm").attr("action", "updateMyComment.co").submit();
				        		
				        		}
				        		
				        	}
				        		
				        }
				        
				        <c:if test="${ not empty Msg }">
				        
				        	alert('${ Msg }');
				        
				        </c:if>
				        
				    </script>
		
		        <br>
		
		        <hr>
	            
	            <div id="commentContainer">
	                <div id="commentInfo">
	                	<c:choose>
		                	<c:when test="${ not empty Movie }">
		                		<input type="hidden" name="contentsId" id="contentsId" value="1427"> <!-- ${ movie.movieId } 대신 테스트용으로 향수 번호 넣음 -->
		                	</c:when>
		                	<c:otherwise>
		                		<input type="hidden" name="contentsId" id="contentsId" value="1427"> <!-- ${ tv.tvId } 대신 테스트용으로 향수 번호 넣음 -->
		                	</c:otherwise>
	                	</c:choose>
						<div id="commentAll">&nbsp;&nbsp;&nbsp;현재 ${ listCount }명의 UFO 이용자가 코멘트를 남겼습니다.</div>
						<div id="commentRequestAll"><a href="commentListAll.co">더보기</a>&nbsp;&nbsp;&nbsp;</div>
					</div>
	                <br><br>
	                <c:forEach var="r" items="${ list }">
		                <div class="commentList">
							<table class="personalComment" width="100px;">
								<tr class="personalCommentTitle">
									<th class="commentTitle1">&nbsp;&nbsp;&nbsp;${ r.userNickname }</th>
									<c:if test="${ not empty loginUser }">
										<td class="commentTitle2">
							                <input type="hidden" name="commentUserNo" id="commentUserNo" value="${ r.userNo }">
							                <input type="hidden" name="reviewNo" id="reviewNo" value="${ r.reviewNo }">
											<input type="hidden" name="loginUserNo" id="loginUserNo" value="${ loginUser.userNo }">
											<button type="button" id="commentReport" data-toggle="modal" data-target="#commentReportModal">신고</button>
										</td>
									</c:if>
								</tr>
								<tr>
									<th colspan="2"><div class="personalCommentStar">★ ${ r.reviewStar } </div></th>
								</tr>
								<tr class="personalCommentContent">
									<c:choose>
										<c:when test="${ not empty r.reviewContent }">
											<th colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ r.reviewContent }</th>
										</c:when>
										<c:otherwise>
											<th colspan="2" style="font-size:12px; color:gray;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ r.userNickname } 님께서는<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;현재 별점만 주신 상태예요!</th>
										</c:otherwise>
									</c:choose>
								</tr>
							</table>
						</div>
					</c:forEach>
	            </div>
	
		        <form id="report-form" action="reportComment.co" method="post" name="reportForm">
                      <!-- 코멘트 신고 모달창 -->
                      <div class="modal" id="commentReportModal">
                          <div class="modal-dialog modal-dialog-centered">
                          <div class="modal-content">
                          
                              <!-- Modal Header -->
                              <div class="modal-header">
                              <h5 class="modal-title">코멘트 신고</h5>
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
                                 <button type="button" class="btn btn-info"  id="reportSubmitButton" onclick="reportComment();">신고</button>
                                 <input type="hidden" id="form_reviewNo" name="form_reviewNo" value="">
                                 <input type="hidden" id="form_commentUserNo" name="form_commentUserNo" value="">
                                 <input type="hidden" id="form_loginUserNo" name="form_loginUserNo" value="">
                              </div>
       
			                <script>
			                
			               		$("#commentContainer").on("click", "#commentReport", function() {
			
			                   		const reviewNo = $(this).siblings("#reviewNo").val();
			                   		const commentUserNo = $(this).siblings("#commentUserNo").val();
			                   		const loginUserNo = $(this).siblings("#loginUserNo").val();
			                   		
			                   		// console.log(reviewNo);
			                   		// console.log(commentUserNo);
			                   		// console.log(loginUserNo);
			                   		
			                   		// 자바스크립트로 뽑은 값을 신고 모달창의 input type="hidden"에 각각 넣어 주기 	
			                   		$('input[name=form_reviewNo]').attr('value', reviewNo);
			                   		$('input[name=form_commentUserNo]').attr('value', commentUserNo);
			                   		$('input[name=form_loginUserNo]').attr('value', loginUserNo);
			                   		
			                   		// 값 뽑힘 확인
			                   		// const a1 = $("#form_reviewNo").val();
			                   		// const a2 = $("#form_commentUserNo").val();
			                   		// const a3 = $("#form_loginUserNo").val();
			                   		
			                   		// console.log(a1);
			                   		// console.log(a2);
			                   		// console.log(a3);
			                   	
			               		});
			               		
		                        // 모달창의 신고 버튼 누르면 action 따라서 url 옮겨라
		                        $("#reportSubmitButton").on("click", function() {
		                        	
		                        	document.getElementById("report-form").submit();
		                        	
		                        });
			                </script>
                              
                          </div>
                          </div>
                      </div>
                </form> <!-- 코멘트 신고 모달창 끝 -->
                
                <!-- 코멘트 수정 모달창 -->
                <form id="updateMyCommentForm" action="" method="post" name="updateMyCommentForm">
				  <div class="modal fade" id="myCommentModal">
				    <div class="modal-dialog modal-xl">
				      <div class="modal-content">
				      
				        <!-- Modal Header -->
				        <div class="modal-header">
				          <h4 class="modal-title" style="color:black;">코멘트 수정</h4>
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				        </div>
				        
				        <!-- Modal body -->
				        <div class="modal-body">
				          <textarea id="updateMyComment" name="updateMyComment" style="width:1100px; resize:none;" autofocus>${ myComment.reviewContent }</textarea>
				        </div>
				        
				        <!-- Modal footer -->
				        <div class="modal-footer">
				       		<input type="hidden" name="myReviewNo" id="myReviewNo" value="${ myComment.reviewNo }">
				            <button type="button" class="btn btn-info" data-dismiss="modal" onclick="myCommentSubmit(3);">수정</button>
				            <button type="button" class="btn" data-dismiss="modal">취소</button>
				        </div>
				        
				      </div>
				    </div>
				  </div>
				</form>

		    </div>  <!-- 댓글 영역  끝 -->
		</div>
	    
	    <!-- 푸터 영역 -->
	   	<jsp:include page="../common/footer.jsp" />
	   	
    </div> <!-- 전체 영역 끝 -->

</body>
</html>