package com.urfavoriteott.ufo.contents.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.urfavoriteott.ufo.common.model.vo.PageInfo;
import com.urfavoriteott.ufo.contents.model.vo.Review;

public interface ReviewService {
	
	/**
	 * 콘텐츠 화면에서 별점/코멘트 탭을 클릭했을 때 뜨는 창에서 해당 콘텐츠의 코멘트 개수를 알려 주는 메소드 - 작성자: 수빈
	 * 콘텐츠 화면에서 별점/코멘트 더보기를 클릭했을 때 페이징바(select)- 작성자: 수빈 (재활용)
	 * @param contentsId
	 * @return
	 */
	int selectCommentListCount(int contentsId);
	
	/**
	 * 콘텐츠 화면에서 별점/코멘트 탭을 클릭했을 때 뜨는 창 - 작성자: 수빈
	 * @param contentsNo : tvId 또는 movieId
	 * @return
	 */
	ArrayList<Review> selectCommentList(int contentsId);
	
	/**
	 * 콘텐츠 화면에서 별점/코멘트 더보기를 클릭했을 때 뜨는 창 - 작성자: 수빈
	 * @param contentsId
	 * @return
	 */
	ArrayList<Review> selectCommentListAll(int contentsId, PageInfo pi);
	
	/**
	 * 콘텐츠 화면 별점/코멘트 탭에서 신고를 눌렀을 때 사용할 메소드 - 작성자: 수빈
	 * @param reportReason
	 * @param form_loginUserNo
	 * @param contentsId
	 * @param form_commentUserNo
	 * @param form_reviewNo
	 * @return
	 */
	int reportComment(HashMap map);
	
	/**
	 * 콘텐츠 화면에서 나의 리뷰 가지고 오기 - 작성자: 수빈
	 * @param loginUserNo
	 * @return
	 */
	Review selectMyComment(HashMap map);
	
	/**
	 * 컨텐츠 화면에서 나의 코멘트를 삭제하는 메소드 - 작성자: 수빈
	 * @param myReviewNo
	 * @return
	 */
	int deleteMyComment(int myReviewNo);
	
	/**
	 * 컨텐츠 화면에서 나의 코멘트를 작성하는 메소드 - 작성자: 수빈
	 * @param map
	 * @return
	 */
	int insertMyComment(HashMap map);
	
	/**
	 * 컨텐츠 화면에서 나의 코멘트를 수정하는 메소드 - 작성자: 수빈
	 * @param map
	 * @return
	 */
	int updateMyComment(HashMap map);
	
	/**
	 * 콘텐츠에서 별점을 줄 때 사용할(insert or update) 메소드 - 작성자: 수빈
	 * @param map
	 * @return
	 */
	int selectCondition(HashMap map);
	
	/**
	 * 콘텐츠에서 있는 별점을 수정할 때 사용할 메소드 - 작성자: 수빈
	 * @param map
	 * @return
	 */
	int updateMyStar(HashMap map);
	
	/**
	 * 콘텐츠에서 없는 별점을 처음 등록할 때 사용할 메소드 - 작성자: 수빈
	 * @param map
	 * @return
	 */
	int insertMyStar(HashMap map);

}