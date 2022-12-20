package com.urfavoriteott.ufo.contents.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.urfavoriteott.ufo.common.model.vo.PageInfo;
import com.urfavoriteott.ufo.contents.model.dao.ReviewDao;
import com.urfavoriteott.ufo.contents.model.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Autowired
    private ReviewDao reviewDao;
    
    /**
     * 콘텐츠 화면에서 별점/코멘트 탭을 클릭했을 때 뜨는 창에서 해당 콘텐츠의 코멘트 개수를 알려 주는 메소드 - 작성자: 수빈
     * 콘텐츠 화면에서 별점/코멘트 더보기를 클릭했을 때 페이징바(select)- 작성자: 수빈 (재활용)
     */
    @Override
    public int selectCommentListCount(int contentsId) {
    	return reviewDao.selectCommentListCount(sqlSession, contentsId);
    }

	/**
	 * 콘텐츠 화면에서 별점/코멘트 탭을 클릭했을 때 뜨는 창 - 작성자: 수빈
	 */
	@Override
	public ArrayList<Review> selectCommentList(int contentsId) {
		return reviewDao.selectCommentList(sqlSession, contentsId);
	}

	/**
	 * 콘텐츠 화면에서 별점/코멘트 더보기를 클릭했을 때 뜨는 창 - 작성자: 수빈
	 */
	@Override
	public ArrayList<Review> selectCommentListAll(int contentsId, PageInfo pi) {
		return reviewDao.selectCommentListAll(sqlSession, contentsId, pi);
	}

	/**
	 * 콘텐츠 화면 별점/코멘트 탭에서 신고를 눌렀을 때 사용할 메소드 - 작성자: 수빈
	 */
	@Override
	public int reportComment(HashMap map) {
		return reviewDao.reportComment(sqlSession, map);
	}

	/**
	 * 콘텐츠 화면에서 나의 리뷰 가지고 오기 - 작성자: 수빈
	 */
	@Override
	public Review selectMyComment(HashMap map) {
		return reviewDao.selectMyComment(sqlSession, map);
	}

	/**
	 * 컨텐츠 화면에서 나의 코멘트를 삭제하는 메소드 - 작성자: 수빈
	 */
	@Override
	public int deleteMyComment(int myReviewNo) {
		return reviewDao.deleteMyComment(sqlSession, myReviewNo);
	}

	/**
	 * 컨텐츠 화면에서 나의 코멘트를 작성하는 메소드 - 작성자: 수빈
	 */
	@Override
	public int insertMyComment(HashMap map) {
		return reviewDao.insertMyComment(sqlSession, map);
	}

	/**
	 * 컨텐츠 화면에서 나의 코멘트를 수정하는 메소드 - 작성자: 수빈
	 */
	@Override
	public int updateMyComment(HashMap map) {
		return reviewDao.updateMyComment(sqlSession, map);
	}

	/**
	 * 콘텐츠에서 별점을 줄 때 사용할(insert or update) 메소드 - 작성자: 수빈
	 */
	@Override
	public int selectCondition(HashMap map) {
		return reviewDao.selectCondition(sqlSession, map);
	}

	/**
	 * 콘텐츠에서 있는 별점을 수정할 때 사용할 메소드 - 작성자: 수빈
	 */
	@Override
	public int updateMyStar(HashMap map) {
		return reviewDao.updateMyStar(sqlSession, map);
	}

	/**
	 * 콘텐츠에서 없는 별점을 처음 등록할 때 사용할 메소드 - 작성자: 수빈
	 */
	@Override
	public int insertMyStar(HashMap map) {
		return reviewDao.insertMyStar(sqlSession, map);
	}
}