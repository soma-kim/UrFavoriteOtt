package com.urfavoriteott.ufo.cs.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.urfavoriteott.ufo.common.model.vo.PageInfo;
import com.urfavoriteott.ufo.cs.model.dao.NoticeDao;
import com.urfavoriteott.ufo.cs.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Autowired
    private NoticeDao noticeDao;
    
    @Override
	public int selectNoticeListCount() {
		
		return noticeDao.selectNoticeListCount(sqlSession);
		
	}

	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		
		return noticeDao.selectNoticeList(sqlSession, pi);
	}

	@Override
	public int noticeIncreaseCount(int noticeNo) {
		return noticeDao.noticeIncreaseCount(sqlSession, noticeNo);
	}

	@Override
	public Notice selectNotice(int noticeNo) {
		return noticeDao.selectNotice(sqlSession, noticeNo);
	}

	@Override
	public int insertNotice(Notice n) {
		
		return noticeDao.insertNotice(sqlSession, n);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		
		return noticeDao.deleteNotice(sqlSession, noticeNo);
	}

	@Override
	public int updateNotice(Notice n) {
		
		return noticeDao.updateNotice(sqlSession, n);
	}
}