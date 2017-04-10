<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
response.setHeader("Expires","0");
%>
<%@ page import="java.util.*"%>
<%@ page errorPage="../error.jsp"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page contentType="text/html;charset=GBK"%>

<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="GGGL_JYDW_JBXX" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JBXX"/>
<jsp:useBean id="GGGL_JYDW_HCQK" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_HCQK"/>
<jsp:useBean id="GGGL_USER" scope="session" class="com.macrosoft.icms.ggxkz.GGGL_USER"/>
<%	
  String ADBULICNO=GGGL_USER.getADBULICNO();
  int INSYEAR=GGGL_USER.getINSYEAR();
  
  GGGL_JYDW_JBXX.setADBULICNO(ADBULICNO);
  GGGL_JYDW_JBXX.setINSYEAR(INSYEAR);
  GGGL_JYDW_JBXX.doSelect();
  
  GGGL_JYDW_HCQK.setADBULICNO(ADBULICNO);
  GGGL_JYDW_HCQK.setINSYEAR(INSYEAR);
  GGGL_JYDW_HCQK.doSelect();
  String cheopin=GGGL_JYDW_HCQK.getCHEOPIN();
  String othercheopin=GGGL_JYDW_HCQK.getOTHERCHEOPIN();
%>
<html><head><title>广告经营单位广告经营资格检查表</title>
</head>
<body style="text-align: center">
<style>table{border-collapse: collapse;}
</style>
<style media="print">
.Noprint{display:none;}
.PageNext{page-break-before: always;}
tr{font-size: 12pt;}
.tr9{font-size: 9pt;}
.tdprint{text-align: left;text-indent: 2;}
</style>

<input type="button" value="打印通知书" onclick="window.focus();window.print();" class="NOPRINT">
<input name=back type="button" value="关   闭" onclick="window.close();" class="NOPRINT">
<font  color="red" id="shelp" class="noprint" style="font-size: 9pt;" class="NOPRINT">(请用A4纸打印,在打印之前请在IE->文件->页面设置"中将"页眉页脚"清空)</font>
		
<table width="90%" align="center" bordercolor="#000000">
     <tr>
        <td class="formTd02">
           <br><br><br><br>
           <p align="center" class="textCenter22"  style="font-family:'黑体';font-size:19pt;">
           广告许可证资格检查驳回通知书</p>
           </td>
      </tr>
     <tr>
     <td class="formTd02">
      <br><br><br><br>
           <p style="height:10">&nbsp;</p>
          
           <p style="font-size: 14pt; line-height: 200%; margin-top: 0; margin-bottom: 0;text-align:left"><font class="textShowContent">&nbsp;<%=GGGL_JYDW_JBXX.getADBUENT()%></font>:</p>
           <p style="font-size: 14pt; line-height: 200%; margin-top: 0; margin-bottom: 0;text-align:left"><font class="textShowContent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;你单位申报的材料存在以下问题未通过预审，请补正全部内容后重新申报网上资格检查。</font></p>
           <p style="height:30">&nbsp;</p>
           </td>
        </tr>
           <tr>
           <td class="formTd02">
          
           <p style="font-size: 14pt; line-height: 200%; margin-top: 0; margin-bottom: 0;text-align:left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;驳回原因:
           <%if(cheopin.equals("1")){out.print("具备经营广告业务资格，通过检查。");}
             else if(cheopin.equals("2")){out.print("缓期通过检查，限期整改。");}
             else if(cheopin.equals("3")){out.print("核减其广告经营项目。");}
             else if(cheopin.equals("4")){out.print("不具备经营广告业务资格，核销《广告经营许可证》。");}
             %> 

	  </td>
	  </tr>

  </tr>
  <tr>
  <td class="formTd02">
  	   <p style="height:100">&nbsp;</p>
           <p style="font-size: 14pt;height:30"align="Right">(印章)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
           <p style="font-size: 14pt;height:30"align="Right"><%=GGGL_JYDW_HCQK.getCHEDATE()%>&nbsp;&nbsp;&nbsp;&nbsp;</p>
  </td>

     </tr>
</table>
</body></html>