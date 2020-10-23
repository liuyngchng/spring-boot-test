function updatePayStatus() {
    var payNo = $("#payNo").val();
    var contextParam = $("#contextParam").val();

    $.ajax({
        url: contextParam + '/emergency/pay',
        type: 'post',
        dataType: 'json',
        data: {
            payNo : payNo,
            payChannel : $("#payChannel").val()
        },
        success: function(data) {
            alert(JSON.stringify(data));
            return false;
        },
        error: function (data) {
            alert(JSON.stringify(data));
            return false;
        }
    })
}

function unbindBank() {
    var bankCardId = $("#bankCardId").val().trim();
    var contextParam = $("#contextParam").val();
    if (undefined == bankCardId || '' ==  bankCardId) {
        alert("请输入银行卡ID");
        return;
    }
    $.ajax({
        url: contextParam + '/emergency/unbind/bank',
        type: 'post',
        dataType: 'json',
        data: {
            bankCardId : bankCardId,
            payChannel : $("#payChannel").val()
        },
        success: function(data) {
            alert(JSON.stringify(data));
            return false;
        },
        error: function (data) {
            alert(JSON.stringify(data));
            return false;
        }
    })
}

function updateAuditStatus() {
    var contextParam = $("#contextParam").val();
    $.ajax({
        url: contextParam + '/emergency/auditStatus/update',
        type: 'post',
        dataType: 'json',
        data: {
            applyNo : $("#applyNo").val(),
            auditStatus : $("#auditStatus").val()
        },
        success: function(data) {
            alert(JSON.stringify(data["responseText"]));
            return true;
        },
        error: function (data) {
            alert(JSON.stringify(data["responseText"]));
            return false;
        }
    })
}


function sendJsonEsb() {
    var contextParam = $("#contextParam").val();
    var esbJson = $(".esbJson").val().trim();
    var registerName = $(".registerName").val().trim();
    if ('' == esbJson || undefined == esbJson) {
        alert("请输入ESB json.");
        return;
    } else if ('' == registerName || undefined == registerName) {
        alert("请选择esb的注册名称.");
        return;
    }
    if (!window.confirm('确认要发送如下的ESB消息吗？registerName: ' + registerName + ', esb content: ' + esbJson )) {
        return;
    }
    $.ajax({
        url: contextParam + '/esb/send/msg/json',
        type: 'POST',
        dataType: 'json',
        data: {
            registerName : registerName,
            esbJson: encodeURIComponent(esbJson)
        },
        success: function(data) {
            alert(JSON.stringify(data));
            return true;
        },
        error: function (data) {
            alert(JSON.stringify(data));
            return false;
        }
    })
}


function releaseKey() {
    var redisKey = $("#redisKey").val().trim();
    if (undefined == redisKey || '' ==  redisKey) {
        alert("请输入需要解锁的key");
        return;
    }
    var contextParam = $("#contextParam").val();
    $.ajax({
        url: contextParam + '/emergency/release/key',
        type: 'post',
        dataType: 'json',
        data: {
            redisKey : redisKey
        },
        success: function(data) {
            alert(JSON.stringify(data));
            return false;
        },
        error: function (data) {
            alert(JSON.stringify(data));
            return false;
        }
    })
}


function getPicUrl() {
    var contextParam = $("#contextParam").val();
    var ufileKey = $("#ufileKey").val().trim();
    if (undefined == ufileKey || '' ==  ufileKey) {
        alert("请输入ufileKey");
        return;
    }
    $.ajax({
        url: contextParam + '/ufile/picture/url',
        type: 'post',
        dataType: 'json',
        data: {
            key : ufileKey
        },
        success: function(data) {
            alert(data["data"]);
            return false;
        },
        error: function (data) {
            alert(JSON.stringify(data));
            return false;
        }
    })
}

function getPdfUrl() {
    var contextParam = $("#contextParam").val();
    var loanId = $("#loanId").val().trim();
    if (undefined == loanId || '' ==  loanId) {
        alert("请输入loanId");
        return;
    }
    $.ajax({
        url: contextParam + '/ufile/pdf/url',
        type: 'post',
        dataType: 'json',
        data: {
            loanId : loanId
        },
        success: function(data) {
            if (data["errorCode"] == 0) {
                window.open(data["data"], false);
            } else {
                alert(data["errorMessage"]);
            }
            return true;
        },
        error: function (data) {
            alert(JSON.stringify(data));
            return false;
        }
    })
}

function configRedis() {
    var contextParam = $("#contextParam").val();
    var configKey = $("#configKey").val().trim();
    var configValue = $("#configValue").val().trim();
    if (undefined == configValue || '' ==  configValue) {
        alert("请输入配置信息的值");
        return;
    }
    try {
        var config = JSON.parse(configValue);
        configValue = JSON.stringify(config);
    } catch(ex) {
        alert(ex.message);
        return;
    }
    configValue = encodeURIComponent(configValue);
    $("#configValue").val("正在提交......");
    $.ajax({
        url: contextParam + '/config/refresh',
        type: 'post',
        dataType: 'json',
        data: {
            configKey : configKey,
            configValue : configValue
        },
        success: function(data) {
            alert(JSON.stringify(data));
            return false;
        },
        error: function (data) {
            alert(JSON.stringify(data));
            return false;
        }
    })
    $("#configValue").val("");
}

function getRedisConfig() {
    var contextParam = $("#contextParam").val();
    var configKey = $("#configKey").val().trim();
    if (undefined == configKey || '' ==  configKey) {
        alert("请选择配置的key");
        return;
    }
    $("#configValue").val("正在查询......");
    $.ajax({
        url: contextParam + '/config/data',
        type: 'post',
        dataType: 'json',
        data: {
            configKey : configKey
        },
        success: function(data) {
            $("#configValue").val(decodeURIComponent(JSON.stringify(data, null, 4)))
            return true;
        },
        error: function (data) {
            alert(JSON.stringify(data));
            return false;
        }
    })
}
