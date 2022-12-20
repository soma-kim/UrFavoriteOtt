package com.urfavoriteott.ufo.cs.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.urfavoriteott.ufo.common.model.vo.PageInfo;
import com.urfavoriteott.ufo.cs.model.vo.Notice;

@Repository
public class NoticeDao {
	
	/**
	 * 게시글의 총 갯수 구하는 메소드 - 작성자 : 동민
	 * @param sqlSession
	 * @return
	 */
	public int selectNoticeListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("noticeMapper.selectNoticeListCount");
		
	}
	
	/**
	 * 공지사항 리스트 조회 메소드(관리자 + 회원) - 작성자 : 동민
	 * @param sqlSession
	 * @param pi
	 * @return
	 */
	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
      
		RowBounds rowBounds = new RowBounds(offset, limit);		
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectNoticeList", null, rowBounds);
		
	}
	
	/**
	 * 공지사항 게시글 작성 메소드 - 작성자 : 동민
	 * @param sqlSession
	 * @param n : 작성할 공지사항 게시글의 정보
	 * @return
	 */
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}
	
	/**
	 * 공지사항 게시글 조회수 증가 메소드(관리자 + 회원) - 작성자 : 동민
	 * @param sqlSession
	 * @param noticeNo : 조회수 증가할 공지사항 게시글 번호
	 * @return
	 */
	public int noticeIncreaseCount(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.update("noticeMapper.noticeIncreaseCount", noticeNo);
	}
	
	/**
	 * 공지사항 게시글 상세조회 메소드(관리자 + 회원) - 작성자 : 동민
	 * @param sqlSession
	 * @param noticeNo : 상세조회할 공지사항 게시글 번호
	 * @return
	 */
	public Notice selectNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.selectOne("noticeMapper.selectNotice", noticeNo);
	}
	
	/**
	 * 공지사항 게시글 삭제 메소드 - 작성자 : 동민
	 * @param sqlSession
	 * @param noticeNo : 삭제할 공지사항 게시글 번호
	 * @return
	 */
	public int deleteNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.update("noticeMapper.deleteNotice", noticeNo);
	}

	/**
	 * 공지사항 수정 메소드 - 작성자 : 동민
	 * @param sqlSession
	 * @param n : 수정할 공지사항 게시글 정보
	 * @return
	 */
	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		
		return sqlSession.update("noticeMapper.updateNotice", n);
	}
}