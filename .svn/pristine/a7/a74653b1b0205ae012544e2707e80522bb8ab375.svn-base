
  // 得到一个ajax引擎
  function createXmlHttpRequest(){
	   var xmlHttp=null;
	   
	   try {    // Firefox, Opera 8.0+, Safari
	           xmlHttp=new XMLHttpRequest();
	    } catch (e) {
	           try {    // Internet Explorer
	                  xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
	            } catch (e) {
	                  try {
	                          xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
	                  } catch (e){}  
	           }
	    }
	    
	   return xmlHttp;
	 }
	
  // 给下拉框重新赋值的函数，通过ajax得到后台部门的数据，然后
  // 通过js重新给select下拉框重新赋值。
  function selectDept(obj){
		
		//第一步：创建ajax引擎
		var xmlHttp = createXmlHttpRequest();
		
		//第二步：事件处理函数
		xmlHttp.onreadystatechange = function(){
			
			if(xmlHttp.readyState == 4) {
				
				if(xmlHttp.status == 200) {
					 var data = xmlHttp.responseText;
					 var ints = new Array();
					 ints = data.split(",");
					 
					for (var i = 0; i < ints.length; i ++ ) {
							 var deptno =ints[i];
							 var deptname =ints[i+1];
							 
							 if (typeof(deptname) != "undefined")
							 {
						  	 	var selectDept = document.getElementById("deptname");
						  	 	
							 		if(!jsSelectIsExitItem(selectDept,deptno)) {
						   			selectDept.options.add(new Option(deptname,deptno));
							 		}
							 }
						}
					}
				}
			};
	
		//第三步：打开一个连接
		xmlHttp.open("POST","jsp.ycj/RefreshDept",true);
		xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		//第四步：发送请求
		xmlHttp.send(null);
	}