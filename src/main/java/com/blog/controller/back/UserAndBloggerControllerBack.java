package com.blog.controller.back;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.blog.bean.Blogger;
import com.blog.bean.User;
import com.blog.service.BloggerService;
import com.blog.service.UserService;

@Controller
public class UserAndBloggerControllerBack {
	@Resource
	private BloggerService bloggerService;
	@Resource
	private UserService userService;
	@RequestMapping(value = "info.do")
	public String info(HttpServletRequest request, Model model) {
		int bloggerId = Integer.parseInt(request.getSession().getAttribute("bloggerId_back").toString());
		Blogger blogger = bloggerService.getBloggerById(bloggerId);
		model.addAttribute("blogger", blogger);
		return "info";
	}

	@RequestMapping(value = "infoupdate.do")
	public String indoupdate(HttpServletRequest request, Model model) {
		int bloggerId = Integer.parseInt(request.getSession().getAttribute("bloggerId_back").toString());
		Blogger blogger = bloggerService.getBloggerById(bloggerId);
		model.addAttribute("blogger", blogger);
		return "infoupdate";
	}

	@RequestMapping(value = "saveinfo.do")
	public String saveinfo(@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request) throws Exception {
		Integer userId = Integer.parseInt(request.getParameter("userId"));
		Integer bloggerId = Integer.parseInt(request.getParameter("bloggerId"));
		String userName = request.getParameter("loginName");
		String bloggerName = request.getParameter("bloggerName");
		String realName = request.getParameter("realName");
		String sex = request.getParameter("sex");
		String birthday = request.getParameter("birthday");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		if(!birthday.trim().equals("")){
			date = sdf.parse(birthday);
		}
		int sexInt;
		if (sex.equals("male"))
			sexInt = 1;
		else
			sexInt = 0;
		System.out.println(sexInt);
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String qq = request.getParameter("qq");
		String introduce = request.getParameter("introduce");
		String path = "/userPic/";
		String realPath = "/home/wanjinzhong/userPic/";
		String fileName = file.getOriginalFilename();
		String imageUrl = null;
		if (fileName != null && !fileName.trim().equals("")) {
			String picName =  System.currentTimeMillis()
					+ fileName.substring(fileName.lastIndexOf("."), fileName.length());
			String realUrl = realPath + picName;
			imageUrl = path + picName;
			// 保存
			System.out.println(imageUrl);
			try {
				file.transferTo(new File(realUrl));
			} catch (Exception e) {
				e.printStackTrace();

			}
		}
		Blogger blogger = new Blogger();
		blogger.setBloggerName(bloggerName);
		blogger.setBloggerId(bloggerId);
		blogger.setUserId(userId);
		User user = new User();
		user.setUserId(userId);
		user.setLoginName(userName);
		user.setRealName(realName);
		user.setBirthday(date);
		user.setSex(sexInt);
		user.setTel(tel);
		user.setEmail(email);
		user.setQq(qq);
		user.setIntroduce(introduce);
		user.setImageUrl(imageUrl);
		userService.updateSelective(user);
		bloggerService.updateSelective(blogger);
		return "redirect:info.do";
	}


}
