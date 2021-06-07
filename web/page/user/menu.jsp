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
    <script src="https://cdn.bootcdn.net/ajax/libs/layer/3.4.0/layer.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/qs/6.10.1/qs.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
</head>
<body>
<div id="menu">
    <el-form :inline="true" ref="myForm" class="demo-form-inline">
        <el-form-item>
            <el-button type="success" plain @click="addDialog=true">添加菜单</el-button>
        </el-form-item>
    </el-form>

    <el-table :data="menuList" style="width: 100%;" stripe border>
        <el-table-column prop="mid" label="序号" width="150" align="center"></el-table-column>
        <el-table-column prop="name" label="菜单名" width="150" align="center"></el-table-column>
        <el-table-column prop="parentid" label="父id" width="150" align="center" :formatter="playbackFormat2">

        </el-table-column>
        <el-table-column prop="state" label="是否显示" width="150" align="center"
                         :formatter="playbackFormat"></el-table-column>
        <el-table-column prop="path" label="路径" width="250" align="center"></el-table-column>

        <el-table-column prop="icon" label="图标" width="200" align="center"></el-table-column>

        <el-table-column label="操作" align="center" width="200">8
            <template slot-scope="scope">
                <el-button type="primary" round @click="modifyMenu(scope.row)">修改</el-button>
                <el-button type="danger" round @click="deleteCommand(scope.row.mid)"
                           :disabled="scope.row.state==0||scope.row.parentid==0">删除
                </el-button>
            </template>
        </el-table-column>
    </el-table>


    <!-- 模态框 -->
    <el-dialog title="修改菜单" :visible.sync="updateDialog" width="40%">
        <el-form label-width="90px" :model="updateMenu" ref="updateMenu">
            <el-row>
                <el-form-item label="菜单名" prop="name">
                    <el-input v-model="updateMenu.name" auto-complete="off"
                              placeholder="请输入名称"></el-input>
                </el-form-item>

                <el-form-item label="修改显示" prop="state">
                    <el-input v-model="updateMenu.state" auto-complete="off"
                              placeholder="请输入名称"></el-input>
                </el-form-item>

                <el-form-item label="选择父类" prop="parentid">
                    <el-select v-model="updateMenu.parentid" :disabled="updateMenu.parentid==0">
                        <el-option v-for="item in parents" :key="item.mid" :label="item.name" :value="item.mid">
                        </el-option>
                    </el-select>
                </el-form-item>

                <el-form-item label="选择角色">
                    <el-select multiple v-model="value" placeholder="请选择">
                        <el-option label="选择所有" value="all"></el-option>
                        <el-option v-for="item in options" :key="item.rid" :label="item.rname" :value="item.rid">
                        </el-option>
                    </el-select>
                </el-form-item>

                <el-form-item label="修改图标" prop="icon">
                    <el-input v-model="updateMenu.icon" auto-complete="off"
                              placeholder="请输入作者"></el-input>
                </el-form-item>
            </el-row>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="updateDialog = false">取 消</el-button>
            <el-button type="primary" @click="modifyMenus">确 定</el-button>
        </div>
    </el-dialog>

    <!-- 模态框 -->
    <el-dialog title="添加菜单" :visible.sync="addDialog" width="40%">
        <el-dialog width="30%" title="添加父菜单" :visible.sync="innerVisible1" append-to-body>
            <el-form label-width="90px" :model="addMenu" ref="addMenu">
                <el-row>
                    <el-form-item label="菜单名" prop="name">
                        <el-input v-model="addMenu.name" auto-complete="off"
                                  placeholder="请输入菜单名"></el-input>
                    </el-form-item>

                    <el-form-item label="状态" prop="state">
                        <el-input v-model="addMenu.state" auto-complete="off"
                                  placeholder="请输入状态id"></el-input>
                    </el-form-item>
                    <el-form-item label="图标" prop="icon">
                        <el-input v-model="addMenu.icon" auto-complete="off"
                                  placeholder="请输入图标"></el-input>
                    </el-form-item>

                    <el-form-item label="选择角色">
                        <el-select v-model="value" placeholder="请选择">
                            <el-option v-for="item in options" :key="item.rid" :label="item.rname" :value="item.rid">
                            </el-option>
                        </el-select>
                    </el-form-item>
                </el-row>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="innerVisible1 = false ,addDialog = false">取 消</el-button>
                <el-button type="primary" @click="addMenus('parent')">确 定</el-button>
            </div>
        </el-dialog>
        <el-dialog width="30%" title="添加子菜单" :visible.sync="innerVisible2" append-to-body>
            <el-form label-width="90px" :model="addMenu" ref="addMenu">
                <el-row>
                    <el-form-item label="菜单名" prop="name">
                        <el-input v-model="addMenu.name" auto-complete="off"
                                  placeholder="请输入菜单名"></el-input>
                    </el-form-item>

                    <el-form-item label="状态" prop="state">
                        <el-input v-model="addMenu.state" auto-complete="off"
                                  placeholder="请输入状态id"></el-input>
                    </el-form-item>

                    <el-form-item label="地址" prop="path">
                        <el-input v-model="addMenu.path" auto-complete="off"
                                  placeholder="请输入路径"></el-input>
                    </el-form-item>

                    <el-form-item label="图标" prop="icon">
                        <el-input v-model="addMenu.icon" auto-complete="off"
                                  placeholder="请输入图标"></el-input>
                    </el-form-item>

                    <el-form-item label="选择父类">
                        <el-select v-model="updateparentid">
                            <el-option v-for="item in parents" :key="item.mid" :label="item.name" :value="item.mid">
                            </el-option>
                        </el-select>
                    </el-form-item>

                    <el-form-item label="选择角色">
                        <el-select v-model="value" placeholder="请选择">
                            <el-option v-for="item in options" :key="item.rid" :label="item.rname" :value="item.rid">
                            </el-option>
                        </el-select>
                    </el-form-item>

                </el-row>
            </el-form>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="innerVisible2 = false ,addDialog = false">取 消</el-button>
                <el-button type="primary" @click="addMenus('child')">确 定</el-button>
            </div>

        </el-dialog>
        <el-button type="primary" @click="innerVisible1 = true">添加父菜单</el-button>
        <el-button type="primary" @click="innerVisible2 = true">添加子菜单</el-button>
        <div slot="footer" class="dialog-footer">
            <el-button @click="addDialog = false">取 消</el-button>
        </div>
    </el-dialog>

</div>


<script type="text/javascript">
    new Vue({
        el: "#menu",
        data: {
            menuList: [],
            disabled: false,
            updateDialog: false,
            addDialog: false,
            innerVisible1: false,
            innerVisible2: false,
            options: [],
            role: {},
            menu:{},
            updateMenu: {
                mid: "",
                name: "",
                state: "",
                parentid: "",
                icon: ""
            },
            addMenu: {
                name: "",
                state: "",
                parentid: "",
                icon: "",
                path: ""
            },
            parents: [],
            value: [],
            updateparentid: '',

        },
        methods: {
            playbackFormat(row, column) {
                if (row.state === "0") {
                    return '不显示'
                } else {
                    return '显示'
                }
            },
            playbackFormat2(row, column) {
                let vm = this;
                if (row.parentid === 0) {
                    return '就是父类'
                } else {
                    let arr = vm.$data.parents
                    for(j = 0,len=arr.length; j < len; j++) {
                        console.log("asdasd"+arr[1].mid)
                        if (row.parentid === arr[j].mid) {
                            console.log("asdasd"+menu.mid)
                            return arr[j].name
                        }
                    }
                }
            },
            modifyMenu(obj) {
                let vm = this;
                vm.$data.updateDialog = true;
                vm.updateMenu = obj;
            }, modifyMenus() {
                let vm = this;
                var rids = window.Qs.stringify(vm.$data.value, {arrayFormat: 'repeat'});
                let params = {
                    type: "updateMenu",
                    mid: vm.$data.updateMenu.mid,
                    name: vm.$data.updateMenu.name,
                    state: vm.$data.updateMenu.state,
                    parentid: vm.$data.updateMenu.parentid,
                    icon: vm.$data.updateMenu.icon,
                    rid: rids
                };
                console.log(params)
                axios({
                    method: "post",
                    url: "/menu.do",
                    params: params
                }).then(function (response) {
                    if (response.data === "修改成功") {
                        vm.$data.updateDialog = false;
                        alert(response.data);
                    } else {
                        alert(response.data)
                    }
                    vm.queryMenu();
                })
            }, addMenus(obj) {
                let vm = this;
                console.log(vm.$data.updateparentid);
                let params;
                if (obj === "parent") {
                    params = {
                        type: "addMenu",
                        path: "#",
                        name: vm.$data.addMenu.name,
                        state: vm.$data.addMenu.state,
                        parentid: "0",
                        icon: vm.$data.addMenu.icon,
                        rid: vm.$data.value
                    }
                } else {
                    params = {
                        type: "addMenuChild",
                        path: vm.$data.addMenu.path,
                        name: vm.$data.addMenu.name,
                        state: vm.$data.addMenu.state,
                        icon: vm.$data.addMenu.icon,
                        parentid: vm.$data.updateparentid,
                        rid: vm.$data.value
                    }
                }
                axios({
                    method: "post",
                    url: "${path}menu.do",
                    params: params
                }).then(function (response) {
                    if (response.data === "添加成功") {
                        vm.$data.innerVisible1 = false;
                        vm.$data.innerVisible2 = false;
                        vm.$data.addDialog = false;
                        alert(response.data);
                    }
                    if (response.data === "添加失败") {
                        alert(response.data);
                    }
                    vm.init();
                    vm.queryMenu();
                });
            },
            deleteCommand(id) {
                let vm = this
                let message;
                this.$confirm('确定删除吗?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    axios({
                        method: "post",
                        url: "${path}menu.do",
                        params: {
                            type: "delete",
                            mid: id
                        }
                    }).then(function (response) {
                        message = response.data;
                        if (message == "删除成功") {
                            console.log("1q2431241341231231")
                            vm.$data.disabled = true;
                        }
                        vm.queryMenu();
                    })
                }).catch(() => {
                    this.$message({type: 'info', message: "已取消退出"});
                });
            }, queryMenu(params) {
                let vm = this;
                if (params == null) {
                    params = {
                        type: "show"
                    }
                }
                axios({
                    method: "post",
                    url: "/menu.do",
                    params: params
                }).then(function (response) {
                    vm.$data.menuList = response.data;
                })
            }, init() {
                //初始化页面数据的方法
                let vm = this;
                axios({
                    method: "post",
                    url: "/menu.do",
                    params: {
                        type: "showParents"
                    }
                }).then(function (response) {
                    vm.$data.parents = response.data;
                })  , axios({
                    method: "post",
                    url: "/role.do",
                    params: {
                        type: "showRole"
                    }
                }).then(function (response) {
                    vm.$data.options = response.data;
                })

            },
        },
        mounted() {
            let vm = this;
            vm.queryMenu();
            vm.init();

        }, watch: {
            value: function (val, oldval) {
                let newindex = val.indexOf('all'), oldindex = oldval.indexOf('all');   //获取val和oldval里all的索引,如果没有则返回-1
                if (newindex != -1 && oldindex == -1 && val.length > 1)                       //如果新的选择里有勾选了选择所有选择所有 则 只直线勾选所有整个选项
                    this.value = ['all'];
                else if (newindex != -1 && oldindex != -1 && val.length > 1)                 //如果操作前有勾选了选择所有且当前也选中了勾选所有且勾选数量大于1  则移除掉勾选所有
                    this.value.splice(val.indexOf('all'), 1)
            }
        }
    })
</script>
</body>
</html>
