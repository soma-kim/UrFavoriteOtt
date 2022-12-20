package com.urfavoriteott.ufo.community.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.urfavoriteott.ufo.common.model.vo.PageInfo;
import com.urfavoriteott.ufo.community.model.dao.CommunityDao;
import com.urfavoriteott.ufo.community.model.vo.Community;
import com.urfavoriteott.ufo.community.model.vo.CommunityReply;

@Service
public class CommunityServiceImpl implements CommunityService {

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Autowired
    private CommunityDao communityDao;

	@Override
	public int selectCommunityListCount() {
		return communityDao.selectCommunityListCount(sqlSession);
	}

	@Override
	public ArrayList<Community> selectCommunityList(PageInfo pi) {
		return communityDao.selectCommunityList(sqlSession, pi);
	}

	@Override
	public int insertCommunity(Community c) {
		return communityDao.insertCommunity(sqlSession, c);
	}

	@Override
	public int communityIncreaseCount(int comNo) {
		return communityDao.communityIncreaseCount(sqlSession, comNo);
	}

	@Override
	public Community selectCommunity(int comNo) {
		return communityDao.selectCommunity(sqlSession, comNo);
	}

	@Override
	public int deleteCommunity(int comNo) {
		return communityDao.deleteCommunity(sqlSession, comNo);
	}

	@Override
	public int updateCommunity(Community c) {
		return communityDao.updateCommunity(sqlSession, c);
	}

	@Override
	public int reportCommunity(HashMap<String, String> map) {
		return communityDao.reportCommunity(sqlSession, map);
	}
	
	@Override
	public int insertReply(CommunityReply r) {
		
		return communityDao.insertReply(sqlSession, r);
		
	}

	@Override
	public ArrayList<CommunityReply> selectReplyList(int cno) {
		
		return communityDao.selectReplyList(sqlSession, cno);
	}

	/**
	 * 커뮤니티 댓글 신고를 눌렀을 때 사용할 메소드 - 작성자: 수빈
	 */
	@Override
	public int reportReply(HashMap map) {
		return communityDao.reportReply(sqlSession, map);
	}
}