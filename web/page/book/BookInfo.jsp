<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/5/29
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>小说管理</title>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://unpkg.com/vue/dist/vue.js"></script>
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/element-ui/2.15.1/index.min.js"></script>
    <style>
        /*.el-table-column {*/
            /*align: "center";*/
        /*}*/

        /*.user-search {*/
            /*margin-top: 20px;*/
        /*}*/

        /*.userRole {*/
            /*width: 100%;*/
        /*}*/

        /*.page-box {*/
            /*margin: 10px auto;*/
        /*}*/

        .el-main {
            height: calc(100vh - 70px);
        }
    </style>

</head>
<body>
<div id="bookVue">
    <el-container>
        <el-main>
            <el-card class="box-card">
                <%--  ===========================     查询功能      ======================================================--%>
                <el-form :inline="true" :model="formBook" ref="formBook" class="user-search">
                    <el-form-item>
                        <el-select size="small" v-model="formBook.bookOneTypeId" placeholder="一级分类搜索选择" @change="changeType">
                            <el-option v-for="type in oneTypeList" :label="type.bookTypeName" :value="type.bookTypeId" :key="type.bookTypeId"></el-option>
                        </el-select>
                    </el-form-item>

                    <el-form-item>
                        <el-select size="small" v-model="formBook.bookTypeId" placeholder="二级分类搜索选择">
                            <el-option v-for="type in twoTypeList" :label="type.bookTypeName" :value="type.bookTypeId"
                                       :key="type.bookTypeId" ></el-option>
                        </el-select>
                    </el-form-item>

                    <el-form-item label="通过小说编号搜索：">
                        <el-input size="small" v-model="formBook.bookId" placeholder="输入小说编号"></el-input>
                    </el-form-item>

                    <el-form-item label="通过小说名称搜索：">
                        <el-input size="small" v-model="formBook.bookName" placeholder="输入小说名称"></el-input>
                    </el-form-item>

                    <el-form-item>
                        <el-button size="small" type="primary" icon="el-icon-search" @click="search">搜索</el-button>
                    </el-form-item>
                </el-form>
                <%--  ================================= 表格内容   ================================================ --%>
                <el-table :data="bookList" highlight-current-row stripe border style="width: 100%;height: 80%">
                    <el-table-column type="index" width="60">
                    </el-table-column>
                    <el-table-column sortable prop="bookId" label="小说编号" width="120" show-overflow-tooltip>
                    </el-table-column>
                    <el-table-column  prop="bookName" label="小说名称" width="150" show-overflow-tooltip>
                    </el-table-column>
                    <el-table-column  prop="authorName" label="作者" width="150" show-overflow-tooltip>
                    </el-table-column>
                    <el-table-column  prop="bookOneTypeId" label="一级分类Id" width="150" show-overflow-tooltip>
                    </el-table-column>
                    <el-table-column  prop="bookOneTypeName" label="一级分类名称" width="150" show-overflow-tooltip>
                    </el-table-column>
                    <el-table-column  prop="bookTwoTypeId" label="二级分类Id" width="150" show-overflow-tooltip>
                    </el-table-column>
                    <el-table-column  prop="bookTwoTypeName" label="二级分类名称" width="150" show-overflow-tooltip>
                    </el-table-column>
                    <el-table-column  prop="updateStatus" label="更新状态" width="150" show-overflow-tooltip>
                    </el-table-column>

                    <el-table-column   prop="wordcount" label="小说字数" width="150" >
                    </el-table-column>
                    <el-table-column  prop="cover_url" label="小说链接" width="150" v-if="show">
                    </el-table-column>
                    <el-table-column  prop="description" label="小说简介" width="150" v-if="show">
                    </el-table-column>

                    <el-table-column label="操作" align="center" min-width="50">
                        <template slot-scope="scope">
                            <el-button type="primary" round @click="modifyBook(scope.$index),updateDialog = true">修改
                            </el-button>
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
            <%--     =========================    编辑   ============================================                --%>
            <el-dialog title="编辑小说" :visible.sync="updateDialog" width="50%">
                <el-form label-width="120px" :model="updateBooks" ref="updateBooks">
                    <el-row>

                        <el-form-item label="小说编号">
                            <el-input v-model="updateBooks.bookId" auto-complete="off" v-if="show"></el-input>
                        </el-form-item>

                        <el-form-item label="小说名称">
                            <el-input v-model="updateBooks.bookName" auto-complete="off"
                                      placeholder="请输入名称"></el-input>
                        </el-form-item>

                        <el-form-item label="作者名称">
                            <el-input v-model="updateBooks.authorName" auto-complete="off"
                                      placeholder="请输入作者"></el-input>
                        </el-form-item>

                        <el-form-item label="小说属性">
                            <el-select v-model="updateBooks.attribution" placeholder="请选择">
                                <el-option
                                        v-for="item in attributionName"
                                        :key="item.value"
                                        :label="item.label"
                                        :value="item.value">
                                </el-option>
                            </el-select>
                        </el-form-item>


                        <el-form-item label="小说类型">
                            <el-select v-model="updateBooks.bookOneTypeId" placeholder="请选择一级分类" @change="changeType">
                                <el-option
                                        v-for="item in oneTypeList"
                                        :key="item.bookTypeId"
                                        :label="item.bookTypeName"
                                        :value="item.bookTypeId">
                                </el-option>
                            </el-select>
                            <el-select v-model="updateBooks.bookTypeId" placeholder="请选择二级分类">
                                <el-option
                                        v-for="item in twoTypeList"
                                        :key="item.bookTypeId"
                                        :label="item.bookTypeName"
                                        :value="item.bookTypeId">
                                </el-option>
                            </el-select>
                        </el-form-item>

                        <el-form-item label="更新状态">
                            <el-select v-model="updateBooks.updateStatus" placeholder="请选择">
                                <el-option label="已完结" value="0"></el-option>
                                <el-option label="连载中" value="1"></el-option>
                            </el-select>
                        </el-form-item>
                        <el-form-item label="小说字数">
                            <el-input size="small" v-model="updateBooks.wordcount" auto-complete="off"
                                      placeholder="请输入字数"></el-input>
                        </el-form-item>
                    </el-row>
                    <el-form-item label="小说链接">
                        <el-input v-model="updateBooks.cover_url" auto-complete="off" placeholder="请输入小说链接"></el-input>
                    </el-form-item>
                    <el-form-item label="小说简介">
                        <el-input v-model="updateBooks.description" auto-complete="off"
                                  placeholder="请输入小说简介"></el-input>
                    </el-form-item>
                </el-form>
                <div slot="footer" class="dialog-footer">
                    <el-button @click="updateDialog = false">取 消</el-button>
                    <el-button type="primary" @click="editBook">确 定</el-button>
                </div>
            </el-dialog>
        </el-main>
    </el-container>

</div>
<script type="text/javascript">
    var book = {
        data() {
            return {
                bookList: [],//小说列表
                formBook: {//查询条件
                    type:"showBook",
                    nowPage: "1", // 当前页
                    pageNum: "3", // 每页显示几条数据
                    bookId:0,//小说id
                    bookName:"",//小说名
                    bookOneTypeId:"",//一级类别Id
                    bookTypeId:""//二级类别Id
                },
                pageInfo: {
                    currentPage: 1,
                    pageSize: 3,
                    total: 0
                },
                selectParams: { //查询时提交到servlet的数据
                    type: "showBook",
                    nowPage: "1", // 当前页
                    pageNum: "3", // 每页显示几条数据
                    bookName: "", //  书籍名称
                    bookOneTypeId: 0
                },

                updateBooks: {//添加编辑提交内容
                    bookId: "",
                    bookName: "",
                    authorName: "",
                    // attribution: "",
                    bookOneTypeId: "",
                    bookTypeId: "",
                    updateStatus: "",
                    wordCount: "",
                    url: "",
                    description: ""
                },
                attributionName: [{//1.男频2.女频3.出版
                    value: 1,
                    label: "男频"
                }, {
                    value: 2,
                    label: "女频"
                }, {
                    value: 3,
                    label: "出版"
                }],
                status: [{//更新状态 0 已完结， 1 连载中
                    value: 0,
                    label: "已完结"
                }, {
                    value: 1,
                    label: "连载中"
                }],
                bookOneTypeId: 0,
                oneTypeList: [],//一级类别列表
                twoTypeList: [],//二级类别列表
                updateDialog: false,//控制添加编辑页面显示与隐藏
                editForm: true,//是否可以编辑
                show:false //设置某列是否显示
            }
        },
        methods: {
            findType() {
                var vm = this;
                var params = {
                    type: "showType",
                    flagParent: 0,
                    parentTypeId: 0
                };
                axios({
                    url: "/bookInfo.do",
                    method: "post",
                    params: params
                }).then(function (response) {
                    // console.log("返回的一级目录的信息!!!!!!!!!!!"+response.data);
                    vm.$data.oneTypeList = response.data;
                });
            },
            changeType(val) {
                var vm = this;
                var params = {
                    type: "showType",
                    flagParent: 1,
                    parentTypeId: val
                };
                axios({
                    url: "/bookInfo.do",
                    method: "post",
                    params: params
                }).then(function (response) {
                    // console.log("二级查询目录的值!!!!!!!!!"+response);
                    vm.$data.twoTypeList = response.data;
                });
            },
            search() {          //查询书籍
                var vm = this;
                var searchbook = this.formBook;
                vm.queryBook(searchbook)

            },
            modifyBook(index) {
                //将要修改的图书信息添加到模态框中
                var book = this.bookList[index];
                // console.log("asdasdasdassd  "+book.cover_url)
                // console.log("asdasdasdassd  "+book.wordCount)
                this.updateBooks = {
                    type:"updateBook",
                    bookId: book.bookId,
                    bookName: book.bookName,
                    authorName: book.authorName,
                    attribution: "1",
                    bookOneTypeId: book.bookOneTypeId,
                    bookTypeId: book.bookTwoTypeId,
                    updateStatus: book.updateStatus,
                    wordcount: book.wordcount,
                    cover_url: book.cover_url,
                    description: book.description
                }
            },
            editBook(){ //将模态框中的数据提交到服务器中
                var vm = this;
                var editBook = this.updateBooks;
                //将数据提交到数据库
                axios({
                    method: 'post', // 提交方式
                    url: '/bookInfo.do',// 提交地址
                    params: editBook
                }).then(function (response) {
                    alert(response.data);
                    if (response.data == "修改成功") {
                        vm.updateDialog = false; // 关闭模态框
                        // 查询游戏列表
                        vm.queryBook(vm.selectParams);
                    }
                }).catch(function (error) {
                    console.log(error);
                });
            },
            sizeChange(pageNums) {
                this.selectParams.pageNum = pageNums;
                this.queryBook(this.selectParams);
            },
            currentChange(nowPage) {
                this.selectParams.nowPage = nowPage;
                this.queryBook(this.selectParams);
            },
            queryBook(params) {
                if (params == null) {
                    this.$data.selectParams.nowPage = 1;
                    params = this.$data.selectParams;
                }
                // console.log("queryBook中的参数!!!!!!"+params);
                var vm = this;
                axios({
                    method: "post",
                    url: "/bookInfo.do",
                    params: params
                }).then(function (response) {
                    // console.log("bookServlet,分页方法返回的数据!!" + response.data);
                    var json = eval(response.data);
                    //将servlet中查到的book数据赋值:booklist.pageinfo
                    vm.bookList = json.list;
                    // console.log("从服务器返回的list!!!!!!!!!!!"+json.list)
                    // console.log("从服务器返回的list!!!!!!!!!!!"+json.list[0].wordcount)
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
            this.queryBook(this.selectParams);
            this.findType();
        }
    };
    var vueObject = Vue.extend(book);
    new vueObject().$mount("#bookVue");
</script>
</body>
</html>
