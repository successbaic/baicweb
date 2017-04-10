package com.macrosoft.icms.szcp;

import com.macrosoft.icms.szcp.dao.SZCP_SQ_HT_XWGFDao;
import com.macrosoft.icms.szcp.dao.SZCP_SQ_JYXYDao;

/**
 * 
* @Title: CreateHeaderUtil.java 
* @Package com.macrosoft.icms.szcp 
* @Description: 生成导航头
* @author yuchengjian 
* @date 2015-5-8 下午03:23:08 
* @version V1.0
 */
public class CreateHeaderUtil {
	
	
	
	public String createHeader_view(String regno,String evalYear,String cerno,String flag,String ENT_NAME) {
		StringBuffer sb = new StringBuffer();
		sb.append("<table border='0' width='100%' align='center'><tr>");
		if("1".equals(flag)) {
			SZCP_SQ_JBXX jbxx = new SZCP_SQ_JBXX();
			jbxx.setENT_NAME(ENT_NAME);
			jbxx.setEVAL_YEAR(evalYear);
			jbxx.setREG_NO(regno);
			boolean jbxxf = jbxx.queryHistoryDataTab(jbxx);
			
			SZCP_SQ_JYGL jygl = new SZCP_SQ_JYGL();
			jygl.setEVAL_YEAR(evalYear);
			jygl.setREG_NO(regno);
			boolean jyglf = jygl.queryHistoryData(jygl);
			
			SZCP_SQ_HT_XWGFDao dao = new SZCP_SQ_HT_XWGFDao();
			boolean htglf = dao.isEmptySZCP_SQ_HT_XWGF(regno,evalYear);
			
			SZCP_SQ_LXQK_RATE lxqk = new SZCP_SQ_LXQK_RATE();
			lxqk.setREG_NO(regno);
			lxqk.setEVAL_YEAR(evalYear);
			boolean htlxf = lxqk.queryHistoryDataTab(lxqk);
			
			SZCP_SQ_JYXYDao jyxy = new SZCP_SQ_JYXYDao();
			boolean jyxyf = jyxy.isEmptySZCP_SQ_JYXY(regno, evalYear);
			
			SZCP_SQ_ZRXY shxy = new SZCP_SQ_ZRXY();
			shxy.setREG_NO(regno);
			shxy.setEVAL_YEAR(evalYear);
			boolean shxyf = shxy.queryHistoryData(shxy);
			
			SZCP_SQ_SHRY shry = new SZCP_SQ_SHRY();
			shry.setREG_NO(regno);
			shry.setEVAL_YEAR(evalYear);
			boolean shryf = shry.queryHistoryData(shry);
			
/*			SZCP_SQ_XGZS xgzs = new SZCP_SQ_XGZS();
			xgzs.setREG_NO(regno);
			xgzs.setEVAL_YEAR(evalYear);
			boolean xgzsf = xgzs.queryHistoryData(xgzs);*/
			//aa
			if(jbxxf){
				sb.append("<td class = 'jbxx'><a href = 'szcp_sq_jbxx_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl'><a href = 'szcp_sq_jygl_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营管理</td>");
				if(jyglf){
					sb.append("<td class = 'htgl'><a href = 'szcp_sq_htgl_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同管理</td>");
					if(htglf){
						sb.append("<td class = 'htlx'><a href = 'szcp_sq_lxqk_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同履行</td>");
						if(htlxf){
							sb.append("<td class = 'jyxy'><a href = 'szcp_sq_jyxy_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营效益</td>");
							if(!jyxyf){
								sb.append("<td class = 'shxy'><a href = 'szcp_sq_zrxy_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会信用</td>");
								if(shxyf){
									sb.append("<td class = 'shry'><a href = 'szcp_sq_shry_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会荣誉</td>");
									if(shryf){
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}else{
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}
								}else{
									sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
									sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
								}
							}else{
								sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
								sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
								sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
							}
						}else{
							sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
							sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
							sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
							sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
						}
					}else{
						sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
						sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
						sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
						sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
						sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
					}
				}else{
					sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
					sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
					sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
					sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
					sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
					sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
				}
			}else{
				sb.append("<td class = 'jbxx' id='jbxx'><a href = 'szcp_sq_jbxx_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl' id='jygl'><a href = '#'</a>"+"经营管理</td>");
				sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
				sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
				sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
				sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
				sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
				sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
			}
			

		}else if("2".equals(flag)) {
			SZCP_SQ_JBXX jbxx = new SZCP_SQ_JBXX();
			jbxx.setENT_NAME(ENT_NAME);
			jbxx.setEVAL_YEAR(evalYear);
			jbxx.setREG_NO(regno);
			boolean jbxxf = jbxx.queryHistoryDataTab(jbxx);
			
			SZCP_SQ_JYGL jygl = new SZCP_SQ_JYGL();
			jygl.setEVAL_YEAR(evalYear);
			jygl.setREG_NO(regno);
			boolean jyglf = jygl.queryHistoryData(jygl);
			
			SZCP_SQ_HT_XWGFDao dao = new SZCP_SQ_HT_XWGFDao();
			boolean htglf = dao.isEmptySZCP_SQ_HT_XWGF(regno,evalYear);
			
			SZCP_SQ_LXQK_RATE lxqk = new SZCP_SQ_LXQK_RATE();
			lxqk.setREG_NO(regno);
			lxqk.setEVAL_YEAR(evalYear);
			boolean htlxf = lxqk.queryHistoryDataTab(lxqk);
			
			SZCP_SQ_JYXYDao jyxy = new SZCP_SQ_JYXYDao();
			boolean jyxyf = jyxy.isEmptySZCP_SQ_JYXY(regno, evalYear);
			
			SZCP_SQ_ZRXY shxy = new SZCP_SQ_ZRXY();
			shxy.setREG_NO(regno);
			shxy.setEVAL_YEAR(evalYear);
			boolean shxyf = shxy.queryHistoryData(shxy);
			
			SZCP_SQ_SHRY shry = new SZCP_SQ_SHRY();
			shry.setREG_NO(regno);
			shry.setEVAL_YEAR(evalYear);
			boolean shryf = shry.queryHistoryData(shry);
			
/*			SZCP_SQ_XGZS xgzs = new SZCP_SQ_XGZS();
			xgzs.setREG_NO(regno);
			xgzs.setEVAL_YEAR(evalYear);
			boolean xgzsf = xgzs.queryHistoryData(xgzs);*/
			if(jbxxf){
				sb.append("<td class = 'jbxx'><a href = 'szcp_sq_jbxx_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl'><a href = 'szcp_sq_jygl_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营管理</td>");
				if(jyglf){
					sb.append("<td class = 'htgl'><a href = 'szcp_sq_htgl_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同管理</td>");
					if(htglf){
						sb.append("<td class = 'htlx'><a href = 'szcp_sq_lxqk_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同履行</td>");
						if(htlxf){
							sb.append("<td class = 'jyxy'><a href = 'szcp_sq_jyxy_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营效益</td>");
							if(!jyxyf){
								sb.append("<td class = 'shxy'><a href = 'szcp_sq_zrxy_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会信用</td>");
								if(shxyf){
									sb.append("<td class = 'shry'><a href = 'szcp_sq_shry_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会荣誉</td>");
									if(shryf){
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}else{
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}
								}else{
									sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
									sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
								}
							}else{
								sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
								sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
								sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
							}
						}else{
							sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
							sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
							sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
							sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
						}
					}else{
						sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
						sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
						sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
						sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
						sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
					}
				}else{
					sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
					sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
					sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
					sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
					sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
					sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
				}
			}else{
				sb.append("<td class = 'jbxx' id='jbxx'><a href = 'szcp_sq_jbxx_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl' id='jygl'><a href = '#'</a>"+"经营管理</td>");
				sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
				sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
				sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
				sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
				sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
				sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
			}
		}else if("3".equals(flag)) {
			
			SZCP_SQ_JBXX jbxx = new SZCP_SQ_JBXX();
			jbxx.setENT_NAME(ENT_NAME);
			jbxx.setEVAL_YEAR(evalYear);
			jbxx.setREG_NO(regno);
			boolean jbxxf = jbxx.queryHistoryDataTab(jbxx);
			
			SZCP_SQ_JYGL jygl = new SZCP_SQ_JYGL();
			jygl.setEVAL_YEAR(evalYear);
			jygl.setREG_NO(regno);
			boolean jyglf = jygl.queryHistoryData(jygl);
			
			SZCP_SQ_HT_XWGFDao dao = new SZCP_SQ_HT_XWGFDao();
			boolean htglf = dao.isEmptySZCP_SQ_HT_XWGF(regno,evalYear);
			
			SZCP_SQ_LXQK_RATE lxqk = new SZCP_SQ_LXQK_RATE();
			lxqk.setREG_NO(regno);
			lxqk.setEVAL_YEAR(evalYear);
			boolean htlxf = lxqk.queryHistoryDataTab(lxqk);
			
			SZCP_SQ_JYXYDao jyxy = new SZCP_SQ_JYXYDao();
			boolean jyxyf = jyxy.isEmptySZCP_SQ_JYXY(regno, evalYear);
			
			SZCP_SQ_ZRXY shxy = new SZCP_SQ_ZRXY();
			shxy.setREG_NO(regno);
			shxy.setEVAL_YEAR(evalYear);
			boolean shxyf = shxy.queryHistoryData(shxy);
			
			SZCP_SQ_SHRY shry = new SZCP_SQ_SHRY();
			shry.setREG_NO(regno);
			shry.setEVAL_YEAR(evalYear);
			boolean shryf = shry.queryHistoryData(shry);
			
/*			SZCP_SQ_XGZS xgzs = new SZCP_SQ_XGZS();
			xgzs.setREG_NO(regno);
			xgzs.setEVAL_YEAR(evalYear);
			boolean xgzsf = xgzs.queryHistoryData(xgzs);*/
			//aa
			if(jbxxf){
				sb.append("<td class = 'jbxx'><a href = 'szcp_sq_jbxx_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl'><a href = 'szcp_sq_jygl_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营管理</td>");
				if(jyglf){
					sb.append("<td class = 'htgl'><a href = 'szcp_sq_htgl_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同管理</td>");
					if(htglf){
						sb.append("<td class = 'htlx'><a href = 'szcp_sq_lxqk_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同履行</td>");
						if(htlxf){
							sb.append("<td class = 'jyxy'><a href = 'szcp_sq_jyxy_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营效益</td>");
							if(!jyxyf){
								sb.append("<td class = 'shxy'><a href = 'szcp_sq_zrxy_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会信用</td>");
								if(shxyf){
									sb.append("<td class = 'shry'><a href = 'szcp_sq_shry_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会荣誉</td>");
									if(shryf){
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}else{
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}
								}else{
									sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
									sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
								}
							}else{
								sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
								sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
								sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
							}
						}else{
							sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
							sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
							sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
							sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
						}
					}else{
						sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
						sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
						sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
						sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
						sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
					}
				}else{
					sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
					sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
					sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
					sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
					sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
					sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
				}
			}else{
				sb.append("<td class = 'jbxx' id='jbxx'><a href = 'szcp_sq_jbxx_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl' id='jygl'><a href = '#'</a>"+"经营管理</td>");
				sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
				sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
				sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
				sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
				sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
				sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
			}
		}else if("4".equals(flag)) {
			
			SZCP_SQ_JBXX jbxx = new SZCP_SQ_JBXX();
			jbxx.setENT_NAME(ENT_NAME);
			jbxx.setEVAL_YEAR(evalYear);
			jbxx.setREG_NO(regno);
			boolean jbxxf = jbxx.queryHistoryDataTab(jbxx);
			
			SZCP_SQ_JYGL jygl = new SZCP_SQ_JYGL();
			jygl.setEVAL_YEAR(evalYear);
			jygl.setREG_NO(regno);
			boolean jyglf = jygl.queryHistoryData(jygl);
			
			SZCP_SQ_HT_XWGFDao dao = new SZCP_SQ_HT_XWGFDao();
			boolean htglf = dao.isEmptySZCP_SQ_HT_XWGF(regno,evalYear);
			
			SZCP_SQ_LXQK_RATE lxqk = new SZCP_SQ_LXQK_RATE();
			lxqk.setREG_NO(regno);
			lxqk.setEVAL_YEAR(evalYear);
			boolean htlxf = lxqk.queryHistoryDataTab(lxqk);
			
			SZCP_SQ_JYXYDao jyxy = new SZCP_SQ_JYXYDao();
			boolean jyxyf = jyxy.isEmptySZCP_SQ_JYXY(regno, evalYear);
			
			SZCP_SQ_ZRXY shxy = new SZCP_SQ_ZRXY();
			shxy.setREG_NO(regno);
			shxy.setEVAL_YEAR(evalYear);
			boolean shxyf = shxy.queryHistoryData(shxy);
			
			SZCP_SQ_SHRY shry = new SZCP_SQ_SHRY();
			shry.setREG_NO(regno);
			shry.setEVAL_YEAR(evalYear);
			boolean shryf = shry.queryHistoryData(shry);
			
/*			SZCP_SQ_XGZS xgzs = new SZCP_SQ_XGZS();
			xgzs.setREG_NO(regno);
			xgzs.setEVAL_YEAR(evalYear);
			boolean xgzsf = xgzs.queryHistoryData(xgzs);*/
			//aa
			if(jbxxf){
				sb.append("<td class = 'jbxx'><a href = 'szcp_sq_jbxx_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl'><a href = 'szcp_sq_jygl_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营管理</td>");
				if(jyglf){
					sb.append("<td class = 'htgl'><a href = 'szcp_sq_htgl_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同管理</td>");
					if(htglf){
						sb.append("<td class = 'htlx'><a href = 'szcp_sq_lxqk_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同履行</td>");
						if(htlxf){
							sb.append("<td class = 'jyxy'><a href = 'szcp_sq_jyxy_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营效益</td>");
							if(!jyxyf){
								sb.append("<td class = 'shxy'><a href = 'szcp_sq_zrxy_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会信用</td>");
								if(shxyf){
									sb.append("<td class = 'shry'><a href = 'szcp_sq_shry_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会荣誉</td>");
									if(shryf){
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}else{
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}
								}else{
									sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
									sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
								}
							}else{
								sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
								sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
								sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
							}
						}else{
							sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
							sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
							sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
							sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
						}
					}else{
						sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
						sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
						sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
						sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
						sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
					}
				}else{
					sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
					sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
					sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
					sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
					sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
					sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
				}
			}else{
				sb.append("<td class = 'jbxx' id='jbxx'><a href = 'szcp_sq_jbxx_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl' id='jygl'><a href = '#'</a>"+"经营管理</td>");
				sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
				sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
				sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
				sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
				sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
				sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
			}
			
		}else if("5".equals(flag)) {
			
			SZCP_SQ_JBXX jbxx = new SZCP_SQ_JBXX();
			jbxx.setENT_NAME(ENT_NAME);
			jbxx.setEVAL_YEAR(evalYear);
			jbxx.setREG_NO(regno);
			boolean jbxxf = jbxx.queryHistoryDataTab(jbxx);
			
			SZCP_SQ_JYGL jygl = new SZCP_SQ_JYGL();
			jygl.setEVAL_YEAR(evalYear);
			jygl.setREG_NO(regno);
			boolean jyglf = jygl.queryHistoryData(jygl);
			
			SZCP_SQ_HT_XWGFDao dao = new SZCP_SQ_HT_XWGFDao();
			boolean htglf = dao.isEmptySZCP_SQ_HT_XWGF(regno,evalYear);
			
			SZCP_SQ_LXQK_RATE lxqk = new SZCP_SQ_LXQK_RATE();
			lxqk.setREG_NO(regno);
			lxqk.setEVAL_YEAR(evalYear);
			boolean htlxf = lxqk.queryHistoryDataTab(lxqk);
			
			SZCP_SQ_JYXYDao jyxy = new SZCP_SQ_JYXYDao();
			boolean jyxyf = jyxy.isEmptySZCP_SQ_JYXY(regno, evalYear);
			
			SZCP_SQ_ZRXY shxy = new SZCP_SQ_ZRXY();
			shxy.setREG_NO(regno);
			shxy.setEVAL_YEAR(evalYear);
			boolean shxyf = shxy.queryHistoryData(shxy);
			
			SZCP_SQ_SHRY shry = new SZCP_SQ_SHRY();
			shry.setREG_NO(regno);
			shry.setEVAL_YEAR(evalYear);
			boolean shryf = shry.queryHistoryData(shry);
			
		/*	SZCP_SQ_XGZS xgzs = new SZCP_SQ_XGZS();
			xgzs.setREG_NO(regno);
			xgzs.setEVAL_YEAR(evalYear);
			boolean xgzsf = xgzs.queryHistoryData(xgzs);*/
			//aa
			if(jbxxf){
				sb.append("<td class = 'jbxx'><a href = 'szcp_sq_jbxx_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl'><a href = 'szcp_sq_jygl_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营管理</td>");
				if(jyglf){
					sb.append("<td class = 'htgl'><a href = 'szcp_sq_htgl_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同管理</td>");
					if(htglf){
						sb.append("<td class = 'htlx'><a href = 'szcp_sq_lxqk_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同履行</td>");
						if(htlxf){
							sb.append("<td class = 'jyxy'><a href = 'szcp_sq_jyxy_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营效益</td>");
							if(!jyxyf){
								sb.append("<td class = 'shxy'><a href = 'szcp_sq_zrxy_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会信用</td>");
								if(shxyf){
									sb.append("<td class = 'shry'><a href = 'szcp_sq_shry_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会荣誉</td>");
									if(shryf){
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}else{
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}
								}else{
									sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
									sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
								}
							}else{
								sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
								sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
								sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
							}
						}else{
							sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
							sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
							sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
							sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
						}
					}else{
						sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
						sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
						sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
						sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
						sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
					}
				}else{
					sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
					sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
					sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
					sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
					sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
					sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
				}
			}else{
				sb.append("<td class = 'jbxx' id='jbxx'><a href = 'szcp_sq_jbxx_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl' id='jygl'><a href = '#'</a>"+"经营管理</td>");
				sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
				sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
				sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
				sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
				sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
				sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
			}
		}else if("6".equals(flag)) {
			SZCP_SQ_JBXX jbxx = new SZCP_SQ_JBXX();
			jbxx.setENT_NAME(ENT_NAME);
			jbxx.setEVAL_YEAR(evalYear);
			jbxx.setREG_NO(regno);
			boolean jbxxf = jbxx.queryHistoryDataTab(jbxx);
			
			SZCP_SQ_JYGL jygl = new SZCP_SQ_JYGL();
			jygl.setEVAL_YEAR(evalYear);
			jygl.setREG_NO(regno);
			boolean jyglf = jygl.queryHistoryData(jygl);
			
			SZCP_SQ_HT_XWGFDao dao = new SZCP_SQ_HT_XWGFDao();
			boolean htglf = dao.isEmptySZCP_SQ_HT_XWGF(regno,evalYear);
			
			SZCP_SQ_LXQK_RATE lxqk = new SZCP_SQ_LXQK_RATE();
			lxqk.setREG_NO(regno);
			lxqk.setEVAL_YEAR(evalYear);
			boolean htlxf = lxqk.queryHistoryDataTab(lxqk);
			
			SZCP_SQ_JYXYDao jyxy = new SZCP_SQ_JYXYDao();
			boolean jyxyf = jyxy.isEmptySZCP_SQ_JYXY(regno, evalYear);
			
			SZCP_SQ_ZRXY shxy = new SZCP_SQ_ZRXY();
			shxy.setREG_NO(regno);
			shxy.setEVAL_YEAR(evalYear);
			boolean shxyf = shxy.queryHistoryData(shxy);
			
			SZCP_SQ_SHRY shry = new SZCP_SQ_SHRY();
			shry.setREG_NO(regno);
			shry.setEVAL_YEAR(evalYear);
			boolean shryf = shry.queryHistoryData(shry);
			
			/*SZCP_SQ_XGZS xgzs = new SZCP_SQ_XGZS();
			xgzs.setREG_NO(regno);
			xgzs.setEVAL_YEAR(evalYear);
			boolean xgzsf = xgzs.queryHistoryData(xgzs);*/
			//aa
			if(jbxxf){
				sb.append("<td class = 'jbxx'><a href = 'szcp_sq_jbxx_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl'><a href = 'szcp_sq_jygl_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营管理</td>");
				if(jyglf){
					sb.append("<td class = 'htgl'><a href = 'szcp_sq_htgl_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同管理</td>");
					if(htglf){
						sb.append("<td class = 'htlx'><a href = 'szcp_sq_lxqk_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同履行</td>");
						if(htlxf){
							sb.append("<td class = 'jyxy'><a href = 'szcp_sq_jyxy_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营效益</td>");
							if(!jyxyf){
								sb.append("<td class = 'shxy'><a href = 'szcp_sq_zrxy_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会信用</td>");
								if(shxyf){
									sb.append("<td class = 'shry'><a href = 'szcp_sq_shry_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会荣誉</td>");
									if(shryf){
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}else{
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}
								}else{
									sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
									sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
								}
							}else{
								sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
								sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
								sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
							}
						}else{
							sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
							sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
							sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
							sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
						}
					}else{
						sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
						sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
						sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
						sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
						sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
					}
				}else{
					sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
					sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
					sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
					sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
					sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
					sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
				}
			}else{
				sb.append("<td class = 'jbxx' id='jbxx'><a href = 'szcp_sq_jbxx_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl' id='jygl'><a href = '#'</a>"+"经营管理</td>");
				sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
				sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
				sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
				sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
				sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
				sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
			}
		}else if("7".equals(flag)) {
			SZCP_SQ_JBXX jbxx = new SZCP_SQ_JBXX();
			jbxx.setENT_NAME(ENT_NAME);
			jbxx.setEVAL_YEAR(evalYear);
			jbxx.setREG_NO(regno);
			boolean jbxxf = jbxx.queryHistoryDataTab(jbxx);
			
			SZCP_SQ_JYGL jygl = new SZCP_SQ_JYGL();
			jygl.setEVAL_YEAR(evalYear);
			jygl.setREG_NO(regno);
			boolean jyglf = jygl.queryHistoryData(jygl);
			
			SZCP_SQ_HT_XWGFDao dao = new SZCP_SQ_HT_XWGFDao();
			boolean htglf = dao.isEmptySZCP_SQ_HT_XWGF(regno,evalYear);
			
			SZCP_SQ_LXQK_RATE lxqk = new SZCP_SQ_LXQK_RATE();
			lxqk.setREG_NO(regno);
			lxqk.setEVAL_YEAR(evalYear);
			boolean htlxf = lxqk.queryHistoryDataTab(lxqk);
			
			SZCP_SQ_JYXYDao jyxy = new SZCP_SQ_JYXYDao();
			boolean jyxyf = jyxy.isEmptySZCP_SQ_JYXY(regno, evalYear);
			
			SZCP_SQ_ZRXY shxy = new SZCP_SQ_ZRXY();
			shxy.setREG_NO(regno);
			shxy.setEVAL_YEAR(evalYear);
			boolean shxyf = shxy.queryHistoryData(shxy);
			
			SZCP_SQ_SHRY shry = new SZCP_SQ_SHRY();
			shry.setREG_NO(regno);
			shry.setEVAL_YEAR(evalYear);
			boolean shryf = shry.queryHistoryData(shry);
			
/*			SZCP_SQ_XGZS xgzs = new SZCP_SQ_XGZS();
			xgzs.setREG_NO(regno);
			xgzs.setEVAL_YEAR(evalYear);
			boolean xgzsf = xgzs.queryHistoryData(xgzs);*/
			//aa
			if(jbxxf){
				sb.append("<td class = 'jbxx'><a href = 'szcp_sq_jbxx_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl'><a href = 'szcp_sq_jygl_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营管理</td>");
				if(jyglf){
					sb.append("<td class = 'htgl'><a href = 'szcp_sq_htgl_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同管理</td>");
					if(htglf){
						sb.append("<td class = 'htlx'><a href = 'szcp_sq_lxqk_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同履行</td>");
						if(htlxf){
							sb.append("<td class = 'jyxy'><a href = 'szcp_sq_jyxy_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营效益</td>");
							if(!jyxyf){
								sb.append("<td class = 'shxy'><a href = 'szcp_sq_zrxy_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会信用</td>");
								if(shxyf){
									sb.append("<td class = 'shry'><a href = 'szcp_sq_shry_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会荣誉</td>");
									if(shryf){
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}else{
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}
								}else{
									sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
									sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
								}
							}else{
								sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
								sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
								sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
							}
						}else{
							sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
							sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
							sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
							sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
						}
					}else{
						sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
						sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
						sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
						sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
						sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
					}
				}else{
					sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
					sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
					sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
					sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
					sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
					sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
				}
			}else{
				sb.append("<td class = 'jbxx' id='jbxx'><a href = 'szcp_sq_jbxx_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl' id='jygl'><a href = '#'</a>"+"经营管理</td>");
				sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
				sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
				sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
				sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
				sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
				sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
			}
		}else if("8".equals(flag)) {
			sb.append("<td class = 'jbxx'><a href = 'szcp_sq_jbxx_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
			sb.append("<td class = 'jygl'><a href = 'szcp_sq_jygl_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营管理</td>");
			sb.append("<td class = 'htgl'><a href = 'szcp_sq_htgl_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同管理</td>");
			sb.append("<td class = 'htlx'><a href = 'szcp_sq_lxqk_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同履行</td>");
			sb.append("<td class = 'jyxy'><a href = 'szcp_sq_jyxy_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营效益</td>");
			sb.append("<td class = 'shxy'><a href = 'szcp_sq_zrxy_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会信用</td>");
			sb.append("<td class = 'shry'><a href = 'szcp_sq_shry_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会荣誉</td>");
			sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs_view.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
		}
		sb.append("</tr></table>");
		
		return sb.toString();
	}
	
	/**
	 * 
	* @Title: createHeader 
	* @Description: 生成头 
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	public String createHeader(String regno,String evalYear,String cerno,String flag,String ENT_NAME) {
		StringBuffer sb = new StringBuffer();
		sb.append("<table border='0' width='100%' align='center'><tr>");
		if("1".equals(flag)) {
			SZCP_SQ_JBXX jbxx = new SZCP_SQ_JBXX();
			jbxx.setENT_NAME(ENT_NAME);
			jbxx.setEVAL_YEAR(evalYear);
			jbxx.setREG_NO(regno);
			boolean jbxxf = jbxx.queryHistoryDataTab(jbxx);
			
			SZCP_SQ_JYGL jygl = new SZCP_SQ_JYGL();
			jygl.setEVAL_YEAR(evalYear);
			jygl.setREG_NO(regno);
			boolean jyglf = jygl.queryHistoryData(jygl);
			
			SZCP_SQ_HT_XWGFDao dao = new SZCP_SQ_HT_XWGFDao();
			boolean htglf = dao.isEmptySZCP_SQ_HT_XWGF(regno,evalYear);
			
			SZCP_SQ_LXQK_RATE lxqk = new SZCP_SQ_LXQK_RATE();
			lxqk.setREG_NO(regno);
			lxqk.setEVAL_YEAR(evalYear);
			boolean htlxf = lxqk.queryHistoryDataTab(lxqk);
			
			SZCP_SQ_JYXYDao jyxy = new SZCP_SQ_JYXYDao();
			boolean jyxyf = jyxy.isEmptySZCP_SQ_JYXY(regno, evalYear);
			
			SZCP_SQ_ZRXY shxy = new SZCP_SQ_ZRXY();
			shxy.setREG_NO(regno);
			shxy.setEVAL_YEAR(evalYear);
			boolean shxyf = shxy.queryHistoryData(shxy);
			
			SZCP_SQ_SHRY shry = new SZCP_SQ_SHRY();
			shry.setREG_NO(regno);
			shry.setEVAL_YEAR(evalYear);
			boolean shryf = shry.queryHistoryData(shry);
			
/*			SZCP_SQ_XGZS xgzs = new SZCP_SQ_XGZS();
			xgzs.setREG_NO(regno);
			xgzs.setEVAL_YEAR(evalYear);
			boolean xgzsf = xgzs.queryHistoryData(xgzs);*/
			//aa
			if(jbxxf){
				sb.append("<td class = 'jbxx'><a href = 'szcp_sq_jbxx.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl'><a href = 'szcp_sq_jygl.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营管理</td>");
				if(jyglf){
					sb.append("<td class = 'htgl'><a href = 'szcp_sq_htgl.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同管理</td>");
					if(htglf){
						sb.append("<td class = 'htlx'><a href = 'szcp_sq_lxqk.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同履行</td>");
						if(htlxf){
							sb.append("<td class = 'jyxy'><a href = 'szcp_sq_jyxy.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营效益</td>");
							if(!jyxyf){
								sb.append("<td class = 'shxy'><a href = 'szcp_sq_zrxy.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会信用</td>");
								if(shxyf){
									sb.append("<td class = 'shry'><a href = 'szcp_sq_shry.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会荣誉</td>");
									if(shryf){
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}else{
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}
								}else{
									sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
									sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
								}
							}else{
								sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
								sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
								sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
							}
						}else{
							sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
							sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
							sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
							sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
						}
					}else{
						sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
						sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
						sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
						sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
						sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
					}
				}else{
					sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
					sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
					sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
					sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
					sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
					sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
				}
			}else{
				sb.append("<td class = 'jbxx' id='jbxx'><a href = 'szcp_sq_jbxx.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl' id='jygl'><a href = '#'</a>"+"经营管理</td>");
				sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
				sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
				sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
				sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
				sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
				sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
			}
			

		}else if("2".equals(flag)) {
			SZCP_SQ_JBXX jbxx = new SZCP_SQ_JBXX();
			jbxx.setENT_NAME(ENT_NAME);
			jbxx.setEVAL_YEAR(evalYear);
			jbxx.setREG_NO(regno);
			boolean jbxxf = jbxx.queryHistoryDataTab(jbxx);
			
			SZCP_SQ_JYGL jygl = new SZCP_SQ_JYGL();
			jygl.setEVAL_YEAR(evalYear);
			jygl.setREG_NO(regno);
			boolean jyglf = jygl.queryHistoryData(jygl);
			
			SZCP_SQ_HT_XWGFDao dao = new SZCP_SQ_HT_XWGFDao();
			boolean htglf = dao.isEmptySZCP_SQ_HT_XWGF(regno,evalYear);
			
			SZCP_SQ_LXQK_RATE lxqk = new SZCP_SQ_LXQK_RATE();
			lxqk.setREG_NO(regno);
			lxqk.setEVAL_YEAR(evalYear);
			boolean htlxf = lxqk.queryHistoryDataTab(lxqk);
			
			SZCP_SQ_JYXYDao jyxy = new SZCP_SQ_JYXYDao();
			boolean jyxyf = jyxy.isEmptySZCP_SQ_JYXY(regno, evalYear);
			
			SZCP_SQ_ZRXY shxy = new SZCP_SQ_ZRXY();
			shxy.setREG_NO(regno);
			shxy.setEVAL_YEAR(evalYear);
			boolean shxyf = shxy.queryHistoryData(shxy);
			
			SZCP_SQ_SHRY shry = new SZCP_SQ_SHRY();
			shry.setREG_NO(regno);
			shry.setEVAL_YEAR(evalYear);
			boolean shryf = shry.queryHistoryData(shry);
			
/*			SZCP_SQ_XGZS xgzs = new SZCP_SQ_XGZS();
			xgzs.setREG_NO(regno);
			xgzs.setEVAL_YEAR(evalYear);
			boolean xgzsf = xgzs.queryHistoryData(xgzs);*/
			if(jbxxf){
				sb.append("<td class = 'jbxx'><a href = 'szcp_sq_jbxx.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl'><a href = 'szcp_sq_jygl.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营管理</td>");
				if(jyglf){
					sb.append("<td class = 'htgl'><a href = 'szcp_sq_htgl.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同管理</td>");
					if(htglf){
						sb.append("<td class = 'htlx'><a href = 'szcp_sq_lxqk.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同履行</td>");
						if(htlxf){
							sb.append("<td class = 'jyxy'><a href = 'szcp_sq_jyxy.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营效益</td>");
							if(!jyxyf){
								sb.append("<td class = 'shxy'><a href = 'szcp_sq_zrxy.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会信用</td>");
								if(shxyf){
									sb.append("<td class = 'shry'><a href = 'szcp_sq_shry.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会荣誉</td>");
									if(shryf){
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}else{
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}
								}else{
									sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
									sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
								}
							}else{
								sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
								sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
								sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
							}
						}else{
							sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
							sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
							sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
							sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
						}
					}else{
						sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
						sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
						sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
						sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
						sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
					}
				}else{
					sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
					sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
					sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
					sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
					sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
					sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
				}
			}else{
				sb.append("<td class = 'jbxx' id='jbxx'><a href = 'szcp_sq_jbxx.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl' id='jygl'><a href = '#'</a>"+"经营管理</td>");
				sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
				sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
				sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
				sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
				sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
				sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
			}
		}else if("3".equals(flag)) {
			
			SZCP_SQ_JBXX jbxx = new SZCP_SQ_JBXX();
			jbxx.setENT_NAME(ENT_NAME);
			jbxx.setEVAL_YEAR(evalYear);
			jbxx.setREG_NO(regno);
			boolean jbxxf = jbxx.queryHistoryDataTab(jbxx);
			
			SZCP_SQ_JYGL jygl = new SZCP_SQ_JYGL();
			jygl.setEVAL_YEAR(evalYear);
			jygl.setREG_NO(regno);
			boolean jyglf = jygl.queryHistoryData(jygl);
			
			SZCP_SQ_HT_XWGFDao dao = new SZCP_SQ_HT_XWGFDao();
			boolean htglf = dao.isEmptySZCP_SQ_HT_XWGF(regno,evalYear);
			
			SZCP_SQ_LXQK_RATE lxqk = new SZCP_SQ_LXQK_RATE();
			lxqk.setREG_NO(regno);
			lxqk.setEVAL_YEAR(evalYear);
			boolean htlxf = lxqk.queryHistoryDataTab(lxqk);
			
			SZCP_SQ_JYXYDao jyxy = new SZCP_SQ_JYXYDao();
			boolean jyxyf = jyxy.isEmptySZCP_SQ_JYXY(regno, evalYear);
			
			SZCP_SQ_ZRXY shxy = new SZCP_SQ_ZRXY();
			shxy.setREG_NO(regno);
			shxy.setEVAL_YEAR(evalYear);
			boolean shxyf = shxy.queryHistoryData(shxy);
			
			SZCP_SQ_SHRY shry = new SZCP_SQ_SHRY();
			shry.setREG_NO(regno);
			shry.setEVAL_YEAR(evalYear);
			boolean shryf = shry.queryHistoryData(shry);
			
/*			SZCP_SQ_XGZS xgzs = new SZCP_SQ_XGZS();
			xgzs.setREG_NO(regno);
			xgzs.setEVAL_YEAR(evalYear);
			boolean xgzsf = xgzs.queryHistoryData(xgzs);*/
			//aa
			if(jbxxf){
				sb.append("<td class = 'jbxx'><a href = 'szcp_sq_jbxx.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl'><a href = 'szcp_sq_jygl.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营管理</td>");
				if(jyglf){
					sb.append("<td class = 'htgl'><a href = 'szcp_sq_htgl.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同管理</td>");
					if(htglf){
						sb.append("<td class = 'htlx'><a href = 'szcp_sq_lxqk.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同履行</td>");
						if(htlxf){
							sb.append("<td class = 'jyxy'><a href = 'szcp_sq_jyxy.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营效益</td>");
							if(!jyxyf){
								sb.append("<td class = 'shxy'><a href = 'szcp_sq_zrxy.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会信用</td>");
								if(shxyf){
									sb.append("<td class = 'shry'><a href = 'szcp_sq_shry.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会荣誉</td>");
									if(shryf){
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}else{
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}
								}else{
									sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
									sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
								}
							}else{
								sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
								sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
								sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
							}
						}else{
							sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
							sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
							sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
							sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
						}
					}else{
						sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
						sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
						sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
						sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
						sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
					}
				}else{
					sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
					sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
					sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
					sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
					sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
					sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
				}
			}else{
				sb.append("<td class = 'jbxx' id='jbxx'><a href = 'szcp_sq_jbxx.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl' id='jygl'><a href = '#'</a>"+"经营管理</td>");
				sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
				sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
				sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
				sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
				sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
				sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
			}
		}else if("4".equals(flag)) {
			
			SZCP_SQ_JBXX jbxx = new SZCP_SQ_JBXX();
			jbxx.setENT_NAME(ENT_NAME);
			jbxx.setEVAL_YEAR(evalYear);
			jbxx.setREG_NO(regno);
			boolean jbxxf = jbxx.queryHistoryDataTab(jbxx);
			
			SZCP_SQ_JYGL jygl = new SZCP_SQ_JYGL();
			jygl.setEVAL_YEAR(evalYear);
			jygl.setREG_NO(regno);
			boolean jyglf = jygl.queryHistoryData(jygl);
			
			SZCP_SQ_HT_XWGFDao dao = new SZCP_SQ_HT_XWGFDao();
			boolean htglf = dao.isEmptySZCP_SQ_HT_XWGF(regno,evalYear);
			
			SZCP_SQ_LXQK_RATE lxqk = new SZCP_SQ_LXQK_RATE();
			lxqk.setREG_NO(regno);
			lxqk.setEVAL_YEAR(evalYear);
			boolean htlxf = lxqk.queryHistoryDataTab(lxqk);
			
			SZCP_SQ_JYXYDao jyxy = new SZCP_SQ_JYXYDao();
			boolean jyxyf = jyxy.isEmptySZCP_SQ_JYXY(regno, evalYear);
			
			SZCP_SQ_ZRXY shxy = new SZCP_SQ_ZRXY();
			shxy.setREG_NO(regno);
			shxy.setEVAL_YEAR(evalYear);
			boolean shxyf = shxy.queryHistoryData(shxy);
			
			SZCP_SQ_SHRY shry = new SZCP_SQ_SHRY();
			shry.setREG_NO(regno);
			shry.setEVAL_YEAR(evalYear);
			boolean shryf = shry.queryHistoryData(shry);
			
/*			SZCP_SQ_XGZS xgzs = new SZCP_SQ_XGZS();
			xgzs.setREG_NO(regno);
			xgzs.setEVAL_YEAR(evalYear);
			boolean xgzsf = xgzs.queryHistoryData(xgzs);*/
			//aa
			if(jbxxf){
				sb.append("<td class = 'jbxx'><a href = 'szcp_sq_jbxx.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl'><a href = 'szcp_sq_jygl.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营管理</td>");
				if(jyglf){
					sb.append("<td class = 'htgl'><a href = 'szcp_sq_htgl.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同管理</td>");
					if(htglf){
						sb.append("<td class = 'htlx'><a href = 'szcp_sq_lxqk.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同履行</td>");
						if(htlxf){
							sb.append("<td class = 'jyxy'><a href = 'szcp_sq_jyxy.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营效益</td>");
							if(!jyxyf){
								sb.append("<td class = 'shxy'><a href = 'szcp_sq_zrxy.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会信用</td>");
								if(shxyf){
									sb.append("<td class = 'shry'><a href = 'szcp_sq_shry.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会荣誉</td>");
									if(shryf){
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}else{
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}
								}else{
									sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
									sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
								}
							}else{
								sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
								sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
								sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
							}
						}else{
							sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
							sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
							sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
							sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
						}
					}else{
						sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
						sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
						sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
						sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
						sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
					}
				}else{
					sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
					sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
					sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
					sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
					sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
					sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
				}
			}else{
				sb.append("<td class = 'jbxx' id='jbxx'><a href = 'szcp_sq_jbxx.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl' id='jygl'><a href = '#'</a>"+"经营管理</td>");
				sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
				sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
				sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
				sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
				sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
				sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
			}
			
		}else if("5".equals(flag)) {
			
			SZCP_SQ_JBXX jbxx = new SZCP_SQ_JBXX();
			jbxx.setENT_NAME(ENT_NAME);
			jbxx.setEVAL_YEAR(evalYear);
			jbxx.setREG_NO(regno);
			boolean jbxxf = jbxx.queryHistoryDataTab(jbxx);
			
			SZCP_SQ_JYGL jygl = new SZCP_SQ_JYGL();
			jygl.setEVAL_YEAR(evalYear);
			jygl.setREG_NO(regno);
			boolean jyglf = jygl.queryHistoryData(jygl);
			
			SZCP_SQ_HT_XWGFDao dao = new SZCP_SQ_HT_XWGFDao();
			boolean htglf = dao.isEmptySZCP_SQ_HT_XWGF(regno,evalYear);
			
			SZCP_SQ_LXQK_RATE lxqk = new SZCP_SQ_LXQK_RATE();
			lxqk.setREG_NO(regno);
			lxqk.setEVAL_YEAR(evalYear);
			boolean htlxf = lxqk.queryHistoryDataTab(lxqk);
			
			SZCP_SQ_JYXYDao jyxy = new SZCP_SQ_JYXYDao();
			boolean jyxyf = jyxy.isEmptySZCP_SQ_JYXY(regno, evalYear);
			
			SZCP_SQ_ZRXY shxy = new SZCP_SQ_ZRXY();
			shxy.setREG_NO(regno);
			shxy.setEVAL_YEAR(evalYear);
			boolean shxyf = shxy.queryHistoryData(shxy);
			
			SZCP_SQ_SHRY shry = new SZCP_SQ_SHRY();
			shry.setREG_NO(regno);
			shry.setEVAL_YEAR(evalYear);
			boolean shryf = shry.queryHistoryData(shry);
			
		/*	SZCP_SQ_XGZS xgzs = new SZCP_SQ_XGZS();
			xgzs.setREG_NO(regno);
			xgzs.setEVAL_YEAR(evalYear);
			boolean xgzsf = xgzs.queryHistoryData(xgzs);*/
			//aa
			if(jbxxf){
				sb.append("<td class = 'jbxx'><a href = 'szcp_sq_jbxx.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl'><a href = 'szcp_sq_jygl.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营管理</td>");
				if(jyglf){
					sb.append("<td class = 'htgl'><a href = 'szcp_sq_htgl.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同管理</td>");
					if(htglf){
						sb.append("<td class = 'htlx'><a href = 'szcp_sq_lxqk.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同履行</td>");
						if(htlxf){
							sb.append("<td class = 'jyxy'><a href = 'szcp_sq_jyxy.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营效益</td>");
							if(!jyxyf){
								sb.append("<td class = 'shxy'><a href = 'szcp_sq_zrxy.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会信用</td>");
								if(shxyf){
									sb.append("<td class = 'shry'><a href = 'szcp_sq_shry.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会荣誉</td>");
									if(shryf){
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}else{
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}
								}else{
									sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
									sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
								}
							}else{
								sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
								sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
								sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
							}
						}else{
							sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
							sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
							sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
							sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
						}
					}else{
						sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
						sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
						sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
						sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
						sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
					}
				}else{
					sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
					sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
					sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
					sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
					sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
					sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
				}
			}else{
				sb.append("<td class = 'jbxx' id='jbxx'><a href = 'szcp_sq_jbxx.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl' id='jygl'><a href = '#'</a>"+"经营管理</td>");
				sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
				sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
				sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
				sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
				sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
				sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
			}
		}else if("6".equals(flag)) {
			SZCP_SQ_JBXX jbxx = new SZCP_SQ_JBXX();
			jbxx.setENT_NAME(ENT_NAME);
			jbxx.setEVAL_YEAR(evalYear);
			jbxx.setREG_NO(regno);
			boolean jbxxf = jbxx.queryHistoryDataTab(jbxx);
			
			SZCP_SQ_JYGL jygl = new SZCP_SQ_JYGL();
			jygl.setEVAL_YEAR(evalYear);
			jygl.setREG_NO(regno);
			boolean jyglf = jygl.queryHistoryData(jygl);
			
			SZCP_SQ_HT_XWGFDao dao = new SZCP_SQ_HT_XWGFDao();
			boolean htglf = dao.isEmptySZCP_SQ_HT_XWGF(regno,evalYear);
			
			SZCP_SQ_LXQK_RATE lxqk = new SZCP_SQ_LXQK_RATE();
			lxqk.setREG_NO(regno);
			lxqk.setEVAL_YEAR(evalYear);
			boolean htlxf = lxqk.queryHistoryDataTab(lxqk);
			
			SZCP_SQ_JYXYDao jyxy = new SZCP_SQ_JYXYDao();
			boolean jyxyf = jyxy.isEmptySZCP_SQ_JYXY(regno, evalYear);
			
			SZCP_SQ_ZRXY shxy = new SZCP_SQ_ZRXY();
			shxy.setREG_NO(regno);
			shxy.setEVAL_YEAR(evalYear);
			boolean shxyf = shxy.queryHistoryData(shxy);
			
			SZCP_SQ_SHRY shry = new SZCP_SQ_SHRY();
			shry.setREG_NO(regno);
			shry.setEVAL_YEAR(evalYear);
			boolean shryf = shry.queryHistoryData(shry);
			
			/*SZCP_SQ_XGZS xgzs = new SZCP_SQ_XGZS();
			xgzs.setREG_NO(regno);
			xgzs.setEVAL_YEAR(evalYear);
			boolean xgzsf = xgzs.queryHistoryData(xgzs);*/
			//aa
			if(jbxxf){
				sb.append("<td class = 'jbxx'><a href = 'szcp_sq_jbxx.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl'><a href = 'szcp_sq_jygl.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营管理</td>");
				if(jyglf){
					sb.append("<td class = 'htgl'><a href = 'szcp_sq_htgl.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同管理</td>");
					if(htglf){
						sb.append("<td class = 'htlx'><a href = 'szcp_sq_lxqk.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同履行</td>");
						if(htlxf){
							sb.append("<td class = 'jyxy'><a href = 'szcp_sq_jyxy.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营效益</td>");
							if(!jyxyf){
								sb.append("<td class = 'shxy'><a href = 'szcp_sq_zrxy.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会信用</td>");
								if(shxyf){
									sb.append("<td class = 'shry'><a href = 'szcp_sq_shry.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会荣誉</td>");
									if(shryf){
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}else{
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}
								}else{
									sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
									sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
								}
							}else{
								sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
								sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
								sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
							}
						}else{
							sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
							sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
							sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
							sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
						}
					}else{
						sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
						sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
						sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
						sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
						sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
					}
				}else{
					sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
					sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
					sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
					sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
					sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
					sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
				}
			}else{
				sb.append("<td class = 'jbxx' id='jbxx'><a href = 'szcp_sq_jbxx.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl' id='jygl'><a href = '#'</a>"+"经营管理</td>");
				sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
				sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
				sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
				sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
				sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
				sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
			}
		}else if("7".equals(flag)) {
			SZCP_SQ_JBXX jbxx = new SZCP_SQ_JBXX();
			jbxx.setENT_NAME(ENT_NAME);
			jbxx.setEVAL_YEAR(evalYear);
			jbxx.setREG_NO(regno);
			boolean jbxxf = jbxx.queryHistoryDataTab(jbxx);
			
			SZCP_SQ_JYGL jygl = new SZCP_SQ_JYGL();
			jygl.setEVAL_YEAR(evalYear);
			jygl.setREG_NO(regno);
			boolean jyglf = jygl.queryHistoryData(jygl);
			
			SZCP_SQ_HT_XWGFDao dao = new SZCP_SQ_HT_XWGFDao();
			boolean htglf = dao.isEmptySZCP_SQ_HT_XWGF(regno,evalYear);
			
			SZCP_SQ_LXQK_RATE lxqk = new SZCP_SQ_LXQK_RATE();
			lxqk.setREG_NO(regno);
			lxqk.setEVAL_YEAR(evalYear);
			boolean htlxf = lxqk.queryHistoryDataTab(lxqk);
			
			SZCP_SQ_JYXYDao jyxy = new SZCP_SQ_JYXYDao();
			boolean jyxyf = jyxy.isEmptySZCP_SQ_JYXY(regno, evalYear);
			
			SZCP_SQ_ZRXY shxy = new SZCP_SQ_ZRXY();
			shxy.setREG_NO(regno);
			shxy.setEVAL_YEAR(evalYear);
			boolean shxyf = shxy.queryHistoryData(shxy);
			
			SZCP_SQ_SHRY shry = new SZCP_SQ_SHRY();
			shry.setREG_NO(regno);
			shry.setEVAL_YEAR(evalYear);
			boolean shryf = shry.queryHistoryData(shry);
			
/*			SZCP_SQ_XGZS xgzs = new SZCP_SQ_XGZS();
			xgzs.setREG_NO(regno);
			xgzs.setEVAL_YEAR(evalYear);
			boolean xgzsf = xgzs.queryHistoryData(xgzs);*/
			//aa
			if(jbxxf){
				sb.append("<td class = 'jbxx'><a href = 'szcp_sq_jbxx.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl'><a href = 'szcp_sq_jygl.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营管理</td>");
				if(jyglf){
					sb.append("<td class = 'htgl'><a href = 'szcp_sq_htgl.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同管理</td>");
					if(htglf){
						sb.append("<td class = 'htlx'><a href = 'szcp_sq_lxqk.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同履行</td>");
						if(htlxf){
							sb.append("<td class = 'jyxy'><a href = 'szcp_sq_jyxy.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营效益</td>");
							if(!jyxyf){
								sb.append("<td class = 'shxy'><a href = 'szcp_sq_zrxy.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会信用</td>");
								if(shxyf){
									sb.append("<td class = 'shry'><a href = 'szcp_sq_shry.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会荣誉</td>");
									if(shryf){
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}else{
										sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
									}
								}else{
									sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
									sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
								}
							}else{
								sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
								sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
								sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
							}
						}else{
							sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
							sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
							sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
							sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
						}
					}else{
						sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
						sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
						sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
						sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
						sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
					}
				}else{
					sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
					sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
					sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
					sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
					sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
					sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
				}
			}else{
				sb.append("<td class = 'jbxx' id='jbxx'><a href = 'szcp_sq_jbxx.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
				sb.append("<td class = 'jygl' id='jygl'><a href = '#'</a>"+"经营管理</td>");
				sb.append("<td class='htgl' id='htgl' onclick='htgl'><a href = '#'</a>"+"合同管理</td>");
				sb.append("<td class='htlx' id='htlx' onclick='htlx'><a href = '#'</a>"+"合同履行</td>");
				sb.append("<td class='jyxy' id='jyxy' onclick='jyxy'><a href = '#'</a>"+"经营效益</td>");
				sb.append("<td class='shxy' id='shxy' onclick='shxy'><a href = '#'</a>"+"社会信用</td>");
				sb.append("<td class='shry' id='shry' onclick='shry'><a href = '#'</a>"+"社会荣誉</td>");
				sb.append("<td class='xgzs' id='xgzs' onclick='xgzs'><a href = '#'</a>"+"相关证书</td>");
			}
		}else if("8".equals(flag)) {
			sb.append("<td class = 'jbxx'><a href = 'szcp_sq_jbxx.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"基本信息</td>");
			sb.append("<td class = 'jygl'><a href = 'szcp_sq_jygl.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营管理</td>");
			sb.append("<td class = 'htgl'><a href = 'szcp_sq_htgl.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同管理</td>");
			sb.append("<td class = 'htlx'><a href = 'szcp_sq_lxqk.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"合同履行</td>");
			sb.append("<td class = 'jyxy'><a href = 'szcp_sq_jyxy.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"经营效益</td>");
			sb.append("<td class = 'shxy'><a href = 'szcp_sq_zrxy.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会信用</td>");
			sb.append("<td class = 'shry'><a href = 'szcp_sq_shry.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"社会荣誉</td>");
			sb.append("<td class = 'xgzs'><a href = 'szcp_sq_xgzs.jsp?REG_NO="+regno+"&EVAL_YEAR="+evalYear+"&CerNO="+cerno+"'</a>"+"相关证书</td>");
		}
		sb.append("</tr></table>");
		
		return sb.toString();
	}
	
	public static String setAlertGo(String salert,String gopage)
	{
			String str="<script language='javascript'>";
		/*	str+="alert('"+salert+"');";*/
			str+="window.location.href='"+gopage+"';";
			str+="</script>";
			return str;
	}

}
