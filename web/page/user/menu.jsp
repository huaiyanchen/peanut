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
    <title>ð¥ð</title>
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
            <el-button type="success" plain @click="addDialog=true">æ·»å èå</el-button>
        </el-form-item>
    </el-form>

    <el-table :data="menuList" style="width: 100%;" stripe border>
        <el-table-column prop="mid" label="åºå·" width="150" align="center"></el-table-column>
        <el-table-column prop="name" label="èåå" width="150" align="center"></el-table-column>
        <el-table-column prop="parentid" label="ç¶id" width="150" align="center" :formatter="playbackFormat2">

        </el-table-column>
        <el-table-column prop="state" label="æ¯å¦æ¾ç¤º" width="150" align="center"
                         :formatter="playbackFormat"></el-table-column>
        <el-table-column prop="path" label="è·¯å¾" width="250" align="center"></el-table-column>

        <el-table-column prop="icon" label="å¾æ " width="200" align="center"></el-table-column>

        <el-table-column label="æä½" align="center" width="200">8
            <template slot-scope="scope">
                <el-button type="primary" round @click="modifyMenu(scope.row)">ä¿®æ¹</el-button>
                <el-button type="danger" round @click="deleteCommand(scope.row.mid)"
                           :disabled="scope.row.state==0||scope.row.parentid==0">å é¤
                </el-button>
            </template>
        </el-table-column>
    </el-table>


    <!-- æ¨¡ææ¡ -->
    <el-dialog title="ä¿®æ¹èå" :visible.sync="updateDialog" width="40%">
        <el-form label-width="90px" :model="updateMenu" ref="updateMenu">
            <el-row>
                <el-form-item label="èåå" prop="name">
                    <el-input v-model="updateMenu.name" auto-complete="off"
                              placeholder="è¯·è¾å¥åç§°"></el-input>
                </el-form-item>

                <el-form-item label="ä¿®æ¹æ¾ç¤º" prop="state">
                    <el-input v-model="updateMenu.state" auto-complete="off"
                              placeholder="è¯·è¾å¥åç§°"></el-input>
                </el-form-item>

                <el-form-item label="éæ©ç¶ç±»" prop="parentid">
                    <el-select v-model="updateMenu.parentid" :disabled="updateMenu.parentid==0">
                        <el-option v-for="item in parents" :key="item.mid" :label="item.name" :value="item.mid">
                        </el-option>
                    </el-select>
                </el-form-item>

                <el-form-item label="éæ©è§è²">
                    <el-select multiple v-model="value" placeholder="è¯·éæ©">
                        <el-option label="éæ©ææ" value="all"></el-option>
                        <el-option v-for="item in options" :key="item.rid" :label="item.rname" :value="item.rid">
                        </el-option>
                    </el-select>
                </el-form-item>

                <el-form-item label="ä¿®æ¹å¾æ " prop="icon">
                    <el-input v-model="updateMenu.icon" auto-complete="off"
                              placeholder="è¯·è¾å¥ä½è"></el-input>
                </el-form-item>
            </el-row>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="updateDialog = false">å æ¶</el-button>
            <el-button type="primary" @click="modifyMenus">ç¡® å®</el-button>
        </div>
    </el-dialog>

    <!-- æ¨¡ææ¡ -->
    <el-dialog title="æ·»å èå" :visible.sync="addDialog" width="40%">
        <el-dialog width="30%" title="æ·»å ç¶èå" :visible.sync="innerVisible1" append-to-body>
            <el-form label-width="90px" :model="addMenu" ref="addMenu">
                <el-row>
                    <el-form-item label="èåå" prop="name">
                        <el-input v-model="addMenu.name" auto-complete="off"
                                  placeholder="è¯·è¾å¥èåå"></el-input>
                    </el-form-item>

                    <el-form-item label="ç¶æ" prop="state">
                        <el-input v-model="addMenu.state" auto-complete="off"
                                  placeholder="è¯·è¾å¥ç¶æid"></el-input>
                    </el-form-item>
                    <el-form-item label="å¾æ " prop="icon">
                        <el-input v-model="addMenu.icon" auto-complete="off"
                                  placeholder="è¯·è¾å¥å¾æ "></el-input>
                    </el-form-item>

                    <el-form-item label="éæ©è§è²">
                        <el-select v-model="value" placeholder="è¯·éæ©">
                            <el-option v-for="item in options" :key="item.rid" :label="item.rname" :value="item.rid">
                            </el-option>
                        </el-select>
                    </el-form-item>
                </el-row>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="innerVisible1 = false ,addDialog = false">å æ¶</el-button>
                <el-button type="primary" @click="addMenus('parent')">ç¡® å®</el-button>
            </div>
        </el-dialog>
        <el-dialog width="30%" title="æ·»å å­èå" :visible.sync="innerVisible2" append-to-body>
            <el-form label-width="90px" :model="addMenu" ref="addMenu">
                <el-row>
                    <el-form-item label="èåå" prop="name">
                        <el-input v-model="addMenu.name" auto-complete="off"
                                  placeholder="è¯·è¾å¥èåå"></el-input>
                    </el-form-item>

                    <el-form-item label="ç¶æ" prop="state">
                        <el-input v-model="addMenu.state" auto-complete="off"
                                  placeholder="è¯·è¾å¥ç¶æid"></el-input>
                    </el-form-item>

                    <el-form-item label="å°å" prop="path">
                        <el-input v-model="addMenu.path" auto-complete="off"
                                  placeholder="è¯·è¾å¥è·¯å¾"></el-input>
                    </el-form-item>

                    <el-form-item label="å¾æ " prop="icon">
                        <el-input v-model="addMenu.icon" auto-complete="off"
                                  placeholder="è¯·è¾å¥å¾æ "></el-input>
                    </el-form-item>

                    <el-form-item label="éæ©ç¶ç±»">
                        <el-select v-model="updateparentid">
                            <el-option v-for="item in parents" :key="item.mid" :label="item.name" :value="item.mid">
                            </el-option>
                        </el-select>
                    </el-form-item>

                    <el-form-item label="éæ©è§è²">
                        <el-select v-model="value" placeholder="è¯·éæ©">
                            <el-option v-for="item in options" :key="item.rid" :label="item.rname" :value="item.rid">
                            </el-option>
                        </el-select>
                    </el-form-item>

                </el-row>
            </el-form>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="innerVisible2 = false ,addDialog = false">å æ¶</el-button>
                <el-button type="primary" @click="addMenus('child')">ç¡® å®</el-button>
            </div>

        </el-dialog>
        <el-button type="primary" @click="innerVisible1 = true">æ·»å ç¶èå</el-button>
        <el-button type="primary" @click="innerVisible2 = true">æ·»å å­èå</el-button>
        <div slot="footer" class="dialog-footer">
            <el-button @click="addDialog = false">å æ¶</el-button>
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
                    return 'ä¸æ¾ç¤º'
                } else {
                    return 'æ¾ç¤º'
                }
            },
            playbackFormat2(row, column) {
                let vm = this;
                if (row.parentid === 0) {
                    return 'å°±æ¯ç¶ç±»'
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
                    if (response.data === "ä¿®æ¹æå") {
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
                    if (response.data === "æ·»å æå") {
                        vm.$data.innerVisible1 = false;
                        vm.$data.innerVisible2 = false;
                        vm.$data.addDialog = false;
                        alert(response.data);
                    }
                    if (response.data === "æ·»å å¤±è´¥") {
                        alert(response.data);
                    }
                    vm.init();
                    vm.queryMenu();
                });
            },
            deleteCommand(id) {
                let vm = this
                let message;
                this.$confirm('ç¡®å®å é¤å?', 'æç¤º', {
                    confirmButtonText: 'ç¡®å®',
                    cancelButtonText: 'åæ¶',
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
                        if (message == "å é¤æå") {
                            console.log("1q2431241341231231")
                            vm.$data.disabled = true;
                        }
                        vm.queryMenu();
                    })
                }).catch(() => {
                    this.$message({type: 'info', message: "å·²åæ¶éåº"});
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
                //åå§åé¡µé¢æ°æ®çæ¹æ³
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
                let newindex = val.indexOf('all'), oldindex = oldval.indexOf('all');   //è·åvalåoldvaléallçç´¢å¼,å¦ææ²¡æåè¿å-1
                if (newindex != -1 && oldindex == -1 && val.length > 1)                       //å¦ææ°çéæ©éæå¾éäºéæ©ææéæ©ææ å åªç´çº¿å¾éæææ´ä¸ªéé¡¹
                    this.value = ['all'];
                else if (newindex != -1 && oldindex != -1 && val.length > 1)                 //å¦ææä½åæå¾éäºéæ©ææä¸å½åä¹éä¸­äºå¾éææä¸å¾éæ°éå¤§äº1  åç§»é¤æå¾éææ
                    this.value.splice(val.indexOf('all'), 1)
            }
        }
    })
</script>
</body>
</html>
