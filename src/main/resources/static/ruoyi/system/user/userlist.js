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
        // {
        //     field: 'userId',
        //     title: '用户ID'
        // },
        // {
        //     field: 'loginName',
        //     title: '登录名'
        // },
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
            title: '操作',
            align: 'center',
            formatter: function(value, row, index) {
                var actions = [];
                actions.push('<a class="btn btn-info' + '" href="#" title="查看" onclick="view(\'' + row.userId + '\')"><i class="fa fa-eye"></i></a> ');
                return actions.join('');
            }
        }
        ];
    var postId = $("#post").val();
    var url = prefix + "/list/"+postId;
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

/*用户管理-查看*/
function view(userId) {
    var url = prefix + '/view/' + userId;
    layer_showAuto("查看学生信息", url);
}
