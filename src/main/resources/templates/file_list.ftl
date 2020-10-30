
<div><label class="col-sm-2 control-label backstage-select-label">文件信息</label></div>
<div class="ibox float-e-margins backstage-right-div">
    <input id="contextParam" type="hidden" value="/"/>
    <div class="ibox-content" >
        <div style="display: none" class="form-group backstage-form-group">
            <label class="col-sm-2 control-label backstage-select-label">时间:</label>
            <div class="col-sm-10 backstage-col-sm-10">
                <input id="startTime" class="laydate-icon form-control layer-date backstage-date"
                       readonly="readonly" placeholder="开始时间" name="create_time">
                <input id="endTime" class="laydate-icon form-control layer-date backstage-date" readonly="readonly"
                       placeholder="结束时间" name="finish_time">
            </div>
        </div>
        <div class="hr-line-dashed backstage-hr-line-dashed"></div>
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
                field: 'id',
                title: '序号',
                width: "50px"
            }, {
                field: 'md5',
                title: '文件MD5'
            },{
                field: 'task_name',
                title: '文件名称'
            }, {
                field: 'create_time',
                title: '传输开始时间'
            }, {
                field: 'finish_time',
                title: '传输完成时间'
            },{
                field: 'push_time',
                title: '投递完成时间'
            }, {
                field: 'origin_ip',
                title: '发送端IP'
            }, {
                field: 'target_ip',
                title: '接收端传输服务IP'
            }, {
                field: 'slice_sended',
                title: '当前包'
            }, {
                field: 'slice_total',
                title: '总包数'
            }, {
                field: 'file_type',
                title: '文件类型'
            },{
                field: 'size',
                title: '文件大小(MB)'
            }, {
                field: 'data_size',
                title: '实际发送数据量(MB)'
            }, {
                field: 'app_type',
                title: '应用类型'
            },]
    })
</script>
