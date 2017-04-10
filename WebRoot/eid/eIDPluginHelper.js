/*
* eIDPluginHelper
*
* Copyright (c) 2014 The Third Research Institute of The Ministry of Public Security   
*
* Version 3.7.5.154
*/

var eID = null;
var onPluginLoad = null;
eID = new eIDPluginHelper();

function eIDPluginHelper() {
    //控件对象
    var eIDpuginObject = null;
    //是否插件已加载
    var isPluginLoad = false;
    //函数索引
    var funcIndex = 0;
    //缓存回调函数列表
    var funcIDBindList = [];
    //是否正在检测设备拔插
    var isDetecting = false;
    //检测设备回调函数
    var onDeviceDetect = null;
    //开始检测设备回调函数
    var onBeginDeviceDetect = null;
    //终止检测设备回调函数
    var onEndDeviceDetect = null;
    //当前读卡器和银行尾号列表
    var currentReaderSerialList = [];
    //本对象
    var self = this;
    //控件基准版本
    var basePlugInVersion = 154;

    //加载控件
    this.load = function(loadCallback) {
        if (typeof (loadCallback) != 'function') {
            return;
        }

        if (isPluginLoad) {
            loadCallback(true);
            return;
        }

        isPluginLoad = true;

        //插件加载错误
        function onPluginError() {
            isPluginLoad = false;
            loadCallback(false, 'http://update.cneid.net.cn/update/eIDSetup.exe');
        }

        onPluginLoad = function() {
            if (isInterfaceFull() == true) {
                //绑定插件事件
                attach(eIDpuginObject, 'GetVersionCompleted', getVersionCompleted);
                attach(eIDpuginObject, 'GetReaderListCompleted', getReaderListCompleted);
                attach(eIDpuginObject, 'DetectCardBeginCompleted', detectCardBeginCompleted);
                attach(eIDpuginObject, 'DetectCardEndCompleted', detectCardEndCompleted);
                attach(eIDpuginObject, 'DeviceInsertCompleted', deviceInsertCompleted);
                attach(eIDpuginObject, 'DeviceRemoveCompleted', deviceRemoveCompleted);
                attach(eIDpuginObject, 'HashCompleted', hashCompleted);
                attach(eIDpuginObject, 'SignCompleted', signCompleted);
                attach(eIDpuginObject, 'VerifyPinCompleted', verifyPinCompleted);
                attach(eIDpuginObject, 'SignNoInputPinCompleted', signNoInputPinCompleted);

                self.getVersion(function(rv, version) {
                    if (rv == 0) {
                        var funcID = addFuncIDBind(function(rv, version) {
                            if (rv != 0) {
                                onPluginError();
                                return;
                            }
                            var plugInVersion = version;

                            for (var i = 0; i < 3; i++) {
                                var index = version.indexOf(".");
                                plugInVersion = plugInVersion.substring(index + 1, plugInVersion.length - index + 1);
                            }

                            if (plugInVersion < basePlugInVersion) {
                                onPluginError();
                                return;
                            }

                            loadCallback(true);
                        });
                        eIDpuginObject.eID_GetVersion(funcID);
                    }
                    else {
                        onPluginError();
                    }
                });
            }
            else {
                onPluginError();
            }
        };

        var objectHtml = '<object id="eIDPlugin" type="application/x-eidpluginhelper" width="0" height="0" style="visibility: visible">';
        objectHtml += '<param name="onload" value="onPluginLoad" />';
        objectHtml += '</object>';
        document.body.innerHTML += objectHtml;

        eIDpuginObject = document.getElementById('eIDPlugin');
        if (isInterfaceFull() == false) {
            onPluginError();
        }
    }



    //转换返回值为中文提示信息
    this.getMessage = function(rv) {

        if (typeof (rv) != 'number') {
            return '';
        }

        if (eIDpuginObject.eID_GetMessage == null || rv == 0xE017003D) {
            return '未安装控件。';
        }

        return eIDpuginObject.eID_GetMessage(rv);
    }

    //获取接口版本号
    this.getVersion = function(getVersionCallback) {
        if (typeof (getVersionCallback) != 'function') {
            return;
        }

        if (eIDpuginObject.eID_GetVersion == null) {
            getVersionCallback(0xE017003D);
            return;
        }

        var funcID = addFuncIDBind(getVersionCallback);
        eIDpuginObject.eID_GetVersion(funcID);
    }

    //开始检测设备插拔
    this.detectDeviceBegin = function(detectDeviceCallback) {
        if (typeof (detectDeviceCallback) != 'function') {
            return;
        }

        if (
            eIDpuginObject.eID_GetReaderList == null ||
            eIDpuginObject.eID_DetectCardBegin == null) {
            detectDeviceCallback(0xE017003D);
            return;
        }

        if (isDetecting == true) {
            onDeviceDetect = detectDeviceCallback;
            detectDeviceCallback(0, currentReaderSerialList);
            return;
        }
        isDetecting = true;
        onBeginDeviceDetect = function(rv, readerSerialList) {
            onDeviceDetect = detectDeviceCallback;
            if (rv == 0) {
                eIDpuginObject.eID_DetectCardBegin(0);
            }
        };
        eIDpuginObject.eID_GetReaderList(0);
    }

    //结束检测设备插拔
    this.detectDeviceEnd = function(detectDeviceEndCallback) {
        if (typeof (detectDeviceEndCallback) != 'function') {
            return;
        }

        if (eIDpuginObject.eID_DetectCardEnd == null) {
            detectDeviceEndCallback(0xE017003D);
            return;
        }

        if (isDetecting == false) {
            detectDeviceEndCallback(0);
            return;
        }

        isDetecting = false;
        onEndDeviceDetect = detectDeviceEndCallback;
        eIDpuginObject.eID_DetectCardEnd(0);
    }

    //杂凑数据
    this.hash = function(hashCallback, reader, data, type, alg) {
        if (typeof (hashCallback) != 'function') {
            return;
        }

        if (typeof (reader) != 'string' || typeof (data) != 'string' || typeof (type) != 'number') {
            hashCallback(0xE0170005);
            return;
        }

        var aAlg = alg;
        if (alg == undefined) {
            aAlg = 1;
        }
        else if (typeof (aAlg) != 'number') {
            hashCallback(0xE0170005);
            return;
        }

        if (eIDpuginObject.eID_Hash == null) {
            hashCallback(0xE017003D);
            return;
        }

        var funcID = addFuncIDBind(hashCallback);
        eIDpuginObject.eID_Hash(funcID, reader, data, type, aAlg);
    }

    //签名数据
    this.sign = function(signCallback, reader, data, type) {
        if (typeof (signCallback) != 'function') {
            return;
        }

        if (typeof (reader) != 'string' || typeof (data) != 'string' || typeof (type) != 'number') {
            signCallback(0xE0170005);
            return;
        }

        if (eIDpuginObject.eID_Sign == null) {
            signCallback(0xE017003D);
            return;
        }

        var funcID = addFuncIDBind(signCallback);
        eIDpuginObject.eID_Sign(funcID, reader, data, type);
    }

    //校验PIN码
    this.verifyPin = function(verifyPinCallback, reader, type, pin) {
        if (typeof (verifyPinCallback) != 'function') {
            return;
        }

        if (typeof (reader) != 'string' || typeof (type) != 'number' || typeof (pin) != 'string') {
            verifyPinCallback(0xE0170005);
            return;
        }

        if (eIDpuginObject.eID_VerifyPin == null) {
            verifyPinCallback(0xE017003D);
            return;
        }

        var funcID = addFuncIDBind(verifyPinCallback);
        eIDpuginObject.eID_VerifyPin(funcID, reader, type, pin);
    }

    //签名数据而不校验PIN码
    this.signNoInputPin = function(signNoInputPinCallback, reader, data, type) {
        if (typeof (signNoInputPinCallback) != 'function') {
            return;
        }

        if (typeof (reader) != 'string' || typeof (data) != 'string' || typeof (type) != 'number') {
            signNoInputPinCallback(0xE0170005);
            return;
        }

        if (eIDpuginObject.eID_Sign == null) {
            signNoInputPinCallback(0xE017003D);
            return;
        }

        var funcID = addFuncIDBind(signNoInputPinCallback);
        eIDpuginObject.eID_SignNoInputPin(funcID, reader, data, type);
    }


    //检测更新事件处理
    function getVersionCompleted(param) {
        var funcID = param[0];
        var rv = parseInt(param[1], 10);
        var version = param[2];
        var func = getFuncIDBind(funcID);
        if (func != null) {
            func(rv, version);
        }
    }

    //开始检测设备插拔事件处理
    function getReaderListCompleted(param) {
        var funcID = param[0];
        var rv = parseInt(param[1], 10);
        if (rv != 0) {
            onBeginDeviceDetect(rv);
            isDetecting = false;
            return;
        }
        currentReaderSerialList = [];
        for (var i = 2; i < param.length; i++) {
            var readerSerial = param[i];
            if (readerSerial[1].length > 0) {
                if (readerSerial[1].indexOf('尾号') == -1) {
                    readerSerial[1] = '尾号:' + readerSerial[1];
                }
            }
            else {
                readerSerial[1] = ' eID通用载体';
            }

            var isExist = false;
            for (var j = 0; j < currentReaderSerialList.length; j++) {
                if (param[i][0] == currentReaderSerialList[j][0]) {
                    isExist = true;
                    break;
                }
            }
            if (isExist == false) {
                currentReaderSerialList.push(readerSerial);
            }
        }
        onBeginDeviceDetect(rv);
    }

    //开始检测设备插拔事件处理
    function detectCardBeginCompleted(param) {
        var funcID = param[0];
        var rv = parseInt(param[1], 10);
        if (rv != 0) {
            isDetecting = false;
        }
        onDeviceDetect(rv, currentReaderSerialList);
    }

    //结束检测设备插拔事件处理
    function detectCardEndCompleted(param) {
        var funcID = param[0];
        var rv = parseInt(param[1], 10);
        if (rv != 0) {
            isDetecting = true;
        }
        onEndDeviceDetect(rv);
    }

    //设备插入事件处理
    function deviceInsertCompleted(param) {
        var rv = parseInt(param[0], 10);
        var readerSerial = param[1];
        if (readerSerial[1].length > 0) {
            if (readerSerial[1].indexOf('尾号') == -1) {
                readerSerial[1] = '尾号:' + readerSerial[1];
            }
        }
        else {
            readerSerial[1] = ' eID通用载体';
        }

        if (rv == 0) {
            var isExist = false;
            for (var j = 0; j < currentReaderSerialList.length; j++) {
                if (readerSerial[0] == currentReaderSerialList[j][0]) {
                    isExist = true;
                    break;
                }
            }
            if (isExist == false) {
                currentReaderSerialList.push(readerSerial);
            }
        }

        onDeviceDetect(rv, currentReaderSerialList);
    }

    //设备拔出事件处理
    function deviceRemoveCompleted(param) {
        var rv = parseInt(param[0], 10);

        if (rv == 0) {
            var readerSerial = param[1];
            for (var i = 0; i < currentReaderSerialList.length; i++) {
                if (readerSerial[0] == currentReaderSerialList[i][0]) {
                    currentReaderSerialList.splice(i, 1);
                    break;
                }
            }
        }

        onDeviceDetect(rv, currentReaderSerialList);
    }

    //杂凑数据完成事件处理
    function hashCompleted(param) {
        var funcID = param[0];
        var rv = parseInt(param[1], 10);
        var result = param[2];
        var idCarrier = param[3];
        var alg = param[4];
        var func = null;
        if (rv == 0xE0170031) {
            func = getFuncIDBind(funcID, false);
        }
        else {
            func = getFuncIDBind(funcID, true);
        }
        if (func != null) {
            func(rv, result, idCarrier, alg);
        }
    }

    //签名数据完成事件处理
    function signCompleted(param) {
        var funcID = param[0];
        var rv = parseInt(param[1], 10);
        var result = param[2];
        var idCarrier = param[3];
        var issuer = param[4];
        var subject = param[5];
        var certSn = param[6];
        var issuerSn = param[7];
        var serial = param[8];
        var alg = param[9];
        var func = null;
        if (rv == 0xE0170031) {
            func = getFuncIDBind(funcID, false);
        }
        else {
            func = getFuncIDBind(funcID, true);
        }
        if (func != null) {
            func(rv, result, idCarrier, issuer, subject, certSn, issuerSn, serial, alg);
        }
    }

    //校验PIN码完成事件处理
    function verifyPinCompleted(param) {
        var funcID = param[0];
        var rv = parseInt(param[1], 10);
        var func = null;
        if (rv == 0xE0170031) {
            func = getFuncIDBind(funcID, false);
        }
        else {
            func = getFuncIDBind(funcID, true);
        }

        if (func != null) {
            func(rv);
        }
    }

    //签名数据不输入PIN码完成事件处理
    function signNoInputPinCompleted(param) {
        var funcID = param[0];
        var rv = parseInt(param[1], 10);
        var result = param[2];
        var idCarrier = param[3];
        var issuer = param[4];
        var subject = param[5];
        var certSn = param[6];
        var issuerSn = param[7];
        var serial = param[8];
        var alg = param[9];
        var func = null;
        if (rv == 0xE0170031) {
            func = getFuncIDBind(funcID, false);
        }
        else {
            func = getFuncIDBind(funcID, true);
        }
        if (func != null) {
            func(rv, result, idCarrier, issuer, subject, certSn, issuerSn, serial, alg);
        }
    }

    //函数索引和函数绑定
    function funcIDBind(vid, vfunc) {
        this.id = vid;
        this.func = vfunc;
    }

    //添加回调函数绑定
    function addFuncIDBind(func) {
        funcIndex++;
        var newFuncIDBind = new funcIDBind(funcIndex, func);
        funcIDBindList.push(newFuncIDBind);
        return funcIndex;
    }

    //获取并移除回调函数绑定
    function getFuncIDBind(funcID, isRemove) {
        if (funcID == null) {
            return;
        }

        var index = null;
        for (var i = 0; i < funcIDBindList.length; i++) {
            if (funcIDBindList[i].id == funcID) {
                if (isRemove == true) {
                    return funcIDBindList.splice(i, 1)[0].func;
                }
                else {
                    return funcIDBindList[i].func;
                }
            }
        }
    }

    //绑定事件
    function attach(elem, eventName, func) {
        if (elem.attachEvent != null) {
            elem.attachEvent('on' + eventName, func);
        }
        else if (elem.addEventListener != null) {
            elem.addEventListener(eventName, func, false);
        }
    }

    //判断接口是否完整
    function isInterfaceFull() {
        if (eIDpuginObject == null ||
            eIDpuginObject.eID_GetVersion == null ||
            eIDpuginObject.eID_GetMessage == null ||
            eIDpuginObject.eID_GetReaderList == null ||
            eIDpuginObject.eID_DetectCardBegin == null ||
            eIDpuginObject.eID_DetectCardEnd == null ||
            eIDpuginObject.eID_Hash == null ||
            eIDpuginObject.eID_Sign == null ||
            eIDpuginObject.eID_VerifyPin == null ||
            eIDpuginObject.eID_SignNoInputPin == null) {
            return false;
        }
        return true;
    }
}