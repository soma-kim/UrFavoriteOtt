package com.urfavoriteott.ufo.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.urfavoriteott.ufo.admin.model.dao.AdminDao;
import com.urfavoriteott.ufo.admin.model.vo.Report;
import com.urfavoriteott.ufo.admin.model.vo.Sales;
import com.urfavoriteott.ufo.common.model.vo.PageInfo;
import com.urfavoriteott.ufo.contents.model.vo.Review;
import com.urfavoriteott.ufo.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Autowired
    private AdminDao adminDao;
    
    @Override
	public int selectListCount() {
		
		return adminDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> selectList(PageInfo pi) {
		
		return adminDao.selectList(sqlSession, pi);
	}

	@Override
	public int selectSearchCount(HashMap<String, String> map) {
		
		return adminDao.selectSearchCount(sqlSession, map);
	}

	@Override
	public ArrayList<Member> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		
		return adminDao.selectSearchList(sqlSession, map, pi);
	}

	@Override
	public int updatePwd(int userNo) {
		
		return adminDao.updatePwd(sqlSession, userNo);
	}

	@Override
	public int deleteMember(int userNo) {
		
		return adminDao.deleteMember(sqlSession, userNo);
	}
	
	@Override
	public ArrayList<Sales> selectSalesPerMonthOnce() {
		
		return adminDao.selectSalesPerMonthOnce(sqlSession);
	}

	@Override
	public ArrayList<Sales> selectSalesPerMonthSub() {
		
		return adminDao.selectSalesPerMonthSub(sqlSession);
	}
	
	@Override
	public ArrayList<Sales> selectSalesPerMonth() {
		
		return adminDao.selectSalesPerMonth(sqlSession);
	}
	
	@Override
	public ArrayList<Sales> selectSalesPerYearOnce() {
		
		return adminDao.selectSalesPerYearOnce(sqlSession);
	}

	@Override
	public ArrayList<Sales> selectSalesPerYearSub() {
		
		return adminDao.selectSalesPerYearSub(sqlSession);
	}

	@Override
	public ArrayList<Sales> selectSalesPerYear() {
		
		return adminDao.selectSalesPerYear(sqlSession);
	}
	
	@Override
	public ArrayList<Integer> selectViewsTV(String genre) {
		
		return adminDao.selectViewsTV(sqlSession, genre);
	}
	
	@Override
	public ArrayList<Integer> selectViewsMovie(String genre) {
		
		return adminDao.selectViewsMovie(sqlSession, genre);
	}


	/**
	 * ????????? ????????? ????????? ????????? ?????? ???????????? - ?????????: ??????
	 * @return
	 */
	@Override
	public int selectAdminCommentListCount() {
		return adminDao.selectAdminCommentListCount(sqlSession);
	}

	/**
	 * ????????? ??????????????? ????????? ????????? ?????? ?????? ????????? ?????? (select) - ?????????: ??????
	 * @return
	 */
	@Override
	public ArrayList<Review> selectAdminCommentList(PageInfo pi) {
		return adminDao.selectAdminCommentList(sqlSession, pi);
	}

	/**
	 * ????????? ????????? ????????? ???????????? ????????? ?????? ????????????(select) - ?????????: ??????
	 * @return
	 */
	@Override
	public int searchAdminCommentListCount(HashMap map) {
		return adminDao.searchAdminCommentListCount(sqlSession, map);
	}

	/**
	 * ????????? ????????? ????????? ???????????? ????????? ????????? ?????? (select) - ?????????: ??????
	 * @return
	 */
	@Override
	public ArrayList<Review> searchAdminCommentList(HashMap map, PageInfo pi) {
		return adminDao.searchAdminCommentList(sqlSession, map, pi);
	}


	/**
	 * ????????? ????????? ????????? ???????????? ????????? ????????? ?????? (update) - ?????????: ??????
	 */
	@Override
	public int deleteAdminComment(int checkNum) {
		return adminDao.deleteAdminComment(sqlSession, checkNum);
	}

	/**
	 * ????????? ????????? ????????? ?????? ????????? ?????? ????????????(select) - ?????????: ??????
	 */
	@Override
	public int reportedCommentListCount() {
		return adminDao.reportedCommentListCount(sqlSession);
	}

	/**
	 * ????????? ??????????????? ?????? ????????? ?????? ????????? ?????? ????????? ?????? (select) - ?????????: ??????
	 */
	@Override
	public ArrayList<Report> reportedCommentList(PageInfo pi) {
		return adminDao.reportedCommentList(sqlSession, pi);
	}
	
	/**
	 * ????????? ????????? ?????? ???????????? ????????? ???????????? ??????(REPORT_STATUS='Y') ?????? ????????? - ?????????: ??????
	 */
	@Override
	public int changeStatusReportedComment(int reportNo) {
		return adminDao.changeStatusReportedComment(sqlSession, reportNo);
	}

	/**
	 * ????????? ????????? ?????? ???????????? ????????? ???????????? ??????(REVIEW_STATUS='N') ?????? ????????? - ?????????: ??????
	 */
	@Override
	public int deleteReportedComment(int reviewNo) {
		return adminDao.deleteReportedComment(sqlSession, reviewNo);
	}

	/**
	 * ????????? ????????? ?????? ???????????? ????????? ????????? ?????? ?????? ?????? ??? ????????????(select) - ?????????: ??????
	 */
	@Override
	public int processedCommentListCount() {
		return adminDao.processedCommentListCount(sqlSession);
	}

	/**
	 * ????????? ????????? ?????? ???????????? ????????? ????????? ?????? ?????? ?????? ??? ?????? ????????? ?????? ????????? ?????? (select) - ?????????: ??????
	 */
	@Override
	public ArrayList<Report> processedCommentList(PageInfo pi) {
		return adminDao.processedCommentList(sqlSession, pi);
	}

	/**
	 * ????????? ????????? ?????? ???????????? ????????? ???????????? ????????????(REPORT_STATUS='N') ????????? - ?????????: ??????
	 */
	@Override
	public int resetStatusReportedComment(int reportNo) {
		return adminDao.resetStatusReportedComment(sqlSession, reportNo);
	}

	/**
	 * ????????? ????????? ?????? ???????????? ????????? ???????????? ?????? ????????? ????????????(REVIEW_STATUS='Y') ????????? - ?????????: ??????
	 */
	@Override
	public int resetReportedComment(int reviewNo) {
		return adminDao.resetReportedComment(sqlSession, reviewNo);
	}
	
	/**
	 * ????????? ????????? ?????? ?????? ????????? ?????? ????????????(select) - ?????????: ??????
	 */
	@Override
	public int reportedReplyListCount() {
		return adminDao.reportedReplyListCount(sqlSession);
	}

	/**
	 * ????????? ??????????????? ?????? ????????? ?????? ????????? ?????? ?????? ?????? (select) - ?????????: ??????
	 */
	@Override
	public ArrayList<Report> reportedReplyList(PageInfo pi) {
		return adminDao.reportedReplyList(sqlSession, pi);
	}

	/**
	 * ????????? ????????? ?????? ???????????? ????????? ?????? ??????(REPORT_STATUS='Y') ?????? ????????? - ?????????: ??????
	 */
	@Override
	public int changeStatusReportedReply(int reportNo) {
		return adminDao.changeStatusReportedReply(sqlSession, reportNo);
	}

	/**
	 * ????????? ????????? ?????? ???????????? ????????? ????????? ??????(REVIEW_STATUS='N') ?????? ????????? - ?????????: ??????
	 */
	@Override
	public int deleteReportedReply(int comRplNo) {
		return adminDao.deleteReportedReply(sqlSession, comRplNo);
	}

	/**
	 * ????????? ????????? ?????? ???????????? ????????? ?????? ?????? ?????? ?????? ??? ????????????(select) - ?????????: ??????
	 */
	@Override
	public int processedReplyListCount() {
		return adminDao.processedReplyListCount(sqlSession);
	}

	/**
	 * ????????? ????????? ?????? ???????????? ????????? ?????? ?????? ?????? ?????? ??? ?????? ????????? ?????? ?????? ?????? (select) - ?????????: ??????
	 */
	@Override
	public ArrayList<Report> processedReplyList(PageInfo pi) {
		return adminDao.processedReplyList(sqlSession, pi);
	}

	/**
	 * ????????? ????????? ?????? ???????????? ????????? ????????? ????????????(REPORT_STATUS='N') ????????? - ?????????: ??????
	 */
	@Override
	public int resetStatusReportedReply(int reportNo) {
		return adminDao.resetStatusReportedReply(sqlSession, reportNo);
	}

	/**
	 * ????????? ????????? ?????? ???????????? ????????? ?????? ?????? ????????? ????????????(REVIEW_STATUS='Y') ????????? - ?????????: ??????
	 */
	@Override
	public int resetReportedReply(int comRplNo) {
		return adminDao.resetReportedReply(sqlSession, comRplNo);
	}
	
		
}