<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/5/26
  Time: 18:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>
    <meta charset="utf-8">
    <title>🥜🚇</title>

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="//unpkg.com/vue/dist/vue.js"></script>
    <script src="//unpkg.com/element-ui@2.15.1/lib/index.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="//unpkg.com/element-ui@2.15.1/lib/index.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- vue中的js文件 -->
    <script src="https://unpkg.com/vue/dist/vue.js"></script>
    <!-- elementui中的组件 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <script src="https://cdn.bootcss.com/qs/6.7.0/qs.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="//unpkg.com/vue/dist/vue.js"></script>
    <script src="//unpkg.com/element-ui@2.15.2/lib/index.js"></script>

</head>
<style type="text/css">
    .el-row {
        margin-bottom: 20px;
       font-family: 楷体;
    }

    :last-child {
        margin-bottom: 0;
    }



    .el-col {
        border-radius: 4px;
    }

    .bg-purple-dark {
        background: #99a9bf;
    }

    .bg-purple {
        background: #d3dce6;
    }

    .bg-purple-light {
        background: #e5e9f2;
    }

    .grid-content {
        border-radius: 4px;
        min-height: 36px;
    }

    .row-bg {
        padding: 10px 0;
        background-color: #f9fafc;
    }

    .el-header, .el-footer {
        background-color: #cfdef1;
        color: #0c0c0c;
        text-align: left;
        line-height: 60px;
    }

    .box-card{
        background-color:#E6A23C;
    }



</style>


<body>
<div id="app3">

    <el-row :gutter="10">
        <el-col :span="12">
            <div class="grid-content">
                图书管理
            </div>
        </el-col>
        </el-col>
    </el-row>

</div>


<div id="app">
    <%--查询条件部分--%>
    <el-row :gutter="60">



        <el-col :span="6" :offset="1">
            <div class="block">
                <el-cascader
                        v-model="defaultProps.value"
                        :options="novelListData"
                        :props="defaultProps"
                        @change="queryNovel" clearable></el-cascader>
            </div>
        </el-col>


        <el-col :span="3" :offset="1">
            <el-input v-model="selectParams.bookid" placeholder="书籍ID"  clearable></el-input>
        </el-col>

        <el-col :span="3" :offset="1">
            <el-input v-model="selectParams.bookName" placeholder="名称"  clearable></el-input>
        </el-col>


        <el-col :span="3" :offset="5">
            <el-button type="primary" round @click="queryNovel()">搜索</el-button>
        </el-col>





        <el-dialog title="新建图书信息" :visible.sync="dialogFormVisible">

            <el-form ref="form" :model="form" label-width="100px">
                <el-form-item label="合作发行商">
                    <el-input v-model="form.bookpartner"></el-input>
                </el-form-item>

                <el-form-item label="书号">
                    <el-input v-model="form.bookid"></el-input>
                </el-form-item>

                <el-form-item label="书名">
                    <el-input v-model="form.bookName"></el-input>
                </el-form-item>

                <el-form-item label="是否完结">
                    <el-switch v-model="form.bstatus"></el-switch>
                </el-form-item>

                <el-form-item label="总字数">
                    <el-input v-model="form.bwordCount"></el-input>
                </el-form-item>

                <el-form-item label="简介">
                    <el-input v-model="form.bdescription"></el-input>
                </el-form-item>

                <el-form-item label="网络发行地址">
                    <el-input v-model="form.bcoverUrl"></el-input>
                </el-form-item>

                <el-form-item label="作者名">
                    <el-input v-model="form.bauthorName"></el-input>
                </el-form-item>

                <el-form-item label="最后章节名">
                    <el-input v-model="form.blastupdatechaptername"></el-input>
                </el-form-item>

                <el-form-item label="最后章节id">
                    <el-input v-model="form.blastupdatechapterid"></el-input>
                </el-form-item>

                <el-form-item label="纸质书籍价格">
                    <el-input v-model="form.bprice"></el-input>
                </el-form-item>

                <el-form-item label="花生内的价格">
                    <el-input v-model="form.bpeanutprice"></el-input>
                </el-form-item>

                <el-form-item label="是否vip">
                    <el-switch v-model="form.bisvip"></el-switch>
                </el-form-item>

                <el-form-item label="频道分类">
                    <el-radio-group v-model="formmodify.battribution">
                        <el-radio :label="1">男频</el-radio>
                        <el-radio :label="2">女频</el-radio>
                        <el-radio :label="3">其它</el-radio>
                    </el-radio-group>
                </el-form-item>

                <el-form-item label="分类">
                    <el-tree
                            :data=" novelListData2"
                            show-checkbox
                            node-key="bsortid"
                            default-expand-all
                            ref="tree"
                            highlight-current
                            :props="defaultProps2">
                    </el-tree>
                </el-form-item>

                <el-form-item label="关键字">
                    <el-input v-model="form.bkeyword"></el-input>
                </el-form-item>

                <el-form-item label="是否推荐">
                    <el-switch v-model="form.bisRecommand"></el-switch>
                </el-form-item>

            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="dialogFormVisible = false">取 消</el-button>
                <el-button type="primary" @click="saveNovel">确 定</el-button>
            </div>
        </el-dialog>



            <el-dialog title="修改图书信息" :visible.sync="dialogFormVisible1">
                <el-form ref="formmodify" :model="formmodify" label-width="100px">
                    <el-form-item label="合作发行商">
                        <el-input v-model="formmodify.bookpartner"></el-input>
                    </el-form-item>

                    <el-form-item label="书号">
                        <el-input v-model="formmodify.bookid"></el-input>
                    </el-form-item>

                    <el-form-item label="书名">
                        <el-input v-model="formmodify.bookName"></el-input>
                    </el-form-item>

                    <el-form-item label="是否完结">
                        <el-switch v-model="formmodify.bstatus"></el-switch>
                    </el-form-item>

                    <el-form-item label="总字数">
                        <el-input v-model="formmodify.bwordCount"></el-input>
                    </el-form-item>

                    <el-form-item label="简介">
                        <el-input v-model="formmodify.bdescription"></el-input>
                    </el-form-item>


                    <el-form-item label="网络发行地址">
                        <el-input v-model="formmodify.bcoverUrl"></el-input>
                    </el-form-item>

                    <el-form-item label="作者名">
                        <el-input v-model="formmodify.bauthorName"></el-input>
                    </el-form-item>

                    <el-form-item label="最后章节名">
                        <el-input v-model="formmodify.blastupdatechaptername"></el-input>
                    </el-form-item>

                    <el-form-item label="最后章节id">
                        <el-input v-model="formmodify.blastupdatechapterid"></el-input>
                    </el-form-item>

                    <el-form-item label="纸质书籍价格">
                        <el-input v-model="formmodify.bprice"></el-input>
                    </el-form-item>

                    <el-form-item label="花生内的价格">
                        <el-input v-model="formmodify.bpeanutprice"></el-input>
                    </el-form-item>

                    <el-form-item label="是否vip">
                        <el-switch v-model="formmodify.bisvip"></el-switch>
                    </el-form-item>

                    <el-form-item label="频道分类">
                        <el-radio-group v-model="formmodify.battribution" >
                            <el-radio :label="1">男频</el-radio>
                            <el-radio :label="2">女频</el-radio>
                            <el-radio :label="3">其它</el-radio>
                        </el-radio-group>
                    </el-form-item>

                    <el-form-item label="分类">
                        <el-tree
                                :data=" novelListData2"
                                show-checkbox
                                node-key="bsortid"
                                default-expand-all
                                ref="tree"
                                highlight-current
                                :props="defaultProps2">
                        </el-tree>
                    </el-form-item>

                    <el-form-item label="关键字">
                        <el-input v-model="formmodify.bkeyword"></el-input>
                    </el-form-item>

                    <el-form-item label="是否推荐">
                        <el-switch v-model="formmodify.bisRecommand"></el-switch>
                    </el-form-item>

                </el-form>

                    <div slot="footer" class="dialog-footer">
                        <el-button @click="dialogFormVisible1 = false">取 消</el-button>
                        <el-button type="primary" @click="modifyNovel">确 定</el-button>
                    </div>
        </el-dialog>



            <el-dialog title="书籍章节信息" :visible.sync="dialogTableVisible">
                <el-table :data="novelChapterList">
                    <el-table-column property="bchapterid" label="章节id" width="150"></el-table-column>
                    <el-table-column property="bchapterName" label="章节名" width="200"></el-table-column>
                    <el-table-column property="bchaptercontent" label="章节内容"></el-table-column>
                </el-table>

            </el-dialog>

    </el-row>


    <%--信息显示部分--%>
    <el-container >

        <el-header >数据</el-header>
        <el-main>
            <el-card class="box-card" >
                <template >
                    <el-table :data="novelList" height="450" border style="width: 100%" :header-cell-style="{background:'#409EFF',color:'#000000'}" :cell-style="{}">

                        <el-table-column prop="bookid" label="书籍ID"  width="180px" align="center" >
                        </el-table-column>
                        <el-table-column prop="bookName" label="书籍名称" align="center" width="180">
                        </el-table-column>
                        <el-table-column prop="bauthorName" label="作者" align="center" width="180">
                        </el-table-column>
                        <el-table-column prop="pid" align="center" label="一级分类ID">
                        </el-table-column>
                        <el-table-column prop="bsortname" align="center" label="一级分类名称">
                        </el-table-column>
                        <el-table-column prop="bsortid" align="center" label="二级分类ID">
                        </el-table-column>
                        <el-table-column prop="bsortname1" align="center" label="二级分类名称">
                        </el-table-column>
                        <el-table-column prop="bstatus" align="center" label="更新状态"  :formatter="playbackFormat">
                        </el-table-column>

                        <el-table-column fixed="right" align="center" label="操作" width="200">


                            <template slot-scope="scope">

                                <el-button type="primary" @click="dialogTableVisible = true,bookchapId = scope.row.bookid,queryChapter()" icon="el-icon-view" circle
                                           size="mini"
                                           :disabled="scope.row.state==0"></el-button>


                                <el-button type="success" icon="el-icon-edit" circle size="mini"
                                           @click="dialogFormVisible1 = true,bookresId = scope.row.bookid"
                                           :disabled="scope.row.state==0"></el-button>

                                <el-button type="primary" icon="el-icon-star-off" circle size="mini"
                                           @click="dialogFormVisible = true"></el-button>


                                <el-button type="danger" icon="el-icon-delete" circle size="mini"
                                           @click="deleteCommand(scope.row.bookid)"
                                           :disabled="scope.row.state==0"></el-button>

                            </template>
                        </el-table-column>
                    </el-table>
                </template>

                <!-- 分页 -->
                <div class="block" style="margin-top: 20px;">
                    <el-pagination background layout="total, sizes, prev, pager, next, jumper" @size-change="sizeChange"
                                   @current-change="currentChange"
                                   :page-sizes="[3, 6, 9]" :total="pageInfo.total" :page-size="pageInfo.pageSize"
                                   :current-page="pageInfo.page">
                    </el-pagination>
                </div>
            </el-card>


        </el-main>
    </el-container>

</div>
</body>

<script>


    Main = {
        data() {
            return {


                //修改绑定bookid
                bookresId:"",

                novelListData: [],
                defaultProps: {
                    value: 'bsortid',
                    label: 'bsortname',
                    children: 'children',
                    expandTrigger: 'hover',
            },

                novelListData2: [],
                defaultProps2: {
                    id: 'bsortid',
                    label: 'bsortname',
                    children: 'children',
                },

                novelChapterList:[],
                // 查书籍章节绑定bookid
                bookchapId:"",

                dialogFormVisible: false,
                dialogFormVisible1: false,
                dialogTableVisible: false,
                form: {
                    type: "addNovel",
                    bookpartner: '',
                    bookid: '',
                    bookName: '',
                    bstatus: false,
                    bwordCount: '',
                    bdescription: '',

                    bcoverUrl: '',
                    bauthorName: '',
                    blastupdatechaptername: '',
                    blastupdatechapterid: '',

                    bprice: '',
                    bpeanutprice: '',
                    bisvip: false,
                    battribution: 1,
                    // bsortid: '',

                    // pid: '',
                    bkeyword: '',
                    bisRecommand: false,
                },


                formmodify: {
                    type: "modifyNovel",
                    bookpartner: '',
                    bookid: '',
                    bookName: '',
                    bstatus: false,
                    bwordCount: '',
                    bdescription: '',

                    bcoverUrl: '',
                    bauthorName: '',
                    blastupdatechaptername: '',
                    blastupdatechapterid: '',

                    bprice: '',
                    bpeanutprice: '',
                    bisvip: false,
                    battribution:1,
                    // bsortid: '',

                    // pid: '',
                    bkeyword: '',
                    bisRecommand: false,
                },



                //搜索框关联
                selectParams: {//查询时提交到servlet中的数据
                    type: "showNovel",
                    nowPage: "1",
                    pageNum: "3",
                    input: {
                        bookid: '',
                        bookName: ''
                    },
                },
                novelList: [],//所有书籍列表
                pageInfo: {
                    total: 0,//总条数
                    page: 1,//当前页
                    pageSize: 3,//每页显示几条数据
                },

                pageInfo2: {
                    total: 0,//总条数
                    page: 1,//当前页
                    pageSize: 3,//每页显示几条数据
                },

                disabled: false,



                //级联框关联初始化数据
                novelTypeParams: {
                    type: "showNovel",
                    nowPage: "1",
                    pageNum: "3",

                },







            };
        },


        methods: {
            playbackFormat(row, column) {
                if (row.bstatus === 'true') {
                    return '已完结'
                } else  {
                    return '连载中'
                }
            },
            handleChange() {
                var vm = this;
                 var bsortid2 =  vm.$data.defaultProps.value;
                   handleparams=vm.novelTypeParams

                console.log("5566" )

                axios({
                    method: 'post', // 提交方式
                    url: '/Blayersearch.do',// 提交地址
                    params:{
                        type: "showNovel2",
                        nowPage:vm.$data.novelTypeParams.nowPage,
                        pageNum: vm.$data.novelTypeParams.pageNum,
                        //得到数组
                        bsortid1:bsortid2[1],
                    }
                }).then(function (response) {
                    console.log("------" + response.data);
                    var json = eval(response.data);
                    console.log("110"+json.list);
                    vm.novelList = json.list;

                    vm.pageInfo2 = {
                        total: json.allCount,
                        pageSize: json.count,
                        page: json.page
                    };
                    console.log("4396"+json.page);
                }).catch(function (error) {
                    console.log(error);
                });
            },



            currentChange(val) {
                //上面的nowpage传递到这里来并传到this.selectParams.nowPage中
                this.selectParams.nowPage = val;
                //每次换页会根据当前条件执行一次queryNovel
                this.queryNovel(this.selectParams);
            },
            sizeChange(value) {
                this.selectParams.pageNum = value;
                this.queryNovel(this.selectParams);
            },


            currentChange2(val2) {
                //上面的nowpage传递到这里来并传到this.selectParams.nowPage中
                this.novelTypeParams.nowPage = val2;
                //每次换页会根据当前条件执行一次queryNovel
                this.handleChange();
            },
            sizeChange2(value2) {
                this.novelTypeParams.pageNum = value2;
                this.handleChange();
            },




            queryNovel(params) {
                var vm = this;
                var bsortid2 =  vm.$data.defaultProps.value;
                handleparams=vm.novelTypeParams

                if (params == null) {
                    this.$data.selectParams.nowPage = 1;
                    params = this.$data.selectParams;
                }
                console.log("999999" + params)

                //发送post请求

                axios({
                    method: 'post', // 提交方式
                    url: '/Blayersearch.do',// 提交地址
                    params:{
                    type: "showNovel",
                    nowPage: this.$data.selectParams.nowPage,
                    pageNum: this.$data.selectParams.pageNum,
                    bookid: params.bookid,
                    bookName: params.bookName,
                    bsortid1:bsortid2[1]
                },
                }).then(function (response) {
                    console.log("55555555" + response.data);
                    var json = eval(response.data);
                    vm.novelList = json.list;
                    console.log(json.list);
                    vm.pageInfo = {
                        total: json.allCount,
                        pageSize: json.count,
                        page: json.page
                    };console.log("6655"+json.page)
                }).catch(function (error) {
                    console.log(error);
                });
            },

            deleteCommand(bookid) {
                console.log("244334erg3" + bookid)
                let vm = this;
                let message;
                this.$confirm('确定删除吗?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    axios({
                        method: 'post',
                        url: '/AddModifDelete.do',
                        params: {
                            type: "deleteNovel",
                            bookid: bookid
                        }
                    }).then(function (response) {
                        message = response.data;
                        if (message == "删除成功") {
                            console.log("1q2431241341231231")
                            vm.$data.disabled = true;
                        }
                        vm.queryNovel();
                    })
                }).catch(() => {
                    this.$message({type: 'info', message: "已取消退出"});
                });
            },


            saveNovel() {
                var vm = this;

                var mids = vm.$refs.tree.getCheckedKeys();

                console.log("4396"+mids);

                axios({
                    method: "post",
                    url: '/AddModifDelete.do',
                    params:
                        {
                            type: "addNovel",
                            bookpartner:vm.$data.form.bookpartner,
                            bookid:vm.$data.form.bookid,
                            bookName:vm.$data.form.bookName,
                            bstatus:vm.$data.form.bstatus,
                            bwordCount:vm.$data.form.bwordCount,
                            bdescription:vm.$data.form.bdescription,

                            bcoverUrl:vm.$data.form.bcoverUrl,
                            bauthorName:vm.$data.form.bauthorName,
                            blastupdatechaptername:vm.$data.form.blastupdatechaptername,
                            blastupdatechapterid:vm.$data.form.blastupdatechapterid,

                            bprice:vm.$data.form.bprice,
                            bpeanutprice: vm.$data.form.bpeanutprice,
                            bisvip:vm.$data.form.bisvip,
                            battribution:vm.$data.form.battribution,
                            // bsortid: '',

                            // pid: '',
                            bkeyword:vm.$data.form.bkeyword,
                            bisRecommand:vm.$data.form.bisRecommand,
                            type: "addNovel",
                            bsortid:mids[0],

                        },


                }).then(function (response) {
                    message = response.data;
                    alert(message);
                    if (message == "添加成功") {
                        vm.dialogFormVisible = false; // 关闭模态框
                        vm.form.bookpartner="",
                            vm.form.bookid="",
                            vm.form.bookName="",
                            vm.form.false="",
                            vm.form.bwordCount="",
                            vm.form.bdescription="",

                            vm.form.bcoverUrl="",
                            vm.form.bauthorName="",
                            vm.form.blastupdatechaptername="",
                            vm.form.blastupdatechapterid="",

                            vm.form. bprice="",
                            vm.form.bpeanutprice="",
                            vm.form. bisvip=false,
                            vm.form.battribution= 1,
                            vm.form.bsortid=mids[0],

                            vm.form.pid="",
                            vm.form.bkeyword="",
                            vm.form.bisRecommand=false
                        // 查询书籍列表
                    }
                    vm.queryNovel();
                }).catch(function (error) {
                    console.log(error);
                });
            },


            modifyNovel() {
                let vm = this;
                var mids = vm.$refs.tree.getCheckedKeys();

                let message;
                var modifyParams = this.formmodify;
                let params = {
                    bookresId: vm.$data.bookresId,
                    modifyParams
                }
                console.log("asdasdasdasd" + params.bookid)
                axios({
                    method: "post",
                    url: '/AddModifDelete.do',
                    params: {
                        type: "modifyNovel",
                        bookresId: vm.$data.bookresId,
                        bookpartner: vm.$data.formmodify.bookpartner,
                        bookid: vm.$data.formmodify.bookid,
                        bookName: vm.$data.formmodify.bookName,
                        bstatus: vm.$data.formmodify.bstatus,
                        bwordCount: vm.$data.formmodify.bwordCount,
                        bdescription: vm.$data.formmodify.bdescription,

                        bcoverUrl: vm.$data.formmodify.bcoverUrl,
                        bauthorName: vm.$data.formmodify.bauthorName,
                        blastupdatechaptername:vm.$data.formmodify.blastupdatechaptername,
                        blastupdatechapterid: vm.$data.formmodify.blastupdatechapterid,

                        bprice:vm.$data.formmodify.bprice,
                        bpeanutprice:vm.$data.formmodify.bpeanutprice,
                        bisvip: vm.$data.formmodify.bisvip,
                        battribution: vm.$data.formmodify.battribution,
                        bsortid:mids[0],


                        bkeyword: vm.$data.formmodify.bkeyword,
                        bisRecommand: vm.$data.formmodify.bisRecommand,
                    }
                }).then(function (response) {
                    message = response.data;
                    alert(message);
                    if (message == "修改成功") {
                        vm.dialogFormVisible1 = false; // 关闭模态框
                        vm.formmodify.bookpartner="",
                            vm.formmodify.bookid="",
                            vm.formmodify.bookName="",
                            vm.formmodify.false="",
                            vm.formmodify.bwordCount="",
                            vm.formmodify.bdescription="",

                            vm.formmodify.bcoverUrl="",
                            vm.formmodify.bauthorName="",
                            vm.formmodify.blastupdatechaptername="",
                            vm.formmodify.blastupdatechapterid="",

                            vm.formmodify. bprice="",
                            vm.formmodify.bpeanutprice="",
                            vm.formmodify. bisvip=false,
                            vm.formmodify.battribution= 1,
                            vm.formmodify.bsortid="",

                            vm.formmodify.pid="",
                            vm.formmodify.bkeyword="",
                            vm.formmodify.bisRecommand=false
                        // 查询书籍列表
                    }
                    vm.queryNovel();
                }).catch(function (error) {
                    console.log(error);
                });
            },


            showNovelType(params) {
                params = this.$data.showNovelType();
                console.log("asdasdadas" + params)
                var vm = this;
                //发送post请求

                axios({
                    method: 'post', // 提交方式
                    url: '/NovelList.do',// 提交地址
                    params: params
                }).then(function (response) {
                    console.log("++++++++" + response.data);
                    var json = eval(response.data);
                    vm.novelTypeList = json;
                    console.log(json);
                }).catch(function (error) {
                    console.log(error);
                });
            },


            queryChapter() {

                var vm = this;

                //发送post请求
                axios({
                    method: 'post', // 提交方式
                    url: '/NovelChapter.do',// 提交地址
                    params: {
                        type:"showNovelChapter",
                        bookchapId: vm.$data.bookchapId,
                    }
                }).then(function (response) {
                    console.log("-------" + response.data);
                    var json = eval(response.data);
                    vm.novelChapterList = json;
                    console.log("sadasdasd"+json);
                }).catch(function (error) {
                    console.log(error);
                });
            },

            queryNovelList() {

                var vm = this;

                //发送post请求
                axios({
                    method: 'post', // 提交方式
                    url: '/NovelList.do',// 提交地址
                    params: {
                        type:"showNovelList",
                    }
                }).then(function (response) {
                    console.log("-------123" + response.data);
                    vm.$data.novelListData = response.data;
                    vm.$data.novelListData2 = response.data;


                }).catch(function (error) {
                    console.log(error);
                });

            },

        },




        mounted() {
            let vm = this;
            this.queryNovel(this.selectParams);
            this.queryNovelList();

        }
    };

    var Ctor = Vue.extend(Main)
    new Ctor().$mount('#app')

</script>
</html>
