<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/5/31
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>🥜🚇の渠道分类</title>
    <style>
        .el-main {
            height: calc(100vh - 70px);
        }
    </style>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://unpkg.com/vue/dist/vue.js"></script>
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/element-ui/2.15.1/index.min.js"></script>
</head>
<body>
<div id="vue2">
    <el-container>
        <el-main>
            <el-card class="box-card">
                <%--  ================================= 添加按钮   ================================================ --%>

                <el-form :inline="true" ref="myForm" class="demo-form-inline">
                    <el-form-item>
                        <el-button type="success" plain @click="addDialog = true">添加</el-button>
                    </el-form-item>
                </el-form>
                <%--  ================================= 表格内容   ================================================ --%>
                <el-table :data="channelTypeList" highlight-current-row stripe border style="width: 100%;height: 80%">
                    <el-table-column type="index" width="60">
                    </el-table-column>
                    <el-table-column sortable prop="name" label="分类名称" width="150" show-overflow-tooltip>
                    </el-table-column>
                    <el-table-column sortable prop="pid" label="父级" width="150" show-overflow-tooltip>
                        <template slot-scope="scope">
                            {{scope.row.pid==0?"无父级":""}}
                            {{scope.row.pid==1?"一级分类1":""}}
                            {{scope.row.pid==2?"一级分类2":""}}
                            {{scope.row.pid==3?"一级分类3":""}}
                        </template>
                    </el-table-column>
                    <el-table-column sortable prop="sort" label="标签排序" width="150" show-overflow-tooltip>
                    </el-table-column>
                    <el-table-column sortable prop="ctime" label="创建时间" width="150" show-overflow-tooltip>
                    </el-table-column>


                    <el-table-column label="操作" align="center" min-width="50">
                        <template slot-scope="scope">
                            <el-button type="primary" round @click="modifyChannel(scope.$index)">修改</el-button>


                            <%--<el-button type="danger" round @click="deleteChannel(scope.row.tid)">删除</el-button>--%>

                            <el-popconfirm
                                    confirm-button-text='好的'
                                    cancel-button-text='不用了'
                                    icon="el-icon-info"
                                    icon-color="red"
                                    title="这是一段内容确定删除吗？"
                                    @confirm ="deleteChannel(scope.row.tid)">

                                <el-button type="danger" round slot="reference"  >删除</el-button>
                            </el-popconfirm>

                        </template>
                    </el-table-column>

                </el-table>
                <%-- =========================    分页   ============================================--%>
                <el-pagination background layout="sizes,prev, pager, next, jumper"
                               @size-change="sizeChange" @current-change="currentChange" :page-sizes="[4, 6, 8]"
                               :total="pageInfo.total"
                               :page-size="pageInfo.pageSize" :current-page="pageInfo.currentPage">
                </el-pagination>
            </el-card>

            <%--      =========================    编辑   ============================================    --%>
            <el-dialog style="width: 1000px;" title="添加渠道分类" :visible.sync="addDialog">
                <el-form :model="addChannelType">
                    <el-form-item label="分类名称" :label-width="formLabelWidth">
                        <el-input v-model="addChannelType.name" autocomplete="off"></el-input>
                    </el-form-item>
                    <el-form-item label="父级" :label-width="formLabelWidth">
                        <el-select v-model="addChannelType.pid" placeholder="请选择">
                            <el-option
                                    v-for="item in TypeList"
                                    :key="item.value"
                                    :label="item.label"
                                    :value="item.value">
                            </el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="标签排序" :label-width="formLabelWidth">
                        <el-input v-model="addChannelType.sort" autocomplete="off"></el-input>
                    </el-form-item>
                    <el-form-item label="备注" :label-width="formLabelWidth">
                        <el-input
                                type="textarea"
                                :autosize="{ minRows: 1, maxRows: 3}"
                                placeholder="请输入内容"
                                v-model="addChannelType.description">
                        </el-input>
                    </el-form-item>
                </el-form>
                <div slot="footer" class="dialog-footer">
                    <el-button @click="addDialog = false">取 消</el-button>
                    <el-button type="primary" @click="saveChannelType">确 定</el-button>
                </div>
            </el-dialog>
            <%--      =========================    修改   ============================================    --%>
            <el-dialog style="width: 1000px;" title="修改" :visible.sync="updateDialog">
                <el-form :model="updataList">
                    <el-form-item label="分类名称" :label-width="formLabelWidth">
                        <el-input v-model="updataList.name" autocomplete="off"></el-input>
                    </el-form-item>
                    <el-form-item label="父级" :label-width="formLabelWidth">
                        <el-select v-model="updataList.pid" placeholder="请选择">
                            <el-option
                                    v-for="item in TypeList"
                                    :key="item.value"
                                    :label="item.label"
                                    :value="item.value">
                            </el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="标签排序" :label-width="formLabelWidth">
                        <el-input v-model="updataList.sort" autocomplete="off"></el-input>
                    </el-form-item>
                    <el-form-item label="备注" :label-width="formLabelWidth">
                        <el-input
                                type="textarea"
                                :autosize="{ minRows: 1, maxRows: 3}"
                                placeholder="请输入内容"
                                v-model="updataList.description">
                        </el-input>
                    </el-form-item>
                </el-form>
                <div slot="footer" class="dialog-footer">
                    <el-button @click="updateDialog = false">取 消</el-button>
                    <el-button type="primary" @click="updateChannelType">确 定</el-button>
                </div>
            </el-dialog>

        </el-main>
    </el-container>
</div>
<script type="text/javascript">
    var userListObject2 = {
        data() {
            return {
                formLabelWidth: "120px",
                channelTypeList: [],// 所有的渠道类型列表

                pageInfo: { // 分页信息
                    total: 0, //总条数
                    pageSize: 4, // 每页显示几条数据
                    currentpage: 1 // 当前页
                },

                selectParams: { //查询时提交到servlet的数据
                    type: "showTypeList",
                    nowPage: "1", // 当前页
                    pageNum: "4", // 每页显示几条数据
                },
                addDialog: false, // 添加模态框的状态值
                updateDialog:false, //修改界面模态框的状态值
                addChannelType: { // 添加时，需要提交到服务器的数据
                    type: "addTypeList", // servlet中调用方法
                    name: "",
                    pid: "",
                    sort: "",
                    description: ""
                },
                TypeList:[{//0.无父级 1.一级分类1 2.1.一级分类2 3.1.一级分类3
                    value: 0,
                    label: "无父级"
                }, {
                    value: 1,
                    label: "一级分类1"
                }, {
                    value: 2,
                    label: "一级分类2"
                }],
                status: [{//更新状态 0 已完结， 1 连载中
                    value: 3,
                    label: "一级分类3"
                }],
                updataList:{ //修改渠道时,提交到服务器中的数据
                    type:"updateTypeList",
                    name: "",
                    pid: "",
                    sort: "",
                    description: ""
                },

            }
        },
        methods: {
            currentChange(nowPage) {
                this.selectParams.nowPage = nowPage;
                this.queryChannelType(this.selectParams);
            },
            sizeChange(count) {
                this.selectParams.pageNum = count;
                this.queryChannelType(this.selectParams);
            },
            saveChannelType() {
                var vm = this;
                var addParams = this.addChannelType;
                console.log(addParams.pid)
                axios({
                    method: 'post',
                    url: '/channelType.do',
                    params: addParams
                }).then(function (response) {
                    alert(response.data);
                    if (response.data == response.data) {
                        vm.addDialog = false; // 关闭模态框
                        vm.queryChannelType(vm.selectParams);
                    }
                }).catch(function (error) {
                    console.log(error);
                });
            },

            modifyChannel(index) {
                ///将要修改的游戏信息添加到模态框中
                var channelType = this.channelTypeList[index];
                this.updataList = {
                    type: "updateTypeList", // servlet中调用方法
                    tid:channelType.tid,
                    name: channelType.name,
                    pid: channelType.pid,
                    sort: channelType.sort,
                    description: channelType.description
                };
                this.updateDialog = true; //显示修改的模态框
            },
            updateChannelType(){
                //将模态框中的数据提交到后端
                var vm = this;
                var updateChannel = this.updataList;
                axios({
                    method: 'post', // 提交方式
                    url: '/channelType.do',// 提交地址
                    params: updateChannel
                }).then(function (response) {
                    alert(response.data);
                    if (response.data == response.data) {
                        vm.updateDialog = false; // 关闭模态框
                        // 查询游戏列表
                        vm.queryChannelType(vm.selectParams);
                    }
                }).catch(function (error) {
                    console.log(error);
                });
            },
            deleteChannel(tid) {
                var vm = this;
                axios({
                    method: 'post', // 提交方式
                    url: '/channelType.do',// 提交地址
                    params: { //提交的数据
                        type: "deleteTypeList",
                        tid: tid
                    }
                }).then(function (response) {
                    console.log(response);
                    alert(response.data);
                    vm.queryChannelType(vm.selectParams);
                })
            },
            queryChannelType(params) {
                if (params == null) {
                    this.$data.selectParams.nowPage = 1;
                    params = this.$data.selectParams;
                }
                console.log(params);
                var vm = this;
                axios({
                    method: "post",
                    url: "/channelInfo.do",
                    params: params
                }).then(function (response) {
                    console.log("ChannelTypeServlet返回的数据:!!!" + response.data);
                    var json = eval(response.data);
                    // 将serlvet中查询到的game数据赋值:gameList、pageInfo
                    vm.channelTypeList = json.list;
                    vm.pageInfo = {
                        total: json.allCount, //总条数
                        pageSize: json.count, // 每页显示几条数据
                        page: json.page // 当前页
                    };
                }).catch(function (error) {
                    console.log(error);
                });
            }
        },
        mounted: function () {
            //查询游戏列表中的数据
            this.queryChannelType(this.selectParams);
        }
    };

    var vueObject2 = Vue.extend(userListObject2);
    new vueObject2().$mount("#vue2");
</script>
</body>
</html>