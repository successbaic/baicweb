//v.2.0 build 81009
dhtmlXTreeObject.prototype.parserExtension={_parseExtension:function(p,a,pid) {this._idpull[a.id]._attrs=a}};dhtmlXTreeObject.prototype.getAttribute=function(id,name){this._globalIdStorageFind(id)
 var t=this._idpull[id]._attrs;return t?t[name]:window.undefined};dhtmlXTreeObject.prototype.setAttribute=function(id,name,value){this._globalIdStorageFind(id)
 var t=(this._idpull[id]._attrs)||{};t[name]=value;this._idpull[id]._attrs=t};
//v.2.0 build 81009