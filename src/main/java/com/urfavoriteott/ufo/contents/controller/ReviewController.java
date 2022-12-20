package com.urfavoriteott.ufo.contents.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.urfavoriteott.ufo.common.model.vo.PageInfo;
import com.urfavoriteott.ufo.common.template.Pagination;
import com.urfavoriteott.ufo.contents.model.service.ReviewService;
import com.urfavoriteott.ufo.contents.model.vo.Review;

@Controller
public class ReviewController {

    @Autowired
    private ReviewService reviewService;
    
    /**
     * 콘텐츠 화면에서 별점/코멘트 탭을 클릭했을 때 뜨는 창 - 작성자: 수빈
     * @return
     */
    @RequestMapping(value="commentList.co")
    public String selectCommentList(@RequestParam(value="contentsId", defaultValue="1427") int contentsId, String loginUserNo, Model model) {
    	
    	// System.out.println(loginUserNo);
    	
    	HashMap<String, String> map = new HashMap<>();
    	map.put("contentsId", Integer.toString(contentsId));
    	map.put("loginUserNo", loginUserNo);
    	
    	Review myComment = reviewService.selectMyComment(map);
    	
    	// System.out.println(myComment);
    	
    	int listCount = reviewService.selectCommentListCount(contentsId);
    	
    	ArrayList<Review> list = reviewService.selectCommentList(contentsId);
    	
    	// System.out.println(listCount);
    	// System.out.println(list);
    	
    	model.addAttribute("myComment", myComment);
    	model.addAttribute("listCount", listCount);
    	model.addAttribute("list", list);
    	
    	return "contents/commentListView";
    }
    
    /**
     * 콘텐츠 화면에서 별점/코멘트 더보기를 클릭했을 때 뜨는 창 - 작성자: 수빈
     * @param contentsId
     * @param model
     * @return
     */
    @RequestMapping(value="commentListAll.co")
    public String selectCommentListAll(@RequestParam(value="cpage", defaultValue="1") int currentPage, @RequestParam(value="contentsId", defaultValue="1427") int contentsId, Model model) {
    	
    	int searchCount = reviewService.selectCommentListCount(contentsId);
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, pageLimit, boardLimit);
		
    	ArrayList<Review> list = reviewService.selectCommentListAll(contentsId, pi);
    	
    	model.addAttribute("pi", pi);
    	model.addAttribute("list", list);
    	
    	return "contents/commentAll";
    }
    
    /**
     * 콘텐츠 화면 별점/코멘트 탭에서 신고를 눌렀을 때 사용할 메소드 - 작성자: 수빈
     * @param reportReason
     * @return
     */
    @ResponseBody
    @RequestMapping(value="reportComment.co", produces="text/html; charset=UTF-8")
    public String reportComment(String reportReason, String form_loginUserNo, @RequestParam(value="contentsId", defaultValue="1427") int contentsId, String form_commentUserNo, String form_reviewNo, Model model) {
    	
    	// System.out.println("reportReason: " + reportReason);
    	// System.out.println("loginUserNo: " + form_loginUserNo);
    	// System.out.println("contentsId:" + contentsId);
    	// System.out.println("commentUserNo: " + form_commentUserNo);
    	// System.out.println("reviewNo: " + form_reviewNo);
    	
    	String contentId = Integer.toString(contentsId);
    	
    	HashMap<String, String> map = new HashMap<>();
    	map.put("reportReason", reportReason);
    	map.put("form_loginUserNo", form_loginUserNo);
    	map.put("contentId", contentId);
    	map.put("form_commentUserNo", form_commentUserNo);
    	map.put("form_reviewNo", form_reviewNo);

    	int resultNum = reviewService.reportComment(map);
    	
    	if(resultNum > 0) {
	    	
	    	return "<script>"
	    		 + "alert('성공적으로 신고 접수되었습니다.');"
	    		 + "location.href='commentList.co';"
	    		 + "</script>";
	    	
    	} else {
    		
    		return "<script>"
   	    		 + "alert('신고 접수에 실패하였습니다. 잠시 후 다시 시도해 주세요.');"
   	    		 + "location.href='commentList.co';"
   	    		 + "</script>";
    		
    	}
    }
    
    /**
     * 컨텐츠 화면에서 나의 코멘트를 삭제하는 메소드 - 작성자: 수빈
     * @param myReviewNo
     * @return
     */
    @RequestMapping("deleteMyComment.co")
    public String deleteMyComment(int myReviewNo) {
    	
    	int result = reviewService.deleteMyComment(myReviewNo);
    	
    	// System.out.println(result); // 성공적으로 삭제 시 1 잘 뽑힘
    	
    	if(result > 0) {
    		
    		return "redirect:/";
    		
    	} else {
    		
    		return "<script>"
        			+ "alert('코멘트 삭제에 실패하였습니다. 잠시 후 다시 시도해 주세요.');"
        			+ "location.href='commentList.co';"
        			+ "<script>";
    		
    	}
    	
    }
    
    /**
     * 컨텐츠 화면에서 나의 코멘트를 작성하는 메소드 - 작성자: 수빈
     * @param myReviewNo
     * @param myComment
     * @return
     */
    @ResponseBody
    @RequestMapping(value="insertMyComment.co", produces="application/json; charset=UTF-8")
    public int insertMyComment(String myReviewNo, String myComment) {
    	
    	// System.out.println("myReviewNo: " + myReviewNo);
    	// System.out.println("myComment: " + myComment);
    	
    	HashMap<String, String> map = new HashMap<>();
    	map.put("myReviewNo", myReviewNo);
    	map.put("myComment", myComment);
    	
    	int result = reviewService.insertMyComment(map);
    	
    	// System.out.println(result);
    	
    	return result;
    }
    
    /**
     * 컨텐츠 화면에서 나의 코멘트를 수정하는 메소드 - 작성자: 수빈
     * @param myReviewNo
     * @param updateMyComment
     * @return
     */
    @RequestMapping(value="updateMyComment.co", produces="text/html; charset=UTF-8")
    public ModelAndView updateMyComment(String myReviewNo, String updateMyComment, ModelAndView mv) {
    	
    	// System.out.println("myReviewNo: " + myReviewNo);
    	// System.out.println("updateMyComment: " + updateMyComment);
    	
    	HashMap<String, String> map = new HashMap<>();
    	map.put("myReviewNo", myReviewNo);
    	map.put("updateMyComment", updateMyComment);
    	
    	int updateResult = reviewService.updateMyComment(map);
    	
    	if(updateResult > 0) {
    		
    		mv.addObject("Msg", "코멘트 수정이 완료되었습니다.");
    		
    	} else {
    		
    		mv.addObject("Msg", "코멘트 수정에 실패했습니다. 잠시 후 다시 시도해 주세요.");
    		
    	}
    	
    	mv.setViewName("contents/commentListView");
    	
    	 return mv;
    	
    }
    
    /**
     * 콘텐츠에서 별점을 줄 때 사용할(insert or update) 메소드 - 작성자: 수빈
     * @param loginUserNo
     * @param contentsId
     * @return
     */
    @ResponseBody
    @RequestMapping("selectCondition.co")
    public int selectCondition(String loginUserNo, String contentsId) {
    	
    	// System.out.println("loginUserNo: " + loginUserNo);
    	// System.out.println("contentsId: " + contentsId);
    	
    	HashMap<String, String> map = new HashMap<>();
    	map.put("loginUserNo", loginUserNo);
    	map.put("contentsId", contentsId);
    	
    	int selectResult = reviewService.selectCondition(map);
    	
    	// System.out.println(selectResult);
    	
    	return selectResult;
    }
    
    /**
     * 콘텐츠에서 있는 별점을 수정할 때 사용할 메소드 - 작성자: 수빈
     * @param myReviewNo
     * @param conversionScore
     * @return
     */
    @ResponseBody
    @RequestMapping("updateMyStar.co")
    public int updateMyStar(String myReviewNo, String conversionScore) {
    	
    	// System.out.println(myReviewNo);
    	// System.out.println(conversionScore);
    	
    	HashMap<String, String> map = new HashMap<>();
    	map.put("myReviewNo", myReviewNo);
    	map.put("conversionScore", conversionScore);
    	
    	int result = reviewService.updateMyStar(map);
    	
    	return result;
    }
    
    /**
     * 콘텐츠에서 없는 별점을 처음 등록할 때 사용할 메소드 - 작성자: 수빈
     * @param conversionScore
     * @param loginUserNo
     * @param contentsId
     * @return
     */
    @ResponseBody
    @RequestMapping("insertMyStar.co")
    public int insertMyStar(String conversionScore, String loginUserNo, String contentsId) {
    	
    	// System.out.println(conversionScore);
    	// System.out.println(loginUserNo);
    	// System.out.println(contentsId);
    	
    	HashMap<String, String> map = new HashMap<>();
    	map.put("conversionScore", conversionScore);
    	map.put("loginUserNo", loginUserNo);
    	map.put("contentsId", contentsId);
    	
    	int result = reviewService.insertMyStar(map);
    	
    	return result;
    }
}