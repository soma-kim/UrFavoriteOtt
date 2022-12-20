<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 신고 관리</title>

	<link href="resources/css/adminReportedReply.css" rel="stylesheet">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<!--
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
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
	                <td width="380" style="font-size:50px; font-weight:900;">관리자</td>
	            </tr>
	        </table>
	    	
	    	<!-- !!! 본인이 맡은 탭 div에 id="selected_tab" 붙어녛기 !!!-->
		    <div id="admin_mypage_navi">
		        <div><a href="admin_list.me">회원 관리</a></div>
		        <div><a href="">콘텐츠 관리</a></div>
				<div><a href="commentList.ad">코멘트 관리</a></div>
		        <div><a href="">이용권 관리</a></div>       
		        <div id="selected_tab"><a href="reportedComment.ad">신고 관리</a></div>
		        <div><a href="admin_stat.st">통계 관리</a></div>
			</div>

			<!-- 이곳부터 본인 화면 구현 -->
			<div id="reportReplyManagement">
				<br>
				<div id="reportCategory">
					<div style="float : left;">
					<!-- 구현하는 페이지 option에 옵션 selected 넣을 것 -->
						<select id="reportPageTab" name="reportCategory" onchange="changeSelect()">
							<option value="community" name="community">커뮤니티 글</option>
							<option value="communityReply" name="communityReply" selected>커뮤니티 댓글</option>
							<option value="comment" name="comment">코멘트</option>
						</select>
					</div>
					<div style="text-align:right; color: white; font-size:bold;"><button type="button" onclick="reportedReplyList();">처리되지 않은 댓글 보기</button></div>
				</div>
				
					<div id="replyListAll">
						<br>
					<c:choose>
						<c:when test="${ not empty replyList }">
							<table id="replyTable">
								<thead>
									<tr id="reply_head" class="line">
										<th class="reply_head1" width="10%;">신고자</th>
										<th class="reply_head1" width="10%;">작성일</th>
										<th class="reply_head1" width="10%;">댓글번호</th>
										<th class="reply_head1" width="25%;">댓글내용</th>
										<th class="reply_head1" width="20%;">신고사유</th>
										<th class="reply_head1" width="8%;">신고처리</th>
										<th class="reply_head1" width="17%;">삭제상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="r" items="${ replyList }">
										<tr class="personalReply">
											<td id="userMail">${ r.userNo }</td>
											<td id="replyDate">${ r.comRplRegisterDate }</td>
											<td id="communityNo">${ r.comRplNo }</td>
											<td id="reply_Content">${ r.comRplContent }</td>
											<td id="reportedReason">${ r.reportReason }</td>
											<td id="reportedCount">${ r.reportStatus }</td>
											<td>
												<input type="hidden" id="replyReportNo" name="replyReportNo" value=${ r.reportNo }>
												<input type="hidden" id="comRplNo" name="comRplNo" value=${ r.comRplNo }>
												<button type="button" class="btn btn-danger" id="resetReportedReply">되돌리기</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
		
							<br><br>
		
							<div id="pagingArea">
								<c:choose>
									<c:when test="${ pi.currentPage eq 1 }">
										<button type="button" onclick="location.href='#';" disabled>«</button>
									</c:when>
									<c:otherwise>
										<button type="button" onclick="location.href='processedReplyList.ad?cpage=${ pi.currentPage - 1}';">«</button>
									</c:otherwise>
								</c:choose>
								
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }" step="1">
									<button type="button" onclick="location.href='processedReplyList.ad?cpage=${ p }';">${ p }</button>
								</c:forEach>
								
								<c:choose>
									<c:when test="${ pi.currentPage eq pi.maxPage }">
										<button type="button" onclick="location.href='#';" disabled>»</button>
									</c:when>
									<c:otherwise>
										<button type="button" onclick="location.href='processedReplyList.ad?cpage=${ pi.currentPage + 1}';">»</button>
									</c:otherwise>
								</c:choose>
							</div>
							</c:when>
							<c:otherwise>
								조회된 내역이 없습니다.
							</c:otherwise>
							</c:choose>
								
				</div> <!-- communityListAll 영역 끝 -->
				
				<!-- 신고관리 option category select시 url 이동 -->
				<script> 
					function changeSelect(){ 
	
						var selectList = document.getElementById("reportPageTab")
						
						if(selectList.value == "community"){
							location.href = "reportedCommunity.ad";
						}
						if(selectList.value == "communityReply"){
							location.href = "reportedReply.ad";
						}
						if(selectList.value == "comment"){
							location.href = "reportedComment.ad";
						}
					}
				</script>
				
				<script>
					$("#replyListAll").on("click", "#resetReportedReply", function(){
						
						const reportNo = $(this).siblings("#replyReportNo").val();
						const comRplNo = $(this).siblings("#comRplNo").val();
						
						// console.log(reportNo);
						// console.log(comRplNo);
						
						if(confirm("해당 댓글의 상태를 되돌리시겠습니까?")) {
							
							$.ajax({
								url : "resetReportedReply.ad",
								type : "get",
								data : { reportNo : reportNo,
										 comRplNo : comRplNo
									   },
								success : function(result) {
									
									if(result > 0) {
										alert("성공적으로 처리되었습니다.");
										location.reload();
									}
									
								},
								error : function() {
									console.log("신고된 댓글 삭제용 ajax 통신 실패!");
								}
								
							});
						}
					
					});
					
					function reportedReplyList() {
						location.href="reportedReply.ad";
					}
				</script>

			</div>
			
        </div>

		<!-- 푸터 영역 -->
        <jsp:include page="../common/footer.jsp" />

    </div>
    
</body>
</html>