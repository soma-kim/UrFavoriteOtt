<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 코멘트 관리</title>

	<link href="resources/css/adminCommentView.css" rel="stylesheet">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<!--
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://bootswatch.com/5/lux/bootstrap.css">
	-->

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
        	
	        <table id="admin_profile">
	            <tr>
	                <td width="220"><img src="resources/image/user/profile/admin.png" width="170" height="170"></td>
	                <td width="380" style="font-size:50px; font-weight:900; color:white;">관리자</td>
	            </tr>
	        </table>
	    	
	    	<!-- !!! 본인이 맡은 탭 div에 id="selected_tab" 붙어녛기 !!!-->
		    <div id="admin_mypage_navi">
		        <div><a href="admin_list.me">회원 관리</a></div>
		        <div><a href="">콘텐츠 관리</a></div>
				<div id="selected_tab"><a href="commentList.ad">코멘트 관리</a></div>
		        <div><a href="">이용권 관리</a></div>       
		        <div><a href="reportedComment.ad">신고 관리</a></div>
		        <div><a href="admin_stat.st">통계 관리</a></div>
			</div>

			<!-- 이곳부터 본인 화면 구현 -->
			<div id="commentManagementArea">
				<br><br>
				<div id="selectCommentInfo">
					<form action="searchComment.ad" method="get">
						<select id="selectCommentMenu" name="condition">
							<option value="userId" name="userId">이메일</option>
							<option value="userNickname" name="userNickname">닉네임</option>
							<option value="contentsTitle" name="contentsTitle">콘텐츠명</option>
						</select>
						<input type="text" id="inputUserMail" name="keyword" value="${ keyword }" placeholder="검색할 유저의 정보를 입력하세요">&nbsp;
						<button type="submit" id="selectButton">검색</button>
					</form>
				</div>
				<!-- 검색어 유지를 위해 추가 -->
				<c:if test="${ not empty condition }">
					<script>
						$(function() {
							$("#selectCommentInfo option[value=${ condition }]").attr("selected", true);
						});
					</script>
				</c:if>
				<br><br>
				<div id="commentListAll">
					<br>
					<c:choose>
						<c:when test="${ not empty list }">
							<table id="commentTable">
								<thead>
									<tr id="comment_head" class="line">
										<th class="comment_head1" width="5%">선택</th>
										<th class="comment_head1" width="15%;">유저 이메일</th>
										<th class="comment_head1" width="10%;">유저 닉네임</th>
										<th class="comment_head1" width="20%;">콘텐츠명</th>
										<th class="comment_head1" width="10%;">별점</th>
										<th class="comment_head1" width="40%">코멘트 내용</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="r" items="${ list }">
										<tr class="personalComment">
											<td>
												<input type="checkbox" name="selectContent" id="selectContent" value="${ r.reviewNo }">
											</td>
											<td id="userMail">${ r.userId }</td>
											<td id="userNickname">${ r.userNickname }</td>
											<td id="ContentName">
												<c:choose>
													<c:when test="${ not empty r.movieTitle }">
														${ r.movieTitle }
													</c:when>
													<c:otherwise>
														${ r.tvName }
													</c:otherwise>
												</c:choose>
											</td>
											<td id="reviewStar">★ ${  r.reviewStar }</td>
											<td id="review_content">${ r.reviewContent }</td>
										</tr>
									</c:forEach>
									<tr><th colspan="6" style="text-align: right;"><button type="button" class="btn btn-danger" onclick="deleteComment();">삭제</button></th></tr>
								</tbody>
							</table>
		
							<br><br>                                        
		
							<div id="pagingArea">
								<c:choose>
									<c:when test="${ pi.currentPage eq 1 }">
										<button type="button" onclick="location.href='#';" disabled>«</button>
									</c:when>
									<c:otherwise>
										<button type="button" onclick="location.href='commentList.ad?cpage=${ pi.currentPage - 1}';">«</button>
									</c:otherwise>
								</c:choose>
								
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }" step="1">
									<button type="button" onclick="location.href='commentList.ad?cpage=${ p }';">${ p }</button>
								</c:forEach>
								
								<c:choose>
									<c:when test="${ pi.currentPage eq pi.maxPage }">
										<button type="button" onclick="location.href='#';" disabled>»</button>
									</c:when>
									<c:otherwise>
										<button type="button" onclick="location.href='commentList.ad?cpage=${ pi.currentPage + 1}';">${ p }</button>
									</c:otherwise>
								</c:choose>
								</div>
								</c:when>
								<c:when test="${ not empty searchList }">
									<table id="commentTable">
								<thead>
									<tr id="comment_head" class="line">
										<th class="comment_head1" width="5%">선택</th>
										<th class="comment_head1" width="15%;">유저 이메일</th>
										<th class="comment_head1" width="10%;">유저 닉네임</th>
										<th class="comment_head1" width="20%;">콘텐츠명</th>
										<th class="comment_head1" width="10%;">별점</th>
										<th class="comment_head1" width="40%">코멘트 내용</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="r" items="${ searchList }">
										<tr class="personalComment">
											<td>
												<input type="checkbox" name="selectContent" id="selectContent" value="${ r.reviewNo }">
											</td>
											<td id="userMail">${ r.userId }</td>
											<td id="userNickname">${ r.userNickname }</td>
											<td id="ContentName">
												<c:choose>
													<c:when test="${ not empty r.movieTitle }">
														${ r.movieTitle }
													</c:when>
													<c:otherwise>
														${ r.tvName }
													</c:otherwise>
												</c:choose>
											</td>
											<td id="reviewStar">★ ${  r.reviewStar }</td>
											<td id="review_content">${ r.reviewContent }</td>
										</tr>
									</c:forEach>
									<tr><th colspan="6" style="text-align: right;"><button type="button" class="btn btn-danger" onclick="deleteComment();">삭제</button></th></tr>
								</tbody>
							</table>
		
							<br><br>                                        
		
							<div id="pagingArea">
								<c:choose>
									<c:when test="${ pi.currentPage eq 1 }">
										<button type="button" onclick="location.href='#';" disabled>«</button>
									</c:when>
									<c:otherwise>
										<button type="button" onclick="location.href='commentList.ad?cpage=${ pi.currentPage - 1}';">«</button>
									</c:otherwise>
								</c:choose>
								
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }" step="1">
									<button type="button" onclick="location.href='commentList.ad?cpage=${ p }';">${ p }</button>
								</c:forEach>
								
								<c:choose>
									<c:when test="${ pi.currentPage eq pi.maxPage }">
										<button type="button" onclick="location.href='#';" disabled>»</button>
									</c:when>
									<c:otherwise>
										<button type="button" onclick="location.href='commentList.ad?cpage=${ pi.currentPage + 1}';">»</button>
									</c:otherwise>
								</c:choose>
								</div>
							</c:when>
							<c:otherwise>
								조회된 코멘트가 없습니다.
							</c:otherwise>
						</c:choose>
						
						<script>
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
										url : "deleteComment.ad",
										data : { reviewNoArr : reviewNoArr },
										type : "get",
										success : function(result) {
											if(result == 1) {
												alert("성공적으로 삭제되었습니다.");
												location.reload();
											}
										},
										error : function() {
											console.log("관리자 코멘트 삭제용 ajax 통신 실패!");
										}
										
									});
								}
								
							}
						</script>

				</div> <!-- commentListAll 영역 끝 -->

			</div> <!-- 본인 구현 영역 끝 -->

        </div> <!-- 컨텐츠 영역 끝 -->

		<!-- 푸터 영역 -->
        <jsp:include page="../common/footer.jsp" />

    </div> <!-- 전체 영역 끝 -->
    
</body>
</html>