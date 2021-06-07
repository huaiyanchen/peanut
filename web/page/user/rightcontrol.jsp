<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/5/28
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>🥜🚇</title>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://unpkg.com/vue/dist/vue.js"></script>
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/element-ui/2.15.1/index.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/qs/6.10.1/qs.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/layer/3.4.0/layer.js"></script>
</head>
<body>
<div id="menu">
    <el-form :inline="true" class="demo-form-inline">
        <el-form-item>
            <el-button type="success" plain @click="showAddDialog = true">添加管理员</el-button>
        </el-form-item>

        <el-form-item>
            <el-button type="success" plain @click="showAddRoleDialog = true">添加角色</el-button>
        </el-form-item>
    </el-form>

    <el-table :data="userList" style="width: 100%;" stripe border>
        <el-table-column prop="uid" label="序号" width="150" align="center"></el-table-column>
        <el-table-column prop="username" label="账号" width="150" align="center"></el-table-column>
        <el-table-column prop="rname" label="角色" width="150" align="center"></el-table-column>
        <el-table-column prop="regtime" label="创建日期" width="250" align="center"></el-table-column>
        <el-table-column prop="logintime" label="最后登陆日期" width="250" align="center"></el-table-column>
        <el-table-column prop="state" label="状态" width="150" align="center"  :formatter="playbackFormat">

        </el-table-column>
        <el-table-column label="操作" align="center" width="200">
            <template slot-scope="scope">
                <el-button type="primary" round @click="updateState(scope.$index),showUpdateDialog = true,checkName = scope.row.username">修改
                </el-button>
                <el-button type="danger" round @click="deleteCommand(scope.row.uid)"
                           :disabled="scope.row.state==0 ||scope.row.uid==1 ">删除
                </el-button>
            </template>
        </el-table-column>
    </el-table>

    <%-- 添加管理用户  --%>
    <el-dialog title="新增管理员" :visible.sync="showAddDialog" width="40%">
        <el-form ref="userData" :model="userData" label-width="100px">
            <el-form-item label="请输入用户名">
                <el-input v-model="userData.username" placeholder="请输入用户名" @blur="checkUserName"></el-input>
                <el-tag :type="messageNameType" v-show="show">{{messageName}}</el-tag>
            </el-form-item>
            <el-form-item label="请输入密码">
                <el-input v-model="userData.pwd" type="password" placeholder="请输入密码"></el-input>
            </el-form-item>

            <el-form-item label="选择角色">
                <el-select multiple v-model="value" placeholder="请选择">
                    <el-option label="选择所有" value="all"></el-option>
                    <el-option v-for="item in options" :key="item.rid" :label="item.rname" :value="item.rid">
                    </el-option>
                </el-select>
            </el-form-item>

        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="showAddDialog = false">取 消</el-button>
            <el-button type="primary" @click="addUser">确 定</el-button>
        </div>
    </el-dialog>

    <%-- 修改管理用户 index --%>
    <el-dialog title="修改管理员" :visible.sync="showUpdateDialog" width="40%">
        <el-form ref="userData" :model="userData" label-width="100px">
            <el-form-item label="请输入用户名">
                <el-input v-model="userData.username" placeholder="请输入用户名" @blur="checkUserName1"></el-input>
                <el-tag :type="messageNameType" v-show="show">{{messageName}}</el-tag>
            </el-form-item>

            <el-form-item label="选择角色">
                <el-select multiple v-model="value" placeholder="请选择">
                    <el-option label="选择所有" value="all"></el-option>
                    <el-option v-for="item in options" :key="item.rid" :label="item.rname" :value="item.rid">
                    </el-option>
                </el-select>
            </el-form-item>

            <el-form-item label="账号状态">
                <el-select v-model="userData.state" placeholder="请选择">
                    <el-option
                            v-for="item in stateList"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                    </el-option>
                </el-select>
            </el-form-item>

        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="showUpdateDialog = false">取 消</el-button>
            <el-button type="primary" @click="updateUser">确 定</el-button>
        </div>
    </el-dialog>

    <%-- 添加角色  --%>
    <el-dialog title="新增角色" :visible.sync="showAddRoleDialog" width="40%">
        <el-form ref="roleData" :model="userData" label-width="100px">
            <el-form-item label="请输入角色名">
                <el-input v-model="roleData.rname" placeholder="请输入角色名"></el-input>
            </el-form-item>
            <el-form-item label="请选择菜单">
                <el-tree :data="menuData" show-checkbox default-expand-all node-key="mid" ref="tree" highlight-current
                         :props="defaultProps"></el-tree>
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="showAddRoleDialog = false">取 消</el-button>
            <el-button type="primary" @click="addRole">确 定</el-button>
        </div>
    </el-dialog>

</div>


<script type="text/javascript">
    new Vue({
        el: "#menu",
        data: {
            userList: [],
            checkName:'',
            disabled: false,
            showAddDialog: false,
            showAddRoleDialog: false,
            showUpdateDialog: false,
            userData: {},
            show: false,
            messageName: "",
            messageNameType: "",
            //修改的用户数据向数据库上传
            updateUserDate: {},
            stateList: [{
                value: 0,
                label: "账号已停用"
            }, {
                value: 1,
                label: "账号可用"
            }],
            options: [],
            value: [],
            roleList: [],
            roleData: {},
            menuData: [],
            defaultProps: {
                id: "mid",
                label: 'name',
                children: 'children',
            },
        },
        methods: {
            playbackFormat(row, column) {
                if (row.state === 0) {
                    return '无效'
                } else  {
                    return '有效'
                }
            },
            checkUserName() {
                let vm = this;
                let userName = this.userData.username;
                axios({
                    method: "post",
                    url: "/user.do",
                    params: {
                        type: "checkUserName",
                        username: userName,
                    }
                }).then(function (response) {
                    vm.$data.show = true;
                    vm.$data.messageName = response.data;
                    if (response.data === "合法用户名") {
                        vm.$data.messageNameType = "success"
                    } else {
                        vm.$data.messageNameType = "danger"
                    }
                })
            },
            checkUserName1() {
                let vm = this;
                let userName = this.userData.username;
                axios({
                    method: "post",
                    url: "/user.do",
                    params: {
                        type: "checkUserName",
                        username: userName,
                    }
                }).then(function (response) {
                    vm.$data.show = true;
                    if (response.data === "合法用户名"){
                        vm.$data.messageNameType = "success";
                        vm.$data.messageName = "合法用户名"
                    }else if ( vm.$data.userData.username ===  vm.$data.checkName) {
                        vm.$data.messageNameType = "success";
                        vm.$data.messageName = "用户名未修改"
                    } else {
                        vm.$data.messageNameType = "danger";
                        vm.$data.messageName = response.data
                    }
                })
            },

            addRole() {
                let vm = this;
                var mids = window.Qs.stringify(vm.$refs.tree.getCheckedKeys(), {arrayFormat: 'repeat'});
                axios({
                    method: "post",
                    url: "/role.do",
                    params: {
                        type: "addRole",
                        mids: mids,
                        rname: vm.$data.roleData.rname
                    }
                }).then(function (response) {
                    vm.$data.showAddRoleDialog = false;
                    alert(response.data);
                    if (response.data === "添加成功") {
                        vm.showAddRoleDialog = false;
                    } else {
                        alert(response.data);
                    }
                    vm.init();
                })
            },
            updateState(index) {
                var vm = this;
                vm.userData = this.userList[index];
            },
            updateUser() {
                var vm = this;
                var rids = window.Qs.stringify(vm.$data.value, {arrayFormat: 'repeat'});
                var upDateUserRole = vm.updateUserDate = {
                    type: "updateUserRole",
                    uid: this.userData.uid,
                    username: this.userData.username,
                    state: this.userData.state,
                    rids:rids
                };
                axios({
                    method: "post",
                    url: "/user.do",
                    params: upDateUserRole
                }).then(function (response) {
                    vm.$data.showUpdateDialog = false;
                    if (response.data == "添加成功") {
                        alert(response.data)
                    } else {
                        alert(response.data)
                    }
                    vm.queryMenu();
                })
            },
            deleteCommand(id) {
                let vm = this;
                let message;
                this.$confirm('确定删除吗?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    axios({
                        method: "post",
                        url: "/user.do",
                        params: {
                            type: "delete",
                            uid: id
                        }
                    }).then(function (response) {
                        message = response.data;
                        if (message == "删除成功") {
                        }
                        vm.queryMenu();
                    })
                }).catch(() => {
                    this.$message({type: 'info', message: "已取消退出"});
                });
            },
            queryMenu(params) {
                let vm = this;
                if (params == null) {
                    params = {
                        type: "show"
                    }
                }
                axios({
                    method: "post",
                    url: "/user.do",
                    params: params
                }).then(function (response) {
                    vm.$data.userList = response.data;
                })
            },
            addUser() {
                let vm = this;
                var rids = window.Qs.stringify(vm.$data.value, {arrayFormat: 'repeat'});
                axios({
                    method: "post",
                    url: "/user.do",
                    params: {
                        type: "addUser",
                        username: vm.$data.userData.username,
                        pwd: vm.$data.userData.pwd,
                        rids: rids
                    }
                }).then(function (response) {
                    vm.$data.showAddDialog = false;
                    if (response.data === "添加成功") {
                        alert(response.data)
                    } else {
                        alert(response.data)
                    }
                    vm.queryMenu();
                })
            },
            init() {
                let vm = this;
                axios({
                    method: "post",
                    url: "/menu.do",
                    params: {
                        type: "showMenuList",
                    }
                }).then(function (response) {
                    vm.$data.menuData = response.data;
                });
                axios({
                    method: "post",
                    url: "/role.do",
                    params: {
                        type: "showRole"
                    }
                }).then(function (response) {
                    vm.$data.options = response.data;
                });
                vm.queryMenu();
            },
        },
        mounted() {
            let vm = this;
            vm.init();
        }, watch: {
            value: function (val, oldval) {
                let newindex = val.indexOf('all'), oldindex = oldval.indexOf('all');   //获取val和oldval里all的索引,如果没有则返回-1
                if (newindex != -1 && oldindex == -1 && val.length > 1)                       //如果新的选择里有勾选了选择所有选择所有 则 只直线勾选所有整个选项
                    this.value = ['all'];
                else if (newindex != -1 && oldindex != -1 && val.length > 1)                 //如果操作前有勾选了选择所有且当前也选中了勾选所有且勾选数量大于1  则移除掉勾选所有
                    this.value.splice(val.indexOf('all'), 1)
            },
        },
    })
</script>
</body>
</html>
