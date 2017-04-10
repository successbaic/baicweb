package com.macrosoft.icms.commAjax;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.macrosoft.icms.commAjax.action.CreateTreesAction;
import com.macrosoft.icms.commAjax.action.DjhCheckAction;
import com.macrosoft.icms.commAjax.action.GetDjjgLevel;
import com.macrosoft.icms.commAjax.action.GetNameFromApprnoAction;
import com.macrosoft.icms.commAjax.action.ImageAction;
import com.macrosoft.icms.commAjax.action.TqdwAction;
import com.macrosoft.icms.commAjax.action.TzCheckAction;
import com.macrosoft.icms.commAjax.action.ValidImageAction;
import com.macrosoft.icms.util.BaseAction;

public class ControlAction extends BaseAction {

	/**
	 * action 控制器 by vincent on 2014.8.6
	 */
	private static final long serialVersionUID = 3593707486140288966L;

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("GBK");
		response.setContentType("text/html;charset=GBK");
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/") + 1, uri
				.lastIndexOf("."));
		String method = request.getParameter("method");
		String action = request.getParameter("action");
		if (path.equals("imageAction")) {
			BufferedImage bufferImage = new ImageAction().createImage(request);
			// 禁止图像缓存。
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0);
			response.setContentType("image/jpeg");
			// 将图像输出到Servlet输出流中。
			ServletOutputStream sos = response.getOutputStream();
			ImageIO.write(bufferImage, "jpeg", sos);
			sos.close();

		} else if (path.equals("validateImageAction")) {
			String isSuccess = new ValidImageAction().validateImage(request);
			PrintWriter out = response.getWriter();
			out.print(isSuccess);

		} else if (path.equals("createTreesAction")) {
			PrintWriter out = response.getWriter();
			out.print(CreateTreesAction.createTrees(request));
			out.flush();
			out.close();
		}else if(path.equals("tqdw")){
			PrintWriter out = response.getWriter();
			out.print(new TqdwAction().tqdw(request,response));
			out.flush();
			out.close();
			
		}else if(path.equals("tzrCheck")){
			PrintWriter out = response.getWriter();
			out.print(new TzCheckAction().tzCheck(request,response));
			out.flush();
			out.close();
			
		}else if(path.equals("djhCheck")){
			String OPENO = URLDecoder.decode(request
					.getParameter("OPENO"), "GBK");
			PrintWriter out = response.getWriter();
			out.print(new DjhCheckAction().djhCheck(OPENO));
			out.flush();
			out.close();
			
		}else if(path.equals("getDjjgLevel")){
			PrintWriter out = response.getWriter();
			out.print(new GetDjjgLevel().getDjjgLevel(request,response));
			out.flush();
			out.close();
			
		}else if(path.equals("getNameFromAPPRNO")){//根据名称通知书文号得到名称
			PrintWriter out = response.getWriter();
			String apprno = request.getParameter("APPRNO");
			out.print(new GetNameFromApprnoAction().getNameFromApprno(apprno));
			out.flush();
			out.close();
			
		}
	}

}
