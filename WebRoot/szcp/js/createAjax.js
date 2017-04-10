
  // �õ�һ��ajax����
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
	
  // �����������¸�ֵ�ĺ�����ͨ��ajax�õ���̨���ŵ����ݣ�Ȼ��
  // ͨ��js���¸�select���������¸�ֵ��
  function selectDept(obj){
		
		//��һ��������ajax����
		var xmlHttp = createXmlHttpRequest();
		
		//�ڶ������¼�������
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
	
		//����������һ������
		xmlHttp.open("POST","jsp.ycj/RefreshDept",true);
		xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		//���Ĳ�����������
		xmlHttp.send(null);
	}