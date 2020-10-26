
<div><label class="col-sm-2 control-label backstage-select-label">任务信息</label></div>
<div class="ibox float-e-margins backstage-right-div">
    <input id="contextParam" type="hidden" value="/"/>
    <div class="ibox-content">
        <form method="get" class="form-horizontal">

            <div class="form-group backstage-form-group">
                <label class="col-sm-2 control-label backstage-select-label">文件名称:</label>
                <div class="col-sm-10 backstage-col-sm-10">
                    <input placeholder="请输入文件名称" class="form-control backstage-input" type="text" id="filename" name="filename">
                </div>
            </div>

            <div class="hr-line-dashed backstage-hr-line-dashed"></div>
            <div class="form-group backstage-form-group">
                <label class="col-sm-2 control-label backstage-select-label">时间:</label>
                <div class="col-sm-10 backstage-col-sm-10">
                    <input id="startTime" class="laydate-icon form-control layer-date backstage-date"
                           readonly="readonly" placeholder="开始时间" name="startTime">
                    <input id="endTime" class="laydate-icon form-control layer-date backstage-date" readonly="readonly"
                           placeholder="结束时间" name="endTime">
                </div>
            </div>
            <div class="hr-line-dashed backstage-hr-line-dashed"></div>

            <div class="form-group backstage-form-group">
                <label class="col-sm-2 control-label backstage-select-label">任务状态:</label>
                <div class="col-sm-10 backstage-col-sm-10">
                    <select class="form-control m-b backstage-select" name="productCode" id="productCode">
                        <option value="">-- 全部 --</option>
                        <option value="1">初始化</option>
                        <option value="12">已结束</option>
                    </select>
                </div>
            </div>
            <div class="hr-line-dashed backstage-hr-line-dashed"></div>

            <div class="form-group backstage-form-group">
                <label class="col-sm-2 control-label backstage-select-label">任务类型:</label>
                <div class="col-sm-10 backstage-col-sm-10">
                    <select class="form-control m-b backstage-select" name="ESBCode" id="ESBCode">
                        <option value="">-- 全部 --</option>
                        <option value="true">接收</option>
                        <option value="false">发送</option>
                    </select>
                </div>
            </div>
            <div class="hr-line-dashed backstage-hr-line-dashed"></div>

            <div class="form-group backstage-form-group">
                <label class="col-sm-2 control-label backstage-select-label">发送端IP:</label>
                <div class="col-sm-10 backstage-col-sm-10">
                    <input placeholder="请输入发送端IP" class="form-control backstage-input" type="text" id="uid" name="uid">
                </div>
            </div>
            <div class="hr-line-dashed backstage-hr-line-dashed"></div>
            <div class="form-group backstage-form-group">
                <label class="col-sm-2 control-label backstage-select-label">接收端传输服务IP:</label>
                <div class="col-sm-10 backstage-col-sm-10">
                    <input placeholder="请输入接收端传输服务IP" class="form-control backstage-input" type="text" id="mobile"
                           name="mobile">
                </div>
            </div>
            <div class="hr-line-dashed backstage-hr-line-dashed"></div>

            <div class="form-group backstage-form-group">
                <div class="col-sm-2 backstage-select-label">
                    <button type="button" class="btn btn-w-m btn-danger backstage-button" onclick="search()">查&nbsp;&nbsp;&nbsp;询</button>
                </div>
            </div>
            <div class="hr-line-dashed backstage-hr-line-dashed"></div>
        </form>
    </div>
    <div class="ibox-content">
        <div class="bootstrap-table table-responsive backstage-table-div">
            <div class="fixed-table-container">
                <table id="table"></table>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- 隐藏域 -->
<div style="display: none">
    <!-- 如果点击搜索,则需要将页码制为1 -->
    <input id="ifPageOne" name="ifPageOne" value="0"/>
</div>
<script type="text/javascript">
    //日期控件
    var startTime = {
        elem: '#startTime',
        format: 'YYYY-MM-DD hh:mm:ss',
        istime: true,
        max: laydate.now(),
        choose: function (datas) {
            endTime.min = datas;
            endTime.start = datas;
        }
    };
    var endTime = {
        elem: '#endTime',
        format: 'YYYY-MM-DD hh:mm:ss',
        istime: true,
        max: laydate.now(),
        choose: function (datas) {
            startTime.max = datas;
        }
    };
    laydate(startTime);
    laydate(endTime);

    //table
    $('#table').bootstrapTable({
        cache: false,
        method: 'post',
        contentType: 'application/x-www-form-urlencoded',
        dataType: 'json',
        url: '/data',
        undefinedText: '-',
        striped: true,
        pagination: true,
        sidePagination: 'server',
        pageSize: 10,
        pageNumber: 1,
        pageList: [],
        queryParams: queryParams,
        columns: [
            {
                field: 'no',
                title: '序号',
                width: "50px",
                formatter: function (value, row, index) {
                    return index + 1;
                }
            }, {
                field: 'fileName',
                title: '文件名称'
            }, {
                field: 'startTime',
                title: '开始时间',
                formatter: function (value, row, index) {
                    if (undefined == value || '' == value) {
                        return;
                    } else if (value == '10000009') {
                        return 'a';
                    } else if (value == '11000009') {
                        return 'b';
                    }
                }
            }, {
                field: 'endTime',
                title: '结束时间',
                formatter: function (value, row, index) {
                    if (undefined == value || '' == value) {
                        return;
                    } else {
                        return tableDateFormatter(value)
                    }
                }
            }, {
                field: 'dataSize',
                title: '数据量'
            }, {
                field: 'percent',
                title: '任务完成率（%）',
                formatter: function (value, row, index) {
                    if (undefined == value) {
                        return;
                    } else {
                        return (value / 100.0).toFixed(2);
                    }
                }
            }, {
                field: 'status',
                title: '任务状态'
            }, {
                field: 'type',
                title: '任务类型',
                formatter: function (value, row, index) {
                    if (undefined == value) {
                        return;
                    } else if (value) {
                        return '是';
                    } else {
                        return '否';
                    }
                }
            }, {
                field: 'senderIP',
                title: '发送端IP',
                formatter: function (value, row, index) {
                    return getAuditStatus(value);
                }
            }, {
                field: 'receiverIP',
                title: '接收端传输服务IP',
                formatter: function (value, row, index) {
                    if (undefined == value || '' == value) {
                        return;
                    } else {
                        return tableDateFormatter(value)
                    }
                }
            }, {
                field: 'op',
                title: '操作',
                formatter: function (value, row, index) {
                    return "<button type=\"button\" class=\"btn btn-w-m btn-danger backstage-button\" onclick=\"stop()\">暂停</button>";
                }
            }]
    })

    //设置查询参数
    function queryParams(params) {
        if ($("#ifPageOne").val() == 1) {
            params.offset = 0;
            var obj = $('#table').bootstrapTable('getOptions');
            obj.pageNumber = 1;
            $("#ifPageOne").val(0);
        }
        //applyDate
        var startTime = $("#startTime").val();
        if (startTime != "") {
            startTime = startTime.replace(/[^0-9]/mg, '');
        }
        var endTime = $("#endTime").val();
        if (endTime != "") {
            endTime = endTime.replace(/[^0-9]/mg, '');
        }
        var obj = {
            pageSize: params.limit,
            pageNo: params.offset / 10 + 1,
            startTime: startTime,
            endTime: endTime,
            productCode: $("#productCode").val(),
            esbMsgPushFlag: $("#ESBCode").val(),
            uid: $("#uid").val(),
            mobile: $("#mobile").val(),
            applyNo: $("#loanId").val()
        }
        return obj;
    }

    //查询按钮方法
    function search() {
        $("#ifPageOne").val(1);
        $('#table').bootstrapTable('removeAll');
        $('#table').bootstrapTable('refresh');
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

    Date.prototype.format = function (format) {
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

    function showJson(obj) {
        var trElement = $(obj).parent().parent().parent()
        var json = $(obj).attr("data-id");
        json = JSON.parse(json);
        json = JSON.stringify(json, null, 4).replace(/\n/g, "<br/>").replace(/\s/g, "&nbsp;");
        var insertElement =
            "<tr class = 'json' >" +
            "<td>J</td>" +
            "<td><a class='hideJson' href='javascript:void(0);' onclick='hideJson(this)'>隐藏</a></td>" +
            "<td colspan='19' style='width:200px;'>" + json + "</td>" +
            "</tr>";
        $(insertElement).insertAfter(trElement);
        $(obj).hide();
    }

    function hideJson(obj) {
        $(obj).parent().parent().prev().find(".showJson").show();
        $(obj).parent().parent().eq(0).remove();
    }

    function getCfcaDesc(value) {
        if (value == 0) {
            return '未签';
        } else if (value == 1) {
            return '已签, 已生成PDF';
        } else if (value == 2) {
            return '已签，未生成PDF';
        } else {
            return value;
        }
    }
</script>
