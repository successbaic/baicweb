<table  border="0" width="90%" align="center" height="75%" bordercolor="#000000">
<caption align="center"><b>
	<span style="font-size: 16pt">ָ���������߹�ͬί�д�����֤��</b><br><br></caption>
  <tr>
    <td align="left" height=46 >�����ˣ�<%=SysSystem.toUnderlineStr(GQDJ_JBXX.getEXPMOR(),"center",50)%></td>
  </tr>
  <tr>
    <td align="left" height=46 >��Ȩ�ˣ�<%=SysSystem.toUnderlineStr(GQDJ_JBXX.getIMPMOR(),"center",50)%></td>
  </tr>
  <tr>
    <td align="left" height=46 >ָ����������ί�д����ˣ�<%=SysSystem.toUnderlineStr(QYDJ_SQWT.getCONSIGNER(),"left",45)%></td>
  </tr>
  <tr>
    <td align="left" height=46 >ί�����_________________________________________________________</td>
  </tr>
  <tr>
    <td align="left"  height=46>ָ����������ί�д����˸����йز��ϵ�Ȩ�ޣ� </td>
  </tr>
  <tr>
    <td  height=46><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. ͬ��<%if("1".equals(QYDJ_SQWT.getIFLICENSE1())){out.print(selected);}else{out.print(checkBox);}%>��ͬ��<%if("2".equals(QYDJ_SQWT.getIFLICENSE1())){out.print(selected);}else{out.print(checkBox);}%>�޸��ļ����ϵ����ִ��� </p></td>
  </tr>
  <tr>
    <td  height=46><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. ͬ��<%if("1".equals(QYDJ_SQWT.getIFLICENSE2())){out.print(selected);}else{out.print(checkBox);}%> ��ͬ��<%if("2".equals(QYDJ_SQWT.getIFLICENSE2())){out.print(selected);}else{out.print(checkBox);}%> �޸��йر������д���� </p></td>
  </tr>
  <tr>
    <td  height=46><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.  ������Ȩ���������<%=SysSystem.toUnderlineStr(QYDJ_SQWT.getCONITEM(),"left",45)%> </p></td>
  </tr>
  <tr>
    <td align="left"  height=46>ί����Ч���� �� <%=(QYDJ_SQWT.getCONFROM()==null || QYDJ_SQWT.getCONFROM().equals(""))?"":icms.getFormatDate(QYDJ_SQWT.getCONFROM())%>��<%=(QYDJ_SQWT.getCONTO()==null || QYDJ_SQWT.getCONTO().equals(""))?"":icms.getFormatDate(QYDJ_SQWT.getCONTO())%></td>
  </tr>
  <tr>
    <td  align="center" height="200" >
	
	<table width="500" border="1"  height="200">
      <tr>
        <td align="center">��ָ����������ί�д���
������֤��ӡ��ճ������
</td>
      </tr>
    </table>
  </tr>
  <tr>
    <td align="left" height="80">�����ˡ���Ȩ�˸��»�ǩ�֣�</td>
  </tr>
  <tr>
    <td align="right"  height=46>  &nbsp;&nbsp;&nbsp;&nbsp;��  &nbsp;&nbsp;&nbsp;&nbsp;��  &nbsp;&nbsp;&nbsp;&nbsp;��</td>
  </tr>
  <tr>
    <td  height=46><p>ע��1.�����˺���Ȩ���Ƿ��˺�������֯��������£������˺���Ȩ������Ȼ�˵�����ǩ�֡� </p></td>
  </tr>
</table>