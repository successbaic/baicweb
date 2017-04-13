package com.macrosoft.icms.wei;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.macrosoft.icms.qydj.QYDJ_JBXX_SQ;

public class QydjJbxxSqAction {

	public void Save(HttpServletRequest request,HttpServletResponse response) throws IOException, SQLException{
		String entname=request.getParameter("ENTNAME");
		System.out.println("0---"+entname);
		
		PrintWriter out = response.getWriter();
		QYDJ_JBXX_SQ jbxx=new QYDJ_JBXX_SQ();
		ServletUtil.request2Bean(request, jbxx);
		System.out.println("1--"+jbxx.getENTNAME());
		
		jbxx.setOPENO("1");
		//jbxx.doAdd();
	}
}
