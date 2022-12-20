package com.urfavoriteott.ufo.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class PageInfo {

    private int listCount;          // 전체 객체 수
    private int currentPage;        // 요청 페이지
    private int pageLimit;          // 한 번에 페이징바에 표시할 최대 페이지 수
    private int boardLimit;         // 한 페이지에 표시할 최대 객체 수

    private int maxPage;            // 마지막 페이지 수
    private int startPage;          // 페이징바 시작 수
    private int endPage;            // 페이징바 끝 수
}