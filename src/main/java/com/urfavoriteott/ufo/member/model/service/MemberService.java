package com.urfavoriteott.ufo.member.model.service;

import java.util.ArrayList;

import com.urfavoriteott.ufo.common.model.vo.PageInfo;
import com.urfavoriteott.ufo.contents.model.vo.Review;
import com.urfavoriteott.ufo.member.model.vo.Member;


public interface MemberService {

	/**
	 * 로그인용 메소드 - 작성자 : 동민
	 * @param m : 로그인할 사용자의 계정
	 * @return
	 */
	Member loginMember(Member m);
	
	/**
	 * 회원가입용 메소드 - 작성자 : 동민
	 * @param m : 회원가입할 사용자의 계정
	 * @return
	 */
	int insertMember(Member m);
	
	/**
	 * 비밀번호 재설정용 메소드 - 작성자 : 동민
	 * @param updatePassword : 비밀번호 재설정할 비밀번호 
	 * @return
	 */
	int passwordUpdate(String updatePassword);
	
	/**
	 * 사용자 - 닉네임 중복체크용 메소드 - 작성자 : 장희연
	 * @param checkNickname : 중복체크할 사용자의 닉네임
	 * @return
	 */
	int nicknameCheck(String checkNickname);
	
	/**
	 * 사용자 - 회원 정보 수정용 메소드 - 작성자 : 장희연
	 * @param m : 사용자의 수정할 회원 정보(아이디, 회원번호, 프로필, 닉네임)
	 * @return
	 */
	int updateMember(Member m);
	
	/**
	 * 사용자 - 회원 탈퇴 처리용 메소드 - 작성자 : 장희연
	 * @param userNo : 로그인한 사용자(탈퇴할 회원)의 회원 번호
	 * @return
	 */
	int deleteMember(int userNo);
	
	/**
	 * 마이 페이지 별점 및 코멘트 내역 조회를 위한 페이징바(select) - 작성자 : 수빈
	 * @param loginUserNo
	 * @return
	 */
	int selectMyCommentListCount(String loginUserNo);
	
	/**
	 * 마이 페이지 별점 및 코멘트 내역에서 코멘트 조회 (select) - 작성자 : 수빈
	 * @param pi
	 * @param loginUserNo
	 * @return
	 */
	ArrayList<Review> selectMyCommentList(PageInfo pi, String loginUserNo);
	
	/**
	 * 마이 페이지 별점 및 코멘트 내역에서 선택된 리뷰 삭제 메소드 - 작성자: 수빈
	 * @param checkNum
	 * @return
	 */
	int deleteMyComment(int checkNum); 
}
