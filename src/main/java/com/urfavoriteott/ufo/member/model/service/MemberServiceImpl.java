package com.urfavoriteott.ufo.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.urfavoriteott.ufo.common.model.vo.PageInfo;
import com.urfavoriteott.ufo.contents.model.vo.Review;
import com.urfavoriteott.ufo.member.model.dao.MemberDao;
import com.urfavoriteott.ufo.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession, m);
	}
	
	@Override
	public int insertMember(Member m) {
		
		return memberDao.insertMember(sqlSession, m);
		
	}
	
	@Override
	public int passwordUpdate(String updatePassword) {
		return 0;
	}
	
	@Override
	public int nicknameCheck(String checkNickname) {
		
		return memberDao.nicknameCheck(sqlSession, checkNickname);
	}

	@Override
	public int updateMember(Member m) {
		
		return memberDao.updateMember(sqlSession, m);
	}
	
	@Override
	public int deleteMember(int userNo) {
		
		return memberDao.deleteMember(sqlSession, userNo);
	}

	/**
	 * 마이 페이지 별점 및 코멘트 내역 조회를 위한 페이징바(select) - 작성자 : 수빈
	 */
	@Override
	public int selectMyCommentListCount(String loginUserNo) {
		return memberDao.selectMyCommentListCount(sqlSession, loginUserNo);
	}

	/**
	 * 마이 페이지 별점 및 코멘트 내역에서 코멘트 조회 (select) - 작성자 : 수빈
	 */
	@Override
	public ArrayList<Review> selectMyCommentList(PageInfo pi, String loginUserNo) {
		return memberDao.selectMyCommentList(sqlSession, pi, loginUserNo);
	}

	/**
	 * 마이 페이지 별점 및 코멘트 내역에서 선택된 리뷰 삭제 메소드 - 작성자: 수빈
	 */
	@Override
	public int deleteMyComment(int checkNum) {
		return memberDao.deleteMyComment(sqlSession, checkNum);
	}

}
