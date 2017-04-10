/** @serializedParams looks like "prop1=value1&prop2=value2".
Nested property like 'prop.subprop=value' is also supported **/
function paramString2obj (serializedParams) {

var obj={};
function evalThem (str) {
var attributeName = str.split("=")[0];
var attributeValue = str.split("=")[1];
if(!attributeValue){
return ;
}

var array = attributeName.split(".");
for (var i = 1; i < array.length; i++) {
var tmpArray = Array();
tmpArray.push("obj");
for (var j = 0; j < i; j++) {
tmpArray.push(array[j]);
};
var evalString = tmpArray.join(".");
// alert(evalString);
if(!eval(evalString)){
eval(evalString+"={};");
}
};
eval("obj."+attributeName+"='"+attributeValue+"';");

};
var properties = serializedParams.split("&");
for (var i = 0; i < properties.length; i++) {
evalThem(properties[i]);
};
return obj;
}
$.fn.form2json = function(){
var serializedParams = this.serialize();
var obj = paramString2obj(serializedParams);
return JSON.stringify(obj);
}
//初始化表单
function initForm(initForm,obj){
	//var obj = new Object();
         // obj.username ="randy";
         // obj.book="01,02";
        //  obj.sex="girl";
        //  obj.color="red";
       //   obj.addition="哥写的不是代码，是寂寞";
          for(var attr in obj){
              if(typeof(obj[attr])=='function'){                  
                continue;
              }
            // var $input = $("#form_mcgl_mccc :input[name='"+attr+"']");
            //  var $input = $("#form_mcgl_mccc :input[name='"+attr+"']");
             var $input = initForm.find("[name='"+attr+"']");
              var type = $input.attr("type");                
              if(type=="checkbox" ||type=="radio"){
                  var avalues = obj[attr].split(",");
                  for(var v=0; v<avalues.length;v++){
                    $input.each(function(i,n){
                        var value = $(n).val();                        
                        if(value == avalues[v]){                        
                          $(n).attr("checked","checked");
                        }
                    });
                }
              }else{
                $input.val(obj[attr]);
              }
          } 
}