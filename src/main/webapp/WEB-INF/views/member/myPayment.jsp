<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>

<style>
	#content_container {
		margin-left : 8%;
		margin-right : 8%;
	}
    #content_container a {
    	text-decoration: none;
    	color: gray;
    }
    
    /* 회원 프로필 효과 */
	#user_profile {
		margin-top: 2%;
		margin-bottom: 2%;
	}
	#subscribe_tab {
		background-color: #3b3a40;
		height: 70px;
		text-align: center;
		line-height: 70px;
	}
	
	/* 마이페이지 탭 효과 */
	#mypage_navi>div {
    	display: inline-block;
    	width: 16.4%;
    	margin-top: 25px;
    	font-size: 20px;
    	padding: 10px;
		text-align: center;
    }
    #mypage_navi {
    	border-bottom: 1px solid gray;
    }
    /*
    #mypage_navi>div:active {
    	border-bottom:3px solid #64FFDA;
    }
    */
    #mypage_navi a:hover {
    	color: white;
    }
    #selected_tab {
    	border-bottom:3px solid #64FFDA;
    }
    #selected_tab a {
    	color: white;
    	font-weight: bold;
    }
    
    /* 회원 프로필, 비밀번호변경 버튼 효과 */
    #user_profile button, #pwd_btn {
    	border: 1px solid gray;
    	background-color: rgb(23, 26, 33);
    	color: gray;
    	height: 30px;
    	font-size: 17px;
    }
    #user_profile button:hover, #pwd_btn:hover {
    	background-color: #64FFDA;
    	border: 1px solid #64FFDA;
    }
	
	/* 박성현씨가 먹인 style */
	
	#paymentTable {
		margin:auto;
		margin-top:100px;
	}
	#paymentTable th, #paymentTable td {
		text-align: center;
	}
	.active :hover {
		cursor: pointer;
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

	        <table id="user_profile">
	            <tr>
	                <td rowspan="2" width="220"><img src="resources/image/user/profile/profile1.jfif" width="170" height="170"></td>
	                <td colspan="2" width="380" style="font-size:35px; font-weight:900;">//이용자닉네임//</td>
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
	                <td><button onclick="location.href='#'">이용권 구독</button></td>
	            </tr>
	        </table>

		    <!-- 이용권 구독하지 않은 경우만 나타는 구독 유도탭 -->
		    <div align="center" id="subscribe_tab">이용권을 구독하고 인기 TV프로그램과 다양한 영화를 자유롭게 시청하세요!  이용권 구독하기></div>

		    <!-- !!! 본인이 맡은 탭 div에 id="selected_tab" 붙어녛기 !!!-->
		    <div id="mypage_navi">
		        <div><a href="">시청 내역</a></div>
		        <div><a href="">볼래요</a></div>
		        <div id="selected_tab"><a href="myPayment.pay">이용권 내역</a></div>       
		        <div><a href="">별점 및 코멘트 내역</a></div>
		        <div><a href="">커뮤니티 글 내역</a></div>
		        <div><a href="">커뮤니티 댓글 내역</a></div>
			</div>


			<table id="paymentTable">
				<thead>
					<tr>
						<th width="5%">상태</th>
						<th width="20%">결제번호</th>
						<th colspan="2">상품명</th>
						<th>결제금액</th>
						<th>결제수단</th>
						<th>결제일</th>
						<th>만료일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>구독중</td>
						<td>20220711subsuser01</td>
						<td colspan="2">정기구독권&emsp;<button class="btn btn-sm btn-outline-dark" style="background-color: #64FFDA;">해지</button></div></td>
						<td>5,900원</td>
						<td>카드</td>
						<td>2022.07.11</td>
						<td>2022.08.10</td>
					</tr>
					<tr>
						<td>이용중</td>
						<td>20220711subsuser01</td>
						<td colspan="2">정기구독권&emsp;<button class="btn btn-sm btn-outline-dark" style="background-color: #64FFDA;">해지</button></div></td>
						<td>5,900원</td>
						<td>카드</td>
						<td>2022.07.11</td>
						<td>2022.08.10</td>
					</tr>
					<tr>
						<td>만료</td>
						<td>20220711subsuser01</td>
						<td colspan="2">정기구독권&emsp;<button class="btn btn-sm btn-outline-dark" style="background-color: #64FFDA;" disabled>해지</button></div></td>
						<td>5,900원</td>
						<td>카드</td>
						<td>2022.07.11</td>
						<td>2022.08.10</td>
					</tr>

					<!-- 페이징 처리 할 영역 -->





					<script>
						onload = () => { 
							let btn = document.querySelectorAll('.btn');
							let abledBtn = [];
							btn.forEach((el) => {
								if(el.disabled == false){
									abledBtn.push(el);
								}
							})
							abledBtn.forEach((el) => {
								console.log(el);
								el.addEventListener('mouseenter', () => {
									el.style.cursor = 'pointer';
								})
								el.addEventListener('mouseout', () => {
									el.style.cursor= '';
								})
								el.addEventListener('click', () => { // 해지 누르면 모달창으로 진짜 해지할건지 확인받고 ok하면 비동기처리
									if(confirm('정말 해지하시겠습니까?')){
										$.ajax({
											url: 'delete.pay',
											data: {},
											type: 'post',
											success: () => {
											},
											error: () => {
												console.log('AJAX 호출 에러 발생');
											}
										});
									}
								})
							})
						}
						
					</script>
				</tbody>
			</table>
        </div>

		<!-- 푸터 영역 -->
        <jsp:include page="../common/footer.jsp" />
    </div>
</body>
</html>