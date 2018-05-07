var prefix = "/system/user"


$(document).ready(function(){
    $('body').layout({ west__size: 185 });
    queryUserList();
    queryDeptTreeDaTa();
});

function queryUserList() {
    var columns = [{
        checkbox: true
    },
        {
            field: 'userId',
            title: '用户ID'
        },
        {
            field: 'loginName',
            title: '登录名'
        },
        {
            field: 'userName',
            title: '学生姓名'
        },
        {
            field: 'studentId',
            title: '学号'
        },
        {
            field: 'number',
            title: '届数'
        },
        {
            field: 'dept.deptName',
            title: '专业'
        },
        {
            field: 'employee',
            title: '就业状态'
        },

        {
            field: 'status',
            title: '账户状态',
            align: 'center',
            formatter: function(value, row, index) {
                if (value == '0') {
                    return '<span class="label label-success">正常</span>';
                } else if (value == '1') {
                    return '<span class="label label-danger">禁用</span>';
                }
            }
        }];
    var url = prefix + "/list/1";
    $.initTable(columns, url);
}

function queryDeptTreeDaTa()
{
    // 树结构初始化加载
    var setting = {view:{selectedMulti:false},data:{key:{title:"title"},simpleData:{enable:true}},
        callback:{onClick:function(event, treeId, treeNode){
                tree.expandNode(treeNode);
                var opt = { query : { deptId : treeNode.id, parentId : treeNode.pId, } };
                $('.bootstrap-table').bootstrapTable('refresh', opt);
            }}
    }, tree, loadTree = function(){
        $.get("/system/dept/treeData", function(data) {
            tree = $.fn.zTree.init($("#tree"), setting, data); //.expandAll(true);
            // 展开第一级节点
            var nodes = tree.getNodesByParam("level", 0);
            for (var i = 0; i < nodes.length; i++) {
                tree.expandNode(nodes[i], true, false, false);
            }
            // 展开第二级节点
            nodes = tree.getNodesByParam("level", 1);
            for (var i = 0; i < nodes.length; i++) {
                tree.expandNode(nodes[i], true, false, false);
            }
        }, null, null, "正在加载，请稍后...");
    };loadTree();

    $('#btnExpand').click(function() {
        tree.expandAll(true);
        $(this).hide();
        $('#btnCollapse').show();
    });
    $('#btnCollapse').click(function() {
        tree.expandAll(false);
        $(this).hide();
        $('#btnExpand').show();
    });
    $('#btnRefresh').click(function() {
        loadTree();
    });
}
