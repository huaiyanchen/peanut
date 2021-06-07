<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/5/25
  Time: 17:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>🥜🚇</title>
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

                <el-form :inline="true" ref="myForm" class="demo-form-inline">
                    <el-form-item>
                        <el-button type="success" plain @click="addDialog = true">添加</el-button>
                    </el-form-item>
                </el-form>

                <el-table :data="gameList" style="width: 100%;height: 80%" stripe border>
                    <el-table-column prop="gid" label="编号" width="150"></el-table-column>
                    <el-table-column prop="name" label="游戏名称" width="150"></el-table-column>
                    <el-table-column prop="title" label="游戏标题" width="200"></el-table-column>
                    <el-table-column prop="downLoadCount" label="下载量" width="100"></el-table-column>
                    <el-table-column prop="size" label="大小(M)" width="100"></el-table-column>
                    <el-table-column prop="state" label="状态" width="150">
                        <template slot-scope="scope">
                            {{scope.row.state==3?"体验服":""}}
                            {{scope.row.state==2?"正式服":""}}
                            {{scope.row.state==1?"抢先服":""}}
                            {{scope.row.state==0?"测试服":""}}
                        </template>
                    </el-table-column>

                    <el-table-column prop="typeId" label="分类" width="150">
                        <template slot-scope="scope">
                            {{scope.row.typeId==1?"休闲益智":""}}
                            {{scope.row.typeId==2?"网络游戏":""}}
                            {{scope.row.typeId==3?"体育竞技":""}}
                            {{scope.row.typeId==4?"棋牌中心":""}}
                        </template>
                    </el-table-column>

                    <el-table-column prop="platform" label="平台类型" width="150"></el-table-column>
                    <el-table-column prop="rank" label="推荐类型" width="150">
                        <template slot-scope="scope">
                            {{scope.row.rank==3?"普通":""}}
                            {{scope.row.rank==2?"最新":""}}
                            {{scope.row.rank==1?"精选":""}}
                            {{scope.row.rank==0?"首页推荐":""}}
                        </template>
                    </el-table-column>

                    <el-table-column label="操作" align="center" min-width="50">
                        <template slot-scope="scope">
                            <el-button type="primary" round @click="modifyGame(scope.$index)">修改</el-button>

                            <el-popconfirm
                                    confirm-button-text='好的'
                                    cancel-button-text='不用了'
                                    icon="el-icon-info"
                                    icon-color="red"
                                    title="这是一段内容确定删除吗？"
                                    <%--@click="deleteGame(scope.row.gid)"--%>
                                    @confirm ="deleteGame(scope.row.gid)"
                            >
                                <el-button type="danger" round slot="reference"  >删除</el-button>
                            </el-popconfirm>

                        </template>
                    </el-table-column>
                </el-table>

                <!--
                    layout：sizes->每页显示几条数据  prev->上一页  pager->页码  next->下一页  jumper->跳转到某一页
                 -->
                <el-pagination background layout="sizes,prev, pager, next, jumper"
                               @size-change="sizeChange" @current-change="currentChange" :page-sizes="[3, 6, 9]"
                               :total="pageInfo.total"
                               :page-size="pageInfo.pageSize" :current-page="pageInfo.currentpage">
                </el-pagination>
            </el-card>

            <%--      =========================    编辑   ============================================    --%>
            <el-dialog style="width: 1000px;" title="添加游戏" :visible.sync="addDialog">
                <el-form :model="addGame">
                    <el-form-item label="游戏名称" :label-width="formLabelWidth">
                        <el-input v-model="addGame.name" autocomplete="off"></el-input>
                    </el-form-item>
                    <el-form-item label="标题" :label-width="formLabelWidth">
                        <el-input v-model="addGame.title" autocomplete="off"></el-input>
                    </el-form-item>
                    <el-form-item label="大小" :label-width="formLabelWidth">
                        <el-input v-model="addGame.size" autocomplete="off"></el-input>
                    </el-form-item>

                    <el-form-item label="上架状态" :label-width="formLabelWidth">
                        <el-select v-model="addGame.state" placeholder="请选择上线服类型">
                            <el-option label="测试服" value="0"></el-option>
                            <el-option label="抢先服" value="1"></el-option>
                            <el-option label="正式服" value="2"></el-option>
                            <el-option label="体验服" value="3"></el-option>
                        </el-select>
                    </el-form-item>

                    <el-form-item label="游戏类型" :label-width="formLabelWidth">
                        <el-select v-model="addGame.typeId" placeholder="请选择上线服类型">
                            <el-option label="休闲益智" value="1"></el-option>
                            <el-option label="网络游戏" value="2"></el-option>
                            <el-option label="体育竞技" value="3"></el-option>
                            <el-option label="棋牌中心" value="4"></el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="上线平台" :label-width="formLabelWidth">
                        <el-select v-model="addGame.platform" placeholder="请选择活动区域">
                            <el-option label="安卓" value="android"></el-option>
                            <el-option label="IOS" value="ios"></el-option>
                            <el-option label="all" value="all"></el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="推荐类型" :label-width="formLabelWidth">
                        <el-select v-model="addGame.rank" placeholder="请选择活动区域">
                            <el-option label="首页推荐" value="0"></el-option>
                            <el-option label="精选" value="1"></el-option>
                            <el-option label="最新" value="2"></el-option>
                            <el-option label="普通" value="3"></el-option>
                        </el-select>
                    </el-form-item>
                </el-form>
                <div slot="footer" class="dialog-footer">
                    <el-button @click="addDialog = false">取 消</el-button>
                    <el-button type="primary" @click="saveGame">确 定</el-button>
                </div>
            </el-dialog>

            <%--+============================ 修改 +============================--%>
            <el-dialog style="width: 1000px;" title="修改游戏" :visible.sync="updateDialog">
                <el-form :model="updataGame">
                    <el-form-item label="游戏名称" :label-width="formLabelWidth">
                        <el-input v-model="updataGame.name" autocomplete="off"></el-input>
                    </el-form-item>
                    <el-form-item label="标题" :label-width="formLabelWidth">
                        <el-input v-model="updataGame.title" autocomplete="off"></el-input>
                    </el-form-item>
                    <el-form-item label="大小" :label-width="formLabelWidth">
                        <el-input v-model="updataGame.size" autocomplete="off"></el-input>
                    </el-form-item>
                    <el-form-item label="上架状态" :label-width="formLabelWidth">
                        <el-select v-model="updataGame.state" placeholder="请选择上线服类型">
                            <el-option label="测试服" value="0"></el-option>
                            <el-option label="抢先服" value="1"></el-option>
                            <el-option label="正式服" value="2"></el-option>
                            <el-option label="体验服" value="3"></el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="游戏类型" :label-width="formLabelWidth">
                        <el-select v-model="updataGame.typeId" placeholder="请选择上线服类型">
                            <el-option label="休闲益智" value="1"></el-option>
                            <el-option label="网络游戏" value="2"></el-option>
                            <el-option label="体育竞技" value="3"></el-option>
                            <el-option label="棋牌中心" value="4"></el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="上线平台" :label-width="formLabelWidth">
                        <el-select v-model="updataGame.platform" placeholder="请选择活动区域">
                            <el-option label="安卓" value="android"></el-option>
                            <el-option label="IOS" value="ios"></el-option>
                            <el-option label="all" value="all"></el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="推荐类型" :label-width="formLabelWidth">
                        <el-select v-model="updataGame.rank" placeholder="请选择活动区域">
                            <el-option label="首页推荐" value="0"></el-option>
                            <el-option label="精选" value="1"></el-option>
                            <el-option label="最新" value="2"></el-option>
                            <el-option label="普通" value="3"></el-option>
                        </el-select>
                    </el-form-item>
                </el-form>
                <div slot="footer" class="dialog-footer">
                    <el-button @click="updateDialog = false">取 消</el-button>
                    <el-button type="primary" @click="editGame">确 定</el-button>
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
                gameList: [],// 所有的游戏列表
                // total: 0, //总条数
                // currentpage: 1, // 当前页
                // pageSize: 3, //每页显示几条数据,

                pageInfo: { // 分页信息
                    total: 0, //总条数
                    pageSize: 3, // 每页显示几条数据
                    currentpage: 1 // 当前页
                },

                selectParams: { //查询时提交到servlet的数据
                    type: "showGameByPage",
                    nowPage: "1", // 当前页
                    pageNum: "3", // 每页显示几条数据
                    gname: "" //  游戏名称
                },

                paramGame: {//  查询条件
                    gameName: ""
                },
                addDialog: false, // 添加模态框的状态值
                addGame: { // 添加游戏时，需要提交到服务器的数据
                    type: "addGame", // servlet中调用方法
                    name: "",
                    title: "",
                    size: "",
                    state: "",
                    typeId: "",
                    platform: "",
                    rank: ""
                },

                updateDialog: false,
                updataGame: { // 修改游戏时，需要提交到服务器的数据
                    type: "updataGame", // servlet中调用方法
                    name: "",
                    title: "",
                    size: "",
                    state: "",
                    typeId: "",
                    platform: "",
                    rank: "",
                    gid: ""
                }
            }
        },
        methods: {
            currentChange(nowPage) {
                this.selectParams.nowPage = nowPage;
                this.queryGame(this.selectParams);
            },
            sizeChange(count) {
                this.selectParams.pageNum = count;
                this.queryGame(this.selectParams);
            },
            saveGame() {
                var vm = this;
                var addParams = this.addGame;
                // console.log("awdeasda"+addParams);
                // 将数据提交到服务器
                axios({
                    method: 'post',
                    url: '/game.do',
                    params: addParams
                }).then(function (response) {
                    alert(response.data);
                    if (response.data == response.data) {
                        vm.addDialog = false; // 关闭模态框
                        vm.queryGame(vm.selectParams);
                    }
                }).catch(function (error) {
                    console.log(error);
                });
            },

            modifyGame(index) {
                ///将要修改的游戏信息添加到模态框中
                var game = this.gameList[index];
                this.updataGame = {
                    type: "updataGame", // servlet中调用方法
                    name: game.name,
                    title: game.title,
                    size: game.size,
                    state: game.state,
                    typeName: game.typeName,
                    typeId: game.typeId,
                    platform: game.platform + "",
                    rank: game.rank,
                    gid: game.gid
                };
                console.log(game.typeid)
                console.log(game.name)

                // console.log(typeof (this.updataGame.platform));
                this.updateDialog = true; //显示修改的模态框
            },

            editGame() {
                //将模态框中的修改数据 提交到数据库中
                var vm = this;
                var editGame = this.updataGame;
                //将数据提交到数据库
                axios({
                    method: 'post', // 提交方式
                    url: '/game.do',// 提交地址
                    params: editGame
                }).then(function (response) {
                    alert(response.data);
                    if (response.data == response.data) {
                        vm.updateDialog = false; // 关闭模态框
                        // 查询游戏列表
                        vm.queryGame(vm.selectParams);
                    }
                }).catch(function (error) {
                    console.log(error);
                });
            },
            deleteGame(gid) {
                var vm = this;
                axios({
                    method: 'post', // 提交方式
                    url: '/game.do',// 提交地址
                    params: { //提交的数据
                        type: "deleteGame",
                        gid: gid
                    }
                }).then(function (response) {
                    console.log(response);
                    vm.queryGame(vm.selectParams);
                })
            },
            queryGame(params) {
                if (params == null) {
                    this.$data.selectParams.nowPage = 1;
                    params = this.$data.selectParams;
                }
                console.log(params)
                var vm = this;
                axios({
                    method: "post",
                    url: "/game.do",
                    params: params
                }).then(function (response) {
                    console.log("GameServlet返回的数据:!!!" + response.data);
                    var json = eval(response.data);
                    // 将serlvet中查询到的game数据赋值:gameList、pageInfo
                    vm.gameList = json.list;
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
            this.queryGame(this.selectParams);
        }

        // var vm = this;
        // //发送post请求
        // axios({
        //     method: 'post', // 提交方式
        //     url: '/game.do',// 提交地址
        //     params: {
        //         type: "showGameByPage"
        //     }
        // }).then(function (response) {
        //     // console.log(response.data.allCount);
        //     // console.log(response.data);
        //     vm.$data.gameList = response.data.list;
        //     vm.$data.currentpage = response.data.page;
        //     vm.$data.pageSize = response.data.count;
        //     vm.$data.total = response.data.allCount;
        // });

    };

    var vueObject2 = Vue.extend(userListObject2);
    new vueObject2().$mount("#vue2");
</script>
</body>
</html>
