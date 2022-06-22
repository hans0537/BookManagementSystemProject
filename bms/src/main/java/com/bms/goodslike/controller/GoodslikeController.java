package com.bms.goodslike.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bms.goodslike.service.GoodslikeService;


@Controller("goodslikeController")
@RequestMapping(value="/goods")
public class GoodslikeController {
	
	@Autowired
	private GoodslikeService goodslikeService;
	
	public String communityDetail(@RequestParam int idx, Model model,HttpServletRequest request,HttpServletResponse response, HttpSession session){
		Map<String,Object> resultMap = null;
	    Map<String,Object> idxMap = new HashMap<String, Object>();
	    int bbsidx = idx;
	    int useridx = 0;
	 
	    try {
	        Map<String,Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");
	        useridx = Integer.parseInt(userInfo.get("idx").toString());
	        
	            /* 생략 */
	        resultMap = goodslikeService.communityDetail(bbsidx); // 게시판 상세정보 가져옴
	        idxMap.put("bbsidx", bbsidx);
	        idxMap.put("useridx", useridx);
	 
	        Map<String,Object> likecheckMap = service.likecheck(idxMap);
	        //like 테이블 에서 사용자가 해당 게시글에 대해서 좋아요를 눌렀는지 확인
	        if(likecheckMap == null) {
	//사용자가 좋아요를 한번도 누른적이 없으면 
	//like테이블에 데이터가 없으므로 null반환
	            model.addAttribute("likecheck",0);
	        }
	        else {
	            model.addAttribute("likecheck",likecheckMap.get("likecheck"));
	        }
	 
	        model.addAttribute("likecnt",resultMap.get("likecnt"));
	model.addAttribute("bbsidx",bbsidx);
	 model.addAttribute("useridx",useridx);
	                /* 생략 */
	    } catch (Exception e) {
	        logger.debug(e.getMessage());
	    }
	    return "communityDetail";
	}

}
