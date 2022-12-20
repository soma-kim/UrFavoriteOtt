package com.urfavoriteott.ufo.cs.model.service;

import java.util.ArrayList;

import com.urfavoriteott.ufo.common.model.vo.PageInfo;
import com.urfavoriteott.ufo.cs.model.vo.Notice;

public interface NoticeService {

	// 공지사항 게시판 리스트 조회 서비스 + 페이징 처리
		/**
		 * 게시글의 총 갯수 구하는 메소드 - 작성자 : 동민
		 * @return
		 */
		int selectNoticeListCount();
		/**
		 * 공지사항 리스트 조회 메소드(관리자 + 회원) - 작성자 : 동민
		 * @param pi
		 * @return
		 */
		ArrayList<Notice> selectNoticeList(PageInfo pi);
		
		// 공지사항 상세 조회 서비스
		/**
		 * 공지사항 조회수 증가 메소드(관리자 + 회원) - 작성자 : 동민
		 * @param noticeNo : 조회수 증가시킬 공지사항 게시글 번호
		 * @return
		 */
		int noticeIncreaseCount(int noticeNo);
		/**
		 * 공지사항 상세 조회 메소드(관리자 + 회원) - 작성자 : 동민
		 * @param noticeNo : 상세조회할 공지사항 게시글 번호
		 * @return
		 */
		Notice selectNotice(int noticeNo);
		
		/**
		 * 공지사항 작성 메소드 - 작성자 : 동민
		 * @param n : 작성할 공지사항 게시글 정보
		 * @return
		 */
		int insertNotice(Notice n);
		
		/**
		 * 공지사항 삭제 메소드 - 작성자 : 동민
		 * @param noticeNo : 삭제하고자할 공지사항 게시글 번호
		 * @return
		 */
		int deleteNotice(int noticeNo);
		
		/**
		 * 공지사항 수정 메소드 - 작성자 : 동민
		 * @param n : 수정하고자할 공지사항 게시글 정보
		 * @return
		 */
		int updateNotice(Notice n);
}