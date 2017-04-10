<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.util.CHECK_INFO"%>
<jsp:useBean id="MCGL_JBXX_ZS" scope="page" class="com.macrosoft.icms.gsnw.MCGL_JBXX_ZS" />
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="QYDJ_JBXX_ZS" scope="page" class="com.macrosoft.icms.gsnw.QYDJ_JBXX_ZS" />
<jsp:useBean id="GTDJ_JBXX_ZS" scope="page" class="com.macrosoft.icms.gsnw.GTDJ_JBXX_ZS" />
<html>
	<head>
		<title></title>
	</head>
	<body> 
		<%
		    String ifelec = SysUtility.doPreProcess(request.getParameter("ifelec"));
	        String preregorg = SysUtility.doPreProcess(request.getParameter("PREREGORG"));
			String gmlx = SysUtility.doPreProcess(request.getParameter("gmlx"));
			String IFMC = SysUtility.doPreProcess(request
					.getParameter("radio_mc"));
			if("".equals(IFMC)){
				IFMC = "1";	
			}
			String SIGN = SysUtility.doPreProcess(request.getParameter("SIGN"));//1 查看状态；2 修改状态
			String DL = SysUtility.doPreProcess(request.getParameter("DL"));
			String ENTNAME = SysUtility.doPreProcess(SysUtility
					.convertCode(request.getParameter("ENTNAME")));
						
			String parentOption="parent.document.getElementById('subid').disabled=false;parent.document.getElementById('waitdiv').style.display='none';";
			
			String QYLX = "";
			String ENTCLASS = "";
			String OPENO = "";
			String MCID = "";
			String MCXH = "";
			//是否需要名称检查
			boolean needChecked = false;
			//是否是省局系统
			boolean isSJ = false;
			if(gmlx.equals("1")){
				isSJ=true;
			}
			//个体登记
			if (ENTNAME.equals("****") && DL.equals("GTDJ")) {

			} else {
				//判断该户企业或个体是否正在办理
				CHECK_INFO CHECKINFO = new CHECK_INFO();
				String wwywsbInfo = CHECKINFO.WW_YWSB_SQ(" WHERE ENTNAME='"
						+ ENTNAME
						+ "' AND STATUS NOT IN('4','5','11') AND CDDL in ('1','2','3') ");
				if (!wwywsbInfo.equals("")) {
					out.print(SysUtility.setAlertScript(wwywsbInfo,parentOption));
					return;
				}
			}
			if (isSJ) {//省局系统 如果是省局冠名类型则需要检查名称库
				if (gmlx.equals("1") && IFMC.equals("1")) {
					needChecked = true;
				}
			} else {//地市级系统 如果是地市局系统 总局冠名类型或者省局冠名类型则需要检查名称库
				if ((!gmlx.equals("0")) && IFMC.equals("1")) {
					needChecked = true;
				}
			}
			if (needChecked) {//有名称核准		
				MCID = SysUtility.doPreProcess(SysUtility.convertCode(request
						.getParameter("mcid"))); //获得 预先核准通知书文号
				//备注：如果集中部署这种查询方式可能为多条						
				String dMCID = "" + MCID + "";
				String checkSql = "SELECT * FROM MCGL_JBXX_ZS WHERE ENTNAME='"
						+ ENTNAME + "' AND NAMESTATUS = '2'"
						+ " AND apprno is not null"
						//+ " AND (apprno = '"+dMCID+"' OR apprno LIKE '%第"+dMCID+"号')"
						+ " AND saveperto IS NOT NULL"
						+ " AND saveperto >= sysdate ";
				if (!isSJ) {
					MCGL_JBXX_ZS.doSelectBySql(checkSql+ContrInfo.getMczssql_dishi(webuser.getXZQH()));					
				} else {
					MCGL_JBXX_ZS.doSelectBySqlSJ(checkSql +ContrInfo.getMczssql_shengju(icms.getSjCode(),webuser.getXZQH()));
					
				}
				if (MCGL_JBXX_ZS.getENTNAME().equals("")) {
					out.print(SysUtility.setAlertScript(
							"没有该名称数据，请查看冠名类型、名称信息是否录入正确！", parentOption));
					return;
				} else {
					//System.out.println(MCGL_JBXX_ZS.getAPPRNO());
					if(MCGL_JBXX_ZS.getENTCAT().equals("8")){
						if (MCGL_JBXX_ZS.getAPPRNO().indexOf(dMCID+"号") < 0) {
							{
								out.print(SysUtility.setAlertScript(
									"名称与名称预先核准通知书文号不匹配！", parentOption));
								return;
							}
						}
					}else{
						if (MCGL_JBXX_ZS.getAPPRNO().indexOf("第"+dMCID+"号") < 0) {
							{
								out.print(SysUtility.setAlertScript(
									"名称与名称预先核准通知书文号不匹配！",parentOption));
								return;
							}
						}
					}
					
					Page.setAPPRNO(MCGL_JBXX_ZS.getAPPRNO());
					MCXH = MCGL_JBXX_ZS.getNAMEID();
					ENTCLASS = MCGL_JBXX_ZS.getENTCAT();
					QYLX = icms.getSysRemark("ENTTYPE", MCGL_JBXX_ZS
							.getENTTYPE());
					System.out.println(ENTCLASS);
					if (DL.equals("HZSDJ")) {
						QYLX = "HZS";
						if (!ENTCLASS.equals("6")) {
							out.print(SysUtility.setAlertScript(
									"当前模块只能受理合作社开业！", parentOption));
							return;
						}
					} else if (DL.equals("GTDJ")) {
						QYLX = "GT";
						if (!ENTCLASS.equals("5")) {
							out.print(SysUtility.setAlertScript(
									"当前模块只能受理个体户开业！", parentOption));
							return;
						}
					} else {
						if (ENTCLASS.equals("5") || ENTCLASS.equals("6")) {
							out.print(SysUtility.setAlertScript(
									"当前模块只能受理企业开业！", parentOption));
							return;
						}
					}
				}
			} else {//无名称核准	
				ENTCLASS = request.getParameter("ENTCLASS");
				QYLX = request.getParameter("QYLX");
				if(!"5".equals(ENTCLASS)){
					//判断名称是否被占用
					boolean isUsed = CHECK_INFO.validateEntname(ENTNAME);
					if(isUsed){
						out.print(SysUtility.setAlertScript("该名称已经被占用，请重新拟定名称！",parentOption));	
						return;
					}
				}
				
				//国家局核名
				if(gmlx.equals("0")){
					if(webuser.getXZQH().startsWith("37")){
						String xx="山东,济南,青岛,淄博,枣庄,东营,烟台,潍坊,济宁,泰安,威海,日照,莱芜,临沂,德州,聊城,滨州,菏泽";
						String[] xxs=xx.split(",");
						for(int i=0;i<xxs.length;i++){
							if(ENTNAME.indexOf(xxs[i])>-1){
								out.print(SysUtility.setAlertScript("国家局核名不能包含本地市名，您录入的名称包含【"+xxs[i]+"】字样，如仍需办理，请到工商局现场办理！",parentOption));	
								return;
							}
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
					out.print(SysUtility.setAlertScript("当前企业已经成立，不能再次办理！",parentOption));	
					return;
				}
			}
			if (DL.equals("HZS")) {
				DL = "QY";
			}
			
			Page.setENTNAME(ENTNAME);
			Page.setMCXH(MCXH);
			Page.setXGBH(MCID);
			Page.setENTCLASS(ENTCLASS);
			Page.setENTTYPE(QYLX);
			Page.setAPPRNO(MCGL_JBXX_ZS.getAPPRNO());
			Page.setPRIPID(MCGL_JBXX_ZS.getPRIPID());
			Page.setGMLX(gmlx);
			Page.setIFELEC(ifelec);
			Page.setPREREGORG(preregorg);
			if (ENTNAME.equals("") || QYLX.equals("")) {
				out.print(SysUtility.setAlertScript("没有匹配的企业类型！",parentOption));
				return;
			}
			out.print("<script language='javascript'>parent.window.location.href='../wsdj_tbxx.jsp'</script>");
		%>
	</body>
</html>
