package com.urfavoriteott.ufo.cs.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.urfavoriteott.ufo.common.model.vo.PageInfo;
import com.urfavoriteott.ufo.common.template.Pagination;
import com.urfavoriteott.ufo.cs.model.service.NoticeService;
import com.urfavoriteott.ufo.cs.model.vo.Notice;

@Controller
public class NoticeController {

    @Autowired
    private NoticeService noticeService;
    
    /**
	 * FAQ 조회 메소드 - 작성자 : 동민
	 * @return
	 */
	@RequestMapping("FAQ.no")
	public String FAQForm() {
		
		return "cs/FAQ";
	}
	
	/**
	 * 관리자 FAQ 조회 메소드 - 작성자 : 동민
	 * @return
	 */
	@RequestMapping("adminFAQ.no")
	public String adminFAQForm() {
		
		return "cs/adminFAQ";
	}
	
	
	/**
	 * 공지사항 리스트 조회 메소드 - 작성자 : 동민
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@RequestMapping("noticeList.no")
	public String selectNoticeList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = noticeService.selectNoticeListCount();
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Notice> list = noticeService.selectNoticeList(pi);
		
	    model.addAttribute("pi", pi);
	    model.addAttribute("list", list);
	    
	    return "cs/noticeListView";
		
	}
	
	/**
	 * 공지사항 관리자 리스트 조회 메소드 - 작성자 : 동민
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@RequestMapping("adminNoticeList.no")
	public String adminSelectNoticeList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = noticeService.selectNoticeListCount();
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Notice> list = noticeService.selectNoticeList(pi);
		
	    model.addAttribute("pi", pi);
	    model.addAttribute("list", list);
	    
	    return "cs/adminNoticeListView";
		
	}
	
	/**
	 * 공지사항 관리자 게시글 등록 페이지 이동 메소드 - 작성자 : 동민
	 * @return
	 */
	 @RequestMapping("noticeEnrollForm.no")
	 public String noticeEnrollForm() {
		 
		 
		 return "cs/adminNoticeEnrollForm";
	 }
	 
	 /**
	  * 공지사항 관리자 게시글 등록 메소드 - 작성자 : 동민
	  * @param n : 등록할 공지사항 게시물
	  * @param session
	  * @param mv
	  * @return
	  */
	 @RequestMapping("noticeEnroll.no")
	 public ModelAndView insertBoard(Notice n, HttpSession session, ModelAndView mv) {
	 
		 int result = noticeService.insertNotice(n);
		 
		 if(result > 0) { // 성공
			 
			 session.setAttribute("alertMsg", "성공적으로 공지사항 게시글이 등록되었습니다.");
			 
			 mv.setViewName("redirect:/adminNoticeList.no");
			 
		 }
		 else {
			 
			 mv.addObject("errorMsg", "공지사항 게시글 작성 실패").setViewName("common/errorPage");
		 }
	 
		 return mv;
		 
	 }
	 
	 /**
	  * 공지사항 상세조회 메소드 - 작성자 : 동민
	  * @param Nno : 상세조회할 공지사항 게시물
	  * @param mv
	  * @return
	  */
	 @RequestMapping("noticeDetail.no")
	 public ModelAndView selectNotice(int nno, ModelAndView mv) {
		 
		 int result = noticeService.noticeIncreaseCount(nno);
	
		 
		 if(result > 0) { // 조회수 증가 성공시
			 
			 Notice n = noticeService.selectNotice(nno);
			 
			 mv.addObject("n", n).setViewName("cs/noticeDetailView");
		 }
		 
		 else { // 실패
			 
			 mv.addObject("errorMsg", "공지사항 상세조회 실패").setViewName("common/errorPage");
			 
		 }
		 
		 return mv;
		 
	 }
	 
	 /**
	  * 공지사항 관리자 상세조회 메소드 - 작성자 : 동민
	  * @param Nno : 상세조회할 공지사항 게시물
	  * @param mv
	  * @return
	  */
	 @RequestMapping("adminNoticeDetail.no")
	 public ModelAndView adminSelectNotice(int nno, ModelAndView mv) {
		 
		 int result = noticeService.noticeIncreaseCount(nno);
		 
		 
		 if(result > 0) { // 조회수 증가 성공시
			 
			 Notice n = noticeService.selectNotice(nno);
			 
			 mv.addObject("n", n).setViewName("cs/adminNoticeDetailView");
		 }
		 
		 else { // 실패
			 
			 mv.addObject("errorMsg", "공지사항 상세조회 실패").setViewName("common/errorPage");
			 
		 }
		 
		 return mv;
		 
	 }
	 
	 /**
	  * 공지사항 게시글 삭제 메소드 - 작성자 : 동민
	  * @param nno : 삭제할 공지사항 게시물
	  * @param session
	  * @param model
	  * @return
	  */
	 @RequestMapping("adminNoticeDelete.no")
	 public String deleteNotice(int nno, HttpSession session, Model model) {
		 
		 int result = noticeService.deleteNotice(nno);
		 
		 if(result > 0) { // 공지사항 게시글 작성 성공
			 
			 session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			 return "redirect:/adminNoticeList.no";
		 }
		 
		 else { // 공지사항 게시글 삭제 실패
			 
			 model.addAttribute("errorMsg", "게시글 삭제 실패");
			 
			 return "common/errorPage";
			 
		 }
		 
	 }
	 
	 /**
	  * 공지사항 게시글 수정하기 페이지 이동 메소드 - 작성자 : 동민
	  * @param nno : 수정할 공지사항 게시글 번호
	  * @param model
	  * @return
	  */
	 @RequestMapping("adminNoticeUpdateForm.no")
	 public String updateForm(int nno, Model model) {
		 
		 Notice n = noticeService.selectNotice(nno);
		 
		 model.addAttribute("n", n);
		 
		 return "cs/adminNoticeUpdateForm";
	 }
	 
	 /**
	  * 공지사항 게시글 수정 메소드 - 작성자 : 동민
	  * @param n : 수정할 공지사항 게시글 정보
	  * @param session
	  * @param model
	  * @return
	  */
	 @RequestMapping("adminNoticeUpdate.no")
	 public String updateNotice(Notice n, HttpSession session, Model model) {
		 
		 int result = noticeService.updateNotice(n);
		 
		 if(result > 0) { // 공지사항 게시글 수정 성공
			 
			 session.setAttribute("alertMsg", "성공적으로 공지사항 게시글 수정에 성공하였습니다.");
			 
			 return "redirect:/adminNoticeDetail.no?nno=" + n.getNoticeNo();
		 }
		 
		 else { // 공지사항 게시글 수정 실패
			 
			 model.addAttribute("errorMsg", "게시글 수정 실패");
			 
			 return "common/errorPage";
			 
		 }
		 
	 }
}