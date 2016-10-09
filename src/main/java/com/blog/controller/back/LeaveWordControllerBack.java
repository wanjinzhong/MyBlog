package com.blog.controller.back;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blog.bean.LeaveWord;
import com.blog.bean.LeaveWordFull;
import com.blog.service.LeaveWordService;

@Controller
public class LeaveWordControllerBack {
	private static final int PAGE_SIZE = 10;
	@Resource
	private LeaveWordService leaveWordService;
	@RequestMapping(value="unreadleaveword.do")
	public String unreadLeaveWord(HttpServletRequest request, Integer curPage, Model model){
		curPage = getCurPage(curPage, model);
		int index = (curPage - 1) * PAGE_SIZE;
		Map<String, Integer> map = new HashMap<String, Integer>();
		int bloggerId = Integer.parseInt(request.getSession().getAttribute("bloggerId_back").toString());
		map.put("id", bloggerId);
		map.put("index", index);
		map.put("pageSize",PAGE_SIZE);
		int count = leaveWordService.getCountUnread(bloggerId);
		model.addAttribute("count", count);
		List<LeaveWordFull> list = leaveWordService.getByBloggerIdUnread(map);
		model.addAttribute("curPage", curPage);
		model.addAttribute("leavewords", list);
		return "unreadleaveword";
	}
	@RequestMapping(value="allleaveword.do")
	public String allLeaveWord(HttpServletRequest request, Integer curPage, Model model){
		curPage = getCurPage(curPage, model);
		int index = (curPage - 1) * PAGE_SIZE;
		Map<String, Integer> map = new HashMap<String, Integer>();
		int bloggerId = Integer.parseInt(request.getSession().getAttribute("bloggerId_back").toString());
		map.put("id", bloggerId);
		map.put("index", index);
		map.put("pageSize",PAGE_SIZE);
		int count = leaveWordService.getCount(bloggerId);
		List<LeaveWordFull> list = leaveWordService.getByBloggerId(map);
		formatContent(list);
		model.addAttribute("leavewords", list);
		model.addAttribute("count", count);
		model.addAttribute("curPage", curPage);
		return "allleaveword";
	}
	public void formatContent(List<LeaveWordFull> list) {
		for (int i = 0; i < list.size(); i ++){
			if(list.get(i).getContent().length() > 47)
				list.get(i).setContent(list.get(i).getContent().substring(0, 47) + "...");
		}
	}
	public Integer getCurPage(Integer curPage, Model model) {
		if (curPage == null || curPage <= 0)
			curPage = 1;
		model.addAttribute("curPage", curPage);
		return curPage;
	}
	@RequestMapping(value="leaveworddetail.do")
	public String leaveworddetail(Integer leaveWordId, HttpServletRequest request, Model model){
		LeaveWordFull leaveWord = leaveWordService.getFullByPrimaryKey(leaveWordId);
		System.out.println("leave:" + leaveWord);
		model.addAttribute("leaveword", leaveWord);
		readed(leaveWordId);
		return "leaveworddetail";
	}
	@RequestMapping(value="leavewordignore.do")
	public String leavewordignore(Integer leaveWordId, Integer curPage){
		readed(leaveWordId);
		return "redirect:unreadleaveword.do?curPage=" + curPage;
	}
	public void readed(Integer leaveWordId) {
		LeaveWord lw = new LeaveWord();
		lw.setLeaveWordId(leaveWordId);
		lw.setIsNew(0);
		leaveWordService.updateSelective(lw);
	}
	@RequestMapping(value="deleteleaveword.do")
	public String deleteleaveword(Integer leaveWordId){
		leaveWordService.deleteById(leaveWordId);
		return "redirect:allleaveword.do";
	}
}
