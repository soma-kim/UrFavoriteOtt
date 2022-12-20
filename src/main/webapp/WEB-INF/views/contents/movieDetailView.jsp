<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <!-- CSS 스타일시트 -->
    <link rel="stylesheet" href="resources/css/movieDetailViewCss.css">
</head>
<body>

    <div id="content_detail">

        <img id="content_background" src="https://image.tving.com/upload/cms/caim/CAIM2400/M000368649.png/dims/resize/F_webp,1280">

        <div id="content_info">

            <div id="content_title">헤어질 결심</div>

            <div id="content_poster">
                <img src="https://image.tving.com/upload/cms/caim/CAIM2100/M000368649.jpg/dims/resize/F_webp,480">
            </div>

            <div id="content_tags">
                <div class="content_tag certification">15+</div>
                <div class="content_tag release_date">2022</div>
                <div class="content_tag genre">로맨스</div>
                <div class="content_tag runtime">138분</div>
            </div>

            <div id="content_btn">
                <button id="content_view_btn">▶ 시청하기</button>
                <button id="content_watchable" class="none">
                    <img src="resources/image/common/dib.png"><br>찜
                </button>
            </div>

            <div id="content_text">
                <div id="content_director">
                    <p>크리에이터 &nbsp;&nbsp;박찬욱</p>
                </div>
                <div id="content_cast">
                    <p>출연 &nbsp;&nbsp;박해일, 탕웨이, 이정현, 고경표</p>
                </div>
                <div id="content_tagline">
                    <p>
                        산 정상에서 추락한 한 남자의 변사 사건.<br>
                        담당 형사 '해준'(박해일)은<br>
                        사망자의 아내 '서래'(탕웨이)와 마주하게 된다.···<br>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div id="content_tab">
        <ul>
            <li id="content_list" class="main_tab">
                <a href="#">회차 목록</a>
            </li>
            <li id="content_comment" class="main_tab">
             	<a href="#">별점 · 코멘트</a>
            </li>
        </ul>
    </div>

    <script>
        $(function() {

            $('#content_watchable').click(function() {
                $(this).toggleClass("active");

                if($(this).hasClass("active")) {
                    $('#content_watchable img').attr("src", "resources/image/common/dib_active.png");
                } else {
                    $('#content_watchable img').attr("src", "resources/image/common/dib.png");
                }
            });

            $('#content_list').click(function() {
                $(this).addClass("active");
                $(this).css("border-bottom", "2px solid red");
                $('#content_comment').removeClass("active");
                $('#content_comment').css("border", "0px");
            });
            $('#content_comment').click(function() {
                $(this).addClass("active");
                $(this).css("border-bottom", "2px solid red");
                $('#content_list').removeClass("active");
                $('#content_list').css("border", "0px");
            });
        });
    </script>

</body>
</html>