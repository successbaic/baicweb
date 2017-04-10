package com.macrosoft.icms.commAjax.action;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.macrosoft.icms.system.SysSystem;

public class GetDjjgLevel {
	public String getDjjgLevel(HttpServletRequest request, HttpServletResponse response) {
		String code = request.getParameter("code");
		SysSystem icms = (SysSystem)request.getSession().getServletContext().getAttribute("icms");
		try {
			return icms.getSysRemark("REGORG", code);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "";
		
		
	}
}
