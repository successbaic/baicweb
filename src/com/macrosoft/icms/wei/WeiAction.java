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
			//����Ǽ�
			if (ENTNAME.equals("****")) {

			} else {
				//�жϸû���ҵ������Ƿ����ڰ���
				CHECK_INFO CHECKINFO = new CHECK_INFO();
				String wwywsbInfo = CHECKINFO.WW_YWSB_SQ(" WHERE ENTNAME='"+ ENTNAME + "' AND STATUS NOT IN('4','5','11') AND CDDL in ('1','2','3') ");
				if (!wwywsbInfo.equals("")) {
					out.print(WeiActionUtil.errorReturn(wwywsbInfo));
					return;
				}
			}
			
			if ("1".equals(IFMC)) {//�����ƺ�׼		
				MCID = SysDmUtil.doPreProcess(SysDmUtil.convertCode(request.getParameter("mcid"))); //��� Ԥ�Ⱥ�׼֪ͨ���ĺ�
				//��ע��������в������ֲ�ѯ��ʽ����Ϊ����						
				String dMCID = "" + MCID + "";
				String checkSql = "SELECT * FROM MCGL_JBXX_ZS WHERE ENTNAME='"
						+ ENTNAME + "' AND NAMESTATUS = '2'"
						+ " AND apprno is not null"
						//+ " AND (apprno = '"+dMCID+"' OR apprno LIKE '%��"+dMCID+"��')"
						+ " AND saveperto IS NOT NULL"
						+ " AND saveperto >= sysdate ";
				if ("2".equals(gmlx)) {
					MCGL_JBXX_ZS.doSelectBySql(checkSql+ContrInfo.getMczssql_dishi(WeiActionUtil.XZQH));					
				} else if ("1".equals(gmlx)) {
					MCGL_JBXX_ZS.doSelectBySqlSJ(checkSql +ContrInfo.getMczssql_shengju(WeiActionUtil.SJ,WeiActionUtil.XZQH));
				} else if ("0".equals(gmlx)) {
					if(WeiActionUtil.SJ.startsWith("37")){
						String xx="ɽ��,����,�ൺ,�Ͳ�,��ׯ,��Ӫ,��̨,Ϋ��,����,̩��,����,����,����,����,����,�ĳ�,����,����";
						String[] xxs=xx.split(",");
						for(int i=0;i<xxs.length;i++){
							if(ENTNAME.indexOf(xxs[i])>-1){
								out.print(WeiActionUtil.errorReturn("���Ҿֺ������ܰ���������������¼������ư�����"+xxs[i]+"������������������뵽���̾��ֳ�����"));	
								return;
							}
						}
					}
				}
				
				if ("2".equals(gmlx) || "1".equals(gmlx)) {
					if (MCGL_JBXX_ZS.getENTNAME().equals("")) {
						out.print(WeiActionUtil.errorReturn("û�и��������ݣ���鿴�������͡�������Ϣ�Ƿ�¼����ȷ��"));
						return;
					} else {
						//System.out.println(MCGL_JBXX_ZS.getAPPRNO());
						if(MCGL_JBXX_ZS.getENTCAT().equals("8")){
							if (MCGL_JBXX_ZS.getAPPRNO().indexOf(dMCID+"��") < 0) {
								{
									out.print(WeiActionUtil.errorReturn("����������Ԥ�Ⱥ�׼֪ͨ���ĺŲ�ƥ�䣡"));
									return;
								}
							}
						}else{
							if (MCGL_JBXX_ZS.getAPPRNO().indexOf("��"+dMCID+"��") < 0) {
								{
									out.print(WeiActionUtil.errorReturn("����������Ԥ�Ⱥ�׼֪ͨ���ĺŲ�ƥ�䣡"));
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
				
			} else {//�����ƺ�׼	
				ENTCLASS = request.getParameter("ENTCLASS");
				if(!"5".equals(ENTCLASS)){
					//�ж������Ƿ�ռ��
					boolean isUsed = CHECK_INFO.validateEntname(ENTNAME);
					if(isUsed){
						out.print(WeiActionUtil.errorReturn("�������Ѿ���ռ�ã��������ⶨ���ƣ�"));	
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
				out.print(WeiActionUtil.errorReturn("��ǰ��ҵ�Ѿ������������ٴΰ���"));	
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
	    
		if(OPENO.equals("")|| OPENO==null){//��һ�α��棬�����µ�ҵ����MB��ͷ
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
			out.print(WeiActionUtil.errorReturn("ҳ��¼����Ϣ����������ʹ��IE���������ر�����������²�������ϵϵͳ����Ա!"));
			return;
		}

		//��������������������º�˫��ҵ��ϵͳ���ӵ�ַ�жϣ��ж��Ƿ���Υ�½�����ַ������ǲ����������Ǽ�
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
				out.print(WeiActionUtil.errorReturn("�õǼǵ�ַ�ѱ���ΪΥ��Υ�½���������������̵Ǽ�ҵ��!"));
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
			out.print(WeiActionUtil.errorReturn("������Ϣ����ʧ��!"));
			return;
		}
		
		if(!bl){
			out.print(WeiActionUtil.errorReturn("��������ƽ̨_������Ϣ����ʧ��!"));
			return;
		}
		if(ifFirst && !MCXH.equals("")){
			String GMLX=SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"GMLX"));
			QYDJ_YWSB.doSql("insert into qydj_czxx_sq (OPENO,RECID,PRIPID,INVID,INV,INVTYPE,CERTYPE,CERNO,BLICTYPE,BLICNO,SUBCONAM,SUBCONPROP,COUNTRY,SUBCONAMUSD,CURRENCY) select '"+
					OPENO+"',RECID,'"+PRIPID+"',INVID,INV,INVTYPE,CERTYPE,CERNO,BLICTYPE,BLICNO,SUBCONAM,CONPROP,COUNTRY,SUBCONAMUSD,CURRENCY from mcgl_tzrxx_zs@gs_link where nameid='"+MCXH+"'");
			if(XZQH.equals("3701")){
				//��ʱ�������й�ʡ����ȡ��ʽ
				if(GMLX.equals("1")){
					QYDJ_YWSB.doSql("insert into qydj_czxx_sq (OPENO,RECID,PRIPID,INVID,INV,INVTYPE,CERTYPE,CERNO,BLICTYPE,BLICNO,SUBCONAM,SUBCONPROP,COUNTRY,SUBCONAMUSD,CURRENCY) select '"+
					OPENO+"',RECID,'"+PRIPID+"',INVID,INV,INVTYPE,CERTYPE,CERNO,BLICTYPE,BLICNO,SUBCONAM,CONPROP,COUNTRY,SUBCONAMUSD,CURRENCY from mcgl_tzrxx_zs@sgs_link where nameid='"+MCXH+"'");
				}
			}		
		}
		//�ѻ�����Ϣ���з���������ͬ������Ա��Ϣ����
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
			out.print(WeiActionUtil.errorReturn("���������˱���ʧ��!"));
			return;
		}
		//��������ʷ���ͬ����Ϣ�����ʳ��ʱ��У����ܲ��ţ�
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
			out.print(WeiActionUtil.errorReturn("���ܵ�λ����ʧ��!"));
			return;
		}
		//����ҵ�������в���һ����¼
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
			out.print(WeiActionUtil.errorReturn("ҵ���걨���ݱ���ʧ��!"));
			return;
		}
		
		if(bl){
			//out.print(WeiActionUtil.errorReturn("���ݱ���ɹ�!"));
			retMap.put("status", "1");
		}
		else{
			out.print(WeiActionUtil.errorReturn("��������ƽ̨_ҵ���걨���ݱ���ʧ��!"));
			return;
		}
		//���ݱ������־���¼��־
		WSDJ_LOG_RECORD.setLOGID(SysUtility.getUUID20());
		WSDJ_LOG_RECORD.setLINKNAME("΢�����ϵǼ���ҵ������Ϣ���滷��");
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
					out.print(WeiActionUtil.errorReturn("��ǰ��Ա�����֤�����ں���������!"));
					return;
				}
				if(WSLX.equals("GS")||WSLX.equals("WZGS")||WSLX.equals("NZFR")||WSLX.equals("HZS")){
					if(yjxx.checkLaolai(INAME, CERNO)){
						out.print(WeiActionUtil.errorReturn("��ʾ:��ǰ��Ա��ʧ�ű�ִ����������!"));
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
					//out.print(WeiActionUtil.errorReturn("���ݱ���ɹ�!"));
					retMap.put("status", "1");
					retMap.put("RECID", RECID);
					JSONObject jsonObject = JSONObject.fromObject(retMap);
					out.print(jsonObject.toString());
				}else{
					out.print(WeiActionUtil.errorReturn("���ݱ���ʧ��!"));
					return;
				}
			}else{
				out.print(WeiActionUtil.errorReturn("���ݱ���ʧ��!"));
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
			//				out.print(WeiActionUtil.errorReturn("ͬһ����Աֻ�ܵ���һ��ְ����˲��������!"));
			//				return;
			//			}
			//	}
			//}
			
	//		if(OPETYPE.equals("20") || OPETYPE.equals("30")){
				if(!action.equals("")){
					GSYJXX yjxx=new GSYJXX();
					if(yjxx.checkRyHmd(CERNO,CERTYPE)){
						out.print(WeiActionUtil.errorReturn("��ʾ:��ǰ��Ա���ں���������!"));
						return;
					}
					if(WSLX.equals("GS")||WSLX.equals("WZGS")||WSLX.equals("NZFR")||WSLX.equals("HZS")){
						if(yjxx.checkLaolai(INAME, CERNO)){
							out.print(WeiActionUtil.errorReturn("��ʾ:��ǰ��Ա��ʧ�ű�ִ����������!"));
							return;
						}
					}
				}
	//		}
				
			QYDJ_JBXX_SQ QYDJ_JBXX=new QYDJ_JBXX_SQ();
			if(action.equals("1"))//���
			{  
				//int max =QYDJ_RYXX.getListMax(" where OPENO='"+OPENO+"'");
			    QYDJ_RYXX.setOPENO(OPENO);
			    RECID=SysUtility.getUUID20();
				QYDJ_RYXX.setRECID(RECID);
				if (QYDJ_RYXX.doAdd())
				{
					
				}			    
				else{
					out.print(WeiActionUtil.errorReturn("���ݱ���ʧ��!"));
					return;
				}
				
			}
			else if(action.equals("2"))//�޸�
			{				
				if (QYDJ_RYXX.doModify()){
					
				}else{
					out.print(WeiActionUtil.errorReturn("���ݱ���ʧ��!"));
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
			else if(action.equals("3"))//ɾ��
			{
				if (QYDJ_RYXX.doDelete()){
					
		   		}else{
		   			out.print(WeiActionUtil.errorReturn("���ݱ���ʧ��!"));
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
		  //  String date = new SimpleDateFormat("yyyy-MM-dd").format(new java.sql.Date(new java.util.Date().getTime()));  //��ȡ��ǰϵͳ���� 
		  
		   boolean ifOnePerson = false;
		   if(!action.equals("3")){
			   GSYJXX yjxx=new GSYJXX();
			   QYDJ_JBXX_SQ qydj = new QYDJ_JBXX_SQ();
			   qydj.setOPENO(OPENO);
			   qydj.doSelect();
			   //�����ҵ���ͺ�һ�����޹�˾�Ƿ����ж�
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
								out.print(WeiActionUtil.errorReturn("������"+QYDJ_CZXX.getINV()+" ֤�����룺"+QYDJ_CZXX.getCERNO()+" ��һ�����޹�˾���У����ʵ��������!"));
								return;
							}
						}
					}
				}else{
					if(QYDJ_CZXX.getINVTYPE().startsWith("1")){
					//��ѯ����ע��.����
						QYDJ_JBXX_ZS qydj_jbxx = new QYDJ_JBXX_ZS();
						List list = qydj_jbxx.getList(" WHERE regno = '"+QYDJ_CZXX.getBLICNO()+"' AND entstatus IN ('2','3')");
						if(list.size()>0){
							QYDJ_JBXX_ZS bean = (QYDJ_JBXX_ZS)list.get(0);
							String infoStr = "";
							if(bean.getENTSTATUS() == 2){
								if(bean.getREVDATE().equals("")){
									infoStr = " �ѵ���,���پ߱����η��˹ɶ��ʸ�";
								}else{
									infoStr = " ����"+bean.getREVDATE()+"����,���پ߱����η��˹ɶ��ʸ�";
								}
								out.print(WeiActionUtil.errorReturn("��ǰ��ҵ:"+bean.getENTNAME()+",ע���:"+bean.getREGNO()+infoStr));
							}else if(bean.getENTSTATUS() == 3){
								if(bean.getCANDATE().equals("")){
									infoStr = " ��ע��,���پ߱����η��˹ɶ��ʸ�";
								}else{
									infoStr = " ����"+bean.getCANDATE()+"ע��,���پ߱����η��˹ɶ��ʸ�";
								}
								out.print(WeiActionUtil.errorReturn("��ǰ��ҵ:"+bean.getENTNAME()+",ע���:"+bean.getREGNO()+infoStr));
							}
							return;
						}
						if(yjxx.checkQyHmd(QYDJ_CZXX.getBLICNO())){
							out.print(WeiActionUtil.errorReturn("��ǰ��ҵ:"+QYDJ_CZXX.getINV()+",ע���:"+QYDJ_CZXX.getBLICNO()+" �ڹ����ֺܾ���������,���پ߱����η��˹ɶ��ʸ�!"));
							return;
						}
					}
				}
			   if(!QYDJ_CZXX.getCERTYPE().equals("")){
				   if(yjxx.checkGqdj(PRIPID,QYDJ_CZXX.getCERNO())){
						out.print(WeiActionUtil.errorReturn("��ʾ:��Ͷ���˴��ڹ�Ȩ�����¼!"));
						return;
					}
				   if(yjxx.checkGqcz(PRIPID,QYDJ_CZXX.getCERNO())){
						out.print(WeiActionUtil.errorReturn("��ʾ:��Ͷ���˴��ڹ�Ȩ���ʼ�¼!"));
						return;
					}
			   }else{
				  	if(yjxx.checkGqdj(PRIPID,QYDJ_CZXX.getBLICNO())){
						out.print(WeiActionUtil.errorReturn("��ʾ:��Ͷ���˴��ڹ�Ȩ�����¼!"));	
						return;
					}
					if(yjxx.checkGqcz(PRIPID,QYDJ_CZXX.getBLICNO())){
							out.print(WeiActionUtil.errorReturn("��ʾ:��Ͷ���˴��ڹ�Ȩ���ʼ�¼!"));	
							return;
					}
				}
			}
			
				if(action.equals("1"))//���
				{  
			
				    QYDJ_CZXX.setOPENO(OPENO);
					QYDJ_CZXX.setRECID(SysUtility.getUUID20());
					if (QYDJ_CZXX.doAdd()){
						
					}else{
						out.print(WeiActionUtil.errorReturn("���ݱ���ʧ��!"));
						return;
					}
					
				}
				else if(action.equals("2"))//�޸�
				{				
					if (QYDJ_CZXX.doModify()){
						
					}else{
						out.print(WeiActionUtil.errorReturn("���ݱ���ʧ��!"));
						return;
					}
					
				}
				else if(action.equals("3"))//ɾ��
				{

					if (QYDJ_CZXX.doDelete()){		
					
			   		}else{
					out.print(WeiActionUtil.errorReturn("���ݱ���ʧ��!"));
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
				   out.print(WeiActionUtil.errorReturn("�޸�ʧ��!"));
				   return;
				}   
			}else
			{ 
					  
				if (QYDJ_CWFZR.doAdd()){	
					
				}else{
					out.print(WeiActionUtil.errorReturn("����ʧ��!"));
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
				  //out.print(WeiActionUtil.errorReturn("���ݱ���ɹ�!"));
				}else{
				   out.print(WeiActionUtil.errorReturn("�޸�ʧ��!"));
				   return;
				}   
			}else
			{ 
					  
				if (QYDJ_WZLLR.doAdd()){	
					//out.print(WeiActionUtil.errorReturn("���ݱ���ɹ�!"));
				}else{
					out.print(WeiActionUtil.errorReturn("����ʧ��!"));
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
		 
				if(action.equals("1"))//���
				{  		 
				    QYDJ_XKXX.setOPENO(OPENO);
					QYDJ_XKXX.setRECID(SysUtility.getUUID20());
					if (QYDJ_XKXX.doAdd())
					{
						
					}				    
					else{
						out.print(WeiActionUtil.errorReturn("���ݱ���ʧ��!"));
						return;
					}
				}
				else if(action.equals("2"))//�޸�
				{				
					if (QYDJ_XKXX.doModify()){
						
					}
			   		else{
			   			out.print(WeiActionUtil.errorReturn("���ݱ���ʧ��!"));
			   			return;
			   		}
					
				}
				else if(action.equals("3"))//ɾ��
				{

					if (QYDJ_XKXX.doDelete()){
					
			   		}else{
						out.print(WeiActionUtil.errorReturn("���ݱ���ʧ��!"));
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
				//out.print(WeiActionUtil.errorReturn("����ɹ�!"));
			}else{
				out.print(WeiActionUtil.errorReturn("����ʧ��!"));
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
			
			// �½�һ��SmartUpload����
			SmartUpload su = new SmartUpload();
			// �ϴ���ʼ��
			//su.initialize(pageContext);
		
			su.setAllowedFilesList("rar,zip,jpg,gif,png,txt,doc,docx,xlsx,xls,tif,bmp,pdf,TIF,JPG,GIF,TXT,DOC,XLS,BMP,PDF");
			// 4.�趨��ֹ�ϴ����ļ���ͨ����չ�����ƣ�,��ֹ�ϴ�����exe,bat,jsp,htm,html��չ�����ļ���û����չ�����ļ���
			su.setDeniedFilesList("exe,bat,jsp,");
			su.upload();
			//ȡ��ҵ���š��ϴ����û������ļ�˵�����ļ������ļ����
			String OPENO = SysUtility.doPreProcess(su.getRequest()
					.getParameter("OPENO"));
			String FILENAME = SysUtility.doPreProcess(su.getRequest().getParameter("FILENAME"));
			// ��һ��ȡ�ϴ��ļ���Ϣ��ͬʱ�ɱ����ļ���
			com.jspsmart.upload.File file = su.getFiles().getFile(0);
			// ���ļ������������
			if (file.isMissing())
				return;
			// ���ļ����	
			if (!file.isMissing()) {
				//ȡ���û��ϴ�ʱ���ļ���
				//String fname=file.getFileName();
				//ȡ���ϴ��ļ��Ĵ�С
				double size = file.getSize();
				size = size / 1024 / 1024;
				//System.out.println("size=" + size);
				int sizeLength=2;
				
				if (size > sizeLength) {
					out.print(SysUtility.setAlertScript("�ļ�����"+sizeLength+"M,�ϴ�ʧ��!","parent.window.location.reload();"));
				} else {
					String filesize = Double.toString(size);
					UPLOAD_FILE.setFILESIZE(filesize);
					// ȡ���ϴ����ļ���׺
					String ext = file.getFileExt();

					//  IPTIMESTAMP its = new IPTIMESTAMP(ip) ;
					IPTIMESTAMP its = new IPTIMESTAMP();
					String fileid = OPENO + "" + its.getIPTimeRand2() + "."+ ext;
					UPLOAD_FILE.setFILEID(fileid);
					// �����ļ�
					//String fpath = this.getServletContext().getRealPath("/")+ "upload/";
					// ��浽��WEBӦ�ó���ĸ�Ŀ¼Ϊ�ļ���Ŀ¼��Ŀ¼��
					//·��C:\Documents and Settings\Administrator\workspace\.metadata\.plugins\com.genuitec.eclipse.easie.tomcat.myeclipse\tomcat\webapps\wsdj\\upload
					//file.saveAs("/upload/"+fileid,su.SAVE_VIRTUAL);
			
					// ��浽����ϵͳ�ĸ�Ŀ¼Ϊ�ļ���Ŀ¼��Ŀ¼��
					//file.saveAs("d:\\upload\\"+fileid,su.SAVE_PHYSICAL); 
					file.saveAs("d:\\upload\\"+fileid,su.SAVE_PHYSICAL);
					//file.saveAs("/upload/" + fileid, SmartUpload.SAVE_VIRTUAL);

					// ����ip+ʱ���+��λ�������
					String ip = "";
					
					UPLOAD_FILE.setOPENO(OPENO);
					//  UPLOAD_FILE.setATTACHPER(ATTACHPER);
					//   UPLOAD_FILE.setFILEDES(FILEDES);
					UPLOAD_FILE.setFILENAME(FILENAME);
					SimpleDateFormat sdf= new SimpleDateFormat("yyyy��MM��dd��");
					UPLOAD_FILE.setATTACHDATE(sdf.format(new Date()));
					UPLOAD_FILE.setWJBH(0);
					if (UPLOAD_FILE.doAdd()) {
						retMap.put("status", "1");
						JSONObject jsonObject = JSONObject.fromObject(retMap);
						out.print(jsonObject.toString());
					}else{
						out.print(WeiActionUtil.errorReturn("����ʧ��!"));
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
		  //��������������������º�˫��ҵ��ϵͳ���ӵ�ַ�жϣ��ж��Ƿ���Υ�½�����ַ������ǲ����������Ǽ�
		  	if(XZQH.startsWith("3701") && !WSLX.equals("HZS") && !WSLX.equals("HZSFZ")){//ũ�ϵĲ��ж�
		  		//���ж�ԭ�Ǽ�ס���Ƿ���ֵ���Ƿ�����Υ������
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
						out.print(WeiActionUtil.errorReturn("�õǼǵ�ַ�ѱ���ΪΥ��Υ�½���������������̵Ǽ�ҵ��!"));
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
			if(OPENO.equals("")|| OPENO==null){//��һ�α��棬�����µ�ҵ����MB��ͷ
				OPENO=SYS_BHBM.CREATEBH(2,WeiActionUtil.getJsonValueByKey(jsonStr,"REGORG"));
				retMap.put("OPENO", OPENO);
				IfFirst=true;
			}
			//ɾ��ԭ���ı����Ϣ
			QYDJ_BGSX.setOPENO(OPENO);
			QYDJ_BGSX.doDeleteAll();	
			
			//ѭ��������д�ı������
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
						out.print(WeiActionUtil.errorReturn("����ҵ���Ʋ��ǵ�ǰ��������ҵ�ı�����ƣ�"));
						return;
					}
					if(!(MCGL_JBXX.getISENTNAMEALT()==1)){
						out.print(WeiActionUtil.errorReturn("����ҵ���Ʋ��Ǳ����ҵ���ƣ�"));
						return;
					}
					if(!(MCGL_JBXX.getNAMESTATUS()==2)){
						out.print(WeiActionUtil.errorReturn("����ҵ���Ʋ���Ԥ��׼��ҵ���ƣ�"));
						return;
					}
				
					int saveperto = Integer.parseInt(MCGL_JBXX.getSAVEPERTO().replaceAll("-", ""));	
				//	System.out.println(saveperto);
					if(saveperto<dateNum){
						out.print(WeiActionUtil.errorReturn("����ҵ�����ѳ����������!"));
						return;
					}
				}
			}	
				
				
				//�����������ݱ���
				QYDJ_BGSX.setOPENO(OPENO);
				QYDJ_BGSX.setALTAF(QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,after)));
				QYDJ_BGSX.setALTBE(QYDJ_BGSX.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,befor)));
				QYDJ_BGSX.setALTITEM(ALTITEM);
				QYDJ_BGSX.setALTDATE(today);
				QYDJ_BGSX.setPRIPID(PRIPID);
				QYDJ_BGSX.setREGNO(REGNO);
				bl=QYDJ_BGSX.doAdd();
				if(!bl){
					out.print(WeiActionUtil.errorReturn("�����Ϣ���ʧ��!"));
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
					out.print(WeiActionUtil.errorReturn("�����Ϣ���ʧ��!"));
					return;
				}
			
			}
			
			
			//������������ҵ�������Ϣ--��һ��ȫ�����룬�Ժ���ݱ�������
			if(IfFirst){		
				bl=QYDJ_BGSX.doZs2Lc(OPENO,PRIPID,WSLX,true,true,true,true,true);
				if(!bl){
					out.print(WeiActionUtil.errorReturn("��ʽ���������ʧ��!"));
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
				out.print(WeiActionUtil.errorReturn("������Ϣ���ݸ���ʧ��!"));
				return;
			}
			//������Ա��Ϣ
			if(!sqlRyxx.equals("")){
				bl=QYDJ_BGSX.doModifyBySql("UPDATE QYDJ_RYXX_SQ SET "+sqlRyxx+" WHERE OPENO="+QYDJ_BGSX.doPreProcess3(OPENO)+" AND LEREPSIGN='1'");
				if(!WSLX.equals("HHQY")){
					if(!bl){
						out.print(WeiActionUtil.errorReturn("������������Ϣ���ݸ���ʧ��!"));
						return;
					}
				}
			}
			//����ҵ�������в���һ����¼
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
				out.print(WeiActionUtil.errorReturn("����ɹ�!"));
			}
			else{
				out.print(WeiActionUtil.errorReturn("����ʧ��!"));
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
			
			//ҵ����
			String OPENO=SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"OPENO"));
			//��ҵ�ڲ����
			String PRIPID=SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"PRIPID"));
			String sCDDL=SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"CDDL"));
			boolean bl=false;
			String ip="";
		    
			if(OPENO.equals("")|| OPENO==null){//��һ�α��棬�����µ�ҵ����MB��ͷ
				OPENO=SYS_BHBM.CREATEBH(2,SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"REGORG")));
				retMap.put("OPENO", OPENO);
				//�״α�����Ҫ����ʽ�����Ϣ�������̱���
				bl=QYDJ_BGSX.doZs2Lc(OPENO,PRIPID,"50",true,true,true,true,true);
				if(!bl){
					out.print(WeiActionUtil.errorReturn("��ʽ�������̿��������ʧ��!"));
				}
			}
			
			//ע����Ϣ����
			QYDJ_ZXXX.setOPENO(OPENO);
			if(QYDJ_ZXXX.doCount()){
				bl=QYDJ_ZXXX.doModify();
			}else{
				bl=QYDJ_ZXXX.doAdd();
			}
			if(!bl){
				out.print(WeiActionUtil.errorReturn("��ҵע����Ϣ����ʧ��!"));
				return;
			}
			//������ҵ������Ϣ��״̬������ʱ���
			String jbxxSql="UPDATE QYDJ_JBXX_SQ SET APPDATE=sysdate,OPETYPE=50,STATUS='0',LOGINID='"+LOGINID
			+"',SPANAME='"+SysDmUtil.doPreProcess(WeiActionUtil.getJsonValueByKey(jsonStr,"SPANAME"))+"' WHERE OPENO="+QYDJ_BGSX.doPreProcess3(OPENO);	
			bl=QYDJ_YWSB.doSql(jbxxSql);
			if(!bl){
				out.print(WeiActionUtil.errorReturn("������Ϣ���ݸ���ʧ��!"));
				return;
			}
			//ҵ�������Ϣ
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
				out.print(WeiActionUtil.errorReturn("ҵ���걨���ݱ���ʧ��!"));
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
			String info="ע���";
			if(REGNO.length()==18){
				wheSql1=" AND UNISCID ='"+REGNO+"' ";
				info="������ô���";
			}
			QYDJ_JBXX_ZS.doSelectBySql("SELECT * FROM QYDJ_JBXX_ZS WHERE ENTSTATUS IN ('1','2') "+wheSql1+ContrInfo.getDjzssql_dishi(WeiActionUtil.SJ,WeiActionUtil.XZQH));
			String PRIPID=QYDJ_JBXX_ZS.getPRIPID();
			if(PRIPID.equals("")){
				out.print(WeiActionUtil.errorReturn(info+"�����ڻ�ǰ��ҵ��ע�������뱣֤"+info+"��׼ȷ�������ԣ����������룡"));
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
					//out.print(WeiActionUtil.errorReturn("��ǰ��ҵ�ѵ�����"));
					//return;
				}
			}*/
			String WSLX=SysDmUtil.getSysRemark("ENTTYPE", QYDJ_JBXX_ZS.getENTTYPE());      
			/*if(CDDL.equals("3")){
				if(!WSLX.equals("HZS") && !WSLX.equals("HZSFZ")){
					out.print(WeiActionUtil.errorReturn("��ǰ��ҵ����ũ��רҵ�������������֧��"));
					return;
				}
			}else{
				if(WSLX.equals("HZS") || WSLX.equals("HZSFZ")){
					out.print(WeiActionUtil.errorReturn("��ǰ��ҵ��ũ��רҵ�������������֧��"));
					return;
				}
				if(OPETYPE.equals("40")){
					if(!WSLX.equals("GS")&&!WSLX.equals("NZFR")&&!WSLX.equals("WZGS")){
					    out.print(WeiActionUtil.errorReturn("��ǰ��ҵ����Ҫ������"));
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
					out.print(WeiActionUtil.errorReturn("ִ������ϻ��˵�֤�����գ�������Ǽ���Ϣ��һ�£����飡"));
					return;
				}
			}else{
				QYDJ_RYXX_ZS.setPRIPID(PRIPID);
				QYDJ_RYXX_ZS.doSelectByLEREPSIGN();
				if(! CERNO.equals(QYDJ_RYXX_ZS.getCERNO())){
					out.print(WeiActionUtil.errorReturn("���������ˣ������ˣ���֤��������Ǽ���Ϣ��һ�£����飡"));
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
	 * �����ύ�ӿڣ�doSub  
		���ݲ�����{"OPENO":"37010521706060005","WSLX":"GS","OPETYPE":"20","LOGINID":"ceshi"}
		������OPENO����������WSLX���������ͣ���OPETYPE��20������30�����50ע������LOGINID���û�����
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
					//out.print(WeiActionUtil.errorReturn("����δ��д��Ȩί����Ϣ��"));
					//return;
				}
			}

			ywsb.setOPENO(OPENO);
			ywsb.doSelect();
			if(OPETYPE.equals("20")||OPETYPE.equals("30")){
				int  czr = ywsb.getColumnValueBySql("SELECT COUNT(*)  FROM  QYDJ_CZXX_SQ WHERE OPENO='"+OPENO+"'");
				if(WSLX.equals("GS")||WSLX.equals("WZGS")||WSLX.equals("WZHH")||WSLX.equals("HHQY")||WSLX.equals("NZFR")||WSLX.equals("HZS")){
					if(czr==0){
						//out.print(WeiActionUtil.errorReturn("����д�ɶ���Ͷ���ˣ���Ϣ��"));
						//return;
					}
				}
				String ent = ywsb.getENTTYPE();
				if("115".equals(ent.substring(0,3))){
					if(czr>1){
						out.print(WeiActionUtil.errorReturn("һ���������ι�˾�ɶ�ֻ����1����"));
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
					out.print(WeiActionUtil.errorReturn("��ǰ��ҵ�Ѿ������������ٴΰ���"));	
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
			       out.print(WeiActionUtil.errorReturn("��ʷ���������ʧ��!"));
			       return;
			    }
			}

			if(ywsb.getENTCLASS().equals("5")){
				bl=ywsb.doSql("UPDATE GTDJ_JBXX_SQ SET APPDATE=sysdate ,STATUS='1' WHERE OPENO='"+OPENO+"'");
			}else{
				bl=ywsb.doSql("UPDATE QYDJ_JBXX_SQ SET APPDATE=sysdate ,STATUS='1',YSBH='"+YSBH+"' WHERE OPENO='"+OPENO+"'");
			}
			if(!bl){
				out.print(WeiActionUtil.errorReturn("������Ϣ����ʧ�ܣ�"));
				return;
			}

			bl=ywsb.doSql("UPDATE QYDJ_YWSB_SQ SET APPDATE=sysdate,STATUS='1',YSBH='"+YSBH+"' WHERE OPENO='"+OPENO+"'");

			if(!bl){
				out.print(WeiActionUtil.errorReturn("ҵ����챣��ʧ�ܣ�"));
				return;
			}
			
			bl=ywsb.doSql("insert into wsdj_czjl(openo,czlx,czry,czsj,jqip) values ('"+OPENO+"','1','"+LOGINID+"',sysdate,'"+ip+"')");
			if(!bl){
				out.print(WeiActionUtil.errorReturn("������¼����ʧ�ܣ�"));
				return;
			}
			
			//���ݱ������־���¼��־
			WSDJ_LOG_RECORD.setLOGID(SysUtility.getUUID20());
			WSDJ_LOG_RECORD.setLINKNAME("΢�����ϵǼ��ύ��������");
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
