<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/5/26
  Time: 20:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>🥜🚇の渠道</title>
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
                <%--  ===========================     查询功能      ======================================================--%>
                <el-form :inline="true" :model="formChannel" ref="formChannel" class="user-search">
                    <el-form-item>
                        <el-select size="small" v-model="formChannel.channelOneTypeId" placeholder="一级分类搜索选择"
                                   @change="changeType">
                            <el-option v-for="type in oneTypeList" :label="type.name" :value="type.tid"
                                       :key="type.tid"></el-option>
                        </el-select>
                    </el-form-item>

                    <el-form-item>
                        <el-select size="small" v-model="formChannel.channelTwoTypeId" placeholder="二级分类搜索选择">
                            <el-option v-for="type in twoTypeList" :label="type.name" :value="type.tid"
                                       :key="type.tid"></el-option>
                        </el-select>
                    </el-form-item>

                    <%--<el-form-item label="通过渠道编号搜索：">--%>
                        <%--<el-input size="small" v-model="formChannel.channelnum" placeholder="输入渠道编号"></el-input>--%>
                    <%--</el-form-item>--%>

                    <el-form-item label="通过产品名搜索：">
                        <el-input size="small" v-model="formChannel.productname" placeholder="输入渠道名称"></el-input>
                    </el-form-item>

                    <el-form-item>
                        <el-button size="small" type="primary" icon="el-icon-search" @click="search">搜索</el-button>
                    </el-form-item>
                </el-form>

                <%--  ================================= 表格内容   ================================================ --%>
                <el-table :data="channelList" highlight-current-row stripe border style="width: 100%;height: 80%">
                    <el-table-column type="index" width="60">
                    </el-table-column>
                    <el-table-column sortable prop="id" label="渠道id" width="100" show-overflow-tooltip>
                    </el-table-column>
                    <el-table-column sortable prop="typeoneid" label="一级分类id" width="150" show-overflow-tooltip>
                    </el-table-column>
                    <el-table-column sortable prop="typeonename" label="一级分类名称" width="150" show-overflow-tooltip>
                    </el-table-column>
                    <el-table-column sortable prop="typetwoid" label="二级分类id" width="150" show-overflow-tooltip>
                    </el-table-column>
                    <el-table-column sortable prop="typetwoname" label="二级分类" width="150" show-overflow-tooltip>
                    </el-table-column>
                    <el-table-column sortable prop="haveparent" label="是否有父级" width="150" show-overflow-tooltip>
                    </el-table-column>
                    <el-table-column sortable prop="channelnum" label="渠道号" width="150" show-overflow-tooltip>
                    </el-table-column>
                    <el-table-column sortable prop="url" label="下载地址" width="150" show-overflow-tooltip>
                    </el-table-column>
                    <el-table-column sortable prop="productname" label="产品名" width="150" show-overflow-tooltip>
                    </el-table-column>
                    <el-table-column sortable prop="productviewname" label="展示名" width="150" show-overflow-tooltip>
                    </el-table-column>
                    <el-table-column sortable prop="ctime" label="创建时间" width="150" show-overflow-tooltip>
                    </el-table-column>
                    <el-table-column sortable prop="platform" label="平台" width="150" show-overflow-tooltip>
                    </el-table-column>
                    <el-table-column sortable prop="area" label="地区" width="150" show-overflow-tooltip>
                    </el-table-column>

                    <el-table-column label="操作" align="center" min-width="150">
                        <template slot-scope="scope">
                            <%--<el-button type="danger" round @click="deleteChannel(scope.row.id)">删除</el-button>--%>

                            <el-popconfirm
                                    confirm-button-text='好的'
                                    cancel-button-text='不用了'
                                    icon="el-icon-info"
                                    icon-color="red"
                                    title="这是一段内容确定删除吗？"
                                    @confirm ="deleteChannel(scope.row.id)">

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


        </el-main>
    </el-container>
</div>

<script>
    var userListObject2 = {
        data() {
            return {
                channelList: [],//渠道列表
                oneTypeList: [], //一级分类菜单
                twoTypeList: [], //二级分类菜单

                formChannel: { //查询表格中的数据
                    type: "showChannel",
                    nowPage: "1", // 当前页
                    pageNum: "4", // 每页显示几条数据
                    channelOneTypeId: 0,
                    channelTwoTypeId: 0,
                    channelnum: 0,
                    productname: ""
                },
                pageInfo: {
                    currentPage: 1,
                    pageSize: 3,
                    total: 0
                },
                selectParams: { //查询时提交到servlet的数据
                    type: "showChannel",
                    nowPage: "1", // 当前页
                    pageNum: "4", // 每页显示几条数据
                    productviewname: "", //  渠道名称
                    channelOneTypeId: 0,
                    // typeoneid: 0
                },
                channelOneTypeId: 0,
            }
        },
        methods: {
            findType() {
                var vm = this;
                var params = {
                    type: "showType",
                    pid: 0,
                    tid: "",
                    isparent:1
                };
                axios({
                    url: "/channelInfo.do",
                    method: "post",
                    params: params
                }).then(function (response) {
                    console.log("返回的一级目录的信息!!!!!!!!!!!"+response.data);
                    vm.$data.oneTypeList = response.data;
                });
            },
            changeType(typeoneid) {
                var vm = this;
                var params = {
                    type:"showType",
                    isparent:"0",
                    pid:typeoneid
                };
                axios({
                    url: "/channelInfo.do",
                    method: "post",
                    params: params
                }).then(function (response) {
                    // console.log("二级查询目录的值!!!!!!!!!"+response);
                    vm.$data.twoTypeList = response.data;
                });
            },
            search() {
                var vm = this;
                var serchchannel = this.formChannel;
                vm.queryChannel(serchchannel);
            },
            deleteChannel(id){
                var vm = this;
                axios({
                    method: 'post', // 提交方式
                    url: '/channelInfo.do',// 提交地址
                    params: { //提交的数据
                        type: "deleteChannel",
                        id: id
                    }
                }).then(function (response) {
                    console.log(response);
                    alert(response.data);
                    vm.queryChannel(vm.selectParams);
                })
            },
            sizeChange(pageNums) {
                this.selectParams.pageNum = pageNums;
                this.queryChannel(this.selectParams);
            },
            currentChange(nowPage) {
                this.selectParams.nowPage = nowPage;
                this.queryChannel(this.selectParams);
            },
            queryChannel(params) {
                if (params == null) {
                    this.$data.selectParams.nowPage = 1;
                    params = this.$data.selectParams;
                }
                // console.log("queryBook中的参数!!!!!!"+params);
                var vm = this;
                axios({
                    method: "post",
                    url: "/channelInfo.do",
                    params: params
                }).then(function (response) {
                    console.log("bookServlet,分页方法返回的数据!!" + response.data);
                    var json = eval(response.data);
                    //将servlet中查到的book数据赋值:booklist.pageinfo
                    vm.channelList = json.list;
                    // console.log("count!!!!!!!!!!!"+json.count)
                    // console.log("page!!!!!!!!!!!"+json.page)
                    vm.pageInfo = {
                        total: json.allCount, //总条数
                        pageSize: json.count, // 每页显示几条数据
                        page: json.page // 当前页
                    }
                }).catch(function (error) {
                    console.log(error);
                });
            }
        },
        mounted: function () {
            //查询游戏列表中的数据
            this.queryChannel(this.selectParams);
            this.findType();
        }
    };
    var vueObject2 = Vue.extend(userListObject2);
    new vueObject2().$mount("#vue2");
</script>
</body>
</html>
