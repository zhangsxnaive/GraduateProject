$("#form-user-edit").validate({
	rules:{
		userName:{
			required:true,
		},
		password:{
			required:true,
			minlength: 6
		},
        studentId:{
            required:true,
        },
        gender:{
            required:true
        },
        email:{
			// required:true,
			email:true
		},
		// phonenumber:{
		// 	required:true,
		// },
	},
	submitHandler:function(form){
		update();
	}
});

function update() {
	var userId = $("input[name='userId']").val();
	var deptId = $("input[name='deptId']").val();
	var areaId = $("input[name='areaId']").val();
	var userName = $("input[name='userName']").val();
	var password = $("input[name='password']").val();
	var email = $("input[name='email']").val();
	var phonenumber = $("input[name='phonenumber']").val();
    var gender = $("input[name='gender']:checked").val();
    var company = $("input[name='company']").val();
    var companyAddress = $("input[name='companyAddress']").val();
    var number = $("#number").val();
    var studentId = $("#studentId").val();
	var status = $("input[name='status']").is(':checked') == true ? 0 : 1;
	var roleIds = $("#role").val()+"";
	var postIds = $("#post").val() + "";
	$.ajax({
		cache : true,
		type : "POST",
		url : "/system/user/save",
		data : {
            "company":company,
            "companyAddress":companyAddress,
            "number":number,
            "studentId":studentId,
			"userId": userId,
			"deptId": deptId,
			"userName": userName,
			"password": password,
			"email": email,
			"phonenumber": phonenumber,
            "gender": gender,
			"status": status,
			"roleIds": roleIds,
			"postIds": postIds,
            "location": areaId
		},
		async : false,
		error : function(request) {
			$.modalAlert("系统错误", "error");
		},
		success : function(data) {
			if (data.code == 0) {
				parent.layer.msg("修改成功,正在刷新数据请稍后……",{icon:1,time: 500,shade: [0.1,'#fff']},function(){
					$.parentReload();
				});
			} else {
				$.modalAlert(data.msg, "error");
			}
		}
	});
}

/*用户管理-修改-选择部门树*/
function selectDeptTree() {
	var deptId = $("#treeId").val();
    var url = "/system/dept/selectDeptTree/" + deptId;
    layer_show("选择部门", url, '380', '380');
}

/*用户管理-新增-选择城市树*/
function selectAreaTree() {
    var treeId = $("#areaId").val();
    var areaId = treeId == null || treeId == "" ? "0" : treeId;
    var url = "/system/area/selectAreaTree/" + areaId;
    layer_show("选择城市", url, '380', '380');
}

