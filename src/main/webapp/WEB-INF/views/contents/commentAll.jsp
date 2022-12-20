<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>콘텐츠 코멘트 전체 조회 영역(더보기 클릭 시)</title>
    <link href="resources/css/commentAll.css" rel="stylesheet">
     <!-- jQuery 라이브러리 -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

     <!-- 부트스트랩 -->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
     <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

	<div class="wrap">
	
		<!-- 플로팅 버튼 영역 -->
	    <jsp:include page="../common/floatingButton.jsp" />
	
		<!-- 헤더 영역 -->
	   	<jsp:include page="../common/header.jsp" />
	   	
        <br><br><br><br>
        <div id="commentArea">
        	<c:choose>
        		<c:when test="${ not empty movieId }">
        			<div id="pageInfo"><b><i>향수:어느 살인자의 이야기</i></b>에 대한 코멘트입니다</div> <!-- ${ movieTitle }가 되어야 하는데 일단 하드코딩 -->
        		</c:when>
        		<c:otherwise>
        			<div id="pageInfo"><b><i>향수:어느 살인자의 이야기</i></b>에 대한 코멘트입니다</div> <!-- ${ tvName }가 되어야 하는데 일단 하드코딩 -->
        		</c:otherwise>
        	</c:choose>
            
            <br><br>
			
			<c:forEach var="r" items="${ list }">
	            <!-- commentList를 반복 돌릴 거고 페이징 처리 -->
	           
	            <div class="commentList">
	                <table class="personalComment" width="100px;">
	                    <tr class="personalCommentTitle">
	                        <th class="commentTitle1">${ r.userNickname }</th>
	                        <td class="commentTitle2">
			                    <input type="hidden" id="reviewNo" name="reviewNo" value="${ r.reviewNo }">
			                    <input type="hidden" id="commentUserNo" name="commentUserNo" value="${ r.userNo }">
			                    <input type="hidden" id="loginUserNo" name="loginUserNo" value="${ loginUser.userNo }">
	                        	<button type="button" id="commentReport" data-toggle="modal" data-target="#commentReportModal">신고</button>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th colspan="2"><div class="personalCommentStar">★ ${ r.reviewStar }</div></th>
	                    </tr>
	                    <tr class="personalCommentContentTR">
	                        <c:choose>
								<c:when test="${ not empty r.reviewContent }">
									<th class="personalCommentContent" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ r.reviewContent }</th>
								</c:when>
								<c:otherwise>
									<th class="personalCommentContent" colspan="2" style="font-size:12px; color:gray;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ r.userNickname } 님께서는<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;현재 별점만 주신 상태예요!</th>
								</c:otherwise>
							</c:choose>
	                    </tr>
	                </table>
	            </div>
	         	<br>
			</c:forEach>

            <br><br>

            <div id="pagingArea">
				<c:choose>
					<c:when test="${ pi.currentPage eq 1 }">
						<button type="button" onclick="location.href='#';" disabled>«</button>
					</c:when>
					<c:otherwise>
						<button type="button" onclick="location.href='commentListAll.co?cpage=${ pi.currentPage - 1}';">«</button>
					</c:otherwise>
				</c:choose>
				
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }" step="1">
					<button type="button" onclick="location.href='commentListAll.co?cpage=${ p }';">${ p }</button>
				</c:forEach>
				
				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
						<button type="button" onclick="location.href='#';" disabled>»</button>
					</c:when>
					<c:otherwise>
						<button type="button" onclick="location.href='commentListAll.co?cpage=${ pi.currentPage + 1}';">${ p }</button>
					</c:otherwise>
				</c:choose>
			</div>

        </div>

             <!-- 코멘트 신고 모달창 -->
             <form id="report-form" action="reportComment.co" method="post" name="reportForm">
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
                                <input type="hidden" name="loginUserNo" value="${ loginUser.userNo }">
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
	                            <button type="submit" class="btn btn-info"  id="reportSubmitButton">신고</button>
	                            <input type="hidden" id="form_reviewNo" name="form_reviewNo" value="">
                                <input type="hidden" id="form_commentUserNo" name="form_commentUserNo" value="">
                                <input type="hidden" id="form_loginUserNo" name="form_loginUserNo" value="">
                            </div>
                            
                            <script>
			                
			               		$("#commentArea").on("click", "#commentReport", function() {
			
			                   		const reviewNo = $(this).siblings("#reviewNo").val();
			                   		const commentUserNo = $(this).siblings("#commentUserNo").val();
			                   		const loginUserNo = $(this).siblings("#loginUserNo").val();
			                   		
			                   		console.log(reviewNo);
			                   		console.log(commentUserNo);
			                   		console.log(loginUserNo);
			                   		
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
        </form>
        <!-- 코멘트 신고 모달창 끝 -->
        
        <!-- 푸터 영역 -->
	   	<jsp:include page="../common/footer.jsp" />
	   	
    </div> <!-- 전체 영역 끝 -->

</body>
</html>