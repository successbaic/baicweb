package com.macrosoft.icms.util;

import java.util.Random;

public class WSDJ_WSYY {
	public String doYYNO(String BH,String SXW){
		String YYNO="";
		Random rnd = new Random();
		int num = 100 + rnd.nextInt(900);
		String snum=num+"";
		String snum1=snum.substring(0,1);
		String snum2=snum.substring(1,2);
		String snum3=snum.substring(2,3);
		
		int nBH=Integer.parseInt(BH);
		String BH1="";
		String BH2="";
		nBH=nBH*Integer.parseInt(SXW);
		BH=nBH+"";
		if(nBH<10){
			BH1="0";
			BH2=nBH+"";
		}else if(nBH>=10 && nBH<100){
			BH1=BH.substring(0,1);
			BH2=BH.substring(1,2);
		}else if(nBH>=100){
			BH1=BH.substring(1,2);
			BH2=BH.substring(2,3);
		}		
		YYNO=snum1+BH1+snum2+BH2+snum3;
		
		return YYNO;
	}
}
