<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Floating Button</title>

    <!-- CSS 스타일시트 -->
    <link rel="stylesheet" href="resources/css/floatingButtonCss.css">

    <!-- Font Awesome 아이콘 연결 -->
    <script src="https://kit.fontawesome.com/d57af49dc3.js" crossorigin="anonymous"></script>

    <!-- 1대1 채팅 연결 -->
	<script id="happytalkSDK" src="https://design.happytalkio.com/sdk/happytalk.chat.v2.min.js"></script>
</head>

<body>

    <!-- 플로팅 버튼 영역 -->
    <div id="floating_container">

        <!-- 상하단 이동 스크롤 버튼 -->
        <div id="scroll_button_container">

            <!-- 상단 이동 버튼 -->
            <a href="javascript:;" id="scroll_top">
                <i class="fa-solid fa-circle-chevron-up"></i>
            </a>

            <!-- 하단 이동 버튼 -->
            <a href="javascript:;" id="scroll_bottom">
                <i class="fa-solid fa-circle-chevron-down"></i>
            </a>

        </div>

        <!-- 해피톡 1:1 문의 채팅 상담 버튼 -->
        <script>
            var ht = null;
            (function(id, scriptSrc, callback) {
                var d = document,
                    tagName = 'script',
                    $script = d.createElement(tagName),
                    $element = d.getElementsByTagName(tagName)[0];

                $script.id = id;
                $script.async = true;
                $script.src = scriptSrc;

                if (callback) { $script.addEventListener('load', function (e) { callback(null, e); }, false); }
                $element.parentNode.insertBefore($script, $element);
            })('happytalkSDK', 'https://design.happytalkio.com/sdk/happytalk.chat.v2.min.js', function() {
                ht = new Happytalk({
                siteId: '5000100354',
                siteName: 'InsertCoin',
                categoryId: '152971',
                divisionId: '152972'
            });
            });
        </script>

    </div>


    <script>
        $(function() {

            // 화면 스크롤 시
            $(window).scroll(function() {

                // 상단 이동 버튼 상단으로부터 200px 이상에서만 표시
                if($(window).scrollTop() >= 200) {
                    $('#scroll_top').show();
                } else {
                    $('#scroll_top').hide();
                }

                // 하단 이동 버튼 하단으로부터 200px 이상까지만 표시
                if($(window).scrollTop() <= ($(window).height() - 200)) {
                    $('#scroll_bottom').show();
                } else {
                    $('#scroll_bottom').hide();
                }

                if($(window).scrollTop() >= 10) {
                    $('#header_container').css("opacity", "0.9");
                } else {
                    $('#header_container').css("opacity", "1");
                }
            });

            // 상단 이동 버튼 스크롤 설정
            $('#scroll_top').click(function() {
                $('html').animate({ scrollTop: 0 });
            });

            // 하단 이동 버튼 스크롤 설정
            $('#scroll_bottom').click(function() {
                $('html').animate({ scrollTop: $('html').height() });
            });

            const $theme = document.querySelector('#theme_cb');

            $theme.addEventListener('click', e => {
                if (e.target.checked) {
                    document.documentElement.setAttribute('color-theme', 'light');
                    $('#header_logo').attr("src", "resources/image/common/main-logo_light.png");
                } else {
                    document.documentElement.setAttribute('color-theme', 'dark');
                    $('#header_logo').attr("src", "resources/image/common/main-logo_dark.png");
                }
            });
        });
    </script>

</body>
</html>