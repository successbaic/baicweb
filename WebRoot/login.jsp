<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.Random"%>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<%@ page import="com.macrosoft.icms.util.PropertiesConfigUtil"%>
<html>
	<head>
		<title>用户登录</title>
		<!--  <OBJECT id=PkiCom_3E6E10ED_201311060001 classid="CLSID:0DC9CA0C-ED42-4C87-A335-1B0BD043FC71">
        <PARAM NAME="_Version" VALUE="65536">
        <PARAM NAME="_ExtentX" VALUE="2646">
        <PARAM NAME="_ExtentY" VALUE="1323">
        <PARAM NAME="_StockProps" VALUE="0">
        </OBJECT> -->
        
        <OBJECT id=i_com classid=CLSID:BC96F5A4-C930-4226-ADAB-59349AE585E9></OBJECT>
        
		<script language="javascript" src="<%=request.getContextPath()%>/support/jquery-1.8.3.js"></script>
		<script language="javascript" src="<%=request.getContextPath()%>/support/md5.js"></script>
		<%-- <script language="javascript" src="<%=request.getContextPath()%>/eid/eIDPluginHelper2.0.js"></script>
		<script language="javascript" src="<%=request.getContextPath()%>/eid/base64.js"></script>
		<script language="javascript" src='<%=request.getContextPath()%>/eid/jquery-1.8.2.js'></script>
    	<script language="javascript" src='<%=request.getContextPath()%>/eid/eIDUI/eIDSelect/jquery.eIDSelect.js'></script>
   		<script language="javascript" src='<%=request.getContextPath()%>/eid/eIDUI/eIDSelect/eIDUI-common.js'></script>
    	<link   rel="stylesheet" href="<%=request.getContextPath()%>/eid/eIDUI/eIDSelect/jquery.eIDSelect.css"> --%>
		<script language="javascript">
		//enter事件
function enterSubmit(e){
		var event = $.event.fix(e);
		var  kCode = event.keyCode;
		if(kCode == 13){
			$("#submit").trigger("click");
		}
		return false;
}
//检查验证码
 function checkImageCode(){
		 	$.ajax({
				url:"validateImageAction.action",
				type:"post",
				data:"imageCode="+$("#validateCode").val(),
				success:function(resStr){
					if(resStr == "success"){
					 var passWord=document.userLogin.PASSWORD.value;
					 var salt = "1#2$3%4(5)6@7!poeeww$3%4(5)djjkkldss";
					 document.userLogin.PASSWORD.value=hex_md5(passWord + "" + salt );
					 userLogin.submit();
					}else{
						alert("验证码不正确！");
					}	
				}
			});
		}
		
  function login(){
     var loginId = document.userLogin.LOGINID.value;
     var passWord = document.userLogin.PASSWORD.value;
     if(loginId==null||loginId==''){
        alert("用户名不能为空！");
        document.userLogin.LOGINID.focus();
        return;
     }
     else if(passWord==null||passWord==''){
        alert("密码不能为空！");
        document.userLogin.PASSWORD.focus();
        return;
     }  
     // userLogin.submit();
     checkImageCode();
   }
   /* function login2(){
    var pinma = document.userLogin.PINMA.value;
    if(pinma==null||pinma==''){
    	alert("PIN码不能为空！");
        document.userLogin.PINMA.focus();
        return;
    }
    readCert_no_submit();
   } */
   /*
   function focusNext(form, elemName, evt) {
    evt = (evt) ? evt : event;
    var charCode = (evt.charCode) ? evt.charCode :
	   ((evt.which) ? evt.which : evt.keyCode);
    if (charCode == 13 || charCode == 3) {
	   form.elements[elemName].focus();
	   return false;
    }
    return true;
	}
	*/
	/*
	function submitViaEnter(evt,Location) {
	evt = (evt) ? evt : event;
	var target = (evt.target) ? evt.target : evt.srcElement;
	var form = target.form;
	var charCode = (evt.charCode) ? evt.charCode :
	   ((evt.which) ? evt.which : evt.keyCode);
	if (charCode == 13 || charCode == 3) {
		document.userLogin.logsub.onclick();
		return false;
	}
	return true;
	}
	*/
	function body_load(){
		//var bodyWidth=document.body.offsetWidth;
		//var bodyHeight=document.body.offsetHeight;
		/**var s = "";   
	      s += " 网页可见区域宽："+ document.body.clientWidth+"\n";    
	      s += " 网页可见区域高："+ document.body.clientHeight+"\n";    
	      s += " 网页可见区域宽："+ document.body.offsetWidth + " (包括边线和滚动条的宽)"+"\n";    
	      s += " 网页可见区域高："+ document.body.offsetHeight + " (包括边线的宽)"+"\n";    
	      s += " 网页正文全文宽："+ document.body.scrollWidth+"\n";    
	      s += " 网页正文全文高："+ document.body.scrollHeight+"\n";    
	      s += " 网页被卷去的高(ff)："+ document.body.scrollTop+"\n";    
	      s += " 网页被卷去的高(ie)："+ document.documentElement.scrollTop+"\n";    
	      s += " 网页被卷去的左："+ document.body.scrollLeft+"\n";    
	      s += " 网页正文部分上："+ window.screenTop+"\n";    
	      s += " 网页正文部分左："+ window.screenLeft+"\n";    
	      s += " 屏幕分辨率的高："+ window.screen.height+"\n";    
	      s += " 屏幕分辨率的宽："+ window.screen.width+"\n";    
	      s += " 屏幕可用工作区高度："+ window.screen.availHeight+"\n";    
	      s += " 屏幕可用工作区宽度："+ window.screen.availWidth+"\n";    
	      s += " 你的屏幕设置是 "+ window.screen.colorDepth +" 位彩色"+"\n";    
	      s += " 你的屏幕设置 "+ window.screen.deviceXDPI +" 像素/英寸"+"\n";    
	      alert (s);**/
				
		//document.getElementById("zbddDiv").style.left=(bodyWidth/2)-220;
		//document.getElementById("zbddDiv").style.top=(bodyHeight-100);
		$(document).keypress(function(e)  
    	{  
        switch(e.which)  
        {  
            // user presses the "enter"  
            case 13:    login();  
                        break;    
                          
        }  
    }); 
    /* submit1(); */
    //eid
   /*  eID.setDeviceDiv({
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
                var myTime = new Date();
                var yyyy = myTime.getFullYear();
                var MM = myTime.getMonth() + 1;
                var dd = myTime.getDate();
                var HH = myTime.getHours();
                var mm = myTime.getMinutes();
                var ss = myTime.getSeconds();
                var myTimeStr = "" + yyyy + (MM > 9 ? MM : "0" + MM)
			+ (dd > 9 ? dd : "0" + dd) + (HH > 9 ? HH : "0" + HH)
			+ (mm > 9 ? mm : "0" + mm) + (ss > 9 ? ss : "0" + ss);
                // as in doc, data_to_sign must be with such format as follow:
                var dataToSign = myTimeStr + ":" + myTimeStr + ":data";
                var b = new Base64();
                var dataToSignBase64 = b.encode(dataToSign);
               // alert(dataToSignBase64);
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
                	var NAME = document.userLogin.NAME.value;
                    var IDNUM = document.userLogin.IDNUM.value;
                    if(NAME==null||NAME==''){
				    	alert("用户名不能为空！");
				        document.userLogin.NAME.focus();
				        return;
				    }
                    if(IDNUM==null||IDNUM==''){
				    	alert("证件号码不能为空！");
				        document.userLogin.IDNUM.focus();
				        return;
				    }
                    if (evt.rv != 0) {
                        alert('sign失败，返回码为 ' + evt.rv + ':' + evt.msg);
                    }
                    else {
                   //alert('sign调用成功，result为' + evt.data.signResult + '，idCarrier为' + evt.data.idCarrier + '，issuer为' + evt.data.issuer + '，subject为' + evt.data.subject + '，certSn为' + evt.data.certSn + '，issuerSn为' + evt.data.issuerSn + '，alg为' + evt.data.alg);
				    document.userLogin.result.value=evt.data.signResult;
				    document.userLogin.issuer.value=evt.data.issuer;
				    document.userLogin.certSn.value=evt.data.certSn;
				    document.userLogin.issuerSn.value=evt.data.issuerSn;
				    document.userLogin.subject.value=evt.data.subject;
				    document.userLogin.toSignData.value=toSignData;
					userLogin.submit();
					}
                }
            }); */
	}
	/*
	var Browser_Name=navigator.appName;
    var Browser_Version=parseFloat(navigator.appVersion);
    var Browser_Agent=navigator.userAgent;
    var Actual_Version,Actual_Name;
    var is_IE=(Browser_Name=="Microsoft Internet Explorer");
    if(is_IE){
    
    }else{
    	alert("本系统建议使用IE浏览器，您当前使用的浏览器不是IE浏览器！");
    }
    */
    function isIE() { //ie?
            if (!!window.ActiveXObject || "ActiveXObject" in window)
                return true;
            else
                return false;
    }
    if (!isIE()) {
    	alert("本系统建议使用IE浏览器，您当前使用的浏览器不是IE浏览器！，IE10以上请选择兼容IE8模式");
    }
   /*  function submit2(){
	    $("#Login1").hide();
	    $("#Login2").show();
	    $("#Login3").hide();
    }
    function submit1(){
    	$("#Login2").hide();
	    $("#Login1").show();
	    $("#Login3").hide();
    }
    function submit3(){
    	$("#Login2").hide();
	    $("#Login3").show();
	    $("#Login1").hide();
    } */
    
    function submit2(){
    	var urls="<%=request.getRequestURL()%>";
    	var url=urls.slice(0,-9);
    	var organCode="<%=icms.getCURRENTUNIT()%>";
    	document.form1.postURL.value="<%=icms.getCURRENTURL()%>/index.jsp";
    	document.form1.areaCode.value="370000"//organCode;
    	form1.submit();
 }
    
    var TP_USER=1;
    
    function readCert_no_submit(){

	var i_com = PkiCom_3E6E10ED_201311060001;
	
	var PIN = document.userLogin.PINMA.value;
		
	ret = i_com.BLicInit();
	
	if(ret !=0){
		
	   alert("智能卡初始化失败"+ret);
		
       return ret;
       
	}
	
	
	ret = i_com.BLicLogin(TP_USER,PIN);
	
    if (!ret){
    	
        alert("登录智能卡失败，请确认输入的口令是否正确!");
      
        return -1;
      
    }
	//读取执照开始

	var gsCert=i_com.BLicRead();

	//alert(gsCert);
	if(gsCert!=null){
		
		document.userLogin.cert.value=gsCert;
		alert("读取执照成功");
		userLogin.submit();
	}else{
		alert("读取执照失败");
	}

	//读取执照结束
  
	ret = i_com.BLicLogout();
	
	
  if (!ret){
	  
      alert("智能卡退出失败!");
      
      return -1;
      
   }
  
  
	ret = i_com.BLicEnd();
	
	
	if(ret !=0){
		
		alert("智能卡释放失败"+ret);
		
        return ret;
        
	}

}

</script>
<style type="text/css">
#Container{
    width:1024px;
    margin:0 auto;/*设置整个容器在浏览器中水平居中*/   
}
#Header{
    height:100px;
}

.Clear{
    clear:both;
}
#Content{
width: 1024px; 
height: 430px; 
margin-top: 30px; 
backgroud-color: white; 
text-align: center;
cursor:pointer;
background-image:url(<%=request.getContextPath()%>/images/login/login_center.png);
background-repeat: no-repeat;
}
</style>
	</head>
	<body
		style="text-align: center; margin: 0; background-repeat: no-repeat; background-color: white;"
		onLoad="body_load()">
		<form name="userLogin" method="POST" action="web/index_action.jsp" target="editframe">
		<div id="Container">
			 <div id="Header">
				<div style="float: left; width: 400px; margin-top: 30px;">
					<%
					if(icms.getCURRENTUNIT().startsWith("22")){
					%>
					<img style="width: 400px; height: 70px; margin-left: 50px;"
						src="<%=request.getContextPath()%>/images/login/login_top_jl.png" />
					<%
					}else{
					if("370200".equals(icms.getCURRENTUNIT())){
					%>
					<img style="width: 400px; height: 70px; margin-left: 50px;"
						src="<%=request.getContextPath()%>/images/login/login_top_qd.png" />
					<%}else{ %>
					<img style="width: 400px; height: 70px; margin-left: 50px;"
						src="<%=request.getContextPath()%>/images/login/login_top_sd.png" />
					<%}
					} %>
				</div>
				
				<div style="float: left; width: 300px; margin-left: 200px; margin-top: 60px;">
				<a href="" onClick="javacript:window.location.href='index.jsp'"
					style="cursor: hand; font-size: 16px; color: black; font-weight: bold">返回首页</a>
				|
				<a href="userregist/regist_pre.jsp"
					style="cursor: hand; font-size: 16px; color: black; font-weight: bold"
					target='_blank'>注 册</a> |
				<a href="usermodify/modify_pwd1.jsp?flag=1"
					style="cursor: hand; font-size: 16px; color: black; font-weight: bold"
					target='_blank'>忘记密码</a>
				</div>		
		    </div>
		    <div class="Clear"><!--如何你上面用到float,下面布局开始前最好清除一下。--></div>
		    
		    <div id="Content">
		    	<div style="height:135px;margin:0px;"></div>
		    	<div style="float: left;width: 620px; height:400px;margin:0px;"></div>
				<div id="Login1" style="float: left;width: 385px; height:400px;margin:0px;" >
					<div style="width: 350px; height: 26px;">
						<font color="" style="font-size: 16px"> <strong>用户名：&nbsp;&nbsp;</strong>
						</font>
						<input type="text" id="LOGINID" name="LOGINID"
							style="font-size: 18px; width: 100px; border: none; height: 26px; background-color: #FFFFFF" />
					</div>
					<div style="margin-top: 20px; width: 350px; height: 26px;">
						<font color="" style="font-size: 16px"> <strong>密&nbsp;&nbsp;码：&nbsp;&nbsp;</strong>
						</font>
						<input type="password" id="PASSWORD" name="PASSWORD"
							style="width: 100px; border: none; height: 26px; background-color: #FFFFFF" />
					</div>

					<div
						style="width: 350px; height: 26px; line-height: 26px; margin-top: 20px;">
						<!-- 
						<font color="" style="font-size: 16px"> <strong>验证码：&nbsp;&nbsp;</strong> 
						</font>
						-->
						<img style="" id="validateImage" src="imageAction.action"
							width="100px" height="23px"
							onclick="this.src='imageAction.action?time='+(new Date()).getTime();" />
						&nbsp;
						<input type="text" name="validateCode" id="validateCode"
							style="height: 26px; line-height: 26px; font-size: 18px; width: 80px; border: none; height: 26px; background-color: #FFFFFF" />
						<!-- 
						<a href="#"
							onclick="document.getElementById('validateImage').src='imageAction.action?time='+(new Date()).getTime();"
							tabindex="-1">看不清，换一张</a>
							 -->
					</div>
					
					<div
						style="margin-top: 10px; width: 350px; height: 20px; text-align: center;">
						<img src="images/login/login.png"
							style="cursor: pointer; margin-left: 45px;" id="logsub"
							onClick="login();" />
					</div>
					<% if("370700".equals(icms.getCURRENTUNIT())){%>			
					<div style="margin-top: 15px;"> 
					  <input name="button" type="button" value="潍坊高新区全程电子化统一认证入口" onclick="submit2();" style="width: 220px;cursor: pointer;margin-left: 45px;"/><br><br>
					</div>
					<%} %>
					<!-- <div style="margin-top: 5px;"> 
					  <input name="button" type="button" value="电子营业执照登录入口" onclick="submit2();" style="width: 150px;"/><br><br>
					  <input name="button" type="button" value="eID登录入口" onclick="submit3();" style="width: 150px;"/>
					</div> -->
				</div>
				<!-- <div id="Login2" hidden="true" style="float: left;width: 385px; height:400px;margin:0px;">
					<div style="width: 350px; height: 26px;">
						<font color="" style="font-size: 16px"> <strong>请输入PIN码：&nbsp;&nbsp;</strong>
						</font>
						<input type="text" id="PINMA" name="PINMA"
							style="font-size: 18px; width: 100px; border: none; height: 26px; background-color: #FFFFFF" />
						<input type="hidden" name="cert" id ="cert">
					</div>
					<div
						style="margin-top: 20px; width: 350px; height: 26px; text-align: center;">
						<img src="images/login/login.png"
							style="cursor: pointer; margin-left: 45px;" id="logsub2"
							onClick="login2();" />
					</div>
					<div style="margin-top: 20px;"> 
					  <input name="button" type="button" value="普通用户登录入口" onclick="submit1();" style="width: 150px;"/><br><br>
					  <input name="button" type="button" value="eID登录入口" onclick="submit3();" style="width: 150px;"/>
					</div>
				</div>
				<div id="Login3" hidden="true" style="float: left;width: 385px; height:400px;margin:0px;">
					<div id='div1' style="display: inline-block;margin-left: 30px; width: 350px; height: 50px; text-align: center;">
        			</div>
					<div style="margin-top: 5px;width: 350px; height: 26px;">
						<font color="" style="margin-left: 30px;font-size: 16px"> <strong>用&nbsp;户&nbsp;名：&nbsp;&nbsp;</strong>
						</font>
						<input type="text" id="NAME" name="NAME"
							style="font-size: 18px; width: 150px; border: none; height: 26px; background-color: #FFFFFF" />
					</div>
					<div style="margin-top: 5px;width: 350px; height: 26px;">	
						<font color="" style="margin-left: 30px;font-size: 16px"> <strong>证件号码：&nbsp;&nbsp;</strong>
						</font>
						<input type="text" id="IDNUM" name="IDNUM"
							style="font-size: 18px; width: 150px; border: none; height: 26px; background-color: #FFFFFF" />
						<input type="hidden" name="result" id ="result">
						<input type="hidden" name="issuer" id ="issuer">
						<input type="hidden" name="certSn" id ="certSn">
						<input type="hidden" name="issuerSn" id ="issuerSn">
						<input type="hidden" name="toSignData" id ="toSignData">
						<input type="hidden" name="subject" id ="subject">
						
					</div>
					<div
						style="margin-top: 5px; width: 350px; height: 26px; text-align: center;">
						<img src="images/login/login.png"
							style="cursor: pointer; margin-left: 45px;" id="btn1"
							 />
					</div>
					<div style="margin-top: 5px;"> 
					   <input name="button" type="button" value="电子营业执照登录入口" onclick="submit2();" style="width: 150px;"/><br><br>
					   <input name="button" type="button" value="普通用户登录入口" onclick="submit1();" style="width: 150px;"/>
					</div>
				</div> -->
			</div>
			
			<div class="Clear"><!--如何你上面用到float,下面布局开始前最好清除一下。--></div>
			
		<div style="width: 1024px; height: 30px;margin:-10px;"id="zbddDiv">
			<font color="#FFFFFF"
				style="font-size: 16px; color: #A2A2A2; font-weight: bold">
				主办单位：<%=PropertiesConfigUtil.getValue("deployregorg")%>
				&nbsp;技术支持：浪潮软件股份有限公司</font>
		</div>
		</div>
		</div>
		</form>
		
		<form name="form1" method="post" action="http://<%=icms.getELECLOGINURL() %>/uniformVerify/login.do">
		<input type="hidden" name="postURL" id="postURL" size=10  />
		<input type="hidden" name="areaCode" id="areaCode" />
		</form>
					
		<iframe style="display: none;" height="0" width="100" name="editframe"
			src="" id="editframe" scrolling="no" border="1" align='center'
			frameborder="0"></iframe>
	</body>
</html>
