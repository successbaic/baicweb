<%@ page contentType="text/html; charset=gbk" %>
<jsp:useBean id="WEB_USER" scope="page" class="com.macrosoft.icms.qydj.WEB_USER">
	<jsp:setProperty name="WEB_USER" property="*"/>
</jsp:useBean>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<%
	//登录用户名称
	String name=new String(WEB_USER.doPreProcess(request.getParameter("NAME")).getBytes("ISO8859_1"),"GBK");
	String idnum=WEB_USER.doPreProcess(request.getParameter("CERNO"));
	String openo=WEB_USER.doPreProcess(request.getParameter("OPENO"));
	String fileid=WEB_USER.doPreProcess(request.getParameter("FILEID"));
	String filedes=WEB_USER.doPreProcess(request.getParameter("FILEDES"));
	String fpath=WEB_USER.doPreProcess(request.getParameter("FPATH"));
	String opetype=WEB_USER.doPreProcess(request.getParameter("OPETYPE"));
	String sysCode=WEB_USER.doPreProcess(request.getParameter("SYSCODE"));
	String frsign=WEB_USER.doPreProcess(request.getParameter("FRSIGN"));
	String gdsign=WEB_USER.doPreProcess(request.getParameter("GDSIGN"));
	String dssign=WEB_USER.doPreProcess(request.getParameter("DSSIGN"));
%>
<html>
	<title>签名页面</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
	<meta name="keywords" content="keyword1,keyword2,keyword3" />
	<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
	<link href="css/style.css" rel='stylesheet' type='text/css' />
	<link   rel="stylesheet" href="<%=request.getContextPath()%>/eid/eIDUI/eIDSelect/jquery.eIDSelect.css">	
	<script language="javascript" src="support/jquery-1.7.2.min.js"></script>
    <script language="javascript" src="<%=request.getContextPath()%>/eid/CCB.js"></script>
    <script language="javascript" src="<%=request.getContextPath()%>/eid/BECCB.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/eid/base64.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/eid/eIDPluginHelper2.0.js"></script>
	<script language="javascript" src='<%=request.getContextPath()%>/eid/jquery-1.8.2.js'></script>
	<script language="javascript" src='<%=request.getContextPath()%>/eid/eIDUI/eIDSelect/jquery.eIDSelect.js'></script>
   	<script language="javascript" src='<%=request.getContextPath()%>/eid/eIDUI/eIDSelect/eIDUI-common.js'></script>
	<!--OBJET标签是  网页用的嵌入脚本,用来播放flash文件的,object是指对象的意思-->
	<OBJECT height="0px" width="0px"  id=InfoSecNetSign1 classid=CLSID:B1FBC1AD-5644-4084-882A-0F8BA85E7506></OBJECT>
	<OBJECT height="0px" width="0px"  id=blicAtvNew classid=CLSID:0DC9CA0C-ED42-4C87-A335-1B0BD043FC71></OBJECT>	
	<OBJECT height="0px" width="0px" id=CCB_SignCtl classid=CLSID:BC96F5A4-C930-4226-ADAB-59349AE585E9></OBJECT>
	<OBJECT height="0px" width="0px" id="CCB_GMSignCtl" classid="CLSID:7F432EA4-52B9-442C-AFBD-E1A73AD87043"></OBJECT>	
	<OBJECT height="0px" width="0px" id="CCB" classid="CLSID:BC96F5A4-C930-4226-ADAB-59349AE585E9"></OBJECT>
	<OBJECT height="0px" width="0px" id="CCBNUM" classid="CLSID:128EEE5A-A2FD-4DDC-AFAD-8B3DA1CA18F"></OBJECT>
	<script type="text/javascript">
	var sysCode="<%=sysCode%>";
	
	//样式修改------------------------------
	function changeBor(borId,spanId,divId) {
		// 选中添加框
		$("#eID").css("borderColor", "#E5E5E5");
		$("#eID").css("borderWidth", "1px");
		$("#UKey").css("borderColor", "#E5E5E5");
		$("#UKey").css("borderWidth", "1px");
		$("#privateKey").css("borderColor", "#E5E5E5");
		$("#privateKey").css("borderWidth", "1px");
		$("#" + borId).css("borderColor", "#147FFF");
		$("#" + borId).css("borderWidth", "2px");
		// 字体加粗
		$("#eID_span_pc").css("fontWeight", "normal");
		$("#Pri_span_pc").css("fontWeight", "normal");
		// 字体颜色
		$("#eID_span_pc").css("color", "#63B3FF");
		$("#Pri_span_pc").css("color", "#63B3FF");
		$("#" + spanId).css("fontWeight", "bolder");
		$("#" + spanId).css("color", "#2095FF");
		// 显示div
		$("#pc_eID").css("display", "none");
		$("#ccb_UKey").css("display", "none");
		$("#icbc_UKey").css("display", "none");
		$("#pc_Pri").css("display", "none");
		$("#" + divId).css("display", "block");
	}
	// 一级菜单切换
	function changeDivPer() {
		$("#businessTd").css("backgroundColor", "#FFFFFF");
		$("#businessMenu").css("display", "none");
		$("#personalTd").css("backgroundColor", "#FEF6E1");
		$("#personalMenu").css("display", "block");
		$("#UKey").css("display", "block");

	}
	function changeDivBus() {
		$("#personalTd").css("backgroundColor", "#FFFFFF");
		$("#personalMenu").css("display", "none");
		$("#businessTd").css("backgroundColor", "#FEF6E1");
		$("#businessMenu").css("display", "block");
		$("#UKey").css("display", "none");
	}
	
	//EID签名----------------------------------
	function eidload(borId,spanId,divId,rzCode) {
	   if(rzCode != sysCode){
			alert("请选择已认证身份进行签名！");
			return;
		}
		$("#" + divId).css("display", "block");
		 eID.setDeviceDiv({
             id: "div1",
             callback: function(evt) {
                 if (evt.rv != 0) {
                     alert(evt.msg);
                 }
             },
             onDevChange: function(evt) {
                 //alert(evt.count);
             }
         });    
         
		 function getDataToSign() {
			 var plainText = "<%=filedes%>";
             // as in doc, data_to_sign must be with such format as follow:
             var dataToSign = plainText + ":" + plainText + ":data";
             var b = new Base64();
             var dataToSignBase64 = b.encode(dataToSign);
             return dataToSignBase64;
         }
          
          var toSignData="";
         eID.setSignButton({
             id: 'btn1',
             src: function() {
                 toSignData = getDataToSign();
                 return toSignData;
             },
             alg: 0,
             callback: function(evt) {                   
                 if (evt.rv != 0) {
                     alert('sign失败，返回码为 ' + evt.rv + ':' + evt.msg);
                 }
                 else {
				    document.eidform.result.value=evt.data.signResult;
				    document.eidform.issuer.value=evt.data.issuer;
				    document.eidform.certSn.value=evt.data.certSn;
				    document.eidform.issuerSn.value=evt.data.issuerSn;
				    document.eidform.subject.value=evt.data.subject;
				    document.eidform.toSignData.value=toSignData;
				    eidform.submit();
					}
             }
         }); 
	}	
	
	//电子营业执照---------------------------------------
	function yyzzDataSign(rzCode)
	{
	    if(rzCode != sysCode){
			alert("请选择已认证身份进行签名！");
			return;
		}
	    var plainText = '<%=filedes%>';  //原文
		var data = "";
		var ifud="";   //若是ocxType时银行U盾时，该项的值为dn项，其他为空
		var mylx="";  //密钥类型
		var zslx="";   //证书类型
		var hashsf="";  //hash算法
		var ztxlh="";    //载体序列号
		var sign = "";  //base64编码的签名值
		var com = "";  //base64编码的执照信息或者证书信息
		com = blicAtvNew;
		var keySn = getNumSn(com,1,'');
		if (keySn == null || keySn == '') {
				alert("获取的设备序列号为空！")
				ret = -1;
				return ret;
		}
		var b = new Base64();
	    plainText = b.encode(plainText);
		data = SignData(com,'','',plainText,'','','div2',keySn,1); //第六个参数为hashType [IN]:hash算法，该取33772还是32772
		ifud=data[0];
		mylx=data[1];
		zslx=data[2];
		hashsf=data[3];
		ztxlh==data[4];
		sign = data[5];
		cert = data[6];
		document.getElementById("ifud").value=ifud;
		document.getElementById("mylx").value=mylx;
	    document.getElementById("zslx").value=zslx;
	    document.getElementById("hashsf").value=hashsf;
	    document.getElementById("ztxlh").value=ztxlh;
	    document.getElementById("sign").value=sign;
	    document.getElementById("cert").value=cert;
	    document.getElementById("plainText").value=plainText;
	    yyzzform.submit();
	}

	//建设银行签名------------------------------------------
	function ccbSignData(rzCode)
	{
		if(rzCode != sysCode){
			alert("请选择已认证身份进行签名！");
			return;
		}
		var inData = "";     
		var str = document.getElementById("ccbukeyType");
		if(str.value == "C0001")
	    {
			inData = "<%=filedes%>";  //一代U盾的原文
	    }
		else if(str.value == "C0002")
	    {
		    // 二代U盾原文
			//plainText = "SH=\"1\";SN=\"交易金额\";IN=\"0\";SI=\"0\";|SH=\"1\";SN=\"收款账户名称\";IN=\"0\";SI=\"肖同波\";|SH=\"1\";SN=\"收款账户\";IN=\"0\";SI=\"0063649980130313826\";|SH=\"0\";SN=\"付款账户\";IN=\"0\";SI=\"5324204101072011\";|SH=\"0\";SN=\"签名时间\";IN=\"0\";SI=\"20090630160713\";|";
	        inData = "SH=\"1\";SN=\"数据签名\";IN=\"0\";SI=\""+"<%=filedes%>"+"\";|";
	    }
		
		var deSignerDN = "";
		var signResult = "";
		var com = "";
		com = CCB_GMSignCtl;
		var keySn = getNumSn(com,3,"ccbukeyCT");
		alert(keySn);
		if (keySn == null || keySn == '') {
				alert("获取的设备序列号为空！");
				ret = -1;
				return ret;
		}
		var b = new Base64();
		inData = b.encode(inData);
		signResult = SignData(com,'','',inData,deSignerDN,'',"ccbukeyCT",keySn,3);
		var signdata=signResult[5];
		ccb_form.signdata.value=signdata;
		ccb_form.submit();
	}
	
	//中国工商银行----------------------
	  function icbcSignData(rzCode)
	   {
		if(rzCode != sysCode){
			alert("请选择已认证身份进行签名！");
			return;
		}
	    var inData = "";  
	   
		var ukeyType = document.getElementById("icbcukeyType");
		if(ukeyType.value == "E0001")
	    {		
		    // 签名数据原文
			inData =  "<%=filedes%>";
	    }
		var deSignerDN = "";
		var signResult = "";
		var com = "";
		com = InfoSecNetSign1;
		var keySn = getNumSn(com,5,"ukeyCT");
		if (keySn == null || keySn == '') {
				alert("获取的设备序列号为空！");
				ret = -1;
				return ret;
		}
		var b = new Base64();
		inData = b.encode(inData);
		signResult =SignData(com,'','',inData,deSignerDN,'',"ukeyCT",keySn,5)
		var signdata=signResult[5];
		icbc_form.signdata.value=signdata;
	    icbc_form.submit();
	}
	</script>
	<style>
	#box_relative {
		position: relative;
		top: -3px;
	}
	</style>
</head> 
<body style="background-color: #F5F5F5; height: 100%; width: 100%;">
	<div align="center">
		<div style="height: 30px;"></div>
		<!-- 一级目录 -->
		<div style="width: 80%; background-color: #FFFFFF; padding:0px 0px 50px 0px;">
			<table id="tab" style="width: 100%; text-align: center;">
				<tr>
					<td id="personalTd" style="border-right: 1px solid #F2DCB5; background-color: #FEF6E1; border-bottom: 2px solid #F2DCB5; height: 40px;">
						<span style="letter-spacing: 2px; font-weight:bold; font-family: KaiTi; font-size: 24px; cursor: pointer;" onclick="changeDivPer();">个人签名</span>
					</td>
					<td id="businessTd" style="background-color: #FFFFFF; border-bottom: 2px solid #F2DCB5; height: 40px;">
						<span style="letter-spacing: 2px; font-weight:bold; font-family: KaiTi; font-size: 24px; cursor: pointer;" onclick="changeDivBus();">企业签名</span>
					</td>
				</tr>
			</table>	
		<!-- 个人目录 -->
		<div id="personalMenu" style="display: block;">
		<!-- eID登录 -->
		<div id="eID" style="width: 95%; border:1px solid #E5E5E5; text-align: left; margin: 50px 0px 5px 0px;">
			<div align="left" style="background-color: #E5F1FB; height: 40px;">&nbsp;&nbsp;&nbsp;<img src="eid/eID_logo.png"  height="30px" width="40px" style="margin: 5px 0px 5px 0px;"/>&nbsp;&nbsp;<span style="font-size: 18px; color: #346EC9 ; letter-spacing: 1px; font-weight:bold; font-family: KaiTi; vertical-align: middle;">电子身份</span></div>
	    	<div style="width: 100%; margin: 20px 0px 20px 0px;">
	    	<table width="100%">
	    		<tr height="30px;">
			    	<td style="width: 20%; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    		<input id="eIDinput_2" type="radio" name="radio" value="" onclick="eidload('eID','eID_span_pc','pc_eID','A0001');"/>
			    		<span id="eID_span_pc" style="font-size: 15px; color: #63B3FF; font-family: SimHei; ">&nbsp;eID签名</span>
			    	</td>
			    	<td style="width: 20%; ">&nbsp;</td>
		    		<td style="width: 20%; ">&nbsp;</td>
		    		<td style="width: 20%; ">&nbsp;</td>
		    		<td style="width: 20%; ">&nbsp;</td>
	    		</tr>
	    	</table>
	    	</div>
	    	<!-- 隐藏域 -->
	    	<div id="pc_eID"  style="display: none; width: 100%; margin-bottom: 20px;">
	    	<form name="eidform" METHOD="POST" ACTION="tjwj_sign_action.jsp" target="editframe0">
				<div>
				<div id='div1' name='div1' style="display: inline-block;border:5px; margin-left:95px; text-align: left;float:left;"></div>
				<div  style="float:left;margin-left:-30px;margin-top:15px;" >   
				   <table id="mc"  width="100%" cellspacing='0' cellpadding='0' align="center">
				      <tr> 
				     	<td><button colspan="2" style="height:30px;width:60px;margin-left:95px;" name="btn1" id="btn1">签名</button>&nbsp;&nbsp;
				     </tr>
				   </table>
				   </div>
				</div>
				   <div style="display:none">
				   <input type="hidden" name="result" id ="result"></input>
					<input type="hidden" name="issuer" id ="issuer"></input>
					<input type="hidden" name="certSn" id ="certSn"></input>
					<input type="hidden" name="issuerSn" id ="issuerSn"></input>
					<input type="hidden" name="toSignData" id ="toSignData"></input>
					<input type="hidden" name="subject" id ="subject"></input></div>
				    <input type="hidden" name="openo" value='<%=openo%>'/>
				    <input type="hidden" name="fileid" value='<%=fileid%>'/>    	
				    <input type="hidden" name="name" value='<%=name%>'/>    	
				    <input type="hidden" name="idnum" value='<%=idnum%>'/>
				    <input type="hidden" name="opetype" value='<%=opetype%>'/>    				      
				    <input type="hidden" name="sysCode" value='<%=sysCode%>'/>
				    <input type="hidden" name="frsign" value='<%=frsign%>'/>
				    <input type="hidden" name="gdsign" value='<%=gdsign%>'/>    				      
				    <input type="hidden" name="dssign" value='<%=dssign%>'/>    	    				     			    			     				    			     			    			     				      	
				    </div>
				   <iframe height="0" width="0" name="editframe0" src="" id="editframe0"></iframe>
				</form>
	    	</div>
         </div>
		<!-- 银行U盾登录 -->
	    <div id="UKey" style="width: 95%; background-color: #FFFFFF; border:1px solid #E5E5E5; text-align: left; margin: 5px 0px 5px 0px;">
	    	<div align="left" style="background-color: #E5F1FB; height: 40px; "><img src="images/transparent.png"  height="30px" width="1px" style="margin: 5px 0px 5px 0px;"/><span style=" font-size: 18px; color: #346EC9 ; letter-spacing: 1px; font-weight:bold; font-family: KaiTi; vertical-align: middle;">&nbsp;&nbsp;银行U盾</span></div>
	    	<div style="width: 100%;margin: 20px 0px 20px 0px;">
	    	<table width="100%">
	    		<tr height="50px;">
	    			<td style="width: 20%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    				<input id="UKeyinput_6" type="radio" name="radio" value="" onclick="changeBor('UKey','null','icbc_UKey')"/>&nbsp;&nbsp;
	    				<img id="box_relative" src="eid/icbc_logo.png" height="24px" width="90px" />
	    			</td>
	    			<td style="width: 20%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    				<input id="UKeyinput_2" type="radio" name="radio" value="" onclick="changeBor('UKey','null','ccb_UKey')"/>&nbsp;&nbsp;
	    				<img id="box_relative" src="eid/ccb_logo.png" height="22px" width="100px" />
	    			</td>
	    			<td style="width: 20%;">&nbsp;</td>
					<td style="width: 20%;">&nbsp;</td>
					<td style="width: 20%;">&nbsp;</td>
	    		</tr>
	    	</table>
	    	</div>
	    	<!-- 隐藏域 -->
	    	<!-- 建设银行--> 
	    	<div id="ccb_UKey" style="display: none; width: 100%; margin: 20px 0px 20px 0px;">
	    	<form action="tjwj_ud_action.jsp" id="ccb_form" method="post" target="editframe1">
		    	<table align="left" width="100%">
		    		<tr style="height:50px;">
		    			<td width="30%">
			    			<span style="height:28px; color: #666; font-size: 14px; vertical-align:middle; font-family: SimSun; letter-spacing: 2px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;U盾类型&nbsp;</span>
			    			<select name="typeCode"  id = "ccbukeyType" style="width: 120px; height: 28px; vertical-align:middle; padding: 3px 0px 3px 0px; font-size: 14px;">    				
			    				<option value="C0000">通用盾</option> 
			    				<option value="C0001">一代U盾</option>
			    				<option value="C0002">二代U盾</option>
			    			</select>		
		    			</td>
		    			<td width="70%">&nbsp;&nbsp;
		    				<input id=""  type="button"  value="签名" style="width:60px; height:30px; vertical-align:middle;" onclick="ccbSignData('B0001');" />	    				
		    			</td>
		    		</tr>
		    	</table>
		    	<div id="ccbukeyCT"></div>
		    	<div style="display:none">
				    <input type="hidden" name="openo" value='<%=openo%>'/>
				    <input type="hidden" name="fileid" value='<%=fileid%>'/>    	
				    <input type="hidden" name="name" value='<%=name%>'/>    	
				    <input type="hidden" name="idnum" value='<%=idnum%>'/> 
				    <input type="hidden" name="filedes" value='<%=filedes%>'/>    	
				    <input type="hidden" name="opetype" value='<%=opetype%>'/>    	
				    <input type="hidden" name="sysCode" value='<%=sysCode%>'/>    				     			    			     				    			     			    			     
				    <input type="hidden" name="signdata" id ="signdata"></input>
				    <input type="hidden" name="frsign" value='<%=frsign%>'/>
				    <input type="hidden" name="gdsign" value='<%=gdsign%>'/>    				      
				    <input type="hidden" name="dssign" value='<%=dssign%>'/>  
				   </div>
				 <iframe height="0" width="0" name="editframe1" src="" id="editframe1"></iframe>
	    	</form>
	    	</div>
	    	 <!-- 工商银行 -->
	       <div id="icbc_UKey" style="display: none; width: 100%; margin: 20px 0px 20px 0px;">
		    <form action="tjwj_ud_action.jsp" id="icbc_form" method="post" target="editframe">
			    <table align="center" width="100%">
		    		<tr height="50px">
		    			<td width="30%">
		    				<span style="height:28px; color: #666; vertical-align:middle; font-size: 14px; font-family: SimSun; letter-spacing: 2px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;U盾类型&nbsp;</span>
		    				<select name="typeCode"   id = "icbcukeyType" style="width: 120px; height: 28px; vertical-align:middle; padding: 3px 0px 3px 0px; font-size: 14px;">
		    					<option value="E0001">工行U盾</option>
		    				</select>
		    			</td>
		    			<td width="70%">&nbsp;&nbsp;
		    				<input id="" type="button"  value="签名"  style="width:60px; height:30px; vertical-align:middle;" onclick="icbcSignData('B0005');" />
		    			</td>
		    		</tr>
		    	</table>
                <div id="ukeyCT"></div>
				  <div style="display:none">
				    <input type="hidden" name="openo" value='<%=openo%>'/>
				    <input type="hidden" name="fileid" value='<%=fileid%>'/>    	
				    <input type="hidden" name="name" value='<%=name%>'/>    	
				    <input type="hidden" name="idnum" value='<%=idnum%>'/> 
				    <input type="hidden" name="filedes" value='<%=filedes%>'/>  
				    <input type="hidden" name="opetype" value='<%=opetype%>'/>   
				    <input type="hidden" name="sysCode" value='<%=sysCode%>'/>    				     			    			     				    			     			    			     				     				     			    			     			      				     
				    <input type="hidden" name="signdata" id ="signdata"></input>
				    <input type="hidden" name="frsign" value='<%=frsign%>'/>
				    <input type="hidden" name="gdsign" value='<%=gdsign%>'/>    				      
				    <input type="hidden" name="dssign" value='<%=dssign%>'/>   
				   </div>
				 <iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
	    	  </form>
		    </div>
	    </div>
		<!-- 企业目录 -->
		<div id="businessMenu" style="display: none;">
		<!-- 电子执照登录 -->
		<div id="privateKey" style="width: 95%; border:1px solid #E5E5E5; text-align: left; margin: 50px 0px 5px 0px;">
		<div align="left" style="background-color: #E5F1FB; height: 40px; "><img src="images/transparent.png"  height="30px" width="1px" style="margin: 5px 0px 5px 0px;"/><span style=" font-size: 18px; color: #346EC9 ; letter-spacing: 1px; font-weight:bold; font-family: KaiTi; vertical-align: middle;">&nbsp;&nbsp;电子营业执照</span></div>
	    <div style="width: 100%;margin: 20px 0px 20px 0px;">
			<table width="100%">
			   	<tr height="30px;">
					<td style="width: 30%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input id="Priinput_2" type="radio" name="radio" value="" onclick="changeBor('privateKey','Pri_span_pc','pc_Pri');"/>
						<span id="Pri_span_pc" style="font-size: 15px; color: #63B3FF; font-family: SimHei ">&nbsp;电子营业执照签名</span>
					</td>
				   	<td style="width: 20%;">&nbsp;</td>
			    	<td style="width: 20%;">&nbsp;</td>
			    	<td style="width: 30%;">&nbsp;</td>
			   	</tr>
			</table>
			<div id="pc_Pri"  style="display: none; width: 100%; margin-bottom: 20px;">		
			<form id="yyzzform" method="post" action="tjwj_yyzzsign_action.jsp" target="editframe3">
			  	<div id="dsklogindiv" style="text-align: center;"></div>
			  	<div>
				<div id='div2' name='div2' style="display: inline-block;border:5px; margin-left:95px; text-align: left;float:left;"></div>
				<div  style="float:left;margin-left:-30px;margin-top:15px;" >   
				   <table id="mc"  width="100%" cellspacing='0' cellpadding='0' align="center">
				      <tr> 
				      <td><Input type="Button" name="infoLoad1" id="infoLoad1"  style="width:60px; height:30px;margin-left:95px;" value="签名" onClick="yyzzDataSign('E0001');" />&nbsp;&nbsp;&nbsp;</td>
				     </tr>
				   </table>
				   </div>
				</div>
				<div id="A"></div>
				<div id="ukeyCT"></div>
				<div id="signCT"></div>
			 <div style="display:none">
			    <input type="hidden" name="ifud" id ="ifud"></input>
				<input type="hidden" name="mylx" id ="mylx"></input>
				<input type="hidden" name="zslx" id ="zslx"></input>
				<input type="hidden" name="hashsf" id ="hashsf"></input>
				<input type="hidden" name="ztxlh" id ="ztxlh"></input>
				<input type="hidden" name="sign" id ="sign"></input>
				<input type="hidden" name="cert" id ="cert"></input>
				<input type="hidden" name=plainText id ="plainText"></input>
			    <input type="hidden" name="openo" value='<%=openo%>'/>
			    <input type="hidden" name="fileid" value='<%=fileid%>'/>    	
			    <input type="hidden" name="name" value='<%=name%>'/>    	
			    <input type="hidden" name="idnum" value='<%=idnum%>'/>    	
			    <input type="hidden" name="frsign" value='<%=frsign%>'/>
				 <input type="hidden" name="gdsign" value='<%=gdsign%>'/>    				      
				 <input type="hidden" name="dssign" value='<%=dssign%>'/>  
			</div>
			    <iframe height="0" width="0" name="editframe3" src="" id="editframe3"></iframe>
			</form>
			</div>
	      </div>
	    </div>
	    </div>
	  </div>
	</div>
</div>
</body> 
</html> 