package com.macrosoft.icms.system;

import com.macrosoft.icms.util.Constants;


public class StepShow {
	public  String  getStep(String num, String lx, String OPENO) {	
		//System.out.println("lx="+lx+",num="+num);
		if(lx.equals("520")){ // 广告发布登记
			return getStepByThree(num,  lx,  OPENO);
		}else{
		String istep1 = Constants.PROJECT_NAME+"images/ly/step1_a.png";
		String istep2 = Constants.PROJECT_NAME+"images/ly/step2_a.png";
		String istep3 = Constants.PROJECT_NAME+"images/ly/step3_a.png";
		String istep4 = Constants.PROJECT_NAME+"images/ly/step4_a.png";
		String ustep1 = Constants.PROJECT_NAME+"qysl_select.jsp";
		if(lx.equals("220")){
			ustep1=Constants.PROJECT_NAME+"gtsl_select.jsp";
		}else if(lx.equals("230") || lx.equals("240") || lx.equals("250")){
			ustep1=Constants.PROJECT_NAME+"gtbg_select.jsp";
		}else if(lx.equals("320")){
			ustep1=Constants.PROJECT_NAME+"nmsl_select.jsp";
		}else if(lx.equals("130") 
				|| lx.equals("330") 
				|| lx.equals("140") 
				|| lx.equals("340") 
				|| lx.equals("150") 
				|| lx.equals("350")){
			ustep1="qybg_select.jsp";			
		}else if("930".equals(lx) || "950".equals(lx)){
			ustep1=Constants.PROJECT_NAME+"ggdj/ggdj_select.jsp";
		}else if("920".equals(lx)) {
			ustep1=Constants.PROJECT_NAME+"ggdj/ggdj_tbxx.jsp";
		}
		String ustep2 = Constants.PROJECT_NAME+"wsdj_tbxx.jsp";
		String ustep3 = Constants.PROJECT_NAME+"qydj_control.jsp";
		String ustep4 = Constants.PROJECT_NAME+"wsdj_dotj.jsp";
		if(lx.equals("420"))
		{
			istep1 = Constants.PROJECT_NAME+"images/ly/step1_a.png";
			ustep1 = Constants.PROJECT_NAME+"gqdj/gqsl_select.jsp";
			ustep2 = Constants.PROJECT_NAME+"gqdj/wsdj_gqdj_tbxx.jsp";
			ustep3 = Constants.PROJECT_NAME+"gqdj/gqdj_control.jsp";
			ustep4 = Constants.PROJECT_NAME+"gqdj/wsdj_dotj.jsp";
		}
		else if(lx.equals("430")||lx.equals("450")||lx.equals("481"))
		{	
			
			if(lx.equals("430")){istep1 = Constants.PROJECT_NAME+"images/ly/step1_a.png";}
			if(lx.equals("450")){istep1 = Constants.PROJECT_NAME+"images/ly/step1_a.png";}
			if(lx.equals("481")){istep1 = Constants.PROJECT_NAME+"images/ly/step1_a.png";}
			ustep1=Constants.PROJECT_NAME+"gqdj/gqbg_select.jsp";
			ustep2 = Constants.PROJECT_NAME+"gqdj/wsdj_gqdj_tbxx.jsp";
			ustep3 = Constants.PROJECT_NAME+"gqdj/gqdj_control.jsp";
			ustep4 = Constants.PROJECT_NAME+"gqdj/wsdj_dotj.jsp";
		}else if(lx.equals("530")){
			istep1 = Constants.PROJECT_NAME+"images/ly/step1_a.png";
			ustep1 = Constants.PROJECT_NAME+"hwgg/hwgg_gginfo.jsp";
			ustep2 = Constants.PROJECT_NAME+"hwgg/hwgg_xgcl.jsp";
			ustep3 = Constants.PROJECT_NAME+"hwgg/hwgg_control.jsp";
			ustep4 = Constants.PROJECT_NAME+"hwgg/hwgg_dotj.jsp";
		}else if(lx.equals("6120") || lx.equals("6130") ||lx.equals("6150")){
			istep1 = Constants.PROJECT_NAME+"images/ly/step1_a.png";
			if(lx.equals("6120")){
			ustep1 = Constants.PROJECT_NAME+"htgl/htgl_qyinfo.jsp";
			}else{
				ustep1 = Constants.PROJECT_NAME+"htgl/htgl_dcdyinfo.jsp";
			}
			ustep2 = Constants.PROJECT_NAME+"htgl/dcdy_xgcl.jsp";
			ustep3 = Constants.PROJECT_NAME+"htgl/dcdy_control.jsp";
			ustep4 = Constants.PROJECT_NAME+"htgl/dcdy_dotj.jsp";
		}else if(lx.equals("6220") || lx.equals("6230") ||lx.equals("6250")){
			istep1 = Constants.PROJECT_NAME+"images/ly/step1_a.png";
			if(lx.equals("6220")){
			ustep1 = Constants.PROJECT_NAME+"htgl/htgl_gtinfo.jsp";
			}else{
				ustep1 = Constants.PROJECT_NAME+"htgl/htgl_dcdyinfo.jsp";
			}
			ustep2 = Constants.PROJECT_NAME+"htgl/dcdy_xgcl_gt.jsp";
			ustep3 = Constants.PROJECT_NAME+"htgl/dcdy_control_gt.jsp";
			ustep4 = Constants.PROJECT_NAME+"htgl/dcdy_dotj.jsp";
		}else if(lx.equals("6320") || lx.equals("6330") ||lx.equals("6350")){
			istep1 = Constants.PROJECT_NAME+"images/ly/step1_a.png";
			if(lx.equals("6320")){
			ustep1 = Constants.PROJECT_NAME+"htgl/htgl_nminfo.jsp";
			}else{
				ustep1 = Constants.PROJECT_NAME+"htgl/htgl_dcdyinfo.jsp";
			}
			ustep2 = Constants.PROJECT_NAME+"htgl/dcdy_xgcl_nm.jsp";
			ustep3 = Constants.PROJECT_NAME+"htgl/dcdy_control_nm.jsp";
			ustep4 = Constants.PROJECT_NAME+"htgl/dcdy_dotj.jsp";
		}
		if(lx.equals("010")){
			ustep1=Constants.PROJECT_NAME+"mcgl/mcgl_tbxx.jsp";
			ustep2 = Constants.PROJECT_NAME+"mcgl/mcgl_mccc.jsp";
			ustep3 = Constants.PROJECT_NAME+"mcgl/mcgl_control.jsp";
			ustep4 = Constants.PROJECT_NAME+"mcgl/mcgl_dotj.jsp";
		}else if(lx.equals("011")){
			ustep1=Constants.PROJECT_NAME+"mcgl/mcbg_select.jsp";
			ustep2 = Constants.PROJECT_NAME+"mcgl/mcbg_clsm.jsp";
			ustep3 = Constants.PROJECT_NAME+"mcgl/mcbg_control.jsp";
			ustep4 = Constants.PROJECT_NAME+"mcgl/mcgl_dotj.jsp";
		}else if(lx.equals("012")){
			ustep1=Constants.PROJECT_NAME+"mcgl/mcbg_select.jsp";
			ustep2 = Constants.PROJECT_NAME+"mcgl/mcbg_clsm.jsp";
			ustep3 = Constants.PROJECT_NAME+"mcgl/mcbg_control.jsp";
			ustep4 = Constants.PROJECT_NAME+"mcgl/mcgl_dotj.jsp";
		}else if(lx.equals("013")){
			ustep1=Constants.PROJECT_NAME+"mcgl/qymcbg_select.jsp";
			ustep2 = Constants.PROJECT_NAME+"mcgl/mcbg_clsm.jsp";
			ustep3 = Constants.PROJECT_NAME+"mcgl/mcbg_control.jsp";
			ustep4 = Constants.PROJECT_NAME+"mcgl/mcgl_dotj.jsp";
		}else if("930".equals(lx)){ // 广告发布变更
			ustep2 = Constants.PROJECT_NAME+"ggdj/ggdj_tbxx_bgzx.jsp";
			ustep3 = Constants.PROJECT_NAME+"ggdj/ggdj_control.jsp";
			ustep4 = Constants.PROJECT_NAME+"ggdj/ggdj_dotj.jsp";
		}else if("950".equals(lx)){// 广告发布注销
			ustep2 = Constants.PROJECT_NAME+"ggdj/ggdj_tbxx_bgzx.jsp";
			ustep3 = Constants.PROJECT_NAME+"ggdj/ggdj_control.jsp";
			ustep4 = Constants.PROJECT_NAME+"ggdj/ggdj_dotj.jsp";
		}else if("920".equals(lx)){// 广告设立申请
			ustep2 = Constants.PROJECT_NAME+"ggdj/ggdj_slxx.jsp";
			ustep3 = Constants.PROJECT_NAME+"ggdj/ggdj_control.jsp";
			ustep4 = Constants.PROJECT_NAME+"ggdj/ggdj_dotj.jsp";
		}
		
		if (num.equals("1")) {
			istep1 = Constants.PROJECT_NAME+"images/ly/step1_b.png";
		} else if (num.equals("2")) {
			istep2 = Constants.PROJECT_NAME+"images/ly/step2_b.png";
		} else if (num.equals("3")) {
			istep3 = Constants.PROJECT_NAME+"images/ly/step3_b.png";
		} else if (num.equals("4")) {
			istep4 = Constants.PROJECT_NAME+"images/ly/step4_b.png";
		}

		String vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要设立<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的企业类型";
		if (lx.equals("130")) {
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请录入要变更<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的企业信息";			
		} else if (lx.equals("150")) {
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请录入要注销<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的企业信息";
		} else if (lx.equals("140")) {
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请录入要备案<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的企业信息";
		} else if (lx.equals("220")) {
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要设立<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的个体户类型";
		} else if (lx.equals("230")) {
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请录入要变更<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的个体户信息";
		} else if (lx.equals("250")) {
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请录入要注销<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的个体户信息";
		} else if (lx.equals("320")) {
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要设立<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的合作社类型";
		} else if (lx.equals("330")) {
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请录入要变更<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的合作社信息";
		} else if (lx.equals("350")) {
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请录入要注销<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的合作社信息";
		} else if(lx.equals("010")){
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;需要提交的材<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;料及相关说明";
		} else if(lx.equals("011")){
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请录入要调整<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的名称信息";
		} else if(lx.equals("012")){
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请录入要延期<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的名称信息";
		}else if(lx.equals("013")){
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请录入要变更<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的名称信息";
		}else if(lx.equals("420")){
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要设立<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的股权信息";
		}else if(lx.equals("430")){
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要变更<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的股权信息";
		}else if(lx.equals("450")){
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要注销<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的股权信息";
		}else if(lx.equals("481")){
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要撤销<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的股权信息";
		}else if(lx.equals("530")){
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要变更<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的广告信息";
		}else if(lx.equals("6120")){
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要设立<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的抵押信息";
		}else if(lx.equals("6130")){
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要变更<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的抵押信息";
		}else if(lx.equals("6150")){
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要注销<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的抵押信息";
		}else if(lx.equals("6220")){
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要设立<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的抵押信息";
		}else if(lx.equals("6230")){
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要变更<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的抵押信息";
		}else if(lx.equals("6250")){
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要注销<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的抵押信息";
		}else if(lx.equals("6320")){
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要设立<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的抵押信息";
		}else if(lx.equals("6330")){
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要变更<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的抵押信息";
		}else if(lx.equals("6350")){
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要注销<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的抵押信息";
		}else if("930".equals(lx)){
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择变更的<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;广告发布信息";
		}else if("950".equals(lx)){
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择注销的<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;广告发布信息";
		}else if("920".equals(lx)){
			vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;需要提交的材<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;料及相关说明";		

		}
		String vstep2 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;需要提交的材<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;料及相关说明";
		if(lx.equals("010")){
			vstep2 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名称预先查重";
		}
		// 广告发布登记申请
		if("920".equals(lx)){
			vstep2 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录入许可证号";
		}
		
		String vstep3 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;填写相关材料";
		//String vstep4 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;信息提交至<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;工商局预审";
		String vstep4 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;提交审批";
		if(OPENO.equals("")){			
			ustep3="";ustep4="";
			if(num.equals("1")){
				ustep2="";
			}
		}
		ustep1="onclick=\"window.location.href='"+ustep1+"'\"";		
		if(!ustep2.equals("")){
			ustep2="onclick=\"window.location.href='"+ustep2+"'\"";
		}
		if(!ustep3.equals("")){
			ustep3="onclick=\"window.location.href='"+ustep3+"'\"";
		}
		if(!ustep4.equals("")){
			ustep4="onclick=\"window.location.href='"+ustep4+"'\"";
		}
		StringBuffer sbf = new StringBuffer();
		sbf.append("<table style='background-image:url("+Constants.PROJECT_NAME+"images/ly/step_line.jpg);background-repeat:repeat-x;' height='67px'><tr><td colspan='7' height='6px'></td></tr><tr>");
		sbf.append("<td "+ustep1+" style='background-image:url("
						+ istep1
						+ "); background-repeat:no-repeat;cursor:pointer' width='172px' height='55px'><font color='#FFFFFF' style='font-size:16px'><strong>"
						+ vstep1 + "</strong></font></td>");
		sbf.append("<td><img src='"+Constants.PROJECT_NAME+"images/ly/arrow.png'></td>");
		sbf.append("<td "+ustep2+" style='background-image:url("
						+ istep2
						+ "); background-repeat:no-repeat;cursor:pointer' width='172px'><font color='#FFFFFF' style='font-size:16px'><strong>"
						+ vstep2 + "</strong></font></td>");
		sbf.append("<td><img src='"+Constants.PROJECT_NAME+"images/ly/arrow.png'></td>");
		sbf.append("<td "+ustep3+" style='background-image:url("
						+ istep3
						+ "); background-repeat:no-repeat;cursor:pointer' width='172px'><font color='#FFFFFF' style='font-size:16px'><strong>"
						+ vstep3 + "</strong></font></td>");
		sbf.append("<td><img src='"+Constants.PROJECT_NAME+"images/ly/arrow.png'></td>");
		sbf.append("<td "+ustep4+" style='background-image:url("
						+ istep4
						+ "); background-repeat:no-repeat;cursor:pointer' width='172px'><font color='#FFFFFF' style='font-size:16px'><strong>"
						+ vstep4 + "</strong></font></td>");
		sbf.append("</tr><tr><td colspan='7' height='6px'></td></tr></table>");
		return sbf.toString();
		}		
	}
	public  String  getStep(String num, String lx, String OPENO,boolean isSanZheng) {	
		//System.out.println("lx="+lx+",num="+num);
		if(lx.equals("520")){
			return getStepByThree(num,  lx,  OPENO);
		}else{
			String istep1 = Constants.PROJECT_NAME+"images/ly/step1_a.png";
			String istep2 = Constants.PROJECT_NAME+"images/ly/step2_a.png";
			String istep3 = Constants.PROJECT_NAME+"images/ly/step3_a.png";
			String istep4 = Constants.PROJECT_NAME+"images/ly/step4_a.png";
			String ustep1 = Constants.PROJECT_NAME+"qysl_select.jsp";
			if(lx.equals("220")){
				ustep1=Constants.PROJECT_NAME+"gtsl_select.jsp";
			}else if(lx.equals("230") || lx.equals("240") || lx.equals("250")){
				ustep1=Constants.PROJECT_NAME+"gtbg_select.jsp";
			}else if(lx.equals("320")){
				ustep1=Constants.PROJECT_NAME+"nmsl_select.jsp";
			}else if(lx.equals("130") 
					|| lx.equals("330") 
					|| lx.equals("140") 
					|| lx.equals("340") 
					|| lx.equals("150") 
					|| lx.equals("350")){
				ustep1="qybg_select.jsp";			
			}
			String ustep2 = Constants.PROJECT_NAME+"wsdj_tbxx.jsp";
			String ustep3 = Constants.PROJECT_NAME+"qydj_control.jsp";
			String ustep4 = Constants.PROJECT_NAME+"wsdj_dotj.jsp";
			if(lx.equals("420"))
			{
				istep1 = Constants.PROJECT_NAME+"images/ly/step1_a.png";
				ustep1 = Constants.PROJECT_NAME+"gqdj/gqsl_select.jsp";
				ustep2 = Constants.PROJECT_NAME+"gqdj/wsdj_gqdj_tbxx.jsp";
				ustep3 = Constants.PROJECT_NAME+"gqdj/gqdj_control.jsp";
				ustep4 = Constants.PROJECT_NAME+"gqdj/wsdj_dotj.jsp";
			}
			else if(lx.equals("430")||lx.equals("450")||lx.equals("481"))
			{	
				
				if(lx.equals("430")){istep1 = Constants.PROJECT_NAME+"images/ly/step1_a.png";}
				if(lx.equals("450")){istep1 = Constants.PROJECT_NAME+"images/ly/step1_a.png";}
				if(lx.equals("481")){istep1 = Constants.PROJECT_NAME+"images/ly/step1_a.png";}
				ustep1=Constants.PROJECT_NAME+"gqdj/gqbg_select.jsp";
				ustep2 = Constants.PROJECT_NAME+"gqdj/wsdj_gqdj_tbxx.jsp";
				ustep3 = Constants.PROJECT_NAME+"gqdj/gqdj_control.jsp";
				ustep4 = Constants.PROJECT_NAME+"gqdj/wsdj_dotj.jsp";
			}else if(lx.equals("530")){
				istep1 = Constants.PROJECT_NAME+"images/ly/step1_a.png";
				ustep1 = Constants.PROJECT_NAME+"hwgg/hwgg_gginfo.jsp";
				ustep2 = Constants.PROJECT_NAME+"hwgg/hwgg_xgcl.jsp";
				ustep3 = Constants.PROJECT_NAME+"hwgg/hwgg_control.jsp";
				ustep4 = Constants.PROJECT_NAME+"hwgg/hwgg_dotj.jsp";
			}else if(lx.equals("6120") || lx.equals("6130") ||lx.equals("6150")){
				istep1 = Constants.PROJECT_NAME+"images/ly/step1_a.png";
				if(lx.equals("6120")){
					ustep1 = Constants.PROJECT_NAME+"htgl/htgl_qyinfo.jsp";
				}else{
					ustep1 = Constants.PROJECT_NAME+"htgl/htgl_dcdyinfo.jsp";
				}
				ustep2 = Constants.PROJECT_NAME+"htgl/dcdy_xgcl.jsp";
				ustep3 = Constants.PROJECT_NAME+"htgl/dcdy_control.jsp";
				ustep4 = Constants.PROJECT_NAME+"htgl/dcdy_dotj.jsp";
			}else if(lx.equals("6220") || lx.equals("6230") ||lx.equals("6250")){
				istep1 = Constants.PROJECT_NAME+"images/ly/step1_a.png";
				if(lx.equals("6220")){
					ustep1 = Constants.PROJECT_NAME+"htgl/htgl_gtinfo.jsp";
				}else{
					ustep1 = Constants.PROJECT_NAME+"htgl/htgl_dcdyinfo.jsp";
				}
				ustep2 = Constants.PROJECT_NAME+"htgl/dcdy_xgcl_gt.jsp";
				ustep3 = Constants.PROJECT_NAME+"htgl/dcdy_control_gt.jsp";
				ustep4 = Constants.PROJECT_NAME+"htgl/dcdy_dotj.jsp";
			}else if(lx.equals("6320") || lx.equals("6330") ||lx.equals("6350")){
				istep1 = Constants.PROJECT_NAME+"images/ly/step1_a.png";
				if(lx.equals("6320")){
					ustep1 = Constants.PROJECT_NAME+"htgl/htgl_nminfo.jsp";
				}else{
					ustep1 = Constants.PROJECT_NAME+"htgl/htgl_dcdyinfo.jsp";
				}
				ustep2 = Constants.PROJECT_NAME+"htgl/dcdy_xgcl_nm.jsp";
				ustep3 = Constants.PROJECT_NAME+"htgl/dcdy_control_nm.jsp";
				ustep4 = Constants.PROJECT_NAME+"htgl/dcdy_dotj.jsp";
			}
			if(lx.equals("010")){
				ustep1=Constants.PROJECT_NAME+"mcgl/mcgl_tbxx.jsp";
				ustep2 = Constants.PROJECT_NAME+"mcgl/mcgl_mccc.jsp";
				ustep3 = Constants.PROJECT_NAME+"mcgl/mcgl_control.jsp";
				ustep4 = Constants.PROJECT_NAME+"mcgl/mcgl_dotj.jsp";
			}else if(lx.equals("011")){
				ustep1=Constants.PROJECT_NAME+"mcgl/mcbg_select.jsp";
				ustep2 = Constants.PROJECT_NAME+"mcgl/mcbg_clsm.jsp";
				ustep3 = Constants.PROJECT_NAME+"mcgl/mcbg_control.jsp";
				ustep4 = Constants.PROJECT_NAME+"mcgl/mcgl_dotj.jsp";
			}else if(lx.equals("012")){
				ustep1=Constants.PROJECT_NAME+"mcgl/mcbg_select.jsp";
				ustep2 = Constants.PROJECT_NAME+"mcgl/mcbg_clsm.jsp";
				ustep3 = Constants.PROJECT_NAME+"mcgl/mcbg_control.jsp";
				ustep4 = Constants.PROJECT_NAME+"mcgl/mcgl_dotj.jsp";
			}else if(lx.equals("013")){
				ustep1=Constants.PROJECT_NAME+"mcgl/qymcbg_select.jsp";
				ustep2 = Constants.PROJECT_NAME+"mcgl/mcbg_clsm.jsp";
				ustep3 = Constants.PROJECT_NAME+"mcgl/mcbg_control.jsp";
				ustep4 = Constants.PROJECT_NAME+"mcgl/mcgl_dotj.jsp";
			}
			
			if (num.equals("1")) {
				istep1 = Constants.PROJECT_NAME+"images/ly/step1_b.png";
			} else if (num.equals("2")) {
				istep2 = Constants.PROJECT_NAME+"images/ly/step2_b.png";
			} else if (num.equals("3")) {
				istep3 = Constants.PROJECT_NAME+"images/ly/step3_b.png";
			} else if (num.equals("4")) {
				istep4 = Constants.PROJECT_NAME+"images/ly/step4_b.png";
			}
			
			String vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要设立<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的企业类型";
			if (lx.equals("130")) {
				vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请录入要变更<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的企业信息";			
			} else if (lx.equals("150")) {
				vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请录入要注销<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的企业信息";
			} else if (lx.equals("140")) {
				vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请录入要备案<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的企业信息";
			} else if (lx.equals("220")) {
				vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要设立<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的个体户类型";
			} else if (lx.equals("230")) {
				vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请录入要变更<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的个体户信息";
			} else if (lx.equals("250")) {
				vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请录入要注销<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的个体户信息";
			} else if (lx.equals("320")) {
				vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要设立<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的合作社类型";
			} else if (lx.equals("330")) {
				vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请录入要变更<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的合作社信息";
			} else if (lx.equals("350")) {
				vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请录入要注销<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的合作社信息";
			} else if(lx.equals("010")){
				vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;需要提交的材<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;料及相关说明";
			} else if(lx.equals("011")){
				vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请录入要调整<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的名称信息";
			} else if(lx.equals("012")){
				vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请录入要延期<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的名称信息";
			}else if(lx.equals("013")){
				vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请录入要变更<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的名称信息";
			}else if(lx.equals("420")){
				vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要设立<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的股权信息";
			}else if(lx.equals("430")){
				vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要变更<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的股权信息";
			}else if(lx.equals("450")){
				vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要注销<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的股权信息";
			}else if(lx.equals("481")){
				vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要撤销<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的股权信息";
			}else if(lx.equals("530")){
				vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要变更<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的广告信息";
			}else if(lx.equals("6120")){
				vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要设立<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的抵押信息";
			}else if(lx.equals("6130")){
				vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要变更<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的抵押信息";
			}else if(lx.equals("6150")){
				vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要注销<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的抵押信息";
			}else if(lx.equals("6220")){
				vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要设立<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的抵押信息";
			}else if(lx.equals("6230")){
				vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要变更<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的抵押信息";
			}else if(lx.equals("6250")){
				vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要注销<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的抵押信息";
			}else if(lx.equals("6320")){
				vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要设立<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的抵押信息";
			}else if(lx.equals("6330")){
				vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要变更<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的抵押信息";
			}else if(lx.equals("6350")){
				vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择要注销<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的抵押信息";
			}
			String vstep2 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;需要提交的材<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;料及相关说明";
			if(lx.equals("010")){
				vstep2 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名称预先查重";
			}
			String vstep3 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;填写相关材料";
			String vstep4 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;信息提交至<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;工商局预审";
			if(isSanZheng){
				vstep4 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;提交审批";
			}
			
			if(OPENO.equals("")){			
				ustep3="";ustep4="";
				if(num.equals("1")){
					ustep2="";
				}
			}
			ustep1="onclick=\"window.location.href='"+ustep1+"'\"";		
			if(!ustep2.equals("")){
				ustep2="onclick=\"window.location.href='"+ustep2+"'\"";
			}
			if(!ustep3.equals("")){
				ustep3="onclick=\"window.location.href='"+ustep3+"'\"";
			}
			if(!ustep4.equals("")){
				ustep4="onclick=\"window.location.href='"+ustep4+"'\"";
			}
			StringBuffer sbf = new StringBuffer();
			sbf.append("<table style='background-image:url("+Constants.PROJECT_NAME+"images/ly/step_line.jpg);background-repeat:repeat-x;' height='67px'><tr><td colspan='7' height='6px'></td></tr><tr>");
			sbf.append("<td "+ustep1+" style='background-image:url("
					+ istep1
					+ "); background-repeat:no-repeat;cursor:pointer' width='172px' height='55px'><font color='#FFFFFF' style='font-size:16px'><strong>"
					+ vstep1 + "</strong></font></td>");
			sbf.append("<td><img src='"+Constants.PROJECT_NAME+"images/ly/arrow.png'></td>");
			sbf.append("<td "+ustep2+" style='background-image:url("
					+ istep2
					+ "); background-repeat:no-repeat;cursor:pointer' width='172px'><font color='#FFFFFF' style='font-size:16px'><strong>"
					+ vstep2 + "</strong></font></td>");
			sbf.append("<td><img src='"+Constants.PROJECT_NAME+"images/ly/arrow.png'></td>");
			sbf.append("<td "+ustep3+" style='background-image:url("
					+ istep3
					+ "); background-repeat:no-repeat;cursor:pointer' width='172px'><font color='#FFFFFF' style='font-size:16px'><strong>"
					+ vstep3 + "</strong></font></td>");
			sbf.append("<td><img src='"+Constants.PROJECT_NAME+"images/ly/arrow.png'></td>");
			sbf.append("<td "+ustep4+" style='background-image:url("
					+ istep4
					+ "); background-repeat:no-repeat;cursor:pointer' width='172px'><font color='#FFFFFF' style='font-size:16px'><strong>"
					+ vstep4 + "</strong></font></td>");
			sbf.append("</tr><tr><td colspan='7' height='6px'></td></tr></table>");
			return sbf.toString();
		}		
	}
	
	public String getStepByThree(String num, String lx, String OPENO) {
		StringBuffer sbf = new StringBuffer();
		String istep1 = Constants.PROJECT_NAME+"images/ly/step1_a.png";
		String istep2 = Constants.PROJECT_NAME+"images/ly/step2_a.png";
		String istep3 = Constants.PROJECT_NAME+"images/ly/step3_a.png";
		
		
		String ustep1; // 第一步url	
		String ustep2; // 第二步url
		String ustep3; // 第三步url
		
		// 广告发布登记
		if ("920".equals(lx)) {
			ustep1 = Constants.PROJECT_NAME+"ggdj/ggdj_tbxx.jsp";			
			ustep2 = Constants.PROJECT_NAME+"ggdj/ggdj_control.jsp";
			ustep3 = Constants.PROJECT_NAME+"ggdj/ggdj_dotj.jsp";
		} else {
			ustep1 = Constants.PROJECT_NAME+"hwgg/hwgg_xgcl.jsp";			
			ustep2 = Constants.PROJECT_NAME+"hwgg/hwgg_control.jsp";
			ustep3 = Constants.PROJECT_NAME+"hwgg/hwgg_dotj.jsp";	
		}
		
		if (num.equals("1")) {
			istep1 = Constants.PROJECT_NAME+"images/ly/step1_b.png";
		} else if (num.equals("2")) {
			istep2 = Constants.PROJECT_NAME+"images/ly/step2_b.png";
		} else if (num.equals("3")) {
			istep3 = Constants.PROJECT_NAME+"images/ly/step3_b.png";
		}

		String vstep1 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;需要提交的材<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;料及相关说明";		
		String vstep2 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;填写相关材料";
		String vstep3 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;信息提交至<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;工商局预审";
		
		if(OPENO.equals("")){			
			ustep3="";
			if(num.equals("1")){
				ustep2="";
			}
		}
		ustep1="onclick=\"window.location.href='"+ustep1+"'\"";		
		if(!ustep2.equals("")){
			ustep2="onclick=\"window.location.href='"+ustep2+"'\"";
		}
		if(!ustep3.equals("")){
			ustep3="onclick=\"window.location.href='"+ustep3+"'\"";
		}		
		
		sbf.append("<table style='background-image:url("+Constants.PROJECT_NAME+"images/ly/step_line.jpg);background-repeat:repeat-x;' height='67px'><tr><td colspan='7' height='6px'></td></tr><tr>");
		sbf.append("<td "+ustep1+" style='background-image:url("
						+ istep1
						+ "); background-repeat:no-repeat;cursor:pointer' width='172px' height='55px'><font color='#FFFFFF' style='font-size:16px'><strong>"
						+ vstep1 + "</strong></font></td>");
		sbf.append("<td><img src='"+Constants.PROJECT_NAME+"images/ly/arrow.png'></td>");
		sbf.append("<td "+ustep2+" style='background-image:url("
						+ istep2
						+ "); background-repeat:no-repeat;cursor:pointer' width='172px'><font color='#FFFFFF' style='font-size:16px'><strong>"
						+ vstep2 + "</strong></font></td>");
		sbf.append("<td><img src='"+Constants.PROJECT_NAME+"images/ly/arrow.png'></td>");
		sbf.append("<td "+ustep3+" style='background-image:url("
						+ istep3
						+ "); background-repeat:no-repeat;cursor:pointer' width='172px'><font color='#FFFFFF' style='font-size:16px'><strong>"
						+ vstep3 + "</strong></font></td>");		
		sbf.append("</tr><tr><td colspan='7' height='6px'></td></tr></table>");
		return sbf.toString();
	}
}
