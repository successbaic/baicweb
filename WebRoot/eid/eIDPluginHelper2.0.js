//eIDPluginHelper2.0.js
//3.5.5.138

/*if (document.location.protocol == 'https:') {
    document.write("<script src='jquery-1.8.2.js'></script>");
    document.write("<script src='eIDUI/eIDSelect/jquery.eIDSelect.js'></script>");
    document.write("<script src='eIDUI/eIDSelect/eIDUI-common.js'></script>");
    document.write('<link rel="stylesheet" href="eIDUI/eIDSelect/jquery.eIDSelect.css">');
}
else {
    document.write("<script src='jquery-1.8.2.js'></script>");
    document.write("<script src='eIDUI/eIDSelect/jquery.eIDSelect.js'></script>");
    document.write("<script src='eIDUI/eIDSelect/eIDUI-common.js'></script>");
    document.write('<link rel="stylesheet" href="eIDUI/eIDSelect/jquery.eIDSelect.css">');
}*/

var eID = new eIDPluginHelper();
var onPluginLoad;

function eIDPluginHelper() {
    //函数索引
    var funcID = 0;
    //缓存回调函数列表
    var bindList = [];

    //当前设备信息列表
    var devList = [];

    //设备显示框参数
    var divConfig;

    //控件版本
    var plugInVersion;
    //控件基准版本
    var basePlugInVersion = 138;

    //设备选择框选择器加载完成事件名
    var divSelectOnloadEventName = 'divSelectLoad';

    //设备变化回调函数
    var onDevChange = null;

    //设置设备选择框
    this.setDeviceDiv = function(config) {
        //判断配置和参数是否有效
        if (!checkConfig(config) ||
        !checkParam(config.type, 'number', false) ||
        !checkParam(config.isScroll, 'boolean', false)) {
            callback(config, 0xE0170005);
            return;
        }

        //判断和设置type默认值
        switch (config.type) {
            case undefined:
                config.type = 1;
                break;
            case 1:
                break;
            default:
                callback(config, 0xE0170005);
                return;
        }

        //判断config.isScroll参数
        switch (config.isScroll) {
            case undefined:
                config.isScroll = false;
                break;
        }

        //获取指定id对应的div
        var div = document.getElementById(config.id);
        if (div == null) {
            callback(config, 0xE017003F);
            return;
        }

        //已存在设置的Div，若相同则成功返回；不同则报错返回
        if (divConfig != null) {
            if (divConfig.id == config.id) {
                callback(config, 0);
            }
            else {
                callback(config, 0xE0170029);
            }
            return;
        }

        //判断接口是否完整
        function isInterfaceFull() {
            var pluginObj = document.getElementById('eIDPlugin');
            if (pluginObj == null ||
                pluginObj.eID_GetVersion == null ||
                pluginObj.eID_GetMessage == null ||
                pluginObj.eID_GetReaderList == null ||
                pluginObj.eID_DetectCardBegin == null ||
                pluginObj.eID_DetectCardEnd == null ||
                pluginObj.eID_Hash == null ||
                pluginObj.eID_Sign == null ||
                pluginObj.eID_VerifyPin == null ||
                pluginObj.eID_SignNoInputPin == null) {
                return false;
            }
            return true;
        }

        //插件加载错误处理
        function onPluginError() {
            var div = document.getElementById(config.id);
            initDiv(div, config, false, false);
            divConfig = null;
            callback(config, 0xE017003D);
        }

        //控件加载完成
        onPluginLoad = function() {
            if (isInterfaceFull() == true) {
                var pluginObj = document.getElementById('eIDPlugin');

                //绑定插件事件
                pluginEventAttach(pluginObj, 'GetVersionCompleted', getVersionCompleted);
                pluginEventAttach(pluginObj, 'GetReaderListCompleted', getReaderListCompleted);
                pluginEventAttach(pluginObj, 'DetectCardBeginCompleted', detectCardBeginCompleted);
                pluginEventAttach(pluginObj, 'DetectCardEndCompleted', detectCardEndCompleted);
                pluginEventAttach(pluginObj, 'DeviceInsertCompleted', deviceInsertCompleted);
                pluginEventAttach(pluginObj, 'DeviceRemoveCompleted', deviceRemoveCompleted);
                pluginEventAttach(pluginObj, 'HashCompleted', hashCompleted);
                pluginEventAttach(pluginObj, 'SignCompleted', signCompleted);
                pluginEventAttach(pluginObj, 'VerifyPinCompleted', verifyPinCompleted);
                pluginEventAttach(pluginObj, 'SignNoInputPinCompleted', signNoInputPinCompleted);

                onDevChange = config.onDevChange;
                pluginObj.eID_GetVersion(0);
            }
            else {
                onPluginError();
            }
        };

        //插入到页面的控件html代码
        var objectHtml = '<object id="eIDPlugin" type="application/x-eidpluginhelper" width="0" height="0" style="visibility: visible">';
        objectHtml += '<param name="onload" value="onPluginLoad" />';
        objectHtml += '</object>';

        //加载控件
        document.body.innerHTML += objectHtml;
        if (isInterfaceFull() == false) {
            onPluginError();
        }

        divConfig = config;
    }

    //设置签名认证按钮
    this.setSignButton = function(config) {
        setSign(config, 1);
    }

    //设置本地签名认证按钮
    this.setLocalSignButton = function(config) {
        setSign(config, 2);
    }

    //设置杂凑按钮
    this.setHashButton = function(config) {
        //判断配置和参数是否有效

        if (!checkConfig(config) ||
            !checkParam(config.src, 'function', true) ||
            !checkParam(config.alg, 'number', false) ||
            !checkParam(config.type, 'number', true)) {
            callback(config, 0xE0170005);
            return;
        }

        var src = config.src();
        if (!checkParam(src, 'string', true)) {
            callback(config, 0xE0170005);
            return;
        }
        //判断和设置alg默认值
        var alg;
        switch (config.alg) {
            case undefined:
            case 10:
                config.alg = 10;
                alg = 1;
                break;
            case 11:
                alg = 2;
                break;
            case 12:
                alg = 3;
                break;
            default:
                callback(config, 0xE0170007);
                return;
        }

        //获取指定id对应的按钮
        var btn = document.getElementById(config.id);
        if (btn == null) {
            callback(config, 0xE017003F);
            return;
        }

        //判断是否已设置Div
        if (divConfig == null) {
            callback(config, 0xE017003E);
            return;
        }

        //判断div元素是否有效
        var div = document.getElementById(divConfig.id);
        if (div == null) {
            callback(config, 0xE017003F);
            return;
        }

        btn.disabled = true;

        //判断select是否已创建
        var deviceSelect = document.getElementById(divConfig.id + 'Select');
        if (deviceSelect == null) {
            //绑定div创建完成select事件
            $('#' + divConfig.id).bind(divSelectOnloadEventName, function() {
                //绑定选择器选择变化事件
                $('#' + divConfig.id + 'Select').bind('eIDEventItemSelected', function() {
                    disableInvalidCardBtn(btn);
                });

                //绑定按钮点击事件
                pluginEventAttach(btn, 'click', function() {
                    //获取和判断待签名数据
                    var src = config.src();
                    if (!checkParam(src, 'string', true)) {
                        callback(config, 0xE0170005);
                        return;
                    }

                    //获取div中的选择框
                    var deviceSelect = document.getElementById(divConfig.id + 'Select');
                    if (deviceSelect == null) {
                        callback(config, 0xE0170005);
                        return;
                    }

                    //当前没有设备，则返回无法找到设备的返回码
                    if (devList.length == 0) {
                        callback(config, 0xE0170019);
                        return;
                    }

                    //获取当前选中的读卡器名
                    var reader = deviceSelect.options[deviceSelect.selectedIndex].value;

                    var funcID = addFuncIDBind(config);
                    var pluginObj = document.getElementById('eIDPlugin');
                    pluginObj.eID_Hash(funcID, reader, src, config.type, alg);
                });
            });
        }
    }

    //检测更新事件处理
    function getVersionCompleted(param) {
        var funcID = param[0];
        var rv = parseInt(param[1], 10);
        var version = param[2];
        var bind = getFuncIDBind(funcID);
        for (var i = 0; i < 3; i++) {
            var index = version.indexOf(".");
            version = version.substring(index + 1, version.length - index + 1);
        }
        if (rv != 0) {
            callback(divConfig, rv);
            divConfig = null;
            return;
        }

        plugInVersion = version;

        if (plugInVersion < basePlugInVersion) {
            var div = document.getElementById(divConfig.id);
            initDiv(div, divConfig, false, false);
            divConfig = null;
            callback(divConfig, 0xE017003D);
            return;
        }

        var pluginObj = document.getElementById('eIDPlugin');
        pluginObj.eID_GetReaderList(1);

    }

    //开始检测设备插拔事件处理
    function getReaderListCompleted(param) {
        var funcID = param[0];
        var rv = parseInt(param[1], 10);

        if (rv != 0) {
            callback(divConfig, rv);
            divConfig = null;
            return;
        }

        //初始化div为等待插入卡的样式
        var div = document.getElementById(divConfig.id);
        initDiv(div, divConfig, true, true);

        $('#' + divConfig.id).trigger(divSelectOnloadEventName);


        if (devList.length != param.length - 2) {
            devChangeCallback(onDevChange, param.length - 2);
        }

        if (param.length > 2) {
            for (var i = 2; i < param.length; i++) {
                var reader = param[i][0];
                var cardno = param[i][1];
                var banklogo = param[i][2];
                var cardtype = param[i][3];
                var bankname = param[i][4];

                if (document.location.protocol == 'https:') {
                    banklogo = banklogo.replace('http', 'https');
                    banklogo = banklogo.replace('update.cneid.net.cn', 'eid.cn');
                }

                var isExist = false;
                for (var j = 0; j < devList.length; j++) {
                    if (param[i][0] == devList.readerName) {
                        isExist = true;
                        break;
                    }
                }

                if (isExist == false) {
                    addRecToDevList(divConfig, devList, reader, bankname, banklogo, cardtype, cardno, function(devList) {
                        var div = document.getElementById(divConfig.id);
                        refleshDivDev(div, devList);
                    });
                }
            }
        }

        var pluginObj = document.getElementById('eIDPlugin');
        pluginObj.eID_DetectCardBegin(0);
    }

    //开始检测设备插拔事件处理
    function detectCardBeginCompleted(param) {
        var funcID = param[0];
        var rv = parseInt(param[1], 10);

        if (rv != 0) {
            callback(divConfig, rv);
            divConfig = null;
            return;
        }

        callback(divConfig, rv);
    }

    //结束检测设备插拔事件处理
    function detectCardEndCompleted(param) {

    }

    //设备插入事件处理
    function deviceInsertCompleted(param) {
        var rv = parseInt(param[0], 10);

        if (rv != 0) {
            callback(divConfig, rv);
            return;
        }

        var reader = param[1][0];
        var cardno = param[1][1];
        var banklogo = param[1][2];
        var cardtype = param[1][3];
        var bankname = param[1][4];

        if (document.location.protocol == 'https:') {
            banklogo = banklogo.replace('http', 'https');
            banklogo = banklogo.replace('update.cneid.net.cn', 'eid.cn');
        }

        var isExist = false;
        for (var i = 0; i < devList.length; i++) {
            if (reader == devList[i].readerName) {
                isExist = true;
                break;
            }
        }
        if (isExist == false) {
            addRecToDevList(divConfig, devList, reader, bankname, banklogo, cardtype, cardno, function(devList) {
                var div = document.getElementById(divConfig.id);
                refleshDivDev(div, devList);
            });

            devChangeCallback(onDevChange, devList.length);
        }
    }

    //设备拔出事件处理
    function deviceRemoveCompleted(param) {
        var rv = parseInt(param[0], 10);

        if (rv != 0) {
            callback(divConfig, rv);
            return;
        }

        var reader = param[1][0];
        for (var i = 0; i < devList.length; i++) {
            var cmp = devList[i].readerName;
            if (reader == cmp) {
                devList.splice(i, 1);
                devChangeCallback(onDevChange, devList.length);
                break;
            }
        }

        var div = document.getElementById(divConfig.id);
        refleshDivDev(div, devList);
    }

    //签名数据完成事件处理
    function signCompleted(param) {
        var funcID = param[0];
        var rv = parseInt(param[1], 10);
        var bind = getFuncIDBind(funcID);
        if (rv != 0) {
            callback(bind.conf, rv);
            return;
        }

        var result = param[2];
        var idCarrier = param[3];
        var issuer = param[4];
        var subject = param[5];
        var certSn = param[6];
        var issuerSn = param[7];
        var cert = param[8];
				var algo = param[9];

        var data = {
            signResult: result,
            idCarrier: idCarrier,
            alg: algo
        };
        if (bind.tag == 1) {
            data.issuer = issuer;
            data.subject = subject;
            data.certSn = certSn;
            data.issuerSn = issuerSn;
        }
        else if (bind.tag == 2) {
            data.cert = cert;
        }

        callback(bind.conf, rv, data);
    }

    //杂凑数据完成事件处理
    function hashCompleted(param) {
        var funcID = param[0];
        var rv = parseInt(param[1], 10);
        var bind = getFuncIDBind(funcID);
        if (rv != 0) {
            callback(bind.conf, rv);
            return;
        }

        var result = param[2];
        var idCarrier = param[3];

        callback(bind.conf, rv, {
            hashResult: result,
            idCarrier: idCarrier,
            alg: bind.conf.alg
        });
    }

    //PIN码认证完成事件处理
    function verifyPinCompleted(param) {
        var funcID = param[0];
        var rv = parseInt(param[1], 10);
        var bind = getFuncIDBind(funcID);
        if (rv != 0) {
            callback(bind.conf, rv);
            return;
        }

        var pluginObj = document.getElementById('eIDPlugin');
        var funcID = addFuncIDBind(bind.conf, bind.tag);
        pluginObj.eID_SignNoInputPin(funcID, bind.reader, bind.src, bind.alg);
    }

    //不输入PIN码签名完成事件处理
    function signNoInputPinCompleted(param) {
        var funcID = param[0];
        var rv = parseInt(param[1], 10);
        var bind = getFuncIDBind(funcID);
        if (rv != 0) {
            callback(bind.conf, rv);
            return;
        }

        var result = param[2];
        var idCarrier = param[3];
        var issuer = param[4];
        var subject = param[5];
        var certSn = param[6];
        var issuerSn = param[7];
        var cert = param[8];
        var algo = param[9];

        var data = {
            signResult: result,
            idCarrier: idCarrier,
            alg: algo
        };
        if (bind.tag == 1) {
            data.issuer = issuer;
            data.subject = subject;
            data.certSn = certSn;
            data.issuerSn = issuerSn;
        }
        else if (bind.tag == 2) {
            data.cert = cert;
        }

        callback(bind.conf, rv, data);
    }

    //函数索引和config绑定
    function funcConfBind(id, conf, tag, reader, src, alg) {
        this.id = id;
        this.conf = conf;
        this.tag = tag;
        this.reader = reader;
        this.src = src;
        this.alg = alg;
    }

    //添加绑定
    function addFuncIDBind(conf, tag, reader, src, alg) {
        funcID++;
        var bind = new funcConfBind(funcID, conf, tag, reader, src, alg);
        bindList.push(bind);
        return funcID;
    }

    //获取并移除回调函数绑定
    function getFuncIDBind(funcID) {
        if (funcID == null) {
            return;
        }

        var index = null;
        for (var i = 0; i < bindList.length; i++) {
            if (bindList[i].id == funcID) {
                return bindList.splice(i, 1)[0];
            }
        }
    }

    //内部设置签名函数，根据tag区分签名或本地签名
    function setSign(config, tag) {
        //判断配置和参数是否有效
        if (!checkConfig(config) ||
            !checkParam(config.src, 'function', true) ||
            !checkParam(config.alg, 'number', false)) {
            callback(config, 0xE0170005);
            return;
        }

        var src = config.src();
        if (!checkParam(src, 'string', true)) {
            callback(config, 0xE0170005);
            return;
        }

        //判断和设置alg默认值
        var alg;
        switch (config.alg) {
            case 20:
                alg = 1;
                break;
            case 22:
                alg = 2;
                break;
            case undefined:
            case 0:
                alg = 0;
                break;
            default:
                callback(config, 0xE0170007);
                return;
        }

        //获取指定id对应的按钮
        var btn = document.getElementById(config.id);
        if (btn == null) {
            callback(config, 0xE017003F);
            return;
        }

        //判断是否已设置Div
        if (divConfig == null) {
            callback(config, 0xE017003E);
            return;
        }

        //判断div元素是否有效
        var div = document.getElementById(divConfig.id);
        if (div == null) {
            callback(config, 0xE017003F);
            return;
        }

        btn.disabled = true;

        //判断select是否已创建
        var deviceSelect = document.getElementById(divConfig.id + 'Select');
        if (deviceSelect == null) {
            //绑定div创建完成select事件
            $('#' + divConfig.id).bind(divSelectOnloadEventName, function() {
                //绑定选择器选择变化事件
                $('#' + divConfig.id + 'Select').bind('eIDEventItemSelected', function() {
                    disableInvalidCardBtn(btn);
                });

                var clickFun = function() {
                    //获取和判断待签名数据
                    var src = config.src();
                    if (!checkParam(src, 'string', true)) {
                        callback(config, 0xE0170005);
                        return;
                    }

                    //获取div中的选择框
                    var deviceSelect = document.getElementById(divConfig.id + 'Select');
                    if (deviceSelect == null) {
                        callback(config, 0xE0170005);
                        return;
                    }

                    //当前没有设备，则返回无法找到设备的返回码
                    if (devList.length == 0) {
                        callback(config, 0xE0170019);
                        return;
                    }

                    //获取当前选中的读卡器名
                    var reader = deviceSelect.options[deviceSelect.selectedIndex].value;

                    var pluginObj = document.getElementById('eIDPlugin');
                    var funcID;

                    if (!checkParam(config.inputPin, 'function', false)) {
                        callback(config, 0xE0170005);
                        return;
                    }

                    if (config.inputPin == null) {
                        funcID = addFuncIDBind(config, tag);
                        pluginObj.eID_SignNoInputPin(funcID, reader, src, alg);
                    }
                    else {
                        var inputPin = config.inputPin();
                        if (inputPin == null) {
                            funcID = addFuncIDBind(config, tag);
                            pluginObj.eID_SignNoInputPin(funcID, reader, src, alg);
                        }
                        else {
                            if (!checkParam(inputPin, 'string', true)) {
                                callback(config, 0xE0170005);
                                return;
                            }

                            funcID = addFuncIDBind(config, tag, reader, src, alg);
                            pluginObj.eID_VerifyPin(funcID, reader, 0, inputPin);
                        }
                    }
                }
                pluginEventAttach(btn, 'click', clickFun);
            });
        }
    }

    //初始化Div控件
    function initDiv(div, config, isInstall, isRefresh) {
        var conf = {};

        conf.type = config.type;
        conf.scroll = config.isScroll;
        conf.installed = isInstall;
        conf.width = '260px'

        $(div).eIDselect(conf);
        if (isRefresh) {
            $(div).eIDselect('refresh');
        }
    }

    //添加一条记录到设备列表
    function addRecToDevList(config, devList, reader, bankname, banklogo, cardtype, cardno, allCallback) {
        devList.push({
            readerName: reader,
            issueBank: bankname,
            bankTailNumer: cardno,
            bankCardType: cardtype,
            logoUrl1: banklogo,
            logoUrl2: banklogo
        });
        allCallback(devList);

    }

    //更新设备div显示设备信息列表
    function refleshDivDev(obj, devList) {
        var serialSelect = $(obj).find("select").get(0);
        selectedDevice = serialSelect.value;
        while (serialSelect.options.length > 0) {
            serialSelect.remove(0);
        }
        if (devList.length != 0) {
            for (var i = 0; i < devList.length; i++) {
                var reader = devList[i].readerName;
                var item = new Option(devList[i].bankTailNumer, reader);
                $(item).attr("issueBank", devList[i].issueBank);
                var tailNum = devList[i].bankTailNumer;
                if (tailNum != '') {
                    tailNum = '尾号' + tailNum;
                }
                $(item).attr("bankTailNumer", tailNum);
                $(item).attr("bankCardType", devList[i].bankCardType);
                $(item).attr("logoUrl1", devList[i].logoUrl1);
                serialSelect.options.add(item);
                if (selectedDevice == reader) {
                    item.selected = true;
                }
            }
        }
        $(obj).eIDselect("refresh");
    }

    //绑定事件
    function pluginEventAttach(elem, eventName, func, isCustumEvt) {
        if (isCustumEvt) {
            elem.addEventListener(eventName, func, false);
        }
        else {
            if (elem.attachEvent != null) {
                elem.attachEvent('on' + eventName, func);
            }
            else if (elem.addEventListener != null) {
                elem.addEventListener(eventName, func, false);
            }
        }
    }

    //内部封装回调函数
    function callback(config, retVal, dataVal) {
        if (config != null && typeof (config) == 'object' && typeof (config.callback) == 'function') {
            //返回码中文字符串
            var msgVal;

            var pluginObj = document.getElementById('eIDPlugin');
            //若已加载控件则调用控件方法解析中文
            if (pluginObj != null && typeof (pluginObj) == 'object' && pluginObj.eID_GetMessage != null) {
                msgVal = pluginObj.eID_GetMessage(retVal);
            }
            //没有加载控件则调用以下判断进行解析
            else {
                switch (retVal) {
                    case 0:
                        msgVal = '操作执行成功。'
                        break;
                    case 0xE0170005:
                        msgVal = '参数无效。'
                        break;
                    case 0xE0170019:
                        msgVal = '无法找到设备。';
                        break;
                    case 0xE017003D:
                        msgVal = '控件加载失败或没有安装。';
                        break;
                    case 0xE017003E:
                        msgVal = '未调用设置设备选择框方法。';
                        break;
                    case 0xE0170029:
                        msgVal = '已设置一个Div为设备选择框。';
                        break;
                    case 0xE017003F:
                        msgVal = '无效的页面元素。';
                        break;
                    default:
                        msgVal = '';
                        break;
                }
            }

            //构造回调返回参数
            var evt;
            if (dataVal == null) {
                evt = {
                    rv: retVal,
                    msg: msgVal
                };
            }
            else {
                evt = {
                    rv: retVal,
                    msg: msgVal,
                    data: dataVal
                };
            }

            //执行回调函数
            config.callback(evt);
        }
    }

    //设备变化回调函数
    function devChangeCallback(cb, num) {
        if (cb == null) {
            return;
        }

        var evt = {
            count: num
        };

        cb(evt);
    }

    //检查输入配置是否有效
    function checkConfig(config) {
        if (config == null || typeof (config) != 'object') {
            return false;
        }

        return true;
    }

    //检查输入参数是否有效
    function checkParam(param, type, isNess) {
        if (!isNess) {
            if (param === undefined) {
                return true;
            }
        }

        if (typeof (param) != type) {
            return false;
        }

        return true;
    }

    //禁止无效eID卡的按钮点击
    function disableInvalidCardBtn(btn) {
        var deviceSelect = document.getElementById(divConfig.id + 'Select');
        if (deviceSelect.options.length == 0) {
            btn.disabled = true;
            return;
        }
        var selectContent = deviceSelect.options[deviceSelect.selectedIndex].outerHTML;
        if (selectContent.indexOf('无效eID卡') != -1) {
            btn.disabled = true;
        }
        else {
            btn.disabled = false;
        }
    }
}
