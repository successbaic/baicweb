/**
 */
function getCity(){
	var supercode='370000';
	var url = "getPunCant.CommonAjaxAction";
	var data = eval("({"+"\"method\":\"getPubCant\","
					+"\"supercode\":\""+supercode+"\""+"})");
	$.ajax({
		url : url,
		async : true,
		type: "POST",
		data:data,
		dataType: "json",
		success : function(options, success, response) {
			if (response.responseText) {
				viewCiyt(eval(response.responseText));
			}
		},
		error : function(xhr, errorType, error) {
			return false;
		}
	});
}
function viewCiyt(data){
	$str='';
	for(var i=0;i<data.length;i++){
		var obj = data[i];
		 $str+='<option value="'+obj.CANT_CODE+'" width="100">'+obj.CANT_NAME+'</option>';
	}
	$("#CITY").html($str);  
}
function getCOUNTY(){
	var supercode=$("#CITY").val();
	var url = "getPunCant.CommonAjaxAction";
	var data = eval("({"+"\"method\":\"getPubCant\","
					+"\"supercode\":\""+supercode+"\""+"})");
	$.ajax({
		url : url,
		async : true,
		type: "POST",
		data:data,
		dataType: "json",
		success : function(options, success, response) {
			if (response.responseText) {
				viewCOUNTY(eval(response.responseText));
			}
		},
		error : function(xhr, errorType, error) {
			return false;
		}
	});
}
function viewCOUNTY(data){
	$str='';
	for(var i=0;i<data.length;i++){
		var obj = data[i];
		 $str+='<option value="'+obj.CANT_CODE+'">'+obj.CANT_NAME+'</option>';
	}
	$("#COUNTY").html($str);  
	writeDOM();
}