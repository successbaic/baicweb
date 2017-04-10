function funSetFormData(name,value)  //�����еĶ���Ϊ��ά���� objarr 0 ������ 1ֵ
{
	objarr=document.getElementsByName(name.toUpperCase());
	for (var i=0; i<objarr.length; i++)
	{		
		obj=objarr[i];
		if (obj!=null)
		{
			if ((obj.tagName).toUpperCase()=="INPUT")
			{				
				switch (obj.type.toUpperCase())
				{
					case "TEXT":
					{
						fucSetText(obj,value);
						break;
					}
					case "CHECKBOX":
					{
						fucSetChecked2(obj,value);
						break;
					}
					case "HIDDEN":
					{
						fucSetText(obj,value);
						break;
					}
					case "RADIO":
					{
						fucSetChecked2(obj,value);
						break;
					}
					default: 
					{				
						break;
					}
				}
			}
			else if (obj.tagName.toUpperCase()=="SELECT")
			{
				fucSetSelected(obj,value);
			}
			else if (obj.tagName.toUpperCase()=="TEXTAREA")
			{
				fucSetText(obj,value);
			}
		}

	}
	
}

function GetNumber( obj_user, svalue)
{
	var loopcount;

	loopcount=obj_user.options.length;
	for(var i=0;i<loopcount;i++)

		if ( obj_user.options(i).value==svalue )
		{
			return i;
			break;
		}
	return -1;
}
function fucDisplay(objname,sValue)
{	
	var obj=document.getElementsByName(objname);
	for(var i=0;i<obj.length;i++)
	{
		obj[i].style.display=sValue;
	}
}

function fucDisableText( obj )
{
	if (obj.length != undefined)
	{	
		obj.disabled=true;
		for(var i=0;i<obj.length;i++)
		{
			obj[i].disabled=true;
		}
	}
	else
	{
		obj.disabled=true;
	}	
	
}

function fucEnableText( obj )
{
	if (obj.length != undefined)
	{
		obj.disabled=false;
		for(var i=0;i<obj.length;i++)
		{
			obj[i].disabled=false;
		}
	}
	else
	{
		obj.disabled=false;
	}	
}


function fucDisableSelected( obj )
{
	obj.disabled=true;
}

function fucEnableSelected( obj )
{
	obj.disabled=false;
}

function fucDisableChecked( obj )
{
	obj.disabled=true;
}

function fucEnableChecked( obj )
{
	obj.disabled=false;
}


function fucSetText( obj, sValue )
{
	obj.value=sValue;
}

function fucSetTextArea( obj, sValue)
{
	obj.value=sValue;
}

function fucSetInnerHtml( obj, sValue)
{
	obj.innerHTML=sValue;
}

function fucSetInnerText( obj, sValue)
{
	obj.innerText=sValue;
}

function fucSetSelected( obj, sValue )
{
	if (obj.multiple==true)		//�����ѡ
	{
		obj.options[GetNumber(obj,sValue)].selected=true;
	}
	else
	{
		var j=GetNumber( obj, sValue);
		if (j>=0)
		{
			obj.selectedIndex=j;

		}
		else
		{
			var myOption;
			myOption = document.createElement("OPTION");
			myOption.text=sValue;
			myOption.value=sValue;
			obj.add( myOption );
			obj.selectedIndex=GetNumber( obj, sValue);
		}
		
		
	}
}

function fucSetFocus( obj )
{
	obj.focus();
}

//���ñ�ѡ�е�RadioButton
//sObj:��Ҫ���õ�RadioButton���֣����磺"document.form1.sex"
//sValue:ѡ���ֵ
function fucSetChecked( sObj, sValue )
{
	var i;
	var nLength;
	if ( sValue==null || sValue=="")	//�����������ֵΪ�գ��򷵻�
	{
		return;
	}
	if ( eval( sObj + ".length==null" ) )		//�������飬ֵ��һ��ѡ�ť
	{
		if ( eval( sObj + ".value=='"+sValue+"'" ) )
		{
			eval( sObj + ".checked=true" );
		}
		else
		{
			eval( sObj + ".checked=false" );
		}
	}
	else
	{
		nLength=eval( sObj + ".length" )
		for( i=0; i<nLength; i++ )
		{
			if (eval( sObj + "[" + i + "].value=='" + sValue+"'"))
			{
				eval( sObj + "[" + i + "].checked=true" );
			}
			else
			{
				//eval( sObj + "[" + i + "].checked=false" );
			}
		}
	}
}
//���ñ�ѡ�е�RadioButton
//sObj:��Ҫ���õ�RadioButton���֣����磺"document.form1.sex"
//sValue:ѡ���ֵ
function fucSetChecked2( sObj, sValue )
{
	var i;
	var nLength;
	var	ss=sValue.split(",");
	if ( sValue==null || sValue=="")	//�����������ֵΪ�գ��򷵻�
	{
		return;
	}
	if ( sObj.length==null  )		//�������飬ֵ��һ��ѡ�ť
	{		
		for (j=0;j<ss.length;j++ )
		{
			if (sObj.value==ss[j])
			{			
				sObj.checked=true;
			}
		}		
		
	}
	else
	{
		nLength= sObj.length;
		for( i=0; i<nLength; i++ )
		{
			for (j=0;j<ss.length;j++ )
			{
				if (sObj[i].value==ss[j])
				{					
					sObj[i].checked=true;
				}
			}
					
		}
	}
}
function fucSetTextConvert1( sObj1,sObj2 )
{
	var whole = sObj1.value;
	//����������С��
	var num;
	var dig;
	if(whole.indexOf(".") == -1)
	{
		num = whole;
		dig = "";
	}
	else
	{
		num = whole.substr(0,whole.indexOf("."));
		dig = whole.substr( whole.indexOf(".")+1, whole.length);
	}
	//ת����������
	var i=1;
	var len = num.length;
	var dw2 = new Array("","��","��");//��λ
	var dw1 = new Array("ʰ","��","Ǫ");//С��λ
	var dw = new Array("","Ҽ","��","��","��","��","½","��","��","��");//����������
	var dws = new Array("��","Ҽ","��","��","��","��","½","��","��","��");//С��������
	var k1=0;//��С��λ
	var k2=0;//�ƴ�λ
	var str="";
	for(i=1;i<=len;i++)
	{
		var n = num.charAt(len-i);
		if(n=="0")
		{
			if(k1!=0)
			str = str.substr( 1, str.length-1);
		}

		str = dw[Number(n)].concat(str);//������

		if(len-i-1>=0)//�����ַ�Χ��
		{
			if(k1!=3)//��С��λ
			{
				str = dw1[k1].concat(str);
				k1++;
			}
			else//����С��λ���Ӵ�λ
			{
				k1=0;
				var temp = str.charAt(0);
				if(temp=="��" || temp=="��")//����λǰû����������ȥ��λ
				str = str.substr( 1, str.length-1);
				str = dw2[k2].concat(str);
			}
		}
		if(k1==3)//С��λ��ǧ���λ��һ
		{
			k2++;
		}
	}
	//ת��С������
	var strdig="";
	for(i=0;i<2;i++)
	{
		var n = dig.charAt(i);
		strdig += dws[Number(n)];//������
	}
	str += "��"+strdig+"Ԫ";
	sObj2.value = str;
}
function fucSetTextConvert2( obj )
{
	var whole = obj;
	//����������С��
	var num;
	var dig;
	if(whole.indexOf(".") == -1)
	{
		num = whole;
		dig = "";
	}
	else
	{
		num = whole.substr(0,whole.indexOf("."));
		dig = whole.substr( whole.indexOf(".")+1, whole.length);
	}
	//ת����������
	var i=1;
	var len = num.length;
	var dw2 = new Array("","��","��");//��λ
	var dw1 = new Array("ʰ","��","Ǫ");//С��λ
	var dw = new Array("","Ҽ","��","��","��","��","½","��","��","��");//����������
	var dws = new Array("��","Ҽ","��","��","��","��","½","��","��","��");//С��������
	var k1=0;//��С��λ
	var k2=0;//�ƴ�λ
	var str="";
	for(i=1;i<=len;i++)
	{
		var n = num.charAt(len-i);
		if(n=="0")
		{
			if(k1!=0)
			str = str.substr( 1, str.length-1);
		}

		str = dw[Number(n)].concat(str);//������

		if(len-i-1>=0)//�����ַ�Χ��
		{
			if(k1!=3)//��С��λ
			{
				str = dw1[k1].concat(str);
				k1++;
			}
			else//����С��λ���Ӵ�λ
			{
				k1=0;
				var temp = str.charAt(0);
				if(temp=="��" || temp=="��")//����λǰû����������ȥ��λ
				str = str.substr( 1, str.length-1);
				str = dw2[k2].concat(str);
			}
		}
		if(k1==3)//С��λ��ǧ���λ��һ
		{
			k2++;
		}
	}
	//ת��С������
	var strdig="";
	if (dig==""||dig=="00"||dig=="0")
	{
		str += "Բ��";
	}
	else
	{
		var n = dig.charAt(0);
		if (n!="")
		{
			strdig += dws[Number(n)];//������
			str +="Բ"+strdig+"��";
		}
		var m = dig.charAt(1);
		if (m!="")
		{
			strdig="";
			strdig += dws[Number(m)];//������
			str +=strdig+"��";
		}
	}
		return str;
}

function funcGetDX(obj, cnt)	// ��ȡ��д
{
	var dws = new Array("��","Ҽ","��","��","��","��","½","��","��","��");
	// �����ո�
	var space="";
	for (var i=0;i<cnt;i++)
		space+="&nbsp;";

	var leng=obj.length;
	var ret="";
	for (var j=0;j<leng;j++)
	{
		m=obj.charAt(j);
		dig = dws[Number(m)];
		if (j==leng-1)
			ret += dig;
		else
			ret += dig+space;
	}
	return ret;
}
function funDisblank(obj)
{
	if (obj!=null) 
	{
		var rng = obj.createTextRange();
		rng.text = "*";
	}
}

function FormatNumber(srcStr,nAfterDot)
{
	var srcStr,nAfterDot;
	var resultStr,nTen;
	srcStr = ""+srcStr+"";
	strLen = srcStr.length;
	dotPos = srcStr.indexOf(".",0);
	if (dotPos == -1)
	{
		resultStr = srcStr+".";
		for (i=0;i<nAfterDot;i++)
		{
			resultStr = resultStr+"0";
		}
	}
	else
	{
		if ((strLen - dotPos - 1) >= nAfterDot)
		{
			nAfter = dotPos + nAfterDot + 1;
			nTen =1;
			for(j=0;j<nAfterDot;j++)
			{
			nTen = nTen*10;
			}
   
			resultStr = Math.round(parseFloat(srcStr)*nTen)/nTen;   
			var a="";
			resultStr=resultStr+a;
			dotPos = resultStr.indexOf(".",0);
			if (dotPos==-1)
			{
			}
			else
			{
				var leng=0;
				leng=resultStr.length-1-dotPos;
				if (nAfterDot>leng)
				for (i=0;i<nAfterDot-leng;i++)
				{
					resultStr = resultStr+"0";
				}
			}
		}
	else
	{
		resultStr = srcStr;
		for (i=0;i<(nAfterDot - strLen + dotPos + 1);i++)
		{
			resultStr = resultStr+"0";
		}
	}
}
	return resultStr;
}

function   toChineseMoney( value)     //�����������ַ�������ĵĴ�д����   
{   

                  var   intFen,i;   
                  var   strArr,strCheck,strFen,strDW,strNum,strBig,strNow;   
                  if   (value   ==   null)       //���ݷǷ�ʱ��ʾ�������ؿմ�   
                  {   
                                  strErr   =   "����"+value+"�Ƿ���"   
                                  alert(strErr);   
                                  return   "";   
                  }   
                  if(value==0)   
                                  return   "��";   
                  strCheck   =   value+".";   
                  strArr   =   strCheck.split(".");   
                  strCheck   =   strArr[0];   
                  if(strCheck.length>12)       //���ݴ��ڵ���һ����ʱ��ʾ�޷�����   
                  {   
                                  strErr   =   "����"+value+"�����޷�����"   
                                  alert(strErr);   
                                  return   "";   
                  }   
                  try   
                  {   
                                  i   =   0;   
                                  strBig   =   "";   
                                  intFen   =   value*100;                     //ת��Ϊ�Է�Ϊ��λ����ֵ   
                                  strFen   =   intFen.toString();   
                                  strArr   =   strFen.split(".");   
                                  strFen   =   strArr[0];   
                                  intFen   =   strFen.length;             //��ȡ����   
                                  strArr   =   strFen.split("");//��������ֵ�ֽ⵽������   
                                  while(intFen!=0)       //�ֽⲢת��   
                                  {   
                                                  i   =   i+1;   
                                                  switch(i)                             //ѡ��λ   
                                                  {   
                                                                  case   1:strDW   =   "��";break;   
                                                                  case   2:strDW   =   "��";break;   
                                                                  case   3:strDW   =   "Ԫ";break;   
                                                                  case   4:strDW   =   "ʰ";break;   
                                                                  case   5:strDW   =   "��";break;   
                                                                  case   6:strDW   =   "Ǫ";break;   
                                                                  case   7:strDW   =   "��";break;   
                                                                  case   8:strDW   =   "ʰ";break;   
                                                                  case   9:strDW   =   "��";break;   
                                                                  case   10:strDW   =   "Ǫ";break;   
                                                                  case   11:strDW   =   "��";break;   
                                                                  case   12:strDW   =   "ʰ";break;   
                                                                  case   13:strDW   =   "��";break;   
                                                                  case   14:strDW   =   "Ǫ";break;   
                                                  }   
                                                  switch   (strArr[intFen-1])                             //ѡ������   
                                                  {   
                                                                  case   "1":strNum   =   "Ҽ";break;   
                                                                  case   "2":strNum   =   "��";break;   
                                                                  case   "3":strNum   =   "��";break;   
                                                                  case   "4":strNum   =   "��";break;   
                                                                  case   "5":strNum   =   "��";break;   
                                                                  case   "6":strNum   =   "½";break;   
                                                                  case   "7":strNum   =   "��";break;   
                                                                  case   "8":strNum   =   "��";break;   
                                                                  case   "9":strNum   =   "��";break;   
                                                                  case   "0":strNum   =   "��";break;   
                                                  }   
                                                  //�����������   
                                                  strNow   =   strBig.split("");   
                                                  //��Ϊ��ʱ�����   
                                                  if((i==1)&&(strArr[intFen-1]=="0"))   
                                                                  strBig   =   "��";   
                                                  //��Ϊ��ʱ�����   
                                                  else   if((i==2)&&(strArr[intFen-1]=="0"))   
                                                  {         //�Ƿ�ͬʱΪ��ʱ�����   
                                                                  if(strBig!="��")   
                                                                  strBig   =   "��"+strBig;   
                                                  }   
                                                  //ԪΪ������   
                                                  else   if((i==3)&&(strArr[intFen-1]=="0"))   
                                                                  strBig   =   "Ԫ"+strBig;   
                                                  //ʰ��Ǫ��һλΪ������ǰһλ��Ԫ���ϣ���Ϊ������ʱ����   
                                                  else   if((i<7)&&(i>3)&&(strArr[intFen-1]=="0")&&(strNow[0]!="��")&&(strNow[0]!="Ԫ"))   
                                                                  strBig   =   "��"+strBig;   
                                                  //ʰ��Ǫ��һλΪ������ǰһλ��Ԫ���ϣ�ҲΪ������ʱ��??   
                                                  else   if((i<7)&&(i>3)&&(strArr[intFen-1]=="0")&&(strNow[0]=="��"))   
                                                  {}     
                                                  //ʰ��Ǫ��һλΪ������ǰһλ��Ԫ��Ϊ������ʱ���   
                                                  else   if((i<7)&&(i>3)&&(strArr[intFen-1]=="0")&&(strNow[0]=="Ԫ"))   
                                                  {}   
                                                  //����Ϊ��ʱ���벹������   
                                                  else   if((i==7)&&(strArr[intFen-1]=="0"))   
                                                                strBig   ="��"+strBig;   
                                                  //ʰ��Ǫ����һλΪ������ǰһλ�������ϣ���Ϊ������ʱ����   
                                                  else   if((i<11)&&(i>7)&&(strArr[intFen-1]=="0")&&(strNow[0]!="��")&&(strNow[0]!="��"))   
                                                                  strBig   =   "��"+strBig;   
                                                  //
                                                  else   if((i<11)&&(i>7)&&(strArr[intFen-1]=="0")&&(strNow[0]=="��"))   
                                                  {}   
                                                  //ʰ��Ǫ����һλΪ������ǰһλΪ��λ��Ϊ������ʱ���   
                                                  else   if((i<11)&&(i>7)&&(strArr[intFen-1]=="0")&&(strNow[0]=="��"))   
                                                  {}   
                                                  //��λΪ���Ҵ���Ǫλ��ʮ������ʱ������Ǫ�䲹��   
                                                  else   if((i<11)&&(i>8)&&(strArr[intFen-1]!="0")&&(strNow[0]=="��")&&(strNow[2]=="Ǫ"))   
                                                  strBig   =   strNum+strDW+"����"+strBig.substring(1,strBig.length);   
                                                  //����������λ   
                                                  else   if(i==11)   
                                                  {   
                                                                  //��λΪ������ȫΪ�����Ǫλʱ��ȥ����Ϊ��   
                                                                  if((strArr[intFen-1]=="0")&&(strNow[0]=="��")&&(strNow[2]=="Ǫ"))   
                                                                                  strBig   ="��"+"��"+strBig.substring(1,strBig.length);   
                                                                  //��λΪ������ȫΪ�㲻����Ǫλʱ��ȥ����   
                                                                  else   if((strArr[intFen-1]=="0")&&(strNow[0]=="��")&&(strNow[2]!="Ǫ"))   
                                                                                  strBig   ="��"+strBig.substring(1,strBig.length);   
                                                                  //��λ��Ϊ������ȫΪ�����Ǫλʱ��ȥ����Ϊ��   
                                                                  else   if((strNow[0]=="��")&&(strNow[2]=="Ǫ"))   
                                                                                  strBig   =   strNum+strDW+"��"+strBig.substring(1,strBig.length);   
                                                                  //��λ��Ϊ������ȫΪ�㲻����Ǫλʱ��ȥ����   
                                                                  else   if((strNow[0]=="��")&&(strNow[2]!="Ǫ"))   
                                                                                  strBig   =   strNum+strDW+strBig.substring(1,strBig.length);   
//�����������   
                                                                  else   
                                                                                  strBig   =   strNum+strDW+strBig;   
                                                  }   
                                                  //ʰ�ڣ�Ǫ����һλΪ������ǰһλ�������ϣ���Ϊ������ʱ����   
                                                  else   if((i<15)&&(i>11)&&(strArr[intFen-1]=="0")&&(strNow[0]!="��")&&(strNow[0]!="��"))   
                                                                  strBig   =   "��"+strBig;   
                                                  //ʰ�ڣ�Ǫ����һλΪ������ǰһλ�������ϣ�ҲΪ������ʱ���   
                                                  else   if((i<15)&&(i>11)&&(strArr[intFen-1]=="0")&&(strNow[0]=="��"))   
                                                  {}   
                                                  //ʰ�ڣ�Ǫ����һλΪ������ǰһλΪ��λ��Ϊ������ʱ���   
                                                  else   if((i<15)&&(i>11)&&(strArr[intFen-1]=="0")&&(strNow[0]=="��"))   
                                                  {}   
                                                  //��λΪ���Ҳ�����Ǫ��λ��ʮ������ʱȥ���ϴ�д���??   
                                                  else   if((i<15)&&(i>11)&&(strArr[intFen-1]!="0")&&(strNow[0]=="��")&&(strNow[1]=="��")&&(strNow[3]!="Ǫ"))   
    
                                                                  strBig   =   strNum+strDW+strBig.substring(1,strBig.length);   
    
                                                  //��λΪ���Ҵ���Ǫ��λ��ʮ������ʱ������Ǫ��䲹��   
    
                                                  else   if((i<15)&&(i>11)&&(strArr[intFen-1]!="0")&&(strNow[0]=="��")&&(strNow[1]=="��")&&(strNow[3]=="Ǫ"))   
    
                                                                  strBig   =   strNum+strDW+"����"+strBig.substring(2,strBig.length);   
    
                                                  else   
    
                                                                  strBig   =   strNum+strDW+strBig;   
                                                                  strFen   =   strFen.substring(0,intFen-1);   
                                                                  intFen   =   strFen.length;   
                                                                  strArr   =   strFen.split("");   
                                  }   
                                  return   strBig;   
                  }catch(err){   
                                  return   "";             //��ʧ���򷵻�ԭֵ   
                  }   

}



function rst()
{
	var all = document.form1.all;
	for (k=0;k<=all.length-1 ;k++ )
	{
		if ((all[k].tagName.toUpperCase()=="INPUT") || (all[k].tagName.toUpperCase()=="TEXTAREA") || (all[k].tagName.toUpperCase()=="SELECT"))
		{			
			//if ((all[k].type.toUpperCase()!="HIDDEN") && (all[k].type.toUpperCase()!="BUTTON") && ((all[k].type.toUpperCase()!="SUBMIT")) && ((all[k].type.toUpperCase()!="RESET"))  && ((all[k].type.toUpperCase()!="CHECKBOX")) && ((all[k].type.toUpperCase()!="RADIO")) )
			if (!all[k].disabled)
			{
				
				if ((all[k].type.toUpperCase()=="HIDDEN") || (all[k].type.toUpperCase()=="BUTTON") || ((all[k].type.toUpperCase()=="SUBMIT")) || ((all[k].type.toUpperCase()=="RESET"))  /*&& ((all[k].type.toUpperCase()!="CHECKBOX")) && ((all[k].type.toUpperCase()!="RADIO"))*/ )
				{
					//do nothing.
				}
				else
				{
					if (all[k].type.toUpperCase()=="CHECKBOX" )
					{
						all[k].checked=false;
					}
					else if (all[k].type.toUpperCase()=="RADIO" )
					{
						
					}
					else
						all[k].value="";
				}
			}			
		}
	}
}

function docheckINDUSTRYCO()
{
		var hydm=document.form1.INDUSTRYCO.value;
		if(hydm.length!=4)
		{
			alert('��ѡ��ȷ����ҵ���룬��ҵ�������Ϊ4λ��С�࣡');
			return false;
		}
}