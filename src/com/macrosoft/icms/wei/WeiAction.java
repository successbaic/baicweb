package com.macrosoft.icms.wei;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.macrosoft.icms.util.IPTIMESTAMP;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.macrosoft.icms.gsdbc.GsDbConnection;
import com.macrosoft.icms.gsnw.GSYJXX;
import com.macrosoft.icms.gsnw.GTDJ_JBXX_ZS;
import com.macrosoft.icms.gsnw.MCGL_JBXX_ZS;
import com.macrosoft.icms.gsnw.QYDJ_CZXX_ZS;
import com.macrosoft.icms.gsnw.QYDJ_JBXX_ZS;
import com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS;
import com.macrosoft.icms.mcgl.MCGL_JBXX_SQ;
import com.macrosoft.icms.qydj.QYDJ_BGSX_SQ;
import com.macrosoft.icms.qydj.QYDJ_CWFZR_SQ;
import com.macrosoft.icms.qydj.QYDJ_CZXX_SQ;
import com.macrosoft.icms.qydj.QYDJ_JBXX_SQ;
import com.macrosoft.icms.qydj.QYDJ_RYXX_SQ;
import com.macrosoft.icms.qydj.QYDJ_SQWT_SQ;
import com.macrosoft.icms.qydj.QYDJ_WZLLR_SQ;
import com.macrosoft.icms.qydj.QYDJ_XKXX_SQ;
import com.macrosoft.icms.qydj.QYDJ_YWSB_SQ;
import com.macrosoft.icms.qydj.QYDJ_ZXXX_SQ;
import com.macrosoft.icms.system.ContrInfo;
import com.macrosoft.icms.system.SysUtility;
import com.macrosoft.icms.util.CHECK_INFO;
import com.macrosoft.icms.util.SYS_BHBM;
import com.macrosoft.icms.util.UPLOAD_FILE;
import com.macrosoft.icms.util.WSDJ_LOG_RECORD;

import net.sf.json.JSONObject;

public class WeiAction {

	public void checkMc(HttpServletRequest request,HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		try {
			MCGL_JBXX_ZS MCGL_JBXX_ZS=new MCGL_JBXX_ZS();
			GTDJ_JBXX_ZS GTDJ_JBXX_ZS=new GTDJ_JBXX_ZS();
			QYDJ_JBXX_ZS QYDJ_JBXX_ZS=new QYDJ_JBXX_ZS();
			SysDmUtil SysDmUtil=new SysDmUtil();
			Map map=new HashMap();
			
			String gmlx = SysDmUtil.doPreProcess(request.getParameter("gmlx"));
			String IFMC = SysDmUtil.doPreProcess(request.getParameter("radio_mc"));
			if("".equals(IFMC)){
				IFMC = "1";	
			}
			String ENTNAME = request.getParameter("ENTNAME");
			ENTNAME=SysDmUtil.doPreProcess(SysDmUtil.convertCode(ENTNAME));
			
			String QYLX = "";
			String ENTCLASS = "";
			String OPENO = "";
			String MCID = "";
			String MCXH = "";
			String APPRNO="";
			String PRIPID="";
			//个体登记
			if (ENTNAME.equals("****")) {

			} else {
				//判断该户企业或个体是否正在办理
				CHECK_INFO CHECKINFO = new CHECK_INFO();
				String wwywsbInfo = CHECKINFO.WW_YWSB_SQ(" WHERE ENTNAME='"+ ENTNAME + "' AND STATUS NOT IN('4','5','11') AND CDDL in ('1','2','3') ");
				if (!wwywsbInfo.equals("")) {
					out.print(WeiActionUtil.errorReturn(wwywsbInfo));
					return;
				}
			}
			
			if ("1".equals(IFMC)) {//有名称核准		
				MCID = SysDmUtil.doPreProcess(SysDmUtil.convertCode(request.getParameter("mcid"))); //获得 预先核准通知书文号
				//备注：如果集中部署这种查询方式可能为多条						
				String dMCID = "" + MCID + "";
				String checkSql = "SELECT * FROM MCGL_JBXX_ZS WHERE ENTNAME='"
						+ ENTNAME + "' AND NAMESTATUS = '2'"
						+ " AND apprno is not null"
						//+ " AND (apprno = '"+dMCID+"' OR apprno LIKE '%第"+dMCID+"号')"
						+ " AND saveperto IS NOT NULL"
						+ " AND saveperto >= sysdate ";
				if ("2".equals(gmlx)) {
					MCGL_JBXX_ZS.doSelectBySql(checkSql+ContrInfo.getMczssql_dishi(WeiActionUtil.XZQH));					
				} else if ("1".equals(gmlx)) {
					MCGL_JBXX_ZS.doSelectBySqlSJ(checkSql +ContrInfo.getMczssql_shengju(WeiActionUtil.SJ,WeiActionUtil.XZQH));
				} else if ("0".equals(gmlx)) {
					if(WeiActionUtil.SJ.startsWith("37")){
						String xx="山东,济南,青岛,淄博,枣庄,东营,烟台,潍坊,济宁,泰安,威海,日照,莱芜,临沂,德州,聊城,滨州,菏泽";
						String[] xxs=xx.split(",");
						for(int i=0;i<xxs.length;i++){
							if(ENTNAME.indexOf(xxs[i])>-1){
								out.print(WeiActionUtil.errorReturn("国家局核名不能包含本地市名，您录入的名称包含【"+xxs[i]+"】字样，如仍需办理，请到工商局现场办理！"));	
								return;
							}
						}
					}
				}
				
				if ("2".equals(gmlx) || "1".equals(gmlx)) {
					if (MCGL_JBXX_ZS.getENTNAME().equals("")) {
						out.print(WeiActionUtil.errorReturn("没有该名称数据，请查看冠名类型、名称信息是否录入正确！"));
						return;
					} else {
						//System.out.println(MCGL_JBXX_ZS.getAPPRNO());
						if(MCGL_JBXX_ZS.getENTCAT().equals("8")){
							if (MCGL_JBXX_ZS.getAPPRNO().indexOf(dMCID+"号") < 0) {
								{
									out.print(WeiActionUtil.errorReturn("名称与名称预先核准通知书文号不匹配！"));
									return;
								}
							}
						}else{
							if (MCGL_JBXX_ZS.getAPPRNO().indexOf("第"+dMCID+"号") < 0) {
								{
									out.print(WeiActionUtil.errorReturn("名称与名称预先核准通知书文号不匹配！"));
									return;
								}
							}
						}
						
						MCXH = MCGL_JBXX_ZS.getNAMEID();
						ENTCLASS = MCGL_JBXX_ZS.getENTCAT();
						APPRNO=MCGL_JBXX_ZS.getAPPRNO();
						PRIPID=MCGL_JBXX_ZS.getPRIPID();
						QYLX = SysDmUtil.getSysRemark("ENTTYPE", MCGL_JBXX_ZS.getENTTYPE());
						map.put("ENTCLASS",ENTCLASS);
						map.put("MCXH",MCXH);
						map.put("NAMEAPPNO",APPRNO);
						map.put("WSLX",QYLX);
						map.put("PRIPID",PRIPID);
					}
				}
				
			} else {//无名称核准	
				ENTCLASS = request.getParameter("ENTCLASS");
				if(!"5".equals(ENTCLASS)){
					//判断名称是否被占用
					boolean isUsed = CHECK_INFO.validateEntname(ENTNAME);
					if(isUsed){
						out.print(WeiActionUtil.errorReturn("该名称已经被占用，请重新拟定名称！"));	
						return;
					}
				}
				
			}
			
			
			int countNum=0;
			if(ENTCLASS.equals("5")){
				if(ENTNAME.indexOf("*")<0){
					countNum=GTDJ_JBXX_ZS.getListCount(" WHERE TRANAME='"+ENTNAME+"' AND STATUS='1' ");
				}
			}else{
				countNum=QYDJ_JBXX_ZS.getListCount(" WHERE ENTNAME='"+ENTNAME+"' AND ENTSTATUS='1' ");
			}
			if(countNum>0){
				out.print(WeiActionUtil.errorReturn("当前企业已经成立，不能再次办理！"));	
				return;
			}
			map.put("status", "1");
			JSONObject jsonObject = JSONObject.fromObject(map);
			out.print(jsonObject.toString());
		}catch(SQLException e){
			e.printStackTrace();
			out.print(WeiActionUtil.errorReturn(e.getMessage()));
		}
		
	}
	
	public void jbxxSave(HttpServletRequest request,HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		try {
		Map retMap=new HashMap();
		String jsonStr=request.getParameter("jsonStr");
		jsonStr=new String(jsonStr.getBytes("ISO8859-1"),"GBK");
		QYDJ_JBXX_SQ QYDJ_JBXX=(QYDJ_JBXX_SQ)WeiActionUtil.json2pojo(jsonStr, QYDJ_JBXX_SQ.class);
		
		
		String OPENO=SysDmUtil.doPreProcess(QYDJ_JBXX.getOPENO());
		String MCXH=SysDmUtil.doPreProcess(QYDJ_JBXX.getMCXH());
		String CDDL=SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"CDDL"));
		String ENTNAME = SysDmUtil.doPreProcess(QYDJ_JBXX.getENTNAME());
		String WSLX = SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"WSLX"));
		String PRIPID = SysDmUtil.doPreProcess(QYDJ_JBXX.getPRIPID());
		
		String IFELEC = "";
		String LOGINID =SysDmUtil.doPreProcess(QYDJ_JBXX.getLOGINID());
		String XZQH =WeiActionUtil.XZQH;
		
		SYS_BHBM SYS_BHBM=new SYS_BHBM();
		QYDJ_YWSB_SQ QYDJ_YWSB=new QYDJ_YWSB_SQ();
		QYDJ_RYXX_SQ QYDJ_RYXX=new QYDJ_RYXX_SQ();
		QYDJ_CZXX_SQ QYDJ_CZXX=new QYDJ_CZXX_SQ();
		WSDJ_LOG_RECORD WSDJ_LOG_RECORD=new WSDJ_LOG_RECORD();
		boolean bl=false;
		boolean ifFirst=false;
		String ip="";
	   /* if(request.getHeader("x-forwarded-for")==null){
	  	  ip=request.getRemoteAddr();
	    }else{
	  	  ip=request.getHeader("x-forwarded-for");
	    }*/
	    
		if(OPENO.equals("")|| OPENO==null){//第一次保存，生成新的业务编号MB开头
			OPENO=SYS_BHBM.CREATEBH(2,SysDmUtil.doPreProcess(QYDJ_JBXX.getREGORG()));
			retMap.put("OPENO", OPENO);
			ifFirst=true;
		}
		QYDJ_JBXX.setOPENO(OPENO);
		QYDJ_JBXX.setSTATUS("0");
		QYDJ_JBXX.setIFELEC(IFELEC);
		if(ENTNAME.equals("")
		||QYDJ_JBXX.getENTTYPE().equals("")
		||QYDJ_JBXX.getENTCLASS().equals("")
		||QYDJ_JBXX.getLOGINID().equals("")
		){
			out.print(WeiActionUtil.errorReturn("页面录入信息不完整，请使用IE浏览器，请关闭浏览器后重新操作或联系系统管理员!"));
			return;
		}

		//济南新增需求，配合事中事后双拆，业务系统增加地址判断，判断是否是违章建筑地址，如果是不允许设立登记
		if(XZQH.startsWith("3701") && !WSLX.equalsIgnoreCase("HZS") && !WSLX.equalsIgnoreCase("HZSFZ")){
			String  dom="";
			if(request.getParameter("DOM")!=null && request.getParameter("DOM")!=""){
				dom=SysDmUtil.doPreProcess(QYDJ_JBXX.getDOM());
			}
			String  proloc="";
			if(request.getParameter("PROLOC")!=null && request.getParameter("PROLOC")!=""){
			  proloc=SysDmUtil.doPreProcess(QYDJ_JBXX.getPROLOC());
			}
			String sql = "SELECT * FROM SZSH_XTJG_WZJZ WHERE ACTUALDOM='"+dom+"' OR ACTUALDOM='"+proloc+"'";
			com.macrosoft.icms.gsdbc.GsDbConnection gsdbc=new com.macrosoft.icms.gsdbc.GsDbConnection();
			ResultSet rs = gsdbc.executeQuery(sql);
			if(rs.next()){
				out.print(WeiActionUtil.errorReturn("该登记地址已被列为违法违章建筑，不允许办理工商登记业务!"));
				return;
			}
			gsdbc.close();
		}
		if(QYDJ_JBXX.doCount()){
			bl=QYDJ_JBXX.doModify();		
		}else{		
			bl=QYDJ_JBXX.doAdd();
		}
		if(!bl){
			out.print(WeiActionUtil.errorReturn("基本信息保存失败!"));
			return;
		}
		
		if(!bl){
			out.print(WeiActionUtil.errorReturn("共享数据平台_基本信息保存失败!"));
			return;
		}
		if(ifFirst && !MCXH.equals("")){
			String GMLX=SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"GMLX"));
			QYDJ_YWSB.doSql("insert into qydj_czxx_sq (OPENO,RECID,PRIPID,INVID,INV,INVTYPE,CERTYPE,CERNO,BLICTYPE,BLICNO,SUBCONAM,SUBCONPROP,COUNTRY,SUBCONAMUSD,CURRENCY) select '"+
					OPENO+"',RECID,'"+PRIPID+"',INVID,INV,INVTYPE,CERTYPE,CERNO,BLICTYPE,BLICNO,SUBCONAM,CONPROP,COUNTRY,SUBCONAMUSD,CURRENCY from mcgl_tzrxx_zs@gs_link where nameid='"+MCXH+"'");
			if(XZQH.equals("3701")){
				//暂时济南特有冠省名获取方式
				if(GMLX.equals("1")){
					QYDJ_YWSB.doSql("insert into qydj_czxx_sq (OPENO,RECID,PRIPID,INVID,INV,INVTYPE,CERTYPE,CERNO,BLICTYPE,BLICNO,SUBCONAM,SUBCONPROP,COUNTRY,SUBCONAMUSD,CURRENCY) select '"+
					OPENO+"',RECID,'"+PRIPID+"',INVID,INV,INVTYPE,CERTYPE,CERNO,BLICTYPE,BLICNO,SUBCONAM,CONPROP,COUNTRY,SUBCONAMUSD,CURRENCY from mcgl_tzrxx_zs@sgs_link where nameid='"+MCXH+"'");
				}
			}		
		}
		//把基本信息表中法定代表人同步到人员信息表中
		QYDJ_RYXX.setOPENO(OPENO);
		QYDJ_RYXX.setPRIPID(PRIPID);
		QYDJ_RYXX.setNAME(QYDJ_RYXX.doPreProcess(QYDJ_JBXX.getLEREP()));
		if(QYDJ_RYXX.doCountByFr()){
			bl=QYDJ_RYXX.doModifyFoName();
		}else{
			QYDJ_RYXX.setLEREPSIGN("1");
			QYDJ_RYXX.setRECID(SysUtility.getUUID20());
			bl=QYDJ_RYXX.doAdd();
		}
		if(!bl){
			out.print(WeiActionUtil.errorReturn("法定代表人保存失败!"));
			return;
		}
		//如果是内资法人同步信息到出资出资表中（主管部门）
		if (WSLX.equalsIgnoreCase("NZFR")) {
			//QYDJ_CZXX.setOPENO(OPENO);
			//QYDJ_CZXX.doSelecByOpeno();
			//QYDJ_CZXX.setINV(QYDJ_CZXX.doPreProcess(request.getParameter("DEPINCHA")));
			//if(QYDJ_CZXX.doCountByOpeno()){
			//	bl=QYDJ_CZXX.doModifyByOpeno();
			//}else{
			//	QYDJ_CZXX.setRECID(SysUtility.getUUID20());
			//	bl=QYDJ_CZXX.doAdd();
			//}
		}
		if(!bl){
			out.print(WeiActionUtil.errorReturn("主管单位保存失败!"));
			return;
		}
		//外网业务申办表中插入一条记录
		QYDJ_YWSB.setOPENO(OPENO);
		QYDJ_YWSB.setSTATUS("0");
		QYDJ_YWSB.setJQIP(ip);
		if(QYDJ_YWSB.doCount()){		
			bl=QYDJ_YWSB.doSql("UPDATE QYDJ_YWSB_SQ "
			+"SET (APPFORM,ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,JQIP,LOCALADM,OPELOCDISTRICT,IFELEC) "
			+"=(SELECT 'W',ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,'"
			+ip+"',LOCALADM,OPELOCDISTRICT,IFELEC FROM QYDJ_JBXX_SQ WHERE OPENO='"+OPENO+"') WHERE OPENO='"+OPENO+"'");
			
		}else{
			bl=QYDJ_YWSB.doSql("INSERT INTO QYDJ_YWSB_SQ "
			+"(APPFORM,OPENO,PRIPID,OPETYPE,APPDATE,REGNO,ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,LOGINID,STATUS,JQIP,CDDL,LOCALADM,OPELOCDISTRICT,IFELEC) "
			+"SELECT 'W',OPENO,PRIPID,OPETYPE,APPDATE,REGNO,ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,LOGINID,'0','"
			+ip+"','"+CDDL+"',LOCALADM,OPELOCDISTRICT,IFELEC FROM QYDJ_JBXX_SQ WHERE OPENO='"+OPENO+"'");
		}	
		if(!bl){
			out.print(WeiActionUtil.errorReturn("业务申报数据保存失败!"));
			return;
		}
		
		if(bl){
			//out.print(WeiActionUtil.errorReturn("数据保存成功!"));
			retMap.put("status", "1");
		}
		else{
			out.print(WeiActionUtil.errorReturn("共享数据平台_业务申报数据保存失败!"));
			return;
		}
		//数据保存后日志表记录日志
		WSDJ_LOG_RECORD.setLOGID(SysUtility.getUUID20());
		WSDJ_LOG_RECORD.setLINKNAME("微信网上登记企业基本信息保存环节");
		WSDJ_LOG_RECORD.setUSERID(LOGINID);
		WSDJ_LOG_RECORD.setOPENO(OPENO);
		WSDJ_LOG_RECORD.setUSERIP(ip);
		WSDJ_LOG_RECORD.setENTNAME(QYDJ_YWSB.getENTNAME());
		WSDJ_LOG_RECORD.setOPERNAME(QYDJ_YWSB.getLEREP());
		WSDJ_LOG_RECORD.setIFELEC(IFELEC);
		WSDJ_LOG_RECORD.doAdd();
		
		JSONObject jsonObject = JSONObject.fromObject(retMap);
		out.print(jsonObject.toString());
		
		}catch(SQLException e){
			e.printStackTrace();
			out.print(WeiActionUtil.errorReturn(e.getMessage()));
		}
	}
	
	public void fddbrSave(HttpServletRequest request,HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		try {
			String jsonStr=request.getParameter("jsonStr");
			jsonStr=new String(jsonStr.getBytes("ISO8859-1"),"GBK");
			QYDJ_RYXX_SQ QYDJ_RYXX=(QYDJ_RYXX_SQ)WeiActionUtil.json2pojo(jsonStr, QYDJ_RYXX_SQ.class);
			String RECID=SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"RECID"));
			Map retMap=new HashMap();
			QYDJ_JBXX_SQ QYDJ_JBXX=new QYDJ_JBXX_SQ();
			QYDJ_YWSB_SQ QYDJ_YWSB=new QYDJ_YWSB_SQ();
			
			String OPENO = SysDmUtil.doPreProcess(QYDJ_RYXX.getOPENO());
			String WSLX = SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"WSLX"));
			String CERNO = SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"CERNO"));
			String CERTYPE = SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"CERTYPE"));
			String INAME = new String(WeiActionUtil.getJsonValueByKey(jsonStr,"NAME"));
			
			boolean bl=false;
//			if(OPETYPE.equals("20") || OPETYPE.equals("30")){
				GSYJXX yjxx=new GSYJXX();
				if(yjxx.checkRyHmd(CERNO,CERTYPE)){
					out.print(WeiActionUtil.errorReturn("当前人员的身份证号码在黑名单库中!"));
					return;
				}
				if(WSLX.equals("GS")||WSLX.equals("WZGS")||WSLX.equals("NZFR")||WSLX.equals("HZS")){
					if(yjxx.checkLaolai(INAME, CERNO)){
						out.print(WeiActionUtil.errorReturn("提示:当前人员在失信被执行人名单中!"));
						return;
					}
				}
//			}
			//int max =QYDJ_RYXX.getListMax(" where OPENO='"+OPENO+"'");if(max>0){max=max+1;}
			
			QYDJ_RYXX.setLEREPSIGN("1");
			if(QYDJ_RYXX.doCountByFr()){
				bl=QYDJ_RYXX.doModify();
			}else{
				RECID=SysUtility.getUUID20();
				QYDJ_RYXX.setRECID(RECID);
				bl=QYDJ_RYXX.doAdd();
			}
			if(bl){
				String NAME = QYDJ_RYXX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"NAME"));
				QYDJ_JBXX.setOPENO(OPENO);
				QYDJ_JBXX.doSelect();
				QYDJ_JBXX.setLEREP(NAME);
				QYDJ_JBXX.setPOSITION(QYDJ_RYXX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"POSITION")));
				QYDJ_YWSB.setOPENO(OPENO);
				QYDJ_YWSB.doSelect();
				QYDJ_YWSB.setLEREP(QYDJ_YWSB.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"NAME")));
				if(QYDJ_JBXX.doModify()&&QYDJ_YWSB.doModify()){
					//out.print(WeiActionUtil.errorReturn("数据保存成功!"));
					retMap.put("status", "1");
					retMap.put("RECID", RECID);
					JSONObject jsonObject = JSONObject.fromObject(retMap);
					out.print(jsonObject.toString());
				}else{
					out.print(WeiActionUtil.errorReturn("数据保存失败!"));
					return;
				}
			}else{
				out.print(WeiActionUtil.errorReturn("数据保存失败!"));
				return;
			}
			JSONObject jsonObject = JSONObject.fromObject(retMap);
			out.print(jsonObject.toString());
		}catch(SQLException e){
			e.printStackTrace();
			out.print(WeiActionUtil.errorReturn(e.getMessage()));
		}
	}
	
	public void djscySave(HttpServletRequest request,HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		try {
			String jsonStr=request.getParameter("jsonStr");
			jsonStr=new String(jsonStr.getBytes("ISO8859-1"),"GBK");
			QYDJ_RYXX_SQ QYDJ_RYXX=(QYDJ_RYXX_SQ)WeiActionUtil.json2pojo(jsonStr, QYDJ_RYXX_SQ.class);
			
			Map retMap=new HashMap();
			String action = SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"CZACTION"));
			String WSLX = SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"WSLX"));
			String RECID = SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"RECID"));
			String OPENO = SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"OPENO"));
			String LEREPSIGN=SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"LEREPSIGN"));
			
			String CERNO = SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"CERNO"));
			String CERTYPE = SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"CERTYPE"));
			String INAME = SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"NAME"));
			//List list_tzrs = QYDJ_RYXX.getList(" WHERE openo = '"+OPENO+"'");
			//for(int i = 0 ; i < list_tzrs.size(); i++){
			//	QYDJ_RYXX_SQ bean = (QYDJ_RYXX_SQ)list_tzrs.get(i);
			//	if(QYDJ_RYXX.getCERTYPE().equals(bean.getCERTYPE())
			//			&&QYDJ_RYXX.getCERNO().equals(bean.getCERNO())){
			///			if(!QYDJ_RYXX.getRECID().equals(bean.getRECID())){
			//				out.print(WeiActionUtil.errorReturn("同一个人员只能担任一种职务，请核查后再申请!"));
			//				return;
			//			}
			//	}
			//}
			
	//		if(OPETYPE.equals("20") || OPETYPE.equals("30")){
				if(!action.equals("")){
					GSYJXX yjxx=new GSYJXX();
					if(yjxx.checkRyHmd(CERNO,CERTYPE)){
						out.print(WeiActionUtil.errorReturn("提示:当前人员的在黑名单库中!"));
						return;
					}
					if(WSLX.equals("GS")||WSLX.equals("WZGS")||WSLX.equals("NZFR")||WSLX.equals("HZS")){
						if(yjxx.checkLaolai(INAME, CERNO)){
							out.print(WeiActionUtil.errorReturn("提示:当前人员在失信被执行人名单中!"));
							return;
						}
					}
				}
	//		}
				
			QYDJ_JBXX_SQ QYDJ_JBXX=new QYDJ_JBXX_SQ();
			if(action.equals("1"))//添加
			{  
				//int max =QYDJ_RYXX.getListMax(" where OPENO='"+OPENO+"'");
			    QYDJ_RYXX.setOPENO(OPENO);
			    RECID=SysUtility.getUUID20();
				QYDJ_RYXX.setRECID(RECID);
				if (QYDJ_RYXX.doAdd())
				{
					
				}			    
				else{
					out.print(WeiActionUtil.errorReturn("数据保存失败!"));
					return;
				}
				
			}
			else if(action.equals("2"))//修改
			{				
				if (QYDJ_RYXX.doModify()){
					
				}else{
					out.print(WeiActionUtil.errorReturn("数据保存失败!"));
					return;
				}
				
				if(LEREPSIGN.equals("1")){
					String NAME = QYDJ_RYXX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"NAME"));
					QYDJ_JBXX.setOPENO(OPENO);
					QYDJ_JBXX.setLEREP(NAME);
					QYDJ_JBXX.setPOSITION(QYDJ_RYXX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"POSITION")));
					QYDJ_JBXX.doModifyLerep();
				}
			}
			else if(action.equals("3"))//删除
			{
				if (QYDJ_RYXX.doDelete()){
					
		   		}else{
		   			out.print(WeiActionUtil.errorReturn("数据保存失败!"));
		   			return;
			    }
			}
			
			retMap.put("status", "1");
			
			
			JSONObject jsonObject = JSONObject.fromObject(retMap);
			out.print(jsonObject.toString());
			
		}catch(SQLException e){
			e.printStackTrace();
			out.print(WeiActionUtil.errorReturn(e.getMessage()));
		}	
	}
	
	public void czxxSave(HttpServletRequest request,HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		try {
			String jsonStr=request.getParameter("jsonStr");
			jsonStr=new String(jsonStr.getBytes("ISO8859-1"),"GBK");
			QYDJ_CZXX_SQ QYDJ_CZXX=(QYDJ_CZXX_SQ)WeiActionUtil.json2pojo(jsonStr, QYDJ_CZXX_SQ.class);
			
			Map retMap=new HashMap();
			
			String action = SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"CZACTION"));
			String OPETYPE = SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"OPETYPE"));
			
			String RECID = SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"RECID"));
			String OPENO = SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"OPENO"));
			String PRIPID = SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"PRIPID"));
			   
			//int max =QYDJ_CZXX.getListMax(" where OPENO='"+OPENO+"'");
		  //  String date = new SimpleDateFormat("yyyy-MM-dd").format(new java.sql.Date(new java.util.Date().getTime()));  //获取当前系统日期 
		  
		   boolean ifOnePerson = false;
		   if(!action.equals("3")){
			   GSYJXX yjxx=new GSYJXX();
			   QYDJ_JBXX_SQ qydj = new QYDJ_JBXX_SQ();
			   qydj.setOPENO(OPENO);
			   qydj.doSelect();
			   //变更企业类型后一人有限公司是否检查判断
			   if("30".equals(OPETYPE)){
				   QYDJ_BGSX_SQ bgsx = new QYDJ_BGSX_SQ();
				   bgsx.setALTITEM("04");
				   bgsx.setOPENO(OPENO);
				   ArrayList al = bgsx.getData();
				   if(al.size()>0){
					  	String[] ay=(String[])al.get(5);
					   if("1151".equals(ay[1])){
						   ifOnePerson = true;
					   }
				   }
			   }else{
				   if(qydj.getENTTYPE().equals("1151")){
					   ifOnePerson = true;
				   }
			   }
			   if(ifOnePerson){
			//		if(mcgl.getENTTYPE().equals("1150") 
			//				|| mcgl.getENTTYPE().equals("1151")
			//				|| mcgl.getENTTYPE().equals("1152")){}
					if(action.equals("2")||action.equals("1")){
						QYDJ_CZXX_SQ bean = null;
					
						bean = new QYDJ_CZXX_SQ();
						bean.setOPENO(OPENO);
						bean.setRECID(RECID);
						bean.doSelect();
					
						if(!bean.getCERNO().equals(QYDJ_CZXX.getCERNO())){
							if(yjxx.checkYrByRy(QYDJ_CZXX.getCERNO())){
								out.print(WeiActionUtil.errorReturn("姓名："+QYDJ_CZXX.getINV()+" 证件号码："+QYDJ_CZXX.getCERNO()+" 在一人有限公司库中，请核实后再申请!"));
								return;
							}
						}
					}
				}else{
					if(QYDJ_CZXX.getINVTYPE().startsWith("1")){
					//查询本地注销.吊销
						QYDJ_JBXX_ZS qydj_jbxx = new QYDJ_JBXX_ZS();
						List list = qydj_jbxx.getList(" WHERE regno = '"+QYDJ_CZXX.getBLICNO()+"' AND entstatus IN ('2','3')");
						if(list.size()>0){
							QYDJ_JBXX_ZS bean = (QYDJ_JBXX_ZS)list.get(0);
							String infoStr = "";
							if(bean.getENTSTATUS() == 2){
								if(bean.getREVDATE().equals("")){
									infoStr = " 已吊销,不再具备担任法人股东资格";
								}else{
									infoStr = " 已于"+bean.getREVDATE()+"吊销,不再具备担任法人股东资格";
								}
								out.print(WeiActionUtil.errorReturn("当前企业:"+bean.getENTNAME()+",注册号:"+bean.getREGNO()+infoStr));
							}else if(bean.getENTSTATUS() == 3){
								if(bean.getCANDATE().equals("")){
									infoStr = " 已注销,不再具备担任法人股东资格";
								}else{
									infoStr = " 已于"+bean.getCANDATE()+"注销,不再具备担任法人股东资格";
								}
								out.print(WeiActionUtil.errorReturn("当前企业:"+bean.getENTNAME()+",注册号:"+bean.getREGNO()+infoStr));
							}
							return;
						}
						if(yjxx.checkQyHmd(QYDJ_CZXX.getBLICNO())){
							out.print(WeiActionUtil.errorReturn("当前企业:"+QYDJ_CZXX.getINV()+",注册号:"+QYDJ_CZXX.getBLICNO()+" 在工商总局黑名单库中,不再具备担任法人股东资格!"));
							return;
						}
					}
				}
			   if(!QYDJ_CZXX.getCERTYPE().equals("")){
				   if(yjxx.checkGqdj(PRIPID,QYDJ_CZXX.getCERNO())){
						out.print(WeiActionUtil.errorReturn("提示:该投资人存在股权冻结记录!"));
						return;
					}
				   if(yjxx.checkGqcz(PRIPID,QYDJ_CZXX.getCERNO())){
						out.print(WeiActionUtil.errorReturn("提示:该投资人存在股权出质记录!"));
						return;
					}
			   }else{
				  	if(yjxx.checkGqdj(PRIPID,QYDJ_CZXX.getBLICNO())){
						out.print(WeiActionUtil.errorReturn("提示:该投资人存在股权冻结记录!"));	
						return;
					}
					if(yjxx.checkGqcz(PRIPID,QYDJ_CZXX.getBLICNO())){
							out.print(WeiActionUtil.errorReturn("提示:该投资人存在股权出质记录!"));	
							return;
					}
				}
			}
			
				if(action.equals("1"))//添加
				{  
			
				    QYDJ_CZXX.setOPENO(OPENO);
					QYDJ_CZXX.setRECID(SysUtility.getUUID20());
					if (QYDJ_CZXX.doAdd()){
						
					}else{
						out.print(WeiActionUtil.errorReturn("数据保存失败!"));
						return;
					}
					
				}
				else if(action.equals("2"))//修改
				{				
					if (QYDJ_CZXX.doModify()){
						
					}else{
						out.print(WeiActionUtil.errorReturn("数据保存失败!"));
						return;
					}
					
				}
				else if(action.equals("3"))//删除
				{

					if (QYDJ_CZXX.doDelete()){		
					
			   		}else{
					out.print(WeiActionUtil.errorReturn("数据保存失败!"));
					return;
				    }
				}
			
			
			retMap.put("status", "1");
			
			JSONObject jsonObject = JSONObject.fromObject(retMap);
			out.print(jsonObject.toString());
			
		}catch(SQLException e){
			e.printStackTrace();
			out.print(WeiActionUtil.errorReturn(e.getMessage()));
		}	
	}
	
			
	public void cwfzrSave(HttpServletRequest request,HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		try {
			String jsonStr=request.getParameter("jsonStr");
			jsonStr=new String(jsonStr.getBytes("ISO8859-1"),"GBK");
			Map retMap=new HashMap();
			String OPENO = SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"OPENO"));
			QYDJ_CWFZR_SQ QYDJ_CWFZR=(QYDJ_CWFZR_SQ)WeiActionUtil.json2pojo(jsonStr, QYDJ_CWFZR_SQ.class);
			if (QYDJ_CWFZR.doCount())
			{
				if (QYDJ_CWFZR.doModify()){
				  
				}else{
				   out.print(WeiActionUtil.errorReturn("修改失败!"));
				   return;
				}   
			}else
			{ 
					  
				if (QYDJ_CWFZR.doAdd()){	
					
				}else{
					out.print(WeiActionUtil.errorReturn("保存失败!"));
					return;
				}	
			}
		 
			retMap.put("status", "1");
			JSONObject jsonObject = JSONObject.fromObject(retMap);
			out.print(jsonObject.toString());
			
		}catch(SQLException e){
			e.printStackTrace();
			out.print(WeiActionUtil.errorReturn(e.getMessage()));
		}	
	}
	
	public void llySave(HttpServletRequest request,HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		try {
			Map retMap=new HashMap();
			String jsonStr=request.getParameter("jsonStr");
			QYDJ_WZLLR_SQ QYDJ_WZLLR=(QYDJ_WZLLR_SQ)WeiActionUtil.json2pojo(jsonStr, QYDJ_WZLLR_SQ.class);
			String OPENO = QYDJ_WZLLR.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"OPENO"));
			if (QYDJ_WZLLR.doCount())
			{
				if (QYDJ_WZLLR.doModify()){
				  //out.print(WeiActionUtil.errorReturn("数据保存成功!"));
				}else{
				   out.print(WeiActionUtil.errorReturn("修改失败!"));
				   return;
				}   
			}else
			{ 
					  
				if (QYDJ_WZLLR.doAdd()){	
					//out.print(WeiActionUtil.errorReturn("数据保存成功!"));
				}else{
					out.print(WeiActionUtil.errorReturn("保存失败!"));
					return;
				}	
			}
			retMap.put("status", "1");
			JSONObject jsonObject = JSONObject.fromObject(retMap);
			out.print(jsonObject.toString());
		}catch(SQLException e){
			e.printStackTrace();
		}	
	}
	public void xkxxSave(HttpServletRequest request,HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		try {
			Map retMap=new HashMap();
			String jsonStr=request.getParameter("jsonStr");
			jsonStr=new String(jsonStr.getBytes("ISO8859-1"),"GBK");
			QYDJ_XKXX_SQ QYDJ_XKXX=(QYDJ_XKXX_SQ)WeiActionUtil.json2pojo(jsonStr, QYDJ_XKXX_SQ.class);
			String action = QYDJ_XKXX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"CZACTION"));
			String RECID = QYDJ_XKXX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"RECID"));
			String OPENO = QYDJ_XKXX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"OPENO"));
			//int max =QYDJ_XKXX.getListMax(" where OPENO='"+OPENO+"'");
		 
				if(action.equals("1"))//添加
				{  		 
				    QYDJ_XKXX.setOPENO(OPENO);
					QYDJ_XKXX.setRECID(SysUtility.getUUID20());
					if (QYDJ_XKXX.doAdd())
					{
						
					}				    
					else{
						out.print(WeiActionUtil.errorReturn("数据保存失败!"));
						return;
					}
				}
				else if(action.equals("2"))//修改
				{				
					if (QYDJ_XKXX.doModify()){
						
					}
			   		else{
			   			out.print(WeiActionUtil.errorReturn("数据保存失败!"));
			   			return;
			   		}
					
				}
				else if(action.equals("3"))//删除
				{

					if (QYDJ_XKXX.doDelete()){
					
			   		}else{
						out.print(WeiActionUtil.errorReturn("数据保存失败!"));
						return;
				    }
				}	
				retMap.put("status", "1");
				JSONObject jsonObject = JSONObject.fromObject(retMap);
				out.print(jsonObject.toString());
		}catch(SQLException e){
			e.printStackTrace();
		}	
	}
	public void sqwtSave(HttpServletRequest request,HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		try {
			Map retMap=new HashMap();
			String jsonStr=request.getParameter("jsonStr");
			jsonStr=new String(jsonStr.getBytes("ISO8859-1"),"GBK");
			QYDJ_SQWT_SQ QYDJ_SQWT=(QYDJ_SQWT_SQ)WeiActionUtil.json2pojo(jsonStr, QYDJ_SQWT_SQ.class);
			String OPENO = QYDJ_SQWT.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"OPENO"));
			boolean bl=false;
			QYDJ_SQWT.setOPENO(OPENO);
			if(QYDJ_SQWT.doCount()){ 
			 bl=QYDJ_SQWT.doModify();
			}else{
				bl=QYDJ_SQWT.doAdd();
			}
			if (bl){
				//out.print(WeiActionUtil.errorReturn("保存成功!"));
			}else{
				out.print(WeiActionUtil.errorReturn("保存失败!"));
				return;
			}
			retMap.put("status", "1");
			JSONObject jsonObject = JSONObject.fromObject(retMap);
			out.print(jsonObject.toString());
		}catch(SQLException e){
			e.printStackTrace();
		}	
	}
	public void fjxxSave(HttpServletRequest request,HttpServletResponse response){
		try {
			PrintWriter out = response.getWriter();
			Map retMap=new HashMap();
			//String jsonStr=request.getParameter("jsonStr");
			//UPLOAD_FILE UPLOAD_FILE=(UPLOAD_FILE)WeiActionUtil.json2pojo(jsonStr, UPLOAD_FILE.class);
			//String OPENO = UPLOAD_FILE.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"OPENO"));
			//boolean bl=false;
			//UPLOAD_FILE.setOPENO(OPENO);
			//bl=UPLOAD_FILE.doAdd();
			
			UPLOAD_FILE UPLOAD_FILE=new UPLOAD_FILE();
			
			// 新建一个SmartUpload对象
			SmartUpload su = new SmartUpload();
			// 上传初始化
			//su.initialize(pageContext);
		
			su.setAllowedFilesList("rar,zip,jpg,gif,png,txt,doc,docx,xlsx,xls,tif,bmp,pdf,TIF,JPG,GIF,TXT,DOC,XLS,BMP,PDF");
			// 4.设定禁止上传的文件（通过扩展名限制）,禁止上传带有exe,bat,jsp,htm,html扩展名的文件和没有扩展名的文件。
			su.setDeniedFilesList("exe,bat,jsp,");
			su.upload();
			//取得业务编号、上传者用户名、文件说明，文件名，文件编号
			String OPENO = SysUtility.doPreProcess(su.getRequest()
					.getParameter("OPENO"));
			String FILENAME = SysUtility.doPreProcess(su.getRequest().getParameter("FILENAME"));
			// 逐一提取上传文件信息，同时可保存文件。
			com.jspsmart.upload.File file = su.getFiles().getFile(0);
			// 若文件不存在则继续
			if (file.isMissing())
				return;
			// 将文件另存	
			if (!file.isMissing()) {
				//取得用户上传时的文件名
				//String fname=file.getFileName();
				//取得上传文件的大小
				double size = file.getSize();
				size = size / 1024 / 1024;
				//System.out.println("size=" + size);
				int sizeLength=2;
				
				if (size > sizeLength) {
					out.print(SysUtility.setAlertScript("文件大于"+sizeLength+"M,上传失败!","parent.window.location.reload();"));
				} else {
					String filesize = Double.toString(size);
					UPLOAD_FILE.setFILESIZE(filesize);
					// 取得上传的文件后缀
					String ext = file.getFileExt();

					//  IPTIMESTAMP its = new IPTIMESTAMP(ip) ;
					IPTIMESTAMP its = new IPTIMESTAMP();
					String fileid = OPENO + "" + its.getIPTimeRand2() + "."+ ext;
					UPLOAD_FILE.setFILEID(fileid);
					// 保存文件
					//String fpath = this.getServletContext().getRealPath("/")+ "upload/";
					// 另存到以WEB应用程序的根目录为文件根目录的目录下
					//路径C:\Documents and Settings\Administrator\workspace\.metadata\.plugins\com.genuitec.eclipse.easie.tomcat.myeclipse\tomcat\webapps\wsdj\\upload
					//file.saveAs("/upload/"+fileid,su.SAVE_VIRTUAL);
			
					// 另存到操作系统的根目录为文件根目录的目录下
					//file.saveAs("d:\\upload\\"+fileid,su.SAVE_PHYSICAL); 
					file.saveAs("d:\\upload\\"+fileid,su.SAVE_PHYSICAL);
					//file.saveAs("/upload/" + fileid, SmartUpload.SAVE_VIRTUAL);

					// 根据ip+时间戳+三位随机数：
					String ip = "";
					
					UPLOAD_FILE.setOPENO(OPENO);
					//  UPLOAD_FILE.setATTACHPER(ATTACHPER);
					//   UPLOAD_FILE.setFILEDES(FILEDES);
					UPLOAD_FILE.setFILENAME(FILENAME);
					SimpleDateFormat sdf= new SimpleDateFormat("yyyy年MM月dd日");
					UPLOAD_FILE.setATTACHDATE(sdf.format(new Date()));
					UPLOAD_FILE.setWJBH(0);
					if (UPLOAD_FILE.doAdd()) {
						retMap.put("status", "1");
						JSONObject jsonObject = JSONObject.fromObject(retMap);
						out.print(jsonObject.toString());
					}else{
						out.print(WeiActionUtil.errorReturn("保存失败!"));
						return;
					}
			
				}
			}	
		}catch(IOException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	public void bgxxSave(HttpServletRequest request,HttpServletResponse response){
		try {
			PrintWriter out = response.getWriter();
			Map retMap=new HashMap();
			
			QYDJ_BGSX_SQ QYDJ_BGSX=new QYDJ_BGSX_SQ();
			MCGL_JBXX_ZS MCGL_JBXX=new MCGL_JBXX_ZS();
			QYDJ_YWSB_SQ QYDJ_YWSB=new QYDJ_YWSB_SQ();
			SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
			String today=sdf1.format(new java.sql.Date(new java.util.Date().getTime()));
			
			String jsonStr=request.getParameter("jsonStr");
			jsonStr=new String(jsonStr.getBytes("ISO8859-1"),"GBK");
			
			String OPENO=QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"OPENO"));
			String REGNO=QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"REGNO"));
			String PRIPID=QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"PRIPID"));
			String WSLX=QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"WSLX"));
			String OPETYPE=QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"OPETYPE"));
			String LOGINID=QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"LOGINID"));
			String ALTITEM0=QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"ALTITEM"));
			String[] sALTITEM=ALTITEM0.split(",");
			//String IFPROVINCENAME=QYDJ_BGSX.doPreProcess(request.getParameter("IFPROVINCENAME"));
			String sCDDL=QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"CDDL"));
			String ENTNAME="";
			String ENTNAMEBE="";
			String ip="";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");  
			Date date = new Date();
		   	int dateNum=Integer.parseInt(sdf.format(date));
		
		    String XZQH=WeiActionUtil.XZQH;
		    
		    String ALTBE02=QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"ALTBE02"));
		    String ALTBE16=QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"ALTBE16"));
		  //济南新增需求，配合事中事后双拆，业务系统增加地址判断，判断是否是违章建筑地址，如果是不允许设立登记
		  	if(XZQH.startsWith("3701") && !WSLX.equals("HZS") && !WSLX.equals("HZSFZ")){//农合的不判断
		  		//先判断原登记住所是否有值，是否属于违法建筑
		  		String dom="";
		  		if(ALTBE02!=null && ALTBE02!=""){
					dom=ALTBE02;
				}
		  		if(ALTBE16!=null && ALTBE16!=""){
					dom=ALTBE16;
				}
			  		String sql = "SELECT * FROM SZSH_XTJG_WZJZ WHERE ACTUALDOM='"+dom+"'";
			  		GsDbConnection gsdbc=new GsDbConnection();
					ResultSet rs = gsdbc.executeQuery(sql);
					if(rs.next()){
						out.print(WeiActionUtil.errorReturn("该登记地址已被列为违法违章建筑，不允许办理工商登记业务!"));
						return;
					
					}
		  		gsdbc.close();
		  	}
		  
			String jbxxSqlCsh="";
			String sqlRyxx="";
			boolean bl=false;
			boolean FrChange=false;
			boolean RyChange=false;
			boolean CzChange=false;
			boolean FgsChange=false;
			boolean LlyChange=false;
			boolean IfFirst=false;
			boolean CwfzrChange=false;
			if(OPENO.equals("")|| OPENO==null){//第一次保存，生成新的业务编号MB开头
				OPENO=SYS_BHBM.CREATEBH(2,WeiActionUtil.getJsonValueByKey(jsonStr,"REGORG"));
				retMap.put("OPENO", OPENO);
				IfFirst=true;
			}
			//删除原来的变更信息
			QYDJ_BGSX.setOPENO(OPENO);
			QYDJ_BGSX.doDeleteAll();	
			
			//循环遍历填写的变更事项
			for(int i=0;i<sALTITEM.length;i++){
				String ALTITEM=sALTITEM[i];
				String befor="ALTBE"+ALTITEM;
				String after="ALTAF"+ALTITEM;
				
				String ALTAFTER=QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,after));
				
				if(!ALTAFTER.equals("")){
					String jbmod=QYDJ_BGSX.doModifyJbxx(ALTITEM,ALTAFTER);
				
					if(!jbmod.equals("")){
						if(jbxxSqlCsh.equals("")){
							jbxxSqlCsh=jbmod;
						}else{
							jbxxSqlCsh+=","+jbmod;
						}
					}
					
					String rymod=QYDJ_BGSX.doModifyRyxx(ALTITEM,ALTAFTER);
					if(!rymod.equals("")){
						if(sqlRyxx.equals("")){
							sqlRyxx=rymod;
						}else{
							sqlRyxx+=","+rymod;
						}
					}
				}
				if(ALTITEM0.indexOf("01")>=0){	
					String str =QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"ALTAF01"));
					String strb = QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"ALTBE01"));
					ENTNAME=new String(str.getBytes("ISO8859-1"),"GBK");
					ENTNAMEBE=new String(strb.getBytes("ISO8859-1"),"GBK");
					StringBuffer sb = new StringBuffer();
					sb.append(" SELECT *                        ");
					sb.append("   FROM MCGL_JBXX_ZS             ");
					sb.append("  WHERE ENTNAME = '"+ENTNAME+"'  ");
					sb.append("  AND S_EXT_TIMESTAMP=(SELECT  MAX(S_EXT_TIMESTAMP) FROM MCGL_JBXX_ZS WHERE ENTNAME = '"+ENTNAME+"'  AND PRIPID='"+PRIPID+"')  ");
					sb.append(ContrInfo.getMczssql_dishi(WeiActionUtil.XZQH));
					MCGL_JBXX.doSelectBySql(sb.toString());		
					
				//if(MCGL_JBXX.getENTNAMEBEALT().equals(""))	
				if(!MCGL_JBXX.getNAMEID().equals("")){
					if(!(MCGL_JBXX.getENTNAMEBEALT().equals(ENTNAMEBE))){
						System.out.println(ENTNAMEBE);
						out.print(WeiActionUtil.errorReturn("该企业名称不是当前申请变更企业的变更名称！"));
						return;
					}
					if(!(MCGL_JBXX.getISENTNAMEALT()==1)){
						out.print(WeiActionUtil.errorReturn("该企业名称不是变更企业名称！"));
						return;
					}
					if(!(MCGL_JBXX.getNAMESTATUS()==2)){
						out.print(WeiActionUtil.errorReturn("该企业名称不是预核准企业名称！"));
						return;
					}
				
					int saveperto = Integer.parseInt(MCGL_JBXX.getSAVEPERTO().replaceAll("-", ""));	
				//	System.out.println(saveperto);
					if(saveperto<dateNum){
						out.print(WeiActionUtil.errorReturn("该企业名称已超出变更期限!"));
						return;
					}
				}
			}	
				
				
				//变更事项表数据保存
				QYDJ_BGSX.setOPENO(OPENO);
				QYDJ_BGSX.setALTAF(QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,after)));
				QYDJ_BGSX.setALTBE(QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,befor)));
				QYDJ_BGSX.setALTITEM(ALTITEM);
				QYDJ_BGSX.setALTDATE(today);
				QYDJ_BGSX.setPRIPID(PRIPID);
				QYDJ_BGSX.setREGNO(REGNO);
				bl=QYDJ_BGSX.doAdd();
				if(!bl){
					out.print(WeiActionUtil.errorReturn("变更信息添加失败!"));
					return;
				}
				
				if(!FrChange){
					QYDJ_BGSX.setFrChange(ALTITEM);
					FrChange=QYDJ_BGSX.getFrChange();
				}
				if(!RyChange){
					QYDJ_BGSX.setRyChange(ALTITEM);
					RyChange=QYDJ_BGSX.getRyChange();
				}
				if(!CzChange){			
					QYDJ_BGSX.setCzChange(ALTITEM);		
					CzChange=QYDJ_BGSX.getCzChange();
				}
				if(!FgsChange){			
					QYDJ_BGSX.setFgsChange(ALTITEM);		
					FgsChange=QYDJ_BGSX.getFgsChange();
				}
				if(!LlyChange){
					QYDJ_BGSX.setLlyChange(ALTITEM);		
					LlyChange=QYDJ_BGSX.getLlyChange();
				}
				if(!CwfzrChange){
					QYDJ_BGSX.setCwfzrChange(ALTITEM);		
					CwfzrChange=QYDJ_BGSX.getCwfzrChange();
				}
				if(ALTITEM.equals("02")){
					/*
					jbxxSqlCsh+=",PROVINCE="+SysUtility.doPreProcess3(SysUtility.convertCode(request.getParameter("ALTAF161")))+
							",CITY="+SysUtility.doPreProcess3(SysUtility.convertCode(request.getParameter("ALTAF162")))+
							",COUNTY="+SysUtility.doPreProcess3(SysUtility.convertCode(request.getParameter("ALTAF163")))+
							",TOWN="+SysUtility.doPreProcess3(SysUtility.convertCode(request.getParameter("ALTAF164")))+
							",VILLAGE="+SysUtility.doPreProcess3(SysUtility.convertCode(request.getParameter("ALTAF165")))+
							",HOUSENUMBER="+SysUtility.doPreProcess3(SysUtility.convertCode(request.getParameter("ALTAF166")));
					*/
					QYDJ_BGSX.setOPENO(OPENO);
					QYDJ_BGSX.setALTDATE(today);
					QYDJ_BGSX.setPRIPID(PRIPID);
					QYDJ_BGSX.setREGNO(REGNO);
					
					QYDJ_BGSX.setALTAF(QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"ALTAF161")));
					QYDJ_BGSX.setALTBE(QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"ALTBE161")));
					QYDJ_BGSX.setALTITEM("161");
					bl=QYDJ_BGSX.doAdd();
					
					QYDJ_BGSX.setALTAF(QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"ALTAF162")));
					QYDJ_BGSX.setALTBE(QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"ALTBE162")));
					QYDJ_BGSX.setALTITEM("162");
					bl=QYDJ_BGSX.doAdd();
					
					QYDJ_BGSX.setALTAF(QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"ALTAF163")));
					QYDJ_BGSX.setALTBE(QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"ALTBE163")));
					QYDJ_BGSX.setALTITEM("163");
					bl=QYDJ_BGSX.doAdd();
					
					QYDJ_BGSX.setALTAF(QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"ALTAF164")));
					QYDJ_BGSX.setALTBE(QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"ALTBE164")));
					QYDJ_BGSX.setALTITEM("164");
					bl=QYDJ_BGSX.doAdd();
					
					QYDJ_BGSX.setALTAF(QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"ALTAF165")));
					QYDJ_BGSX.setALTBE(QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"ALTBE165")));
					QYDJ_BGSX.setALTITEM("165");
					bl=QYDJ_BGSX.doAdd();
					
					QYDJ_BGSX.setALTAF(QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"ALTAF166")));
					QYDJ_BGSX.setALTBE(QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"ALTBE166")));
					QYDJ_BGSX.setALTITEM("166");
					bl=QYDJ_BGSX.doAdd();
				}
				if(!bl){
					out.print(WeiActionUtil.errorReturn("变更信息添加失败!"));
					return;
				}
			
			}
			
			
			//从内网导入企业的相关信息--第一次全部导入，以后根据变更事项导入
			if(IfFirst){		
				bl=QYDJ_BGSX.doZs2Lc(OPENO,PRIPID,WSLX,true,true,true,true,true);
				if(!bl){
					out.print(WeiActionUtil.errorReturn("正式库更新数据失败!"));
					return;
				}
			}else{
				bl=QYDJ_BGSX.doZs2Lc(OPENO,PRIPID,WSLX,!RyChange,!CzChange,!FgsChange,!LlyChange,!CwfzrChange);
			}
			
			String jbxxSql="UPDATE QYDJ_JBXX_SQ SET APPDATE=sysdate,OPETYPE='"+OPETYPE+"',STATUS='0',LOGINID='"
							+LOGINID+"',SPANAME='"+SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"SPANAME"))+"' ";
			if(!jbxxSqlCsh.equals("")){
				jbxxSql+=","+jbxxSqlCsh;
			}					
			jbxxSql+=" WHERE OPENO="+QYDJ_BGSX.doPreProcess3(OPENO);
				
			bl=QYDJ_BGSX.doModifyBySql(jbxxSql);
			if(!bl){
				out.print(WeiActionUtil.errorReturn("基本信息数据更新失败!"));
				return;
			}
			//更新人员信息
			if(!sqlRyxx.equals("")){
				bl=QYDJ_BGSX.doModifyBySql("UPDATE QYDJ_RYXX_SQ SET "+sqlRyxx+" WHERE OPENO="+QYDJ_BGSX.doPreProcess3(OPENO)+" AND LEREPSIGN='1'");
				if(!WSLX.equals("HHQY")){
					if(!bl){
						out.print(WeiActionUtil.errorReturn("法定代表人信息数据更新失败!"));
						return;
					}
				}
			}
			//外网业务申办表中插入一条记录
			QYDJ_YWSB.setOPENO(OPENO);	
			if(QYDJ_YWSB.doCount()){		
				bl=QYDJ_YWSB.doSql("UPDATE QYDJ_YWSB_SQ "
				+"SET (ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,JQIP,LOCALADM,OPELOCDISTRICT) "
				+"=(SELECT ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,'"
				+ip+"',LOCALADM,OPELOCDISTRICT FROM QYDJ_JBXX_SQ WHERE OPENO='"+OPENO+"') WHERE OPENO='"+OPENO+"'");		
			}else{
				bl=QYDJ_YWSB.doSql("INSERT INTO QYDJ_YWSB_SQ "
				+"(OPENO,PRIPID,UNISCID,OPETYPE,APPDATE,REGNO,ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,LOGINID,STATUS,JQIP,CDDL,LOCALADM,OPELOCDISTRICT) "
				+"SELECT OPENO,PRIPID,UNISCID,OPETYPE,APPDATE,REGNO,ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,LOGINID,'0','"
				+ip+"','"+sCDDL+"',LOCALADM,OPELOCDISTRICT FROM QYDJ_JBXX_SQ WHERE OPENO='"+OPENO+"'");
			}
			
				
		
			if(bl){	
				out.print(WeiActionUtil.errorReturn("保存成功!"));
			}
			else{
				out.print(WeiActionUtil.errorReturn("保存失败!"));
			}
			
		}catch(IOException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	public void zxxxSave(HttpServletRequest request,HttpServletResponse response){
		try {
			PrintWriter out = response.getWriter();
			Map retMap=new HashMap();
			
			String jsonStr=request.getParameter("jsonStr");
			jsonStr=new String(jsonStr.getBytes("ISO8859-1"),"GBK");
			
			QYDJ_ZXXX_SQ QYDJ_ZXXX=(QYDJ_ZXXX_SQ)WeiActionUtil.json2pojo(jsonStr, QYDJ_ZXXX_SQ.class);
			
			String LOGINID =SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"LOGINID"));
			
			QYDJ_BGSX_SQ QYDJ_BGSX=new QYDJ_BGSX_SQ();
			QYDJ_YWSB_SQ QYDJ_YWSB=new QYDJ_YWSB_SQ();
			
			//业务编号
			String OPENO=SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"OPENO"));
			//企业内部序号
			String PRIPID=SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"PRIPID"));
			String sCDDL=SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"CDDL"));
			boolean bl=false;
			String ip="";
		    
			if(OPENO.equals("")|| OPENO==null){//第一次保存，生成新的业务编号MB开头
				OPENO=SYS_BHBM.CREATEBH(2,SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"REGORG")));
				retMap.put("OPENO", OPENO);
				//首次保存需要将正式表的信息导入流程表中
				bl=QYDJ_BGSX.doZs2Lc(OPENO,PRIPID,"50",true,true,true,true,true);
				if(!bl){
					out.print(WeiActionUtil.errorReturn("正式库入流程库更新数据失败!"));
				}
			}
			
			//注销信息保存
			QYDJ_ZXXX.setOPENO(OPENO);
			if(QYDJ_ZXXX.doCount()){
				bl=QYDJ_ZXXX.doModify();
			}else{
				bl=QYDJ_ZXXX.doAdd();
			}
			if(!bl){
				out.print(WeiActionUtil.errorReturn("企业注销信息保存失败!"));
				return;
			}
			//更新企业基本信息的状态、申请时间等
			String jbxxSql="UPDATE QYDJ_JBXX_SQ SET APPDATE=sysdate,OPETYPE=50,STATUS='0',LOGINID='"+LOGINID
			+"',SPANAME='"+SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"SPANAME"))+"' WHERE OPENO="+QYDJ_BGSX.doPreProcess3(OPENO);	
			bl=QYDJ_YWSB.doSql(jbxxSql);
			if(!bl){
				out.print(WeiActionUtil.errorReturn("基本信息数据更新失败!"));
				return;
			}
			//业务申办信息
			QYDJ_YWSB.setOPENO(OPENO);	
			if(QYDJ_YWSB.doCount()){		
				bl=QYDJ_YWSB.doSql("UPDATE QYDJ_YWSB_SQ SET OPETYPE=50,JQIP='"+ip+"',APPDATE=sysdate WHERE OPENO='"+OPENO+"'");
			}else{		
				bl=QYDJ_YWSB.doSql("INSERT INTO QYDJ_YWSB_SQ "
				+"(OPENO,PRIPID,UNISCID,OPETYPE,APPDATE,REGNO,ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,LOGINID,STATUS,JQIP,CDDL,LOCALADM,OPELOCDISTRICT) "
				+"SELECT OPENO,PRIPID,UNISCID,OPETYPE,APPDATE,REGNO,ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,LOGINID,'0','"
				+ip+"','"+sCDDL+"',LOCALADM,OPELOCDISTRICT FROM QYDJ_JBXX_SQ WHERE OPENO='"+OPENO+"'");
			}	
			if(bl){
				retMap.put("status", "1");
				JSONObject jsonObject = JSONObject.fromObject(retMap);
				out.print(jsonObject.toString());
			}
			else{
				out.print(WeiActionUtil.errorReturn("业务申报数据保存失败!"));
				return;
			}
			
		}catch(IOException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}	
	}
	public void checkEnt(HttpServletRequest request,HttpServletResponse response){
		try {
			PrintWriter out = response.getWriter();
			Map retMap=new HashMap();
			
			String REGNO=SysUtility.doPreProcess(request.getParameter("REGNO"));	
			String CERNO=SysUtility.doPreProcess(SysUtility.convertCode(request.getParameter("CERNO")));	
			//String OPETYPE=SysUtility.doPreProcess(request.getParameter("OPETYPE"));
			//String XZQH=SysUtility.doPreProcess(request.getParameter("XZQH"));
			
			QYDJ_JBXX_ZS QYDJ_JBXX_ZS=new QYDJ_JBXX_ZS();
			QYDJ_CZXX_ZS QYDJ_CZXX_ZS=new QYDJ_CZXX_ZS();
			QYDJ_RYXX_ZS QYDJ_RYXX_ZS=new QYDJ_RYXX_ZS();
			SysDmUtil SysDmUtil=new SysDmUtil();
			
			String wheSql1=" AND REGNO='"+REGNO+"' ";
			String info="注册号";
			if(REGNO.length()==18){
				wheSql1=" AND UNISCID ='"+REGNO+"' ";
				info="社会信用代码";
			}
			QYDJ_JBXX_ZS.doSelectBySql("SELECT * FROM QYDJ_JBXX_ZS WHERE ENTSTATUS IN ('1','2') "+wheSql1+ContrInfo.getDjzssql_dishi(WeiActionUtil.SJ,WeiActionUtil.XZQH));
			String PRIPID=QYDJ_JBXX_ZS.getPRIPID();
			if(PRIPID.equals("")){
				out.print(WeiActionUtil.errorReturn(info+"不存在或当前企业已注吊销，请保证"+info+"的准确及完整性，并重新输入！"));
			       return;
			}
			String REGORG=QYDJ_JBXX_ZS.getREGORG();
			
			CHECK_INFO CHECKINFO =new CHECK_INFO();
			String wwywsbInfo=CHECKINFO.WW_YWSB_SQ(" WHERE STATUS NOT IN('4','5','11') "+wheSql1+" AND CDDL in ('1','3')");
			if(!wwywsbInfo.equals("")){
				out.print(WeiActionUtil.errorReturn(wwywsbInfo));
				return;
			}	
			/*if(OPETYPE.equals("30")){
				if(QYDJ_JBXX_ZS.getENTSTATUS()==2){
					//out.print(WeiActionUtil.errorReturn("当前企业已吊销！"));
					//return;
				}
			}*/
			String WSLX=SysDmUtil.getSysRemark("ENTTYPE", QYDJ_JBXX_ZS.getENTTYPE());      
			/*if(CDDL.equals("3")){
				if(!WSLX.equals("HZS") && !WSLX.equals("HZSFZ")){
					out.print(WeiActionUtil.errorReturn("当前企业不是农民专业合作社或合作社分支！"));
					return;
				}
			}else{
				if(WSLX.equals("HZS") || WSLX.equals("HZSFZ")){
					out.print(WeiActionUtil.errorReturn("当前企业是农民专业合作社或合作社分支！"));
					return;
				}
				if(OPETYPE.equals("40")){
					if(!WSLX.equals("GS")&&!WSLX.equals("NZFR")&&!WSLX.equals("WZGS")){
					    out.print(WeiActionUtil.errorReturn("当前企业不需要备案！"));
						return;
					}
				}
			}*/
			
			if(WSLX.equals("HHQY")){
				QYDJ_CZXX_ZS.doSelectBySql("SELECT * FROM QYDJ_CZXX_ZS WHERE PRIPID='"+PRIPID+"' AND EXEAFFSIGN	='1'");
				String CZNO=QYDJ_CZXX_ZS.getCERNO();
				if(CZNO.equals("")){
					CZNO=QYDJ_CZXX_ZS.getBLICNO();
				}
				if(! CERNO.equals(CZNO)){
					out.print(WeiActionUtil.errorReturn("执行事务合伙人的证件（照）号码与登记信息不一致，请检查！"));
					return;
				}
			}else{
				QYDJ_RYXX_ZS.setPRIPID(PRIPID);
				QYDJ_RYXX_ZS.doSelectByLEREPSIGN();
				if(! CERNO.equals(QYDJ_RYXX_ZS.getCERNO())){
					out.print(WeiActionUtil.errorReturn("法定代表人（负责人）的证件号码与登记信息不一致，请检查！"));
					return;
				}
			}
			retMap.put("WSLX", WSLX);
			retMap.put("PRIPID", PRIPID);
			retMap.put("SPANAME", CERNO);
			retMap.put("REGORG", REGORG);
			retMap.put("REGNO", REGNO);
			retMap.put("status", "1");
			JSONObject jsonObject = JSONObject.fromObject(retMap);
			out.print(jsonObject.toString());
			
		}catch(IOException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}	
	}
	
	/**
	 * 最后的提交接口：doSub  
		传递参数：{"OPENO":"37010521706060005","WSLX":"GS","OPETYPE":"20","LOGINID":"ceshi"}
		包括：OPENO（主键），WSLX（文书类型），OPETYPE（20设立，30变更、50注销），LOGINID（用户名）
	 * @param request
	 * @param response
	 */
	public void doSub(HttpServletRequest request,HttpServletResponse response){
		try {
			PrintWriter out = response.getWriter();
			Map retMap=new HashMap();
			
			String jsonStr=request.getParameter("jsonStr");
			jsonStr=new String(jsonStr.getBytes("ISO8859-1"),"GBK");
			String OPENO = SysUtility.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"OPENO"));
			String WSLX = SysUtility.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"WSLX"));
			String OPETYPE= SysUtility.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"OPETYPE"));
			String LOGINID= SysUtility.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"LOGINID"));
			boolean bl=false;
			QYDJ_YWSB_SQ ywsb=new QYDJ_YWSB_SQ();
			WSDJ_LOG_RECORD WSDJ_LOG_RECORD=new WSDJ_LOG_RECORD();
			QYDJ_JBXX_ZS QYDJ_JBXX_ZS=new QYDJ_JBXX_ZS();
			GTDJ_JBXX_ZS GTDJ_JBXX_ZS=new GTDJ_JBXX_ZS();
			if(!"GT".equals(WSLX)){
				int ywsbCount=ywsb.getColumnValueBySql("SELECT COUNT(*) FROM QYDJ_SQWT_SQ WHERE OPENO='"+OPENO+"'");
				if(ywsbCount==0){
					//out.print(WeiActionUtil.errorReturn("您尚未填写授权委托信息！"));
					//return;
				}
			}

			ywsb.setOPENO(OPENO);
			ywsb.doSelect();
			if(OPETYPE.equals("20")||OPETYPE.equals("30")){
				int  czr = ywsb.getColumnValueBySql("SELECT COUNT(*)  FROM  QYDJ_CZXX_SQ WHERE OPENO='"+OPENO+"'");
				if(WSLX.equals("GS")||WSLX.equals("WZGS")||WSLX.equals("WZHH")||WSLX.equals("HHQY")||WSLX.equals("NZFR")||WSLX.equals("HZS")){
					if(czr==0){
						//out.print(WeiActionUtil.errorReturn("请填写股东（投资人）信息！"));
						//return;
					}
				}
				String ent = ywsb.getENTTYPE();
				if("115".equals(ent.substring(0,3))){
					if(czr>1){
						out.print(WeiActionUtil.errorReturn("一人有限责任公司股东只能有1个！"));
						return;
					}	
				}	
			}

			String ip="";

			String ENTCLASS=ywsb.getENTCLASS();
			String REGORG=ywsb.getREGORG();
			String YSBH=ywsb.getYSBH();
			String ENTNAME=ywsb.getENTNAME();


			if(OPETYPE.equals("20")){
				int countNum=0;
				if(ENTCLASS.equals("5")){
					if(ENTNAME.indexOf("*")<0){
						countNum=GTDJ_JBXX_ZS.getListCount(" WHERE TRANAME='"+ENTNAME+"' AND STATUS='1' ");
					}		
				}else{
					countNum=QYDJ_JBXX_ZS.getListCount(" WHERE ENTNAME='"+ENTNAME+"' AND ENTSTATUS='1' ");
				}
				if(countNum>0){
					out.print(WeiActionUtil.errorReturn("当前企业已经成立，不能再次办理！"));	
					return;
				}
			}
			if(ywsb.getSTATUS().equals("3")){
				StringBuffer sqlstr=new StringBuffer("insert into qydj_ywsb_sq_ls ");
			    sqlstr.append("(OPENO,PRIPID,OPETYPE,APPFORM,LINKMAN,CERTYPE,CERNO,TEL,MOBTEL,APPDATE,");
			    sqlstr.append("APPOPIN,APPPER,APPRNO,APPROPIN,APPRPER,APPRDATE,REGNO,ENTNAME,LEREP,");
			   sqlstr.append("REGORG,STATUS,LOGINID,ENTTYPE,SUBDOC,REGORGN,JQIP,CLBSDD,DEPID,DEPNAME,");
			     sqlstr.append("APPRPID,CDDL,ENTCLASS,YSBH,OPELOCDISTRICT,LOCALADM,S_EXT_TIMESTAMP,UNISCID,RBSJ)");
			     sqlstr.append(" select  ");
			     sqlstr.append("OPENO,PRIPID,OPETYPE,APPFORM,LINKMAN,CERTYPE,CERNO,TEL,MOBTEL,APPDATE,");
			     sqlstr.append("APPOPIN,APPPER,APPRNO,APPROPIN,APPRPER,APPRDATE,REGNO,ENTNAME,LEREP,");
			     sqlstr.append("REGORG,STATUS,LOGINID,ENTTYPE,SUBDOC,REGORGN,JQIP,CLBSDD,DEPID,DEPNAME,");
			    sqlstr.append("APPRPID,CDDL,ENTCLASS,YSBH,OPELOCDISTRICT,LOCALADM,S_EXT_TIMESTAMP,UNISCID,sysdate");
			     sqlstr.append(" from qydj_ywsb_sq t where openo='"+OPENO+"'");
			    if(!ywsb.doSql(sqlstr.toString())){
			       out.print(WeiActionUtil.errorReturn("历史表添加数据失败!"));
			       return;
			    }
			}

			if(ywsb.getENTCLASS().equals("5")){
				bl=ywsb.doSql("UPDATE GTDJ_JBXX_SQ SET APPDATE=sysdate ,STATUS='1' WHERE OPENO='"+OPENO+"'");
			}else{
				bl=ywsb.doSql("UPDATE QYDJ_JBXX_SQ SET APPDATE=sysdate ,STATUS='1',YSBH='"+YSBH+"' WHERE OPENO='"+OPENO+"'");
			}
			if(!bl){
				out.print(WeiActionUtil.errorReturn("基本信息保存失败！"));
				return;
			}

			bl=ywsb.doSql("UPDATE QYDJ_YWSB_SQ SET APPDATE=sysdate,STATUS='1',YSBH='"+YSBH+"' WHERE OPENO='"+OPENO+"'");

			if(!bl){
				out.print(WeiActionUtil.errorReturn("业务申办保存失败！"));
				return;
			}
			
			bl=ywsb.doSql("insert into wsdj_czjl(openo,czlx,czry,czsj,jqip) values ('"+OPENO+"','1','"+LOGINID+"',sysdate,'"+ip+"')");
			if(!bl){
				out.print(WeiActionUtil.errorReturn("操作记录保存失败！"));
				return;
			}
			
			//数据保存后日志表记录日志
			WSDJ_LOG_RECORD.setLOGID(SysUtility.getUUID20());
			WSDJ_LOG_RECORD.setLINKNAME("微信网上登记提交审批环节");
			WSDJ_LOG_RECORD.setUSERID(LOGINID);
			WSDJ_LOG_RECORD.setOPENO(OPENO);
			WSDJ_LOG_RECORD.setUSERIP(ip);
			WSDJ_LOG_RECORD.setENTNAME(ywsb.getENTNAME());
			WSDJ_LOG_RECORD.setOPERNAME(ywsb.getLEREP());
			WSDJ_LOG_RECORD.doAdd();
			
			retMap.put("status", "1");
			JSONObject jsonObject = JSONObject.fromObject(retMap);
			out.print(jsonObject.toString());
			
		}catch(IOException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}	
	}
}
