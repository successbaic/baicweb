package com.macrosoft.icms.commAjax.action;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import com.macrosoft.icms.util.BaseAction;
import com.macrosoft.icms.util.GlobalAttr;
import com.macrosoft.icms.util.ImageUtil;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;


public class ImageAction{
	/**
	 * 
	 */
	
	public BufferedImage createImage(HttpServletRequest request){
		Map<String,BufferedImage> map = ImageUtil.getImage();
		//获取验证码图片上的字符
		String key = map.keySet().iterator().next();
		//写入Session
		HttpSession session = request.getSession();
		session.removeAttribute(GlobalAttr.IMAGE_CODE);
		session.setAttribute(GlobalAttr.IMAGE_CODE, key);
		//获取验证码图片对象
		BufferedImage image = map.get(key);
		//将图片转换成imageStream
//		try{
//			ByteArrayOutputStream bos = new ByteArrayOutputStream();
//			JPEGImageEncoder encode = JPEGCodec.createJPEGEncoder(bos);
//			encode.encode(image);
//			imageStream = new ByteArrayInputStream(bos.toByteArray());
//		}catch(Exception e){
//			e.printStackTrace();
//		}
		return image;
	}
}
