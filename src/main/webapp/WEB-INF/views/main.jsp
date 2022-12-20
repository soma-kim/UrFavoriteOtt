<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, com.urfavoriteott.ufo.contents.model.vo.Movie
                , com.urfavoriteott.ufo.contents.controller.MovieController" %>
<%
    String contextPath = request.getContextPath();
    ArrayList<Movie> movieHeader = new MovieController().getMovieTopRated();
    ArrayList<Movie> moviePopular = new MovieController().getMoviePopular();
    ArrayList<Movie> movieLatest = new MovieController().getMovieLatest();
    ArrayList<Movie> movieVideo = new MovieController().getMovieVideo("436270");
    ArrayList<Movie> movieGenre = new MovieController().getMovieSimilar("882598");
    ArrayList<Movie> movieDirector = new MovieController().getMovieSimilar("76600");
    ArrayList<Movie> movieCast = new MovieController().getMovieSimilar("597");
%>
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
    <link rel="stylesheet" href="resources/css/mainCss.css">

    <!-- Slick 스타일시트 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css" integrity="sha512-yHknP1/AwR+yx26cB1y0cjvQUMvEa2PFzt1c9LlS4pRQ5NOTZFWbhBig+X9G9eYW/8m0/4OXNx8pxJ6z57x0dw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css" integrity="sha512-17EgCFERpgZKcm0j0fEq1YCJuyAWdz9KUtv1EjVuaOz8pDnh/0nZxmU6BBXwaaxqoi9PQXnRWqlcDB027hgv9A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Slick 라이브러리 연결 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js" integrity="sha512-XtmMtDEcNz2j7ekrtHvOVR4iwwaD6o/FUJe6+Zq+HgcCsk3kj4uSQQR8weQ2QVj1o0Pk6PwYLohm206ZzNfubg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body>

    <!-- 전체 영역 -->
    <div class="wrap">

		<!-- 플로팅 버튼 영역 -->
        <jsp:include page="common/floatingButton.jsp" />

		<!-- 헤더 영역 -->
        <jsp:include page="common/header.jsp" />


        <!-- 컨텐츠 영역 (개별 구현 구역) -->
        <div id="content_container">

            <!-- 최고 평점 TOP 5 -->
            <p class="main_text">최고 평점 TOP 5</p>
            <button type="button" id="top_rate_center"></button>
            <div id="top_rate_container">
            	<% for(Movie m : movieHeader) { %>
            		<div><img src=<%= m.getBackdropPath() %>></div>
                <% } %>
            </div>

            <!-- 최신 게임 -->
            <p class="main_text">가장 인기있는 콘텐츠 TOP 20</p>
            <div class="new_game_container">
            	<%
            		int num = 1;
                	String num_src;
                %>
            	<% for(Movie m : moviePopular) { %>
            		<% num_src = "resources/image/common/" + num++ + ".png"; %>
            		<div><a href=""><img class="thumbnail" src=<%= m.getPosterPath() %>></a>
                    <img class="number" src=<%= num_src %>></div>
            	<% } %>
            </div>

            <!-- 장르 검색 -->
            <p class="main_text">신작 콘텐츠</p>
            <div class="genre_search_container">
            	<% for(Movie m : movieLatest) { %>
            		<div><a href=""><img class="thumbnail" src=<%= m.getPosterPath() %>></a></div>
            	<% } %>
            </div>

            <!-- 최신 게임 -->
            <p class="main_text">한다은님이 시청 중인 콘텐츠</p>
            <div class="genre_search_container">
                <% for(Movie m : movieVideo) { %>
            		<div>
            			<iframe width="100%" height="350px" src="https://www.youtube.com/embed/<%= m.getVideoKey() %>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            		</div>
                <% } %>
            </div>

            <!-- 장르 검색 -->
            <p class="main_text">한다은님이 좋아할만한 공포 장르 콘텐츠</p>
            <div class="genre_search_container">
                <% for(Movie m : movieGenre) { %>
            		<div><a href=""><img class="thumbnail" src=<%= m.getPosterPath() %>></a></div>
            	<% } %>
            </div>

            <!-- 장르 검색 -->
            <p class="main_text">한다은님이 좋아할만한 김감독 연출 콘텐츠</p>
            <div class="genre_search_container">
                <% for(Movie m : movieDirector) { %>
            		<div><a href=""><img class="thumbnail" src=<%= m.getPosterPath() %>></a></div>
            	<% } %>
            </div>

            <!-- 장르 검색 -->
            <p class="main_text">한다은님이 좋아할만한 김배우 출연 콘텐츠</p>
            <div class="genre_search_container">
                <% for(Movie m : movieCast) { %>
            		<div><a href=""><img class="thumbnail" src=<%= m.getPosterPath() %>></a></div>
            	<% } %>
            </div>

        </div>


		<!-- 푸터 영역 -->
        <jsp:include page="common/footer.jsp" />

    </div>


    <script>
	    $(function() {

	        /* ===== 최고 평점 TOP 5 ===== */

	        // 슬라이더 설정
	        $('#top_rate_container').slick({
	            autoplay: true,                 // 자동 재생
	            centerMode: true,               // 전후 슬라이드 함께 표시
	            centerPadding: "9%",           // 중앙 슬라이드 좌우 여백 (9%)
	            dots: true,                     // 페이징 버튼 표시
	            focusOnSelect: true             // 옆 슬라이드 클릭 시 센터로 이동시킴
	        });


	        /* ===== 최신 게임 ===== */

	        // 슬라이더 설정
	        $('.new_game_container').slick({
	            autoplay: true,                 // 자동 재생
	            autoplaySpeed: 2000,            // 자동 재생 속도 설정 (2초)
	            dots: true,                     // 페이징 버튼 표시
	            slidesToShow: 5,                // 표시할 슬라이드 수 (4개)
	            slidesToScroll: 5,              // 한번에 넘길 슬라이드 수 (4개)
	            responsive: [                   // 반응형 설정
	                {
	                    breakpoint: 1500,       // 화면 가로 크기 1500(px) 될 경우
	                    settings: {
	                        slidesToShow: 3,    // 표시할 슬라이드 수 (3개)
	                        slidesToScroll: 3   // 한번에 넘길 슬라이드 수 (3개)
	                    }
	                }
	            ]
	        });


	        /* ===== 장르 검색 ===== */

	        // 슬라이더 설정
	        $('.genre_search_container').slick({
	            autoplay: true,                 // 자동 재생
	            autoplaySpeed: 2000,            // 자동 재생 속도 설정 (2초)
	            dots: true,                     // 페이징 버튼 표시
	            slidesToShow: 5,                // 표시할 슬라이드 수 (4개)
	            slidesToScroll: 5,              // 한번에 넘길 슬라이드 수 (4개)
	            responsive: [                   // 반응형 설정
	                {
	                    breakpoint: 1500,       // 화면 가로 크기 1500(px) 될 경우
	                    settings: {
	                        slidesToShow: 3,    // 표시할 슬라이드 수 (3개)
	                        slidesToScroll: 3   // 한번에 넘길 슬라이드 수 (3개)
	                    }
	                }
	            ]
	        });
	    });
    </script>

</body>
</html>