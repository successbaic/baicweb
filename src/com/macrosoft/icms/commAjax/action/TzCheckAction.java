package com.macrosoft.icms.commAjax.action;

import java.math.BigDecimal;
import java.net.URLDecoder;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.mcgl.MCGL_JBXX_SQ;
import com.macrosoft.icms.mcgl.MCGL_TZRXX_SQ;
import com.macrosoft.icms.qydj.QYDJ_BGSX_SQ;
import com.macrosoft.icms.qydj.QYDJ_CZXX_SQ;
import com.macrosoft.icms.qydj.QYDJ_JBXX_SQ;
import com.macrosoft.icms.system.SysSystem;

public class TzCheckAction {
	public String tzCheck(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			String OPENO = URLDecoder.decode(request
					.getParameter("OPENO"), "GBK");
			String ywlx = URLDecoder.decode(request
					.getParameter("ywlx"), "GBK");
//			String OPETYPE = URLDecoder.decode(request
//					.getParameter("OPETYPE"), "GBK");
			if("mcgl".equals(ywlx)){
				//return mcglCheck(OPENO,request);
			}else if("qydj".equals(ywlx)){
				//return qydjCheck(OPENO,request);
			}else if("qybg".equals(ywlx)){
				//return qybgCheck(OPENO,request);
		}
			return "";
		} catch (Exception e) {
			e.printStackTrace();
			return "ϵͳ��������ϵ����Ա��";
		} finally {
		}
	}
	public String mcglCheck(String OPENO,HttpServletRequest request) throws SQLException{

		MCGL_JBXX_SQ mcgl = new MCGL_JBXX_SQ();
		mcgl.setOPENO(OPENO);
		mcgl.doSelect();
		MCGL_TZRXX_SQ czxx=new MCGL_TZRXX_SQ();
		ArrayList czxxList=czxx.getList(" WHERE OPENO='"+mcgl.getOPENO()+"'");
		int czxxCount=czxxList.size();
		if(czxxCount==0){
			return "����δ��дͶ������Ϣ��";
		}
		String[] dzEnttype = new String[] { "1110", "1123", "1150", "1151",
				"1152", "1153", "2110", "2123", "2150", "2151", "2152", "2153",
				"4540", "4560", "5140", "5150", "5160", "6140", "6150", "6160" };
		if(Arrays.asList(dzEnttype).contains(mcgl.getENTTYPE())){
			if(czxxCount!=1){
				//return "��ǰ��ҵ����ֻ����һ���ɶ���";				
			}			
			
		}else{
//			������������͹�˾���ϻ���ҵ��ũ���������Ͷ���˴���һ��
			SysSystem icms = (SysSystem)request.getSession().getServletContext().getAttribute("icms");
			String ENTTYPE=icms.getSysRemark("ENTTYPE",mcgl.getENTTYPE());
			if("GS".equals(ENTTYPE)||"WZGS".equals(ENTTYPE)
					||"WZHH".equals(ENTTYPE)||"HZS".equals(ENTTYPE)){
				if(czxxCount<=1){
					//return "��ǰ��ҵ������Ҫ���������������Ϲɶ���";	
				}
			}
		}
		
		float tzREGCAP=0;String cerno="";
		for(int i=0;i<czxxCount;i++){
			czxx=(MCGL_TZRXX_SQ)czxxList.get(i);
			tzREGCAP+=czxx.getSUBCONAM();
			if(cerno.equals("")){
				cerno="'"+czxx.getCERNO()+czxx.getBLICNO();
			}else{
				cerno+="','"+czxx.getCERNO()+czxx.getBLICNO();
			}
		}
		if(!cerno.equals("")){
			cerno=cerno+"'";
		}
		String entClass = mcgl.getENTCLASS();
		String enttype = mcgl.getENTTYPE();
		
		if("1,2".indexOf(entClass)>=0&&enttype.startsWith("11")){
			if(mcgl.getREGCAP()!= 0 && mcgl.getREGCAP()!=tzREGCAP){
				//return "Ͷ���˵�Ͷ�ʶ��ܺ��������Ϣ�е�ע���ʱ���һ�£�";
			}
		}
		/*
		if(mcgl.getENTCLASS().equals("1")||
		mcgl.getENTCLASS().equals("2")||
		mcgl.getENTCLASS().equals("8")){
			if(mcgl.getREGCAP()!= 0 && mcgl.getREGCAP()!=tzREGCAP){
				return "Ͷ���˵�Ͷ�ʶ��ܺ��������Ϣ�е�ע���ʱ���һ�£�";
			}
		}
		*/
		if(mcgl.getENTCLASS().equals("1")||
		   mcgl.getENTCLASS().equals("2")||
		   mcgl.getENTCLASS().equals("8")){
			if(mcgl.getOPETYPE().equals("10")){
				DbConnection dbc=new DbConnection();
				ResultSet rsSelect;
				//�Ȳ�� ͬһ�û� Ͷ��������ͬ��openo
				rsSelect=dbc.executeQuery("select openo from mcgl_tzrxx_sq where openo in (select openo from mcgl_jbxx_sq where loginid='"+
				mcgl.getLOGINID()+"' AND namestatus <> '4') and openo!='"+mcgl.getOPENO()+"' group by openo having count(*)="+czxxCount);
				String openos="",value="";
				while(rsSelect.next()){
					if(openos.equals("")){
						openos="'"+rsSelect.getString("openo");
					}else{
						openos+="','"+rsSelect.getString("openo");
					}
				}
				if(!openos.equals("")){
					openos+="'";
					//����Щ֤������ģ�ͬʱͶ������һ����
					String checkSql="select openo from mcgl_tzrxx_sq where cerno||blicno in ("+cerno+") and openo in("
							   +openos+") group by openo having count(*)="+czxxCount;
				
					rsSelect=dbc.executeQuery(checkSql);
					
					if(rsSelect.next())
					{
						value=rsSelect.getString("openo");
					}
				}
				rsSelect.close();
				dbc.close();
				
				if(!value.equals("")){
					return "���Ѿ�ʹ����ͬ�Ĺɶ�������������ϵǼǣ�";					
				}		
			}				
		}
		return "";
	
	}
	public String qydjCheck(String OPENO,HttpServletRequest request) throws SQLException{
		
		QYDJ_JBXX_SQ qydj = new QYDJ_JBXX_SQ();
		qydj.setOPENO(OPENO);
		qydj.doSelect();
		QYDJ_CZXX_SQ czxx=new QYDJ_CZXX_SQ();
		ArrayList czxxList=czxx.getList(" WHERE OPENO='"+qydj.getOPENO()+"'");
		int czxxCount=czxxList.size();
		if(czxxCount==0){
			return "����δ��дͶ������Ϣ��";
		}
		String enttype = qydj.getENTTYPE();
		QYDJ_BGSX_SQ bgsx = new QYDJ_BGSX_SQ();
		bgsx.setOPENO(OPENO);
		bgsx.setALTITEM("04");
		bgsx.doSelect();
		if(!("").equals(bgsx.getALTAF())){
			enttype = bgsx.getALTAF();
		}
		String[] dzEnttype = new String[] { "1110", "1123", "1150", "1151",
				"1152", "1153", "2110", "2123", "2150", "2151", "2152", "2153",
				"4540", "4560", "5140", "5150", "5160", "6140", "6150", "6160" };
		if(Arrays.asList(dzEnttype).contains(enttype)){
			if(czxxCount!=1){
				return "��ǰ��ҵ����ֻ����һ���ɶ���";				
			}			
				
			
		}else{
//			������������͹�˾���ϻ���ҵ��ũ���������Ͷ���˴���һ��
			SysSystem icms = (SysSystem)request.getSession().getServletContext().getAttribute("icms");
			String ENTTYPE=icms.getSysRemark("ENTTYPE",enttype);
			if(!Arrays.asList(dzEnttype).contains(enttype)){						
				if(czxxCount<=1){
					//return "��ǰ��ҵ������Ҫ���������������Ϲɶ���";	
				}
			}
		}
		
		float tzREGCAP=0;String cerno="";
		boolean isCheck = true;
		for(int i=0;i<czxxCount;i++){
			czxx=(QYDJ_CZXX_SQ)czxxList.get(i);		
			tzREGCAP+=czxx.getSUBCONAM();			
			if(czxx.getSUBCONAM() == 0){
				isCheck = false;
			}
			if(cerno.equals("")){
				cerno="'"+czxx.getCERNO()+czxx.getBLICNO();
			}else{
				cerno+="','"+czxx.getCERNO()+czxx.getBLICNO();
			}
		}
		if(!cerno.equals("")){
			cerno=cerno+"'";
		}
		String entClass = qydj.getENTCLASS();
		
		if("1,2".indexOf(entClass)>=0&&enttype.startsWith("11")&&isCheck){
			System.out.println("qydj.getREGCAP():"+qydj.getREGCAP());
			System.out.println("tzREGCAP:"+tzREGCAP);
			if(qydj.getREGCAP()!= 0 && qydj.getREGCAP()!=tzREGCAP){				
				//return "Ͷ���˵�Ͷ�ʶ��ܺ��������Ϣ�е�ע���ʱ���һ�£�";
			}
		}
		/*
		if(qydj.getENTCLASS().equals("1")||
				qydj.getENTCLASS().equals("2")||
				qydj.getENTCLASS().equals("8")){
			if(qydj.getOPETYPE().equals("10")){
				DbConnection dbc=new DbConnection();
				ResultSet rsSelect;
				//�Ȳ�� ͬһ�û� Ͷ��������ͬ��openo
				rsSelect=dbc.executeQuery("select openo from mcgl_tzrxx_sq where openo in (select openo from mcgl_jbxx_sq where loginid='"+
						qydj.getLOGINID()+"') and openo!='"+qydj.getOPENO()+"' group by openo having count(*)="+czxxCount);
				String openos="",value="";
				while(rsSelect.next()){
					if(openos.equals("")){
						openos="'"+rsSelect.getString("openo");
					}else{
						openos+="','"+rsSelect.getString("openo");
					}
				}
				if(!openos.equals("")){
					openos+="'";
					//����Щ֤������ģ�ͬʱͶ������һ����
					String checkSql="select openo from mcgl_tzrxx_sq where cerno||blicno in ("+cerno+") and openo in("
					+openos+") group by openo having count(*)="+czxxCount;
					
					rsSelect=dbc.executeQuery(checkSql);
					
					if(rsSelect.next())
					{
						value=rsSelect.getString("openo");
					}
				}
				rsSelect.close();
				dbc.close();
				
				if(!value.equals("")){
					return "���Ѿ�ʹ����ͬ�Ĺɶ�������������ϵǼǣ�";					
				}		
			}				
		}
		*/
		return "";
		
	}
	private String qybgCheck(String OPENO,HttpServletRequest request) throws SQLException{
		
		
		
		MCGL_JBXX_SQ mcgl = new MCGL_JBXX_SQ();
		mcgl.setOPENO(OPENO);
		mcgl.doSelect();
		MCGL_TZRXX_SQ czxx=new MCGL_TZRXX_SQ();
		ArrayList czxxList=czxx.getList(" WHERE OPENO='"+mcgl.getOPENO()+"'");
		int czxxCount=czxxList.size();
		if(czxxCount==0){
			return "����δ��дͶ������Ϣ��";
		}
		if(mcgl.getENTTYPE().equals("1150") 
				|| mcgl.getENTTYPE().equals("1151")
				|| mcgl.getENTTYPE().equals("1152")
				|| mcgl.getENTTYPE().equals("4540")){
			if(czxxCount!=1){
				//return "��ǰ��ҵ����ֻ����һ���ɶ���";				
			}			
			
		}else{
//			������������͹�˾���ϻ���ҵ��ũ���������Ͷ���˴���һ��
			SysSystem icms = (SysSystem)request.getSession().getServletContext().getAttribute("icms");
			String ENTTYPE=icms.getSysRemark("ENTTYPE",mcgl.getENTTYPE());
			if("GS".equals(ENTTYPE)||"WZGS".equals(ENTTYPE)
					||"WZHH".equals(ENTTYPE)||"HZS".equals(ENTTYPE)){
				if(czxxCount<=1){
					//return "��ǰ��ҵ������Ҫ���������������Ϲɶ���";	
				}
			}
		}
		
		float tzREGCAP=0;String cerno="";
		for(int i=0;i<czxxCount;i++){
			czxx=(MCGL_TZRXX_SQ)czxxList.get(i);
			tzREGCAP+=czxx.getSUBCONAM();
			if(cerno.equals("")){
				cerno="'"+czxx.getCERNO()+czxx.getBLICNO();
			}else{
				cerno+="','"+czxx.getCERNO()+czxx.getBLICNO();
			}
		}
		if(!cerno.equals("")){
			cerno=cerno+"'";
		}
		String entClass = mcgl.getENTCLASS();
		String enttype = mcgl.getENTTYPE();
		
		if("1,2".indexOf(entClass)>=0&&enttype.startsWith("11")){
			if(mcgl.getREGCAP()!= 0 && mcgl.getREGCAP()!=tzREGCAP){
				//return "Ͷ���˵�Ͷ�ʶ��ܺ��������Ϣ�е�ע���ʱ���һ�£�";
			}
		}
		/*
		if(mcgl.getENTCLASS().equals("1")||
		mcgl.getENTCLASS().equals("2")||
		mcgl.getENTCLASS().equals("8")){
			if(mcgl.getREGCAP()!= 0 && mcgl.getREGCAP()!=tzREGCAP){
				return "Ͷ���˵�Ͷ�ʶ��ܺ��������Ϣ�е�ע���ʱ���һ�£�";
			}
		}
		 */
		if(mcgl.getENTCLASS().equals("1")||
				mcgl.getENTCLASS().equals("2")||
				mcgl.getENTCLASS().equals("8")){
			if(mcgl.getOPETYPE().equals("10")){
				DbConnection dbc=new DbConnection();
				ResultSet rsSelect;
				//�Ȳ�� ͬһ�û� Ͷ��������ͬ��openo
				rsSelect=dbc.executeQuery("select openo from mcgl_tzrxx_sq where openo in (select openo from mcgl_jbxx_sq where loginid='"+
						mcgl.getLOGINID()+"') and openo!='"+mcgl.getOPENO()+"' group by openo having count(*)="+czxxCount);
				String openos="",value="";
				while(rsSelect.next()){
					if(openos.equals("")){
						openos="'"+rsSelect.getString("openo");
					}else{
						openos+="','"+rsSelect.getString("openo");
					}
				}
				if(!openos.equals("")){
					openos+="'";
					//����Щ֤������ģ�ͬʱͶ������һ����
					String checkSql="select openo from mcgl_tzrxx_sq where cerno||blicno in ("+cerno+") and openo in("
					+openos+") group by openo having count(*)="+czxxCount;
					
					rsSelect=dbc.executeQuery(checkSql);
					
					if(rsSelect.next())
					{
						value=rsSelect.getString("openo");
					}
				}
				rsSelect.close();
				dbc.close();
				
				if(!value.equals("")){
					//return "���Ѿ�ʹ����ͬ�Ĺɶ�������������ϵǼǣ�";					
				}		
			}				
		}
		return "";
		
	}
}
