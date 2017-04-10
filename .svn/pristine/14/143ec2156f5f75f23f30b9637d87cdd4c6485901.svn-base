//校验所有设置属性的输入框

function funCheckInForm(form)
{
	var svid="";
	var objarr=form.elements;
	var pw="";
	var certype="";
	for (var i=0;i<objarr.length;i++)
	{
		obj=objarr[i];
		if(obj.name=="PASSWORD"){pw=obj.value;}
		if(obj.name=="CERTYPE"){certype=obj.value;}
		if (obj!=null)
		{	
			title=obj.title;
			if (title==null||title=="")
				title="";
			//长度超长
			maxlength=obj.maxlength;
			
			if (maxlength!=null&&maxlength!="")
			{	// 注: maxlength 仅对textarea起作用
				if (fucCheckLength(obj.value)>maxlength)
				{
					svid+="\n["+title+"]:输入请少于["+maxlength+"]个字符!";
				}
				
			}
			//不能为空
			disblank=obj.disblank;
			if (disblank!=null&&obj.disabled==false)
			{
				if (obj.type.toUpperCase()=="RADIO")
				{
					if (getCheckedValue(form.name+"."+obj.name)=="")
					{
						svid+="\n["+title+"]:必须选择一项数据!";
					}
				}
				else if (fucCheckLength(obj.value)<=0)
				{
					svid+="\n["+title+"]:必须输入数据!";
				}
				
				
			}
			//输入类型
			datatype=obj.datatype;
			
			if (datatype!=null)
			{
				switch (datatype.toUpperCase())
				{
					case "DATE":
					{
						if (fucCheckDate(obj.value)==0)
						{							
							svid+="\n["+title+"]:数据格式应为日期型!";							
						}
						break;
					}
					case "INT":
					{
						if (fucCheckInt(obj.value)==0)
						{							
							svid+="\n["+title+"]:数据格式应为整数型!";
						}
						break;
					}
					case "NUM":
					{
						if (fucCheckNUM(obj.value)==0)
						{							
							svid+="\n["+title+"]:数据格式应为数字型!";
						}
						break;
					}
					case "NOTZERO":
					{
						if (fucCheckNotZero(obj.value)==0)
						{							
							svid+="\n"+title+":数字应为大于零!";
						}
						break;
					}
					case "TEL":
					{
					  if(obj.value!=""){
					    if (fucCheckTEL(obj.value)==0)
						{							
							svid+="\n["+title+"]:数据格式应为电话格式,且不少于6位!";
						}
					  }
						
						break;
					}
					case "EMAIL":
					{
						if (fucCheckEmail(obj.value)==0)
						{							
							svid+="\n["+title+"]:数据格式应为Email格式!";
						}
						break;
					}
					case "SFZHM":
					{
						if (fucCheckSFZHM(obj.value)==0)
						{							
							svid+="\n["+title+"]:数据格式应为身份证件格式!";
						}
						break;
					}
					case "ENTTYPE":
					{
						if (fucCheckEntType(obj.value)==0)
						{							
							svid+="\n["+title+"]:请选择较为精确的企业类型!";
						}
						break;
					}
					case "PWCONFORM":
					{
					    if(obj.value!=pw){
					       svid+="\n["+title+"]:两次输入的密码不一致!";
					    }
					    break;
					}
					case "CERNO":
					{
					    if(certype=="1"){
					       if (fucCheckSFZHM(obj.value)==0)
						   {							
							svid+="\n["+title+"]:数据格式应为身份证件格式!";
						   }
					    }
					    break;
					}
				}
			}
		}
	}
	if (svid=="")
	{
		for (var i=0;i<objarr.length;i++)
		{
			obj=objarr[i];			
			if (obj!=null)
				obj.disabled=false;
			if (obj.type.toUpperCase()=="SUBMIT")
				obj.disabled=true;
		}	

		return true;
	}
	else
	{
		alert(svid);
		return false;
	}
}
//获得RadioButton选择的值
function getCheckedValue( sObjName )
{
	var nLength;
	nLength=eval( sObjName + ".length" );	//取得选项的个数
	for( i=0; i<nLength; i++)
	{
		if ( eval( sObjName + "["+i+"].checked==true" ) )
		{
			return eval( sObjName + "["+i+"].value" );
			break;
		}
	}
	return "";
}
//获得下拉列表框的值
function getSelectedValue( sObj )
{
	var Obj=eval( sObj );
	return Obj.options[Obj.selectedIndex].value;
}


function Show(divid) 
{
	divid.style.left=window.event.x+10+document.body.scrollLeft;
	divid.style.top =window.event.y+10+document.body.scrollTop;
	divid.filters.revealTrans.apply(); 
	divid.style.visibility = "visible"; 
	divid.filters.revealTrans.play(); 
}

function Hide(divid) 
{
	divid.filters.revealTrans.apply();
	divid.style.visibility = "hidden";
	divid.filters.revealTrans.play();
}


function checkTextEng( theObj )
{
  var checkOK = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_.*&%$#@^-=+/\|!~`(){}[] ";
  var checkStr = theObj.value;
  var allValid = true;
  for (i = 0;  i < checkStr.length;  i++)
  {
    ch = checkStr.charAt(i);
    for (j = 0;  j < checkOK.length;  j++)
      if (ch == checkOK.charAt(j))
        break;
    if (j == checkOK.length)
    {
      allValid = false;
      break;
    }
  }
  if (!allValid)
  {
    return (false);
  }
  return (true);
}


function checkTextNumber( theObj )
{
	var checkOK = "0123456789";
	var checkStr = theObj.value;
	var allValid = true;
	for (i = 0;  i < checkStr.length;  i++){
		ch = checkStr.charAt(i);
		for (j = 0;  j < checkOK.length;  j++){
			if (ch == checkOK.charAt(j)){break;}
		}
		if (j == checkOK.length){
			allValid = false;
			break;
		}
	}
  if (!allValid)
  {
    return false;
  }
  return true;
}


//函数名：fucCheckENG()
//功能介绍：检查是否为英文
//参数说明：要检查的英文
//返回值：1为全是英文，0为不是英文
function fucCheckENG( checkStr )
{
  var checkOK = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_.*&%$#@^-=+/\|!~`(){}[] ";
  var allValid = true;
  for (i = 0;  i < checkStr.length;  i++)
  {
    ch = checkStr.charAt(i);
    for (j = 0;  j < checkOK.length;  j++)
      if (ch == checkOK.charAt(j))
        break;
    if (j == checkOK.length)
    {
      allValid = false;
      break;
    }
  }
  if (!allValid)
  {
    return 0;
  }
  return 1;
}



//函数名：fucCheckNUM()
//功能介绍：检查是否为数字
//参数说明：要检查的数字
//返回值：1为是数字，0为不是数字
function fucCheckNUM(NUM) 
{    
	var i,j,strTemp;
	strTemp="0123456789.-";
	if ( NUM.length == 0) return 1;
	for (i=0;i<NUM.length;i++) 
	{
		j = strTemp.indexOf(NUM.charAt(i));
		if (j==-1) 
		{
			//说明有字符不是数字
			return 0;
		}
	}
	//说明是数字
	return 1;
}

//函数名：fucCheckPassword()
//功能介绍：检查密码是否合格
//参数说明：要检查的密码字串
//返回值：1为是合格，0为不合格
function fucCheckPassword(pwd) 
{
	var i,j,strTemp;
	strTemp="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	if ( pwd.length == 0) return 1;
	for (i=0;i<pwd.length;i++) 
	{
		j = strTemp.indexOf(pwd.charAt(i));
		if (j==-1) 
		{
			//说明有字符不合格
			return 0;
		}
	}
	//说明合格
	return 1;
}

//函数名：fucCheckNUM()
//功能介绍：检查是否为数字
//参数说明：要检查的数字
//返回值：1为是数字，0为不是数字
function fucCheckInt(NUM) 
{
	var i,j,strTemp;
	strTemp="0123456789";
	if ( NUM.length == 0) return 1;		//如果为空,则作为数字
	for (i=0;i<NUM.length;i++) 
	{
		j = strTemp.indexOf(NUM.charAt(i));
		if (j==-1) 
		{
			//说明有字符不是数字
			return 0;
		}
	}
	//说明是数字
	return 1;
}

//函数名：fucCheckLength()
//功能介绍：检查字符串的长度
//参数说明：要检查的字符串
//返回值：长度值
function fucCheckLength(strTemp) 
{
	/*
	var i,sum;
	sum=0;
	for(i=0;i<strTemp.length;i++) 
	{
		if ((strTemp.charCodeAt(i)>=0)&&(strTemp.charCodeAt(i)<=255)&&(strTemp.charAt(i)!=" "))
			sum=sum+1;
		else if(strTemp.charAt(i)==" ")
			sum=sum;
		else
			sum=sum+2;
	}
	return sum;
	*/
	if (strTemp!=null)
	{
		return strTemp.length;
	}
	else
	return 0;
}

//函数名：fucCheckEmail()
//功能介绍：检查是否为Email Address
//参数说明：要检查的字符串
//返回值：0：不是 1：是
function fucCheckEmail(a) 
{
	if (a.length==0)
	{
		return 1;		//如果为空,也可以认为是
	}
	if (a.indexOf(' ')!=-1)
	{
		return 0;
	}
	var i=a.length;
	var temp = a.indexOf('@');
	var tempd = a.indexOf('.');
	if (temp > 1) 
	{
		if ((i-temp) > 3) 
		{
			if (tempd!=-1) 
			{
				return 1;
			}
		}
	}
	return 0;
}

//函数名：fucCheckTEL()
//功能介绍：检查是否为电话号码
//参数说明：要检查的字符串
//返回值：1为是合法，0为不合法
function fucCheckTEL(TEL) 
{
	var i,j,strTemp;
	strTemp="0123456789-()#";
//	if (TEL.length == 0) return 0;
//	if (TEL.length == 0) return 1;	//如果为空,则较验通过
	if(TEL.length<6) return 0;  //联系电话小于6位的，校验都不通过
	for (i=0;i<TEL.length;i++) 
	{
		j=strTemp.indexOf(TEL.charAt(i));
		if (j==-1)
		{
			//说明有字符不合法
			return 0;
		}
	}
	//说明合法
	return 1;
}

//函数名：fucCheckDate() (YYYY-MM-DD)
//功能介绍：检查是否为日期
//参数说明：要检查的字符串
//返回值：0：不是日期 1：是日期
function fucCheckDate(datestr) 
{
	var lthdatestr
	if (datestr != "")
		lthdatestr= datestr.length ;
	else
		lthdatestr=0;
	var tmpy="";
	var tmpm="";
	var tmpd="";
	//var datestr;
	var status;
	status=0;
	if ( lthdatestr== 0)
		return 1;
//		return 0;	如果没有输入则将结果定为通过
	for (var i=0;i<lthdatestr;i++) 
	{
		if (datestr.charAt(i)== '-'||datestr.charAt(i)=='.'||datestr.charAt(i)=='/') 
		{
			status++;
		}
		if (status>2) 
		{
			return 0;
		}
		if ((status==0) && (datestr.charAt(i)!='-'&&datestr.charAt(i)!='.'&&datestr.charAt(i)!='/')) 
		{
			tmpy=tmpy+datestr.charAt(i)
		}
		if ((status==1) && (datestr.charAt(i)!='-'&&datestr.charAt(i)!='.'&&datestr.charAt(i)!='/')) 
		{
			tmpm=tmpm+datestr.charAt(i)
		}
		if ((status==2) && (datestr.charAt(i)!='-'&&datestr.charAt(i)!='.'&&datestr.charAt(i)!='/')) 
		{
			tmpd=tmpd+datestr.charAt(i)
		}
	}
	year=new String (tmpy);
	month=new String (tmpm);
	day=new String (tmpd)
	if ((tmpy.length!=4) || (tmpm.length>2) || (tmpd.length>2)) 
	{
		return 0;
	}
	if (!((1<=month) && (12>=month) && (31>=day) && (1<=day)) ) 
	{
		return 0;
	}
	if (!((year % 4)==0) && (month==2) && (day==29)) 
	{
		return 0;
	}
	if ((month<=7) && ((month % 2)==0) && (day>=31)) 
	{
		return 0;
	}
	if ((month>=8) && ((month % 2)==1) && (day>=31))
	{
		return 0;
	}
	if ((month==2) && (day==30)) 
	{
		return 0;
	}
	return 1;
}

//函数名：fucCheckDateLong() (YYYY-MM-DD HH:MM:SS)
//功能介绍：检查是否为日期
//参数说明：要检查的字符串
//返回值：0：不是日期 1：是日期
//2004.04.12 by wyj
function fucCheckDateLong(datestr) 
{
	var lthdatestr
	if (datestr != "")
		lthdatestr= datestr.length ;
	else
		lthdatestr=0;
	var tmpy="";
	var tmpm="";
	var tmpd="";
	var tmph="";
	var tmpmi="";
	var tmps="";
	//var datestr;
	var status;
	status=0;
	if ( lthdatestr== 0)
		return 1;
//		return 0;	如果没有输入则将结果定为通过
	if( lthdatestr<= 10)	//如果是简化格式用原有检查函数检查
	{
		fucCheckDate(datestr);
	}
	for (var i=0;i<lthdatestr;i++) 
	{
		if (datestr.charAt(i)== '-'||datestr.charAt(i)=='.'||datestr.charAt(i)=='/'||datestr.charAt(i)==' '||datestr.charAt(i)==':') 
		{
			status++;
		}
		if (status>5) 
		{
			return 0;
		}
		if ((status==0) && (datestr.charAt(i)!='-'&&datestr.charAt(i)!='.'&&datestr.charAt(i)!='/'&&datestr.charAt(i)!=' '&&datestr.charAt(i)!=':')) 
		{
			tmpy=tmpy+datestr.charAt(i)
		}
		if ((status==1) && (datestr.charAt(i)!='-'&&datestr.charAt(i)!='.'&&datestr.charAt(i)!='/'&&datestr.charAt(i)!=' '&&datestr.charAt(i)!=':')) 
		{
			tmpm=tmpm+datestr.charAt(i)
		}
		if ((status==2) && (datestr.charAt(i)!='-'&&datestr.charAt(i)!='.'&&datestr.charAt(i)!='/'&&datestr.charAt(i)!=' '&&datestr.charAt(i)!=':')) 
		{
			tmpd=tmpd+datestr.charAt(i)
		}
		if ((status==3) && (datestr.charAt(i)!='-'&&datestr.charAt(i)!='.'&&datestr.charAt(i)!='/'&&datestr.charAt(i)!=' '&&datestr.charAt(i)!=':')) 
		{
			tmph=tmph+datestr.charAt(i)
		}
		if ((status==4) && (datestr.charAt(i)!='-'&&datestr.charAt(i)!='.'&&datestr.charAt(i)!='/'&&datestr.charAt(i)!=' '&&datestr.charAt(i)!=':')) 
		{
			tmpm=tmpmi+datestr.charAt(i)
		}
		if ((status==5) && (datestr.charAt(i)!='-'&&datestr.charAt(i)!='.'&&datestr.charAt(i)!='/'&&datestr.charAt(i)!=' '&&datestr.charAt(i)!=':')) 
		{
			tmps=tmps+datestr.charAt(i)
		}
	}
	year=new String (tmpy);
	month=new String (tmpm);
	day=new String (tmpd);
	hour=new String (tmph);
	min=new String (tmpmi);
	sec=new String (tmps);
	if ((tmpy.length!=4) || (tmpm.length>2) || (tmpd.length>2)|| (tmph.length>2) || (tmpmi.length>2)|| (tmps.length>2)) 
	{
		return 0;
	}
	if (!((1<=month) && (12>=month) && (31>=day) && (1<=day)) ) 
	{
		return 0;
	}
	if (!((year % 4)==0) && (month==2) && (day==29)) 
	{
		return 0;
	}
	if ((month<=7) && ((month % 2)==0) && (day>=31)) 
	{
		return 0;
	}
	if ((month>=8) && ((month % 2)==1) && (day>=31))
	{
		return 0;
	}
	if ((month==2) && (day==30)) 
	{
		return 0;
	}
	if (!( (23>=hour) && (59>=min) && (59>=sec)) ) 
	{
		return 0;
	}
	return 1;
}

//函数名：fucCheckDateOrder() (YYYY-MM-DD)
//功能介绍：检查日期的先后顺序
//参数说明：要检查的字符串
//返回值：1：endingDateStr在startingDateStr后
function fucCheckDateOrder(startingDateStr,endingDateStr) 
{
	var tmpy1="";
	var tmpy2="";
	var tmpm1="";
	var tmpm2="";
	var tmpd1="";
	var tmpd2="";

	var status1,status2;

	if (startingDateStr.length==0)
	{
		return 1;	//如果开始时间为空,则可以通过
	}
	if (endingDateStr.length==0)
	{
		return 1;	//如果结束时间为空,则也可以通过
	}
	status1=0;
	status2=0;
	for (i=0;i<startingDateStr.length;i++) 
	{
		if (startingDateStr.charAt(i)== '-'||startingDateStr.charAt(i)=='.'||startingDateStr.charAt(i)=='/') 
		{
			status1++;
		}
		if (status1>2) 
		{
			return 0;
		}
		if ((status1==0) && (startingDateStr.charAt(i)!='-'&&startingDateStr.charAt(i)!='.'&&startingDateStr.charAt(i)!='/')) 
		{
			tmpy1=tmpy1+startingDateStr.charAt(i)
		}
		if ((status1==1) && (startingDateStr.charAt(i)!='-'&&startingDateStr.charAt(i)!='.'&&startingDateStr.charAt(i)!='/')) 
		{
			tmpm1=tmpm1+startingDateStr.charAt(i)
		}
		if ((status1==2) && (startingDateStr.charAt(i)!='-'&&startingDateStr.charAt(i)!='.'&&startingDateStr.charAt(i)!='/')) 
		{
			tmpd1=tmpd1+startingDateStr.charAt(i)
		}
	}
	year1=new String (tmpy1);
	month1=new String (tmpm1);
	day1=new String (tmpd1)
	
	for (i=0;i<endingDateStr.length;i++) 
	{
		if (endingDateStr.charAt(i)== '-'||endingDateStr.charAt(i)=='.'||endingDateStr.charAt(i)=='/') 
		{
			status2++;
		}
		if (status2>2) 
		{
			return 0;
		}
		if ((status2==0) && (endingDateStr.charAt(i)!='-'&&endingDateStr.charAt(i)!='.'&&endingDateStr.charAt(i)!='/')) 
		{
			tmpy2=tmpy2+endingDateStr.charAt(i)
		}
		if ((status2==1) && (endingDateStr.charAt(i)!='-'&&endingDateStr.charAt(i)!='.'&&endingDateStr.charAt(i)!='/')) 
		{
			tmpm2=tmpm2+endingDateStr.charAt(i)
		}
		if ((status2==2) && (endingDateStr.charAt(i)!='-'&&endingDateStr.charAt(i)!='.'&&endingDateStr.charAt(i)!='/')) 
		{
			tmpd2=tmpd2+endingDateStr.charAt(i)
		}
	}
	year2=new String (tmpy2);
	month2=new String (tmpm2);
	day2=new String (tmpd2)
	
	if((year1-year2)>0)
	{
		return 0;
	}
	else if((year1-year2)<0)
	{
		return 1;
	}
	else if((year1-year2)==0)
	{
		if((month1-month2)>0)
		{
			return 0;
		}
		else if((month1-month2)<0)
		{
			return 1;
		}
		else if((month1-month2)==0)
		{
			if((day1-day2)>0)
			{
				return 0;
			}
			else
			{
				return 1;
			}
		}
	}
}
//函数名：fucCheckDateOrder1() (ND+YF)
//功能介绍：检查日期的先后顺序
//参数说明：要检查的字符串

function fucCheckDateOrder1(obj1,obj2,obj3,obj4)
{
	//obj1---form1;obj2---开始年度,obj3---开始月份,obj4---结束年度,obj5--结束月份

	var ksnd = obj1;//开始年度
	var ksyf = obj2;//开始月份
	var jsnd = obj3;//结束年度
	var jsyf = obj4;//结束月份

	if(jsnd<ksnd)
	{
		return 0;
	}
	else if(jsnd>ksnd)
	{
		return 1;
	}
	else
	{				
		if(((jsyf<10)&&(ksyf>=10))||((jsyf<10)&&(jsyf<ksyf)&&(ksyf<10))||((jsyf>=10)&&(jsyf<ksyf)&&(ksyf>=10)))
		{
			return 0;
		}
		else
		{
			return 1;
		}
	}	
}

//Name: fucCheckZero
//Return: if NUM!=0 return 1, else return 0
function fucCheckNotZero(NUM)
{
	if (fucCheckNUM(NUM)==1)	//是数字格式
	{
		if (NUM!=0)
		{
			return 1;
		}
	}
	return 0;
}


//检查是否有效的证件号码
//如果有效返回1，否则返回0
function fucCheckZJHM(objZjmc, sZJHM )
{
	var nLength;

	if (objZjmc.options[objZjmc.selectedIndex].text=="01|身份证")
	{
		nLength=fucCheckLength(sZJHM);
		if(nLength==18)
		{
			if(fucCheckInt(sZJHM)==0)
			{
				if(fucCheckInt(sZJHM.substring(0,17))==1&&(sZJHM.substring(17,18)=='x'||sZJHM.substring(17,18)=='X'))
				{
					return 1;				
				}
				else
				{
					return 0;
				}
				return 0;
			}
			else
			{
				return 1;
			}
		}
		else if(nLength==15)
		{
			if(fucCheckInt(sZJHM)==0)
			{
				return 1;
			}
		}
		else
		{
			return 0;
		}
	}
	return 1;
}

function fucCheckSFZHM(sZJHM )
{
	var nLength;

	

		nLength=fucCheckLength(sZJHM);
		if(nLength==18)
		{
			if(fucCheckInt(sZJHM)==0)
			{
				if(fucCheckInt(sZJHM.substring(0,17))==1&&(sZJHM.substring(17,18)=='x'||sZJHM.substring(17,18)=='X'))
				{
					return 1;				
				}
				else
				{
					return 0;
				}
				return 0;
			}
			else
			{
				return 1;
			}
		}
		else if(nLength==15)
		{

			if(fucCheckInt(sZJHM)==1)
			{
				return 1;
			}
		}
		else
		{
			return 0;
		}
}


//检查两个数字的大小
//如果有效返回1，否则返回0
function fucCheckNumOrder(Num1, Num2 )
{
	if (Num1.length==0)
	{
		return 1;	//参数一为空,则可以通过
	}
	if (Num2.length==0)
	{
		return 1;	//参数二为空,则可以通过
	}
	if ((Num2-Num1)<0) //参数二小于参数一
	{
		return 0;
	}	
	return 1;
}

//检查两个数字的大小
//如果相等返回1，否则返回0
function fucCheckNumOrder1(Num1, Num2, Num3 )
{
	if (Num1.length==0)
	{
		return 1;	//参数一为空,则可以通过
	}
	if (Num2.length==0)
	{
		return 1;	//参数二为空,则可以通过
	}
	if ((Num2-Num1)!=0&&Num3.length==0) //参数二小于参数一
	{
		return 0;
	}	
	return 1;
}


//js判断字符数量(汉字以及全角算2个字符) 
function fucCheckLength(strTemp)
{
	var i,sum; sum=0;
	for(i=0;i<strTemp.length;i++)
	{
		if((strTemp.charCodeAt(i)>=0)&&(strTemp.charCodeAt(i)<=255))
			sum=sum+1;
		else
			sum=sum+2;
	}
	return sum;
}

// 去掉非汉字
function onlyHZ(obj)
{
	var str = obj.value;
	var tshead;
	var tstail;
	var tscode;
	var ts;	
	
	for(i=0; i<str.length; i++)
	{
		tscode= str.charCodeAt(i);
		tshead = str.substring(0, i);
		tstail = str.substring(i+1, str.length);

		if ( (tscode<19968) || (ts>40959) )
		{		
			obj.value=tshead+tstail;
			onlyHZ(obj);
		}
	}
}

// 不允许输入汉字
function onKU(obj)
{
	var str=obj.value;
	var ts;	
	var tscode;

	for(i=0; i<str.length; i++)
	{
		tscode= str.charCodeAt(i);
		if ( (tscode<19968) || (ts>40959) )
		{
			alert("请确保输入的全部为汉字！");
			onlyHZ(obj);
			obj.onchange();
			return false;
		}
	}
	return true;
}
// 不允许粘贴汉字
function onBP()
{
	clipboardData.setData('text',clipboardData.getData('text').replace(/[^\u4E00-\u9FA5]/g,''))
}
//函数名：fucCheckEntType()
//功能介绍：检查是否为合法的企业类型
//参数说明：要检查的字符串
//返回值：1为是合法，0为不合法
function fucCheckEntType(EntType) 
{
	
	if (EntType=="8000") return 1;	//如果企业类型为集团则通过
	if (EntType.length != 4) return 1;	//如果为空,则较验通过
	var ETS1=EntType.substr(0,1);
	var ETS2=EntType.substr(0,2);
	var ETE2=EntType.substr(2,2);
	if (ETS1=='3'||ETS2=="46"||ETS2=="47"||ETS2=="72"||ETS2=="73"||ETS2=="91")
	{
		return 1;
	}
	else 
	{	
		if (ETE2=="00")
		{
			return 0;
		}
	}	

	//说明合法
	return 1;
}
//校验form中的两个值大小并返回结果
//参数：objF form 的名称
//		objB 第一个控件的值(big)
//		objS 第二个控件的值(small)
//返回值：无
//说明：常用于onblur事件,做填写数据时逻辑比较使用
function funCheckFormObjBS(objF,objB,objS)
{    
	alert(objB);
	alert(objS);
	var checkB;
 	var checkS;
	if (fucCheckNUM(eval("document."+objF+"."+objB + ".value"))==0)
		checkB= 0;
	else
		checkB= Number(eval( "document."+objF+"."+objB + ".value"));
	if (fucCheckNUM(eval("document."+objF+"."+objS + ".value"))==0)
		checkS= 0;
	else
		checkS= Number(eval( "document."+objF+"."+objS + ".value")); 
 	alert(checkS);
	alert(checkB);
    if (checkS>checkB)
	{   
		alert("["+eval("document."+objF+"."+objS + ".title")+"]应小于或者等于["+eval("document."+objF+"."+objB + ".title")+"]");
		eval("document."+objF+"."+objS+".focus();")
		return ;
	}
}
//校验form中的两个值大小并返回结果
//参数：objF form 的名称
//		objB 第一个控件的值(big)
//		objS 第二个控件的值(small)
//返回值：无
//说明：常用于errcheck事件,做填写数据时逻辑比较使用
function funCheckFormObjBSErr(objF,objB,objS)
{    
 	var checkB;
 	var checkS;
	if (fucCheckNUM(eval("document."+objF+"."+objB + ".value"))==0)
		checkB= 0;
	else
		checkB= Number(eval( "document."+objF+"."+objB + ".value"));
	if (fucCheckNUM(eval("document."+objF+"."+objS + ".value"))==0)
		checkS= 0;
	else
		checkS= Number(eval( "document."+objF+"."+objS + ".value")); 
     if (checkS>checkB)
	{   
		alert("["+eval("document."+objF+"."+objS + ".title")+"]应小于或者等于["+eval("document."+objF+"."+objB + ".title")+"]");
		eval("document."+objF+"."+objS+".focus();")
		return false;
	}
}

//函数名：fucKeyUp()
//功能介绍：检查并纠正输入错误
//参数说明：要检查的对象
//返回值：无
function fucKeyUp(obj) 
{  
	datatype=obj.datatype;
 	if (datatype!=null)
	{
		switch (datatype.toUpperCase())
		{
 
			case "INT":
			{
				obj.value = obj.value.replace(/[^0-9]/g, '');
				break;
			}
			case "NUM":
			{
				obj.value = obj.value.replace(/[^0-9.]/g, '');
				break;
			}
			case "DATE":
			{
				obj.value = obj.value.replace(/[^0-9.-]/g, '');
				break;
			}
	 
		}
	}
}
//用户注册时密码强度
var pa=0;//判断程度标识
ratingMsgs = new Array(6);
ratingMsgColors = new Array(6);
barColors = new Array(6);

ratingMsgs[0] = "太短";
ratingMsgs[1] = "较弱";
ratingMsgs[2] = "一般";
ratingMsgs[3] = "很好";
ratingMsgs[4] = "极佳";
ratingMsgs[5] = "未评级"; 

ratingMsgColors[0] = "#676767";
ratingMsgColors[1] = "#aa0033";
ratingMsgColors[2] = "#f5ac00";
ratingMsgColors[3] = "#6699cc";
ratingMsgColors[4] = "#008000";
ratingMsgColors[5] = "#676767";

barColors[0] = "#dddddd";
barColors[1] = "#aa0033";
barColors[2] = "#ffcc33";
barColors[3] = "#6699cc";
barColors[4] = "#008000";
barColors[5] = "#676767";

/**
* pwd：密码内容
* 
*/
function checkPassword(pwd){
	pa=0;
	var min_passwd_len = 6;
	if(pwd.length<6){
		if (pwd.length > 0) {
  			DrawBar(0);
  	  	} else {
  	  		resetBar();
  		}
	}else{
    	var p1= (pwd.search(/[a-zA-Z]/)!=-1) ? 1 : 0;//含有大写或小写字母，加1
    	var p2= (pwd.search(/[0-9]/)!=-1) ? 1 : 0;   //含有数字，加1
    	var p3= (pwd.search(/[^A-Za-z0-9_]/)!=-1) ? 1 : 0;//含有除字母、数字外的其他内容，加1
		var p4=0;
		pa=p1+p2+p3;
		if(pa==3 && pwd.length==12){
			p4=1;  //如果以上三条都满足(含字母+数字+其他)，而且密码长度是12(最大长度)，再加1
		}
		pa=pa+p4;//根据以上计算的结果判断强度
    	DrawBar(pa);		
	}
}
/**
* name：元素id
* 
*/
function getElement(name) {
  if (document.all) {
  	return document.all(name);
  }
  return document.getElementById(name);
}
/**页面显示程度条
* rating：程度标识0:太短，1：弱等，
* 
*/
function DrawBar(rating) {
  var posbar = getElement('posBar');
  var negbar = getElement('negBar');
  var passwdRating = getElement('passwdRating');
  var barLength = 180;
  if (rating >= 0 && rating <= 4) {  
      posbar.style.width = barLength / 4 * rating;
      negbar.style.width = barLength / 4 * (4 - rating);
    } else {
      posbar.style.width = 0;
      negbar.style.width = barLength;
      rating = 5; 
    }
    posbar.style.background = barColors[rating];
    passwdRating.innerHTML = "<font color='" + ratingMsgColors[rating] +
                             "'>" + ratingMsgs[rating] + "</font>";
}

/**
* 重置程度条
* 
*/
function resetBar() {
  var posbar = getElement('posBar');
  var negbar = getElement('negBar');
  var passwdRating = getElement('passwdRating');
  var barLength = 180;
  posbar.style.width = "0px";
  negbar.style.width = barLength + "px";
  passwdRating.innerHTML = "&nbsp;";
}