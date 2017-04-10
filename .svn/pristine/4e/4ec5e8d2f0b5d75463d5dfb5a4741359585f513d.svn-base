package com.macrosoft.icms.commAjax.action;

import com.macrosoft.icms.qydj.QYDJ_JBXX_SQ;
import com.macrosoft.icms.qydj.QYDJ_RYXX_SQ;
import com.macrosoft.icms.util.SYS_DMDZ;

public class DjhCheckAction {
	public String djhCheck(String OPENO) {
		
		try {
			QYDJ_JBXX_SQ qydj = new QYDJ_JBXX_SQ();
			qydj.setOPENO(OPENO);
			qydj.doSelect();
			String enttype = qydj.getENTTYPE();
			SYS_DMDZ dmdz = new SYS_DMDZ();
			int count = dmdz.getListCount(" WHERE type = 'ENTTYPE'" 
								+" AND INSTR(content, '股份') > 0" 
								+" AND remark IN ('GS','WZGS')"
								+" AND code = '"+ enttype +"'");
			if(count == 1){
				QYDJ_RYXX_SQ ryxx = new QYDJ_RYXX_SQ();
				count = ryxx.getListCount(" WHERE OPENO = '"+ OPENO +"'" +
						" AND POSITION IN('410A','410B','431A','431B','432A')");
				if(count < 5){
					return "股份有限公司不能少于5个董事!";
				}else{
					count = ryxx.getListCount(" WHERE OPENO = '"+ OPENO +"'" +
							" AND POSITION IN('408A')");
					if(count < 3){
						return "股份有限公司不能少于3个监事!";
					}
				}
			}
			return "";
		} catch (Exception e) {
			e.printStackTrace();
			return "系统错误请联系管理员！";
		} finally {
		}
	}
}
