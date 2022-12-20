<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이 페이지 별점 및 코멘트 내역</title>

	<link href="resources/css/myPageComment.css" rel="stylesheet">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
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
       		<form id="loginUserForm" action="" method="post">
       			<input type="hidden" name="loginUserNo" id="loginUserNo" value=${ loginUser.userNo }>
       		</form>
	        <table id="user_profile">
	            <tr>
	                <td rowspan="2" width="220"><img src="resources/image/member/1580797858564.gif" width="170" height="170"></td>
	                <td colspan="2" width="380" style="font-size:35px; font-weight:900;">${ loginUser.userNickname }</td>
	                <td>
	                	<button type="button" onclick="location.href='updateForm.me'">회원정보 수정</button>
	                	<button type="button" data-toggle="modal" data-target="#updatePwdForm">비밀번호 변경</button>
	                </td> 
	            </tr>
	            <tr>
	                <td style="font-size:20px; color:gray; font-weight:900;">나의 이용권</td>
	                <!-- 
			                    이용권 구독을 하지 않은 경우 '사용 중인 이용권이 없습니다'
			                    라는 멘트와 함께 이용권 구독 페이지로 가는 a태그
	                -->
	                <td style="font-size:20px; font-weight:900;">사용 중인 이용권이 없습니다</td>
	                <td><button onclick="location.href='##'">이용권 구독</button></td>
	            </tr>
	        </table>
	    	
		    <!-- 이용권 구독하지 않은 경우만 나타는 구독 유도탭 -->
		    <div align="center" id="subscribe_tab">이용권을 구독하고 인기 TV프로그램과 다양한 영화를 자유롭게 시청하세요!  이용권 구독하기></div>
		    
		    <!-- !!! 본인이 맡은 탭 div에 id="selected_tab" 붙어녛기 !!!-->
		    <div id="mypage_navi">
		        <div><a href="">시청 내역</a></div>
		        <div><a href="">볼래요</a></div>
		        <div><a href="">이용권 내역</a></div>       
		        <div id="selected_tab" class="rating_comment"><a href="myComment.me">별점 및 코멘트 내역</a></div>
		        <div><a href="">커뮤니티 글 내역</a></div>
		        <div><a href="">커뮤니티 댓글 내역</a></div>
			</div>

			<br>

			<div id="myComment">
				<c:choose>
					<c:when test="${ not empty list }">
						<table id="myCommentTable">
							<thead>
								<tr id="comment_head" class="line">
									<th class="comment_head1"width="5%;">선택</th>
									<th class="comment_head1" width="30%;">콘텐츠명</th>
									<th class="comment_head1" width="15%;">별점</th>
									<th class="comment_head1" width="50%">코멘트 내용</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="r" items="${ list }">
									<tr class="personalComment">
										<td>
											<input type="checkbox" name="selectContent" id="selectContent" value="${ r.reviewNo }">
										</td>
										<c:choose>
											<c:when test="${ not empty r.movieTitle }">
												<td id="ContentName">${ r.movieTitle }</td>
											</c:when>
											<c:otherwise>
												<td id="ContentName">${ r.Tvname }</td>
											</c:otherwise>
										</c:choose>
										<td id="reviewStar">★ ${ r.reviewStar }</td>
										<td id="review_content">${ r.reviewContent }</td>
									</tr>
								</c:forEach>
								<tr><th colspan="4" style="text-align: right;"><button type="button" class="btn btn-danger" onclick="deleteComment();">삭제</button></th></tr>
							</tbody>
						</table>
						<br><br>                                        
		
						<div id="pagingArea">
							<c:choose>
								<c:when test="${ pi.currentPage eq 1 }">
									<button type="button" onclick="location.href='#';" disabled>«</button>
								</c:when>
								<c:otherwise>
									<button type="button" onclick="location.href='myComment.me?cpage=${ pi.currentPage - 1}';">«</button>
								</c:otherwise>
							</c:choose>
							
							<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }" step="1">
								<button type="button" onclick="location.href='myComment.me?cpage=${ p }';">${ p }</button>
							</c:forEach>
							
							<c:choose>
								<c:when test="${ pi.currentPage eq pi.maxPage }">
									<button type="button" onclick="location.href='#';" disabled>»</button>
								</c:when>
								<c:otherwise>
									<button type="button" onclick="location.href='myComment.me?cpage=${ pi.currentPage + 1}';">»</button>
								</c:otherwise>
							</c:choose>
						</div>
					</c:when>
					<c:otherwise>
						<div style="text-align:center; font-size:20px;">조회된 코멘트가 없습니다.</div>
					</c:otherwise>
				</c:choose>

			</div>

        </div>
        
		<script>
    		$(".rating_comment").on("click", function() {
    		
	       		$("#loginUserForm").attr("action", "myComment.me").submit();
    			
    		});
    		
    		function deleteComment() {
				
				 // 체크박스의 리뷰번호를 담을 배열 선언
				let reviewNoArr = [];
				
				// name 값이 selectContent인 속성 취득 
				const selectContent = document.getElementsByName("selectContent");
				
				// 취득한 수만큼 반복 돌리기
				for (let i = 0; i < selectContent.length; i++) {
					
					// 속성 중에 체크된 항목이 있을 경우
					if(selectContent[i].checked == true) {
						reviewNoArr.push(selectContent[i].value);
					}
				}
				
				// 결과를 표시
				// console.log(reviewNoArr); // 체크박스된 리뷰의 번호가 잘 뽑힘!
				// console.dir(reviewNoArr); // Array[선택된checkbox숫자]
				
				if(confirm("선택된 코멘트를 삭제하시겠습니까?")) {
					
					$.ajax({
						url : "deleteComment.me",
						data : { reviewNoArr : reviewNoArr },
						type : "get",
						success : function(result) {
							if(result > 0) {
								alert("성공적으로 삭제되었습니다.");
								location.reload();
							}
						},
						error : function() {
							console.log("마이페이지 코멘트 삭제용 ajax 통신 실패!");
						}
						
					});
				}
				
			}
		</script>
        
		<!-- 푸터 영역 -->
        <jsp:include page="../common/footer.jsp" />

    </div>

</body>
</html>