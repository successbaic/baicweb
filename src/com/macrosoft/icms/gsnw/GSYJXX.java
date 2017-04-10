package com.macrosoft.icms.gsnw;

import java.sql.ResultSet;

import com.macrosoft.icms.gsdbc.GsDbConnection;
import com.macrosoft.icms.util.DateUtils;

public class GSYJXX {
	
	public String convertCode(String strvalue)
	{	return com.macrosoft.icms.system.SysUtility.convertCode( strvalue );	}

	public String doPreProcess( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess( sValue );	}

	public String doPreProcess2( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess2( sValue );	}

	public String doPreProcess3( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess3( sValue );	}

	public boolean checkRyHmd(String CERNO,String CERTYPE)
	{
		boolean flag=false;
		GsDbConnection dbc=new GsDbConnection();
		ResultSet rsCount;
		String today = DateUtils.getTodayStr(null);
		String sqlSelect="SELECT COUNT(*) AS aCount FROM T_XY_DX_ZJ WHERE IDNO='"+CERNO+"' AND CDATE >= '"+today+"'";
		try{
			rsCount=dbc.executeQuery(sqlSelect);
			rsCount.next();
			int nRowCount=rsCount.getInt("aCount");
			if(nRowCount>0){
				flag=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				dbc.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	public boolean checkQyHmd(String REGNO)
	{
		boolean flag=false;
		GsDbConnection dbc=new GsDbConnection();
		ResultSet rsCount;
		String sqlSelect="SELECT COUNT(*) FROM T_XY_DX_ZJ WHERE ENTREGNO='"+REGNO+"'";
		try{
			rsCount=dbc.executeQuery(sqlSelect);
			rsCount.next();
			int nRowCount=rsCount.getInt( 1 );
			if(nRowCount>0){
				flag=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				dbc.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	public boolean checkYrByRy(String CERNO)
	{
		boolean flag=false;
		GsDbConnection dbc=new GsDbConnection();
		ResultSet rsCount;
//		���Ҿ�һ�����޹�˾���ѯ
		String sqlSelect="SELECT COUNT(*) FROM T_XY_ONEPERSON_ZJ WHERE CERNO_INV='"+CERNO+"'";
		StringBuffer sb1 = new StringBuffer();
		StringBuffer sb2 = new StringBuffer();
//		�������̱��ѯһ�����޹�˾��SQL
		sb1.append(" SELECT COUNT(*)                            ");  
		sb1.append("   FROM QYDJ_JBXX_LC A, QYDJ_CZXX_LC B      ");  
		sb1.append("  WHERE A.OPENO = B.OPENO                   ");  
		sb1.append("    AND A.ENTTYPE = '1151'                  ");  
		sb1.append("    AND B.CERNO = '"+CERNO+"'               "); 
//		������ʽ���ѯһ�����޹�˾��SQL
		sb2.append("SELECT COUNT(*)                       "); 
		sb2.append("  FROM QYDJ_JBXX_ZS A, QYDJ_CZXX_ZS B "); 
		sb2.append(" WHERE A.PRIPID = B.PRIPID            "); 
		sb2.append("   AND A.ENTTYPE = '1151'             "); 
		sb2.append("   AND B.CERNO = '"+CERNO+"'          "); 
	
		try{
			rsCount=dbc.executeQuery(sqlSelect);
			rsCount.next();
			int nRowCount=rsCount.getInt( 1 );
			if(nRowCount>0){
				flag=true;
			}else{
				rsCount=dbc.executeQuery(sb1.toString());
				rsCount.next();
				nRowCount=rsCount.getInt( 1 );
				if(nRowCount>0){
					flag=true;
				}else{
					rsCount=dbc.executeQuery(sb2.toString());
					rsCount.next();
					nRowCount=rsCount.getInt( 1 );
					if(nRowCount>0){
						flag=true;
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				dbc.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return flag;
	}
	public boolean checkGqdj(String pripid,String cerno)
	{
		boolean flag=false;
		GsDbConnection dbc=new GsDbConnection();
		ResultSet rsCount;
		String sqlSelect="SELECT COUNT(*) FROM QYDJ_GQDJ_ZS t WHERE t.pripid = '"+pripid+"' AND t.CERNO='"+cerno+"'";
		try{
			rsCount=dbc.executeQuery(sqlSelect);
			rsCount.next();
			int nRowCount=rsCount.getInt( 1 );
			if(nRowCount>0){
				flag=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				dbc.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	
	public boolean checkLaolai(String iname,String cardnum)
	{
		boolean flag=false;
		GsDbConnection dbc=new GsDbConnection();
		ResultSet rsCount;
		StringBuffer sb = new StringBuffer();
		sb.append(" SELECT COUNT(*)                 ");    
		sb.append("   FROM LAOLAI T                 ");    
		sb.append("  WHERE T.CARDNUM = '"+cardnum+"'");    
		sb.append("    AND T.INAME = '"+iname+"'    ");    

		try{
			rsCount=dbc.executeQuery(sb.toString());
			rsCount.next();
			int nRowCount=rsCount.getInt( 1 );
			if(nRowCount>0){
				flag=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				dbc.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return flag;
	}
	public boolean checkGqcz(String pripid,String cerno)
	{
		boolean flag=false;
		GsDbConnection dbc=new GsDbConnection();
		ResultSet rsCount;
		String sqlSelect="SELECT COUNT(*) FROM GQDJ_JBXX_ZS t WHERE t.pripid = '"
			+pripid+"' AND t.EXPMORBLICNO='"+cerno+"' AND t.STATUS = '1'";
		try{
			rsCount=dbc.executeQuery(sqlSelect);
			rsCount.next();
			int nRowCount=rsCount.getInt( 1 );
			if(nRowCount>0){
				flag=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				dbc.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	public boolean checkYrByQy(String REGNO)
	{
		boolean flag=false;
		GsDbConnection dbc=new GsDbConnection();
		ResultSet rsCount;
		String sqlSelect="SELECT COUNT(*) FROM T_XY_ONEPERSON_ZJ WHERE REGNO='"+REGNO+"'";
		try{
			rsCount=dbc.executeQuery(sqlSelect);
			rsCount.next();
			int nRowCount=rsCount.getInt( 1 );
			if(nRowCount>0){
				flag=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				dbc.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	/*
	//Ͷ���˼��--���Ʋ���
	public String checkTzrMc(MCGL_JBXX_SQ mcgl,HttpServletRequest request) throws SQLException{
		String info="true";
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
				return "��ǰ��ҵ����ֻ����һ���ɶ���";				
			}			
			if(mcgl.getENTTYPE().equals("1151")){
				czxx=(MCGL_TZRXX_SQ)czxxList.get(0);
				String cz_cerno=czxx.getCERNO();
				GSYJXX yjxx=new GSYJXX();
				if(yjxx.checkYrByRy(cz_cerno)){
					return "��ǰ��Ա�����֤������һ�����޹�˾����!";						
				}
			}
		}else{
//			������������͹�˾���ϻ���ҵ��ũ���������Ͷ���˴���һ��
			
			SysSystem icms = (SysSystem)request.getSession().getServletContext().getAttribute("icms");
			String ENTTYPE=icms.getSysRemark("ENTTYPE",mcgl.getENTTYPE());
			if("GS".equals(ENTTYPE)||"WZGS".equals(ENTTYPE)
					||"WZHH".equals(ENTTYPE)||"HZS".equals(ENTTYPE)){
				if(czxxCount<=1){
					return "��ǰ��ҵ������Ҫ���������������Ϲɶ���";	
				}
			}
		}
		
		double tzREGCAP=0;String cerno="";
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
				return "Ͷ���˵�Ͷ�ʶ��ܺ��������Ϣ�е�ע���ʱ���һ�£�";
			}
		}
		
		if(mcgl.getENTCLASS().equals("1")||
		   mcgl.getENTCLASS().equals("2")||
		   mcgl.getENTCLASS().equals("8")){
			if(mcgl.getOPETYPE().equals("10")){
				DbConnection dbc=new DbConnection();
				ResultSet rsSelect;
				//�Ȳ�� ͬһ�û� Ͷ��������ͬ��openo
				rsSelect=dbc.executeQuery("select openo from mcgl_tzrxx_sq where openo in (select openo from mcgl_jbxx_sq where loginid='"+
				mcgl.getLOGINID()+"') and openo!='"+mcgl.getOPENO()+"'AND namestauts <> '4' group by openo having count(*)="+czxxCount);
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
		return info;
	}

	//Ͷ���˼��--��ҵ����
		public String checkTzrQy(QYDJ_YWSB_SQ ywsb,String sENTTYPE) throws SQLException{
			String info="true";
			QYDJ_CZXX_SQ czxx=new QYDJ_CZXX_SQ();
			ArrayList czxxList=czxx.getList(" WHERE OPENO='"+ywsb.getOPENO()+"'");
			int czxxCount=czxxList.size();
			if(czxxCount==0){
				return "����δ��дͶ������Ϣ��";
			}
			if(ywsb.getENTTYPE().equals("1150") 
					|| ywsb.getENTTYPE().equals("1151")
					|| ywsb.getENTTYPE().equals("1152")
					|| ywsb.getENTTYPE().equals("4540")){
				if(czxxCount!=1){
					return "��ǰ��ҵ����ֻ����һ���ɶ���";				
				}	
			}else{
//				������������͹�˾���ϻ���ҵ��ũ���������Ͷ���˴���һ��
				if("GS".equals(sENTTYPE)||"WZGS".equals(sENTTYPE)
						||"WZHH".equals(sENTTYPE)||"HZS".equals(sENTTYPE)){
					if(czxxCount<=1){
						return "��ǰ��ҵ������Ҫ���������������Ϲɶ���";	
					}
				}
			}
			
			
			double tzSUBCONAM=0;
			for(int i=0;i<czxxCount;i++){
				czxx=(QYDJ_CZXX_SQ)czxxList.get(i);						
				tzSUBCONAM+=czxx.getSUBCONAM();
			}
						
			if(sENTTYPE.equals("WZGS")||sENTTYPE.equals("HZS")){
				QYDJ_JBXX_SQ jbxx=new QYDJ_JBXX_SQ();
				jbxx.setOPENO(ywsb.getOPENO());
				jbxx.doSelect();
				if(jbxx.getREGCAP()!=tzSUBCONAM){
					return "Ͷ���˵ĳ��ʶ��ܺ��������Ϣ�еĳ����ܶһ�£�";
				}
			}
					
			return info;
		}
		*/
}
