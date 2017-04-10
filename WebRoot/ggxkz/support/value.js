function funSetFormData(name,value)  //数组中的对象为二维数组 objarr 0 对象名 1值
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
	if (obj.multiple==true)		//允许多选
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

//设置被选中的RadioButton
//sObj:需要设置的RadioButton名字：例如："document.form1.sex"
//sValue:选项的值
function fucSetChecked( sObj, sValue )
{
	var i;
	var nLength;
	if ( sValue==null || sValue=="")	//如果传过来的值为空，则返回
	{
		return;
	}
	if ( eval( sObj + ".length==null" ) )		//不是数组，值有一个选项按钮
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
//设置被选中的RadioButton
//sObj:需要设置的RadioButton名字：例如："document.form1.sex"
//sValue:选项的值
function fucSetChecked2( sObj, sValue )
{
	var i;
	var nLength;
	var	ss=sValue.split(",");
	if ( sValue==null || sValue=="")	//如果传过来的值为空，则返回
	{
		return;
	}
	if ( sObj.length==null  )		//不是数组，值有一个选项按钮
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
	//分离整数与小数
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
	//转换整数部分
	var i=1;
	var len = num.length;
	var dw2 = new Array("","万","亿");//大单位
	var dw1 = new Array("拾","佰","仟");//小单位
	var dw = new Array("","壹","贰","叁","肆","伍","陆","柒","捌","玖");//整数部分用
	var dws = new Array("零","壹","贰","叁","肆","伍","陆","柒","捌","玖");//小数部分用
	var k1=0;//计小单位
	var k2=0;//计大单位
	var str="";
	for(i=1;i<=len;i++)
	{
		var n = num.charAt(len-i);
		if(n=="0")
		{
			if(k1!=0)
			str = str.substr( 1, str.length-1);
		}

		str = dw[Number(n)].concat(str);//加数字

		if(len-i-1>=0)//在数字范围内
		{
			if(k1!=3)//加小单位
			{
				str = dw1[k1].concat(str);
				k1++;
			}
			else//不加小单位，加大单位
			{
				k1=0;
				var temp = str.charAt(0);
				if(temp=="万" || temp=="亿")//若大单位前没有数字则舍去大单位
				str = str.substr( 1, str.length-1);
				str = dw2[k2].concat(str);
			}
		}
		if(k1==3)//小单位到千则大单位进一
		{
			k2++;
		}
	}
	//转换小数部分
	var strdig="";
	for(i=0;i<2;i++)
	{
		var n = dig.charAt(i);
		strdig += dws[Number(n)];//加数字
	}
	str += "点"+strdig+"元";
	sObj2.value = str;
}
function fucSetTextConvert2( obj )
{
	var whole = obj;
	//分离整数与小数
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
	//转换整数部分
	var i=1;
	var len = num.length;
	var dw2 = new Array("","万","亿");//大单位
	var dw1 = new Array("拾","佰","仟");//小单位
	var dw = new Array("","壹","贰","叁","肆","伍","陆","柒","捌","玖");//整数部分用
	var dws = new Array("零","壹","贰","叁","肆","伍","陆","柒","捌","玖");//小数部分用
	var k1=0;//计小单位
	var k2=0;//计大单位
	var str="";
	for(i=1;i<=len;i++)
	{
		var n = num.charAt(len-i);
		if(n=="0")
		{
			if(k1!=0)
			str = str.substr( 1, str.length-1);
		}

		str = dw[Number(n)].concat(str);//加数字

		if(len-i-1>=0)//在数字范围内
		{
			if(k1!=3)//加小单位
			{
				str = dw1[k1].concat(str);
				k1++;
			}
			else//不加小单位，加大单位
			{
				k1=0;
				var temp = str.charAt(0);
				if(temp=="万" || temp=="亿")//若大单位前没有数字则舍去大单位
				str = str.substr( 1, str.length-1);
				str = dw2[k2].concat(str);
			}
		}
		if(k1==3)//小单位到千则大单位进一
		{
			k2++;
		}
	}
	//转换小数部分
	var strdig="";
	if (dig==""||dig=="00"||dig=="0")
	{
		str += "圆整";
	}
	else
	{
		var n = dig.charAt(0);
		if (n!="")
		{
			strdig += dws[Number(n)];//加数字
			str +="圆"+strdig+"角";
		}
		var m = dig.charAt(1);
		if (m!="")
		{
			strdig="";
			strdig += dws[Number(m)];//加数字
			str +=strdig+"分";
		}
	}
		return str;
}

function funcGetDX(obj, cnt)	// 获取大写
{
	var dws = new Array("零","壹","贰","叁","肆","伍","陆","柒","捌","玖");
	// 产生空格
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

function   toChineseMoney( value)     //将阿拉伯数字翻译成中文的大写数字   
{   

                  var   intFen,i;   
                  var   strArr,strCheck,strFen,strDW,strNum,strBig,strNow;   
                  if   (value   ==   null)       //数据非法时提示，并返回空串   
                  {   
                                  strErr   =   "数据"+value+"非法！"   
                                  alert(strErr);   
                                  return   "";   
                  }   
                  if(value==0)   
                                  return   "零";   
                  strCheck   =   value+".";   
                  strArr   =   strCheck.split(".");   
                  strCheck   =   strArr[0];   
                  if(strCheck.length>12)       //数据大于等于一万亿时提示无法处理   
                  {   
                                  strErr   =   "数据"+value+"过大，无法处理！"   
                                  alert(strErr);   
                                  return   "";   
                  }   
                  try   
                  {   
                                  i   =   0;   
                                  strBig   =   "";   
                                  intFen   =   value*100;                     //转换为以分为单位的数值   
                                  strFen   =   intFen.toString();   
                                  strArr   =   strFen.split(".");   
                                  strFen   =   strArr[0];   
                                  intFen   =   strFen.length;             //获取长度   
                                  strArr   =   strFen.split("");//将各个数值分解到数组内   
                                  while(intFen!=0)       //分解并转换   
                                  {   
                                                  i   =   i+1;   
                                                  switch(i)                             //选择单位   
                                                  {   
                                                                  case   1:strDW   =   "分";break;   
                                                                  case   2:strDW   =   "角";break;   
                                                                  case   3:strDW   =   "元";break;   
                                                                  case   4:strDW   =   "拾";break;   
                                                                  case   5:strDW   =   "佰";break;   
                                                                  case   6:strDW   =   "仟";break;   
                                                                  case   7:strDW   =   "万";break;   
                                                                  case   8:strDW   =   "拾";break;   
                                                                  case   9:strDW   =   "佰";break;   
                                                                  case   10:strDW   =   "仟";break;   
                                                                  case   11:strDW   =   "亿";break;   
                                                                  case   12:strDW   =   "拾";break;   
                                                                  case   13:strDW   =   "佰";break;   
                                                                  case   14:strDW   =   "仟";break;   
                                                  }   
                                                  switch   (strArr[intFen-1])                             //选择数字   
                                                  {   
                                                                  case   "1":strNum   =   "壹";break;   
                                                                  case   "2":strNum   =   "贰";break;   
                                                                  case   "3":strNum   =   "叁";break;   
                                                                  case   "4":strNum   =   "肆";break;   
                                                                  case   "5":strNum   =   "伍";break;   
                                                                  case   "6":strNum   =   "陆";break;   
                                                                  case   "7":strNum   =   "柒";break;   
                                                                  case   "8":strNum   =   "捌";break;   
                                                                  case   "9":strNum   =   "玖";break;   
                                                                  case   "0":strNum   =   "零";break;   
                                                  }   
                                                  //处理特殊情况   
                                                  strNow   =   strBig.split("");   
                                                  //分为零时的情况   
                                                  if((i==1)&&(strArr[intFen-1]=="0"))   
                                                                  strBig   =   "整";   
                                                  //角为零时的情况   
                                                  else   if((i==2)&&(strArr[intFen-1]=="0"))   
                                                  {         //角分同时为零时的情况   
                                                                  if(strBig!="整")   
                                                                  strBig   =   "零"+strBig;   
                                                  }   
                                                  //元为零的情况   
                                                  else   if((i==3)&&(strArr[intFen-1]=="0"))   
                                                                  strBig   =   "元"+strBig;   
                                                  //拾－仟中一位为零且其前一位（元以上）不为零的情况时补零   
                                                  else   if((i<7)&&(i>3)&&(strArr[intFen-1]=="0")&&(strNow[0]!="零")&&(strNow[0]!="元"))   
                                                                  strBig   =   "零"+strBig;   
                                                  //拾－仟中一位为零且其前一位（元以上）也为零的情况时跨??   
                                                  else   if((i<7)&&(i>3)&&(strArr[intFen-1]=="0")&&(strNow[0]=="零"))   
                                                  {}     
                                                  //拾－仟中一位为零且其前一位是元且为零的情况时跨过   
                                                  else   if((i<7)&&(i>3)&&(strArr[intFen-1]=="0")&&(strNow[0]=="元"))   
                                                  {}   
                                                  //当万为零时必须补上万字   
                                                  else   if((i==7)&&(strArr[intFen-1]=="0"))   
                                                                strBig   ="万"+strBig;   
                                                  //拾万－仟万中一位为零且其前一位（万以上）不为零的情况时补零   
                                                  else   if((i<11)&&(i>7)&&(strArr[intFen-1]=="0")&&(strNow[0]!="零")&&(strNow[0]!="万"))   
                                                                  strBig   =   "零"+strBig;   
                                                  //
                                                  else   if((i<11)&&(i>7)&&(strArr[intFen-1]=="0")&&(strNow[0]=="万"))   
                                                  {}   
                                                  //拾万－仟万中一位为零且其前一位为万位且为零的情况时跨过   
                                                  else   if((i<11)&&(i>7)&&(strArr[intFen-1]=="0")&&(strNow[0]=="零"))   
                                                  {}   
                                                  //万位为零且存在仟位和十万以上时，在万仟间补零   
                                                  else   if((i<11)&&(i>8)&&(strArr[intFen-1]!="0")&&(strNow[0]=="万")&&(strNow[2]=="仟"))   
                                                  strBig   =   strNum+strDW+"万零"+strBig.substring(1,strBig.length);   
                                                  //单独处理亿位   
                                                  else   if(i==11)   
                                                  {   
                                                                  //亿位为零且万全为零存在仟位时，去掉万补为零   
                                                                  if((strArr[intFen-1]=="0")&&(strNow[0]=="万")&&(strNow[2]=="仟"))   
                                                                                  strBig   ="亿"+"零"+strBig.substring(1,strBig.length);   
                                                                  //亿位为零且万全为零不存在仟位时，去掉万   
                                                                  else   if((strArr[intFen-1]=="0")&&(strNow[0]=="万")&&(strNow[2]!="仟"))   
                                                                                  strBig   ="亿"+strBig.substring(1,strBig.length);   
                                                                  //亿位不为零且万全为零存在仟位时，去掉万补为零   
                                                                  else   if((strNow[0]=="万")&&(strNow[2]=="仟"))   
                                                                                  strBig   =   strNum+strDW+"零"+strBig.substring(1,strBig.length);   
                                                                  //亿位不为零且万全为零不存在仟位时，去掉万   
                                                                  else   if((strNow[0]=="万")&&(strNow[2]!="仟"))   
                                                                                  strBig   =   strNum+strDW+strBig.substring(1,strBig.length);   
//其他正常情况   
                                                                  else   
                                                                                  strBig   =   strNum+strDW+strBig;   
                                                  }   
                                                  //拾亿－仟亿中一位为零且其前一位（亿以上）不为零的情况时补零   
                                                  else   if((i<15)&&(i>11)&&(strArr[intFen-1]=="0")&&(strNow[0]!="零")&&(strNow[0]!="亿"))   
                                                                  strBig   =   "零"+strBig;   
                                                  //拾亿－仟亿中一位为零且其前一位（亿以上）也为零的情况时跨过   
                                                  else   if((i<15)&&(i>11)&&(strArr[intFen-1]=="0")&&(strNow[0]=="亿"))   
                                                  {}   
                                                  //拾亿－仟亿中一位为零且其前一位为亿位且为零的情况时跨过   
                                                  else   if((i<15)&&(i>11)&&(strArr[intFen-1]=="0")&&(strNow[0]=="零"))   
                                                  {}   
                                                  //亿位为零且不存在仟万位和十亿以上时去掉上次写入的??   
                                                  else   if((i<15)&&(i>11)&&(strArr[intFen-1]!="0")&&(strNow[0]=="零")&&(strNow[1]=="亿")&&(strNow[3]!="仟"))   
    
                                                                  strBig   =   strNum+strDW+strBig.substring(1,strBig.length);   
    
                                                  //亿位为零且存在仟万位和十亿以上时，在亿仟万间补零   
    
                                                  else   if((i<15)&&(i>11)&&(strArr[intFen-1]!="0")&&(strNow[0]=="零")&&(strNow[1]=="亿")&&(strNow[3]=="仟"))   
    
                                                                  strBig   =   strNum+strDW+"亿零"+strBig.substring(2,strBig.length);   
    
                                                  else   
    
                                                                  strBig   =   strNum+strDW+strBig;   
                                                                  strFen   =   strFen.substring(0,intFen-1);   
                                                                  intFen   =   strFen.length;   
                                                                  strArr   =   strFen.split("");   
                                  }   
                                  return   strBig;   
                  }catch(err){   
                                  return   "";             //若失败则返回原值   
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
			alert('请选择精确的行业代码，行业代码必须为4位的小类！');
			return false;
		}
}