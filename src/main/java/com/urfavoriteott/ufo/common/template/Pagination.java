package com.urfavoriteott.ufo.common.template;

import com.urfavoriteott.ufo.common.model.vo.PageInfo;

public class Pagination {

    public static PageInfo getPageInfo(int listCount, int currentPage
                                     , int pageLimit, int boardLimit) {

        // 마지막 페이지 수
        // 1) listCount 값 double형으로 형변환 후 boardLimit 으로 나눗셈 연산
        // 2) 연산한 결과 값을 올림 처리 후 int형으로 형변환
        int maxPage = (int)Math.ceil((double)listCount / boardLimit);

        // 페이징바 시작 수
        // 1) n * pageLimit + 1
        // 2) ((currentPage - 1) / pageLimit) * pageLimit + 1
        int startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;

        // 페이징바 끝 수
        int endPage = startPage + pageLimit - 1;

        // 페이징바 끝 수가 마지막 페이지 수보다 큰 경우
        if(endPage > maxPage) {
            endPage = maxPage;
        }

        return new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
    }
}