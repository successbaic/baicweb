package com.macrosoft.icms.commAjax.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.macrosoft.icms.util.GlobalAttr;

public class ValidImageAction{
	/**
	 * 验证码校验
	 * author：vincent
	 * 
	 */

	public String validateImage(HttpServletRequest request){
		String imageCode = request.getParameter("imageCode");
		HttpSession session = request.getSession();
		String sessionCode = (String)session.getAttribute(GlobalAttr.IMAGE_CODE);
		if(imageCode.equalsIgnoreCase(sessionCode)){
			session.removeAttribute(GlobalAttr.IMAGE_CODE);
			return "success";
		}else{
			return "fail";
		}
	}
}
