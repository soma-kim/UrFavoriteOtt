package com.urfavoriteott.ufo.contents.model.vo;

import java.sql.Date;

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
public class Review {
	
	private int reviewNo; 		  //	REVIEW_NO	NUMBER
	private String reviewStatus;  //	REVIEW_STATUS	CHAR(1 BYTE)
	private String reviewStar;		  //	REVIEW_STAR	NUMBER
	private String reviewContent; //	REVIEW_CONTENT	LONG
	private Date reviewDate; 	  //	REVIEW_DATE	DATE
	private int userNo; 		  //	USER_NO	NUMBER
	private String userId;		  //    코멘트에 대한 리스트를 보여줄때 가지고 올 이메일
	private String userNickname;  //	코멘트에 대한 리스트를 보여줄때 가지고 올 닉네임
	private int movieId;		  //	MOVIE_ID
	private String movieTitle;	  //    movie 테이블에서 가지고 올 한글 제목
	private int tvId;		  	  //	TV_ID
	private String tvName;        //    tv 테이블에서 가지고 올 한글 제목
	private int reportNo; 		  //    신고 번호
	private String reportReason;  //    신고 사유
	private String reportStatus;  //    신고 처리 상태
}