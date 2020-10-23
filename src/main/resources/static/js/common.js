/**
 * Created by Richard on 8/18/17.
 */
//格式化时间戳
function formatTimestamp (timestamp) {
    var newDate = new Date();
    newDate.setTime(timestamp)
    var month = (newDate.getMonth() +1).toString();
    var day = newDate.getDate().toString();
    var hour = newDate.getHours().toString();
    var min = newDate.getMinutes().toString();
    var sec = newDate.getSeconds().toString();
    return newDate.getFullYear() +'-' + paddingLeft(month)+ '-' + paddingLeft(day) + ' ' + paddingLeft(hour) + ':' + paddingLeft(min) + ':' + paddingLeft(sec);
}
//时间戳padding
function paddingLeft(str) {
    if (undefined ==  str || '' == str) {
        return;
    }
    if (str.length == 1) {
        return '0' + str;
    } else {
        return str;
    }
}

//进件审核状态
function getAuditStatus(value) {
    if (value == 0) {
        return "未提交(0)";
    } else if (value == 1) {
        return "审核中(1)";
    } else if (value == 2) {
        return "放款中(2)";
    } else if (value == 3) {
        return "还款中(3)";
    } else if (value == 4) {
        return "审核拒绝(4)";
    } else if (value == 5) {
        return "已废弃(5)";
    } else if (value == 6) {
        return "已结清(6)";
    } else if (value == 8) {
        return "补充资料(8)";
    } else if (value == 11) {
        return "复议(11)";
    } else if (value == 12) {
        return "进件中(12)";
    } else if (value == 13) {
        return "已逾期(13)";
    } else if (value == 14) {
        return "放款失败(14)";
    } else if (value == 15) {
        return "放标失败(15)";
    } else if (value == 16) {
        return "放标中(16)";
    } else if (value == 10) {
        return "确认中(10)";
    } else if (value == 9) {
        return "审核通过(9)";
    } else if (value == 17) {
        return "进件失败(17)";
    } else {
        return value;
    }
}


//表格时间格式化
function tableDateFormatter(dateStr) {
    if (dateStr != null && dateStr != "" && dateStr.length == 14) {
        var strArray = dateStr.split("");
        strArray.splice(4, 0, "-");
        strArray.splice(7, 0, "-");
        strArray.splice(10, 0, " ");
        strArray.splice(13, 0, ":");
        strArray.splice(16, 0, ":");
        return strArray.join("");
    } else {
        return dateStr;
    }
}

Date.prototype.format = function(format) {
    var date = {
        "M+": this.getMonth() + 1,
        "d+": this.getDate(),
        "h+": this.getHours(),
        "m+": this.getMinutes(),
        "s+": this.getSeconds(),
        "q+": Math.floor((this.getMonth() + 3) / 3),
        "S+": this.getMilliseconds()
    };
    if (/(y+)/i.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
    }
    for (var k in date) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1
                ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
        }
    }
    return format;
}
//移除json对象中值为空的key
function removeEmpty(obj) {
    Object.keys(obj).forEach(
        function(key) {
            (obj[key] && typeof obj[key] === 'object')
            && removeEmpty(obj[key]) ||
            (obj[key] === undefined || obj[key] === null || obj[key] === '')
            && delete obj[key]
        });
    return obj;
};


