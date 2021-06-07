<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/5/25
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>🥜🚇</title>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://unpkg.com/vue/dist/vue.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/element-ui/2.15.1/index.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/layer/3.4.0/layer.js"></script>
    <link rel="stylesheet" href="static/css/main.css"/>
</head>
<body>
<div id="app" style="display: none;">
    <!-- 左边 导航栏 -->
    <div class="left-side" style="background-color:#545c64">
        <!-- 顶部盒子 显示系统名称 头像 欢迎 -->
        <div class="left-top-box">
            <div class="left-top-title" :style="{color:webInfo.textColorActive}">{{adminName}}</div>
            <div class="left-top-avatar">
                <img :src="headpic"/>
            </div>
            <div class="left-top-welcome" :style="{color:webInfo.textColorActive}">{{adminName}}欢迎你！</div>
        </div>
        <!-- 导航栏盒子-->
        <div class="left-navs-box">
            <div class="navs-inner-box">
                <el-menu :default-active="id" class="navs-item-box" :background-color="webInfo.bg"
                         :text-color="webInfo.textColor"
                         :active-text-color="webInfo.textColorActive">
                    <el-menu-item @click="welTab" index="0">
                        <i class="el-icon-s-platform"></i>
                        <span slot="title">欢迎页</span>
                    </el-menu-item>
                    <div v-for="(item,index) in navs" :key="item.id">
                        <!-- 没有子选项 -->
                        <el-menu-item @click="openTabs(item)" v-if="item.href!='#'" :index="item.id">
                            <i :class="item.icon"></i>
                            <span slot="title">{{item.title}}</span>
                        </el-menu-item>
                        <!-- 有子选项 -->
                        <el-submenu v-if="item.href=='#'" :index="item.id">
                            <template slot="title"><i :class="item.icon"></i>{{item.title}}</template>
                            <el-menu-item v-for="(item,index) in item.children" @click="openTabs(item)" :key="item.id"
                                          :index="item.id">
                                <i :class="item.icon"></i>
                                {{item.title}}
                            </el-menu-item>
                        </el-submenu>
                    </div>
                </el-menu>
            </div>
        </div>
    </div>
    <!-- /左边 导航栏 -->
    <!-- 右边区域 -->
    <div class="right-box">
        <!-- 顶部栏 -->
        <div class="right-header">
            <i @click="isShowNav" :class="showNav?'el-icon-s-fold':'el-icon-s-unfold'"></i>
            <div class="header-right">
                <el-tooltip content="系统公告" placement="bottom" effect="light">
                    <el-badge is-dot class="item"><i @click="notice" class="el-icon-bell"></i></el-badge>
                </el-tooltip>
                <el-avatar size="small" :src="headpic"></el-avatar>
                <!--个人信息操作 -->
                <el-dropdown :show-timeout=100 @command="personCommand">
							<span class="el-dropdown-link">
								{{adminName}}<i class="el-icon-arrow-down el-icon--right"></i>
							</span>
                    <el-dropdown-menu slot="dropdown">
                        <el-dropdown-item command="center">个人中心</el-dropdown-item>
                        <el-dropdown-item command="base">修改密码</el-dropdown-item>
                        <el-dropdown-item command="logout">退出登录</el-dropdown-item>
                    </el-dropdown-menu>
                </el-dropdown>
            </div>

        </div>
        <!-- tab 标签栏 -->
        <div class="right-tab-box">
            <div class="tab-left" @click="tabsLeft"><a href="#"><i class="el-icon-arrow-left"></i></a></div>
            <div class="tab-item-box">
                <div class="tab-item-ul">
                    <div class="tab-item" @click="welTab" :class="welcome?'tab-item-active':'1'">
                        <i class="el-icon-s-platform  tab-item-icon"></i>
                        <div class="tab-item-text">欢迎页</div>
                    </div>
                    <div class="tab-item" @click="tabActive(item)" :id="item.id"
                         :class="id==item.id?'tab-item-active':'1'" v-for="(item,index) in tabs">
                        <i class="tab-item-icon" :class="item.data.icon"></i>
                        <div class="tab-item-text">{{item.data.title}}</div>
                        <i @click.stop="tabClose(item)" class="el-icon-close tab-item-close"></i>
                    </div>
                </div>
            </div>
            <div class="tab-right" @click="tabsRight"><a href="#"><i class="el-icon-arrow-right"></i></a></div>
            <div class="tabs-close-box">
                <el-dropdown @command="tabsCloseItem" :show-timeout=100>
                    <i class="el-icon-arrow-down"></i>
                    <el-dropdown-menu slot="dropdown">
                        <el-dropdown-item command="a">关闭当前标签页</el-dropdown-item>
                        <el-dropdown-item command="b">关闭其他标签页</el-dropdown-item>
                        <el-dropdown-item command="c">关闭所有标签页</el-dropdown-item>
                    </el-dropdown-menu>
                </el-dropdown>
            </div>
        </div>
        <!-- 内容区域 iframe -->
        <el-main style="padding: 0px">
            <div class="right-contain">
                <iframe src="welcome.html" frameborder="0" scrolling="yes" width="100%" height="100%" v-show="welcome">
                </iframe>
                <template v-for="(item,index) in tabs">
                    <iframe :src="item.data.href" frameborder="0" scrolling="yes" width="100%" height="100%"
                            v-show="id==item.id">
                    </iframe>
                </template>
            </div>
        </el-main>
        <!-- 底部栏 -->
        <!-- <div class="right-footer" :style="{backgroundColor:webInfo.bg}"><span>®{{footerText}}</span></div> -->
    </div>
    <!-- 模态框 -->
    <el-dialog title="修改密码" :visible.sync="updateDialog" width="40%">
        <el-form label-width="90px" :model="updatePwd" ref="updatePwd" :rules="rules">
            <el-row>
                <el-form-item label="原密码">
                    <el-input v-model="updatePwd.pwd" auto-complete="off" show-password
                              placeholder="请输入名称"></el-input>
                </el-form-item>

                <el-form-item label="新密码" prop="newPwd">
                    <el-input v-model="updatePwd.newPwd" auto-complete="off" show-password
                              placeholder="请输入名称"></el-input>
                </el-form-item>

                <el-form-item label="确认密码" prop="confirmPwd">
                    <el-input v-model="updatePwd.confirmPwd" auto-complete="off" show-password
                              placeholder="请输入作者"></el-input>
                </el-form-item>
            </el-row>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="updateDialog = false">取 消</el-button>
            <el-button type="primary" @click="modifyPwd">确 定</el-button>
        </div>
    </el-dialog>


    <el-dialog title="个人中心" :visible.sync="showDataDialog" width="40%">
        <el-form ref="personData" :model="personData" label-width="80px">
            <el-form-item label="序号">
                <el-input v-model="personData.uid" :disabled="true"></el-input>
            </el-form-item>
            <el-form-item label="姓名">
                <el-input v-model="personData.username" @blur="checkUserName"></el-input>
                <el-tag :type="messageNameType" v-show="show">{{messageName}}</el-tag>
            </el-form-item>
            <el-form-item label="个人简介">
                <el-input v-model="personData.des"></el-input>
            </el-form-item>
            <el-form-item label="性别">
                <el-input v-model="personData.sex"></el-input>
            </el-form-item>
            <el-form-item label="头像">
                <el-upload class="upload-demo" action="/user.do?type=updateImg" :on-preview="handlePreview"
                           :on-remove="handleRemove" :limit="1" :on-success="handleSuccess" list-type="picture">
                    <el-button size="small" type="primary">点击上传</el-button>
                    <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
                </el-upload>
            </el-form-item>

            <el-form-item label="生日">
                <el-input v-model="personData.birthday"></el-input>
            </el-form-item>
            <el-form-item label="电话">
                <el-input v-model="personData.phone" @blur="checkUserPhone"></el-input>
                <el-tag :type="messagePhoneType" v-show="showPhone">{{messagePhone}}</el-tag>
            </el-form-item>
            <el-form-item label="注册时间">
                <el-input v-model="personData.regtime" :disabled="true"></el-input>
            </el-form-item>
            <el-form-item label="最后登陆时间">
                <el-input v-model="personData.logintime" :disabled="true"></el-input>
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="showDataDialog = false">取 消</el-button>
            <el-button @click="updateUser">确认修改</el-button>
        </div>
    </el-dialog>

</div>


<!-- 公告 -->
<div id="notice" style="display: none;" class="notice-box">
    欢迎使用 花生地铁后台管理系统<br/>
    欢迎使用 花生地铁后台管理系统<br/>
    欢迎使用 花生地铁后台管理系统<br/>
    欢迎使用 花生地铁后台管理系统<br/>
</div>

</body>

<script>
    //加载页面
    var loading = layer.load();
    $(document).ready(function () {
        layer.close(loading);
        $('#app').css('display', 'block')
    })

    // 设置 标签
    function setTabs(e) {
        vm.tabs = e
        vm.$set(vm.tabs, 1, e)
    }


    // index vue 实例
    var userListObject2 = {
        data() {
            var validatePass = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入密码'));
                } else {
                    if (this.updatePwd.confirmPwd !== '') {
                        this.$refs.updatePwd.validateField('confirmPwd');
                    }
                    callback();
                }
            };
            var validatePass2 = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请再次输入密码'));
                } else if (value !== this.updatePwd.newPwd) {
                    callback(new Error('两次输入密码不一致!'));
                } else {
                    callback();
                }
            };
            return {
                /*
                 *可修改的配置信息
                 */
                rules: {
                    newPwd: [
                        {required: true, message: '请输入密码', trigger: 'blur'},
                        {min: 6, max: 16, message: '长度在 6 到 16 个字符', trigger: 'blur'},
                        {validator: validatePass, trigger: 'blur'}
                    ],
                    confirmPwd: [
                        {required: true, message: '请确认密码', trigger: 'blur'},
                        {min: 6, max: 16, message: '长度在 6 到 16 个字符', trigger: 'blur'},
                        {validator: validatePass2, trigger: 'blur', required: true}
                    ],
                },
                adminName: "",
                messagePhone: "",
                navs: [],
                headpic: "",
                resultHeadPic: "",
                updatePwd: {
                    pwd: "",
                    newPwd: "",
                    confirmPwd: ""
                },
                // 左侧导航栏
                webInfo: {
                    bg: "#545c64",
                    // bg:'#4f74b4',
                    textColor: "#fff",
                    // textColorActive: "#ffd04b"
                    textColorActive: "#ffd04b"
                },
                activeIndex: 0,
                footerText: 'mq-admin',
                messagePhoneType:"",
                /*
                 *不建议修改的配置信息
                 */
                isCollapse: true,
                welcome: true,
                showNav: true,
                updateDialog: false,//控制添加编辑页面显示与隐藏
                showDataDialog: false,
                personData: {},
                tabs: [],
                id: '0',
                i: 0,
                isActive: 'tab-item-active',
                loadOk: false,
                item: '',
                disabled: false,
                show: false,
                showPhone: false,
                messageName: "",
                messageNameType: "",

            };
        },
        watch: {
            getTabsBoxWidth: function () {
                // 判断边界
                var tbox = $('.tab-item-box')
            }
        },
        methods: {
            checkUserPhone(){
                let vm = this;
                let phone = vm.$data.personData.phone;
                console.log("ASDASDASDASDASD"+phone)
                if (!(/^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$/.test(phone))) {
                    vm.$data.messagePhone = "手机号码有误，请重填";
                    vm.$data.messagePhoneType = "danger"
                } else {
                    vm.$data.messagePhone = "手机号码格式正确";
                    vm.$data.messagePhoneType = "success"
                }
                vm.$data.showPhone = true;
            },
            checkUserName() {
                let vm = this;
                let userName = this.personData.username;
                axios({
                    method: "post",
                    url: "/user.do",
                    params: {
                        type: "checkUserName",
                        username: userName,
                    }
                }).then(function (response) {
                    vm.$data.show = true;
                    if (vm.$data.adminName === vm.$data.personData.username) {
                        vm.$data.messageNameType = "success"
                        vm.$data.messageName = "用户名未修改";
                    } else {
                        vm.$data.messageName = response.data;
                        if (response.data === "合法用户名") {
                            vm.$data.messageNameType = "success"
                        } else {
                            vm.$data.messageNameType = "danger"
                        }
                    }
                })
            },
            handlePreview(file) {
            },
            handleRemove(file, fileList) {
            },
            handleSuccess(res) {
                this.resultHeadPic = res;
            },
            isShowNav: function (e) { //隐藏显示左边导航栏
                if (this.showNav) {
                    $(".left-side").animate({left: '-220px'}, "slow");
                    $(".right-box").animate({left: '0'}, "slow");
                    this.showNav = !this.showNav
                } else {
                    $(".left-side").animate({left: '0px'}, "slow");
                    $(".right-box").animate({left: '220px'}, "slow");
                    this.showNav = !this.showNav
                }
            },
            welTab: function () { //控制台 欢迎页面 tab事件
                this.welcome = true
                this.id = '0'
                this.activeIndex = '0'
                $('.tab-item-ul').css("left", 0)
            },
            openTabs: function (e) { //打开页面 加载显示tabs
                this.welcome = false
                var tabs = this.tabs
                if (this.tabs.length == 0) {
                    this.tabs.push({id: e.id, data: e})
                    this.id = e.id
                    this.item = e
                    calWidth()
                } else {
                    var back = checkTab(e.id)
                    if (back == 1) { //可以插入
                        this.tabs.push({id: e.id, data: e})
                        this.id = e.id
                        this.item = e
                        calWidth()
                    } else { //已打开
                        this.id = e.id;
                        this.item = e
                        calTabWid(e.id)
                    }
                }
            },
            //点击tab显示页面 并改变颜色 调整距离
            tabActive: function (e) {
                this.welcome = false
                this.id = e.id;
                this.item = e.data
                this.activeIndex = e.id
                calTabWid(e.id)
            },
            //tabs关闭事件
            tabClose: function (e) {
                closeTabThis(e.id)
            },
            //tabs右移
            tabsRight: function () {
                var left = $('.tab-item-ul').position().left;
                var tbox = $('.tab-item-box').width() //外边盒子距离长度
                var ul = $('.tab-item-ul').width()
                if (ul > tbox) {
                    if (left < tbox - ul) {
                        layer.tips('到最右边了', '.tab-right', {tips: 1});
                    } else {
                        $('.tab-item-ul').css("left", -(ul - tbox))
                    }
                } else {
                    layer.tips('到最右边了', '.tab-right', {tips: 1});
                }
            },
            //tabs左移
            tabsLeft: function () {
                var left = $('.tab-item-ul').position().left;
                if (left >= 0) {
                    layer.tips('到最左边了', '.tab-left', {tips: 1});
                } else if (left < -100) {
                    $('.tab-item-ul').css("left", left + 100)
                } else {
                    $('.tab-item-ul').css("left", 0)
                }
            },
            notice: function () { //公告
                // layer.msg('公告')
                layer.open({
                    type: 1,
                    title: '系统公告',
                    content: $('#notice'),
                    area: ['300px', 'auto'],
                    btn: '知道啦',
                    btnAlign: 'c' //按钮居中
                });
            },
            // 关闭tab
            tabsCloseItem: function (e) {
                if (e == 'a') {
                    // layer.msg('关闭当前')
                    closeTabThis(this.id)
                } else if (e == 'b') {
                    // layer.msg('关闭其他')
                    closeTabOther()
                } else {
                    // layer.msg('关闭所有')
                    closeTabAll()
                }
            },
            modifyPwd() {
                let vm = this;
                axios({
                    method: "post",
                    url: "user.do",
                    params: {
                        type: "updatePwd",
                        pwd: this.updatePwd.pwd,
                        newPwd: this.updatePwd.newPwd,
                        confirmPwd: this.updatePwd.confirmPwd,
                        uid: sessionStorage.getItem("uid")
                    }

                }).then(function (response) {
                    alert(response.data);
                    vm.$data.updateDialog = false;
                    if (response.data === "修改成功") {
                        //清空session 退出登陆
                        sessionStorage.setItem("uid", "");
                        window.location.href = "login.jsp";
                    }
                    vm.$data.updatePwd.pwd = "";
                    vm.$data.updatePwd.newPwd = "";
                    vm.$data.updatePwd.confirmPwd = "";
                });
            },
            searchPersonData() {
                let vm = this;
                axios({
                    method: "post",
                    url: "user.do",
                    params: {
                        type: "searchPersonData",
                        uid: sessionStorage.getItem("uid")
                    }
                }).then(function (response) {
                    console.log(response.data)
                    vm.$data.personData = response.data;
                });
            }, updateUser() {
                let vm = this;
                //上传图片
                axios({
                    method: "post",
                    url: "user.do",
                    params: {
                        type: "updateUser",
                        uid: this.personData.uid,
                        username: this.personData.username,
                        des: this.personData.des,
                        sex: this.personData.sex,
                        birthday: this.personData.birthday,
                        phone: this.personData.phone,
                        headpic: "upload/" + this.resultHeadPic
                    }
                }).then(function (response) {
                    alert(response.data)
                    vm.$data.showDataDialog = false;
                    vm.init();
                });
            },
            // 个人信息操作
            personCommand(e) {
                let vm = this;
                switch (e) {
                    case 'center':
                        vm.$data.showDataDialog = true;
                        vm.searchPersonData();
                        break;
                    case 'base':
                        vm.$data.updateDialog = true;
                        break;
                    case 'logout':
                        this.$confirm('确定退出登录吗?', '提示', {
                            confirmButtonText: '确定',
                            cancelButtonText: '取消',
                            type: 'warning'
                        }).then(() => {
                            //退出登陆 ,清空session的uid
                            sessionStorage.setItem("uid", "");
                            window.location.href = "login.jsp"
                        }).catch(() => {
                            this.$message({type: 'info', message: '已取消退出'});
                        });
                        break;
                }
            }, init() {
                let vm = this;
                let uid = sessionStorage.getItem("uid");
                axios({
                    method: "post",
                    url: "login.do",
                    params: {
                        type: "show",
                        uid: uid,
                    }
                }).then(function (response) {
                    vm.$data.adminName = response.data[0].username;
                    vm.$data.headpic = response.data[0].headpic;
                    vm.$data.navs = response.data;

                });
            },

        },
        mounted() {
            let vm = this;
            vm.init()
        },

    }

    var vueObject2 = Vue.extend(userListObject2);
    var vm = new vueObject2().$mount("#app");


    //检查tabs是否已经打开
    function checkTab(id) {
        var i = 0;
        var back = 0
        var tabs = vm.tabs
        for (i; i < tabs.length; i++) {
            if (tabs[i].id == id) {
                back = 0
                break //找到id 中断循环
            } else {
                back = 1
            }
        }
        return back
    }

    //计算 tab距离
    function calTabWid(id) {
        // console.log(id)
        var tbox = $('.tab-item-box').width() //外边盒子距离长度
        var ul = $('.tab-item-ul').width() //tabs外边盒子长度
        var left = $('.tab-item-ul').position().left; //ul 左边偏移距离
        var titem = $('#' + id)
        if (titem.length > 0) {
            var iLeft = titem.position().left //tab距离父盒子左边距离
            var titemW = $('#' + id).width()
            if (ul > tbox && left <= 0) {
                var disAreaL = -left //可视区域左边
                var disAreaR = -left + tbox //可视区域右边
                var iRight = titemW + iLeft
                if (iLeft >= disAreaL && iRight <= disAreaR) {
                    // console.log('不需要移动')
                } else {
                    // console.log('需要移动')
                    if (iLeft < disAreaL) {
                        // console.log('往右移动')
                        $('.tab-item-ul').css("left", left + (disAreaL - iLeft) + 50)
                    } else if (iRight > disAreaR) {
                        // console.log('往左移动')
                        $('.tab-item-ul').css("left", left + (disAreaR - iRight) - 20)
                    }
                }
            }
        }
    }

    // opentab 打开时计算左移距离
    function calWidth() {
        var tbox = $('.tab-item-box').width() //外边盒子距离长度
        var titem = $('.tab-item')
        var len = vm.tabs.length + 2 //有几个tabs
        var countLen = titem.width() * len
        var ul = $('.tab-item-ul').width() + 100
        if (tbox - ul < 0) {
            var len = tbox - ul
            $('.tab-item-ul').css("left", len - 20)
        }
    }

    // 关闭当前tab标签  --> 下拉点击事件、tab X按键关闭事件
    function closeTabThis(id) {

        var tabs = vm.tabs
        var i = 0;
        var len = vm.tabs.length - 2
        if (id == 0) {
            layer.msg('这个不能关闭的哦')
            return
        }
        for (i; i < tabs.length; i++) { //找到id在tabs数组中的位置 下标
            // console.log(tabs[i].id)
            if (tabs[i].id == id) {
                break;
            }
        }
        // console.log(i)
        vm.tabs.splice(i, 1) //从tabs中移除

        if (tabs.length == 0) { //如果tabs没有数据，将控制台设置变色
            vm.welcome = true
            vm.id = '0'
        } else {
            if (tabs[len].id != vm.id) { //判断tabs数组中最后一组数据的id是否为当前的id，若不是则设置
                vm.id = tabs[len].id
                vm.item = tabs[len].data
            }
        }
        //调整位置
        closeWidth()
    }

    //关闭其他标签页
    function closeTabOther() { //删除tabs所有数组，重新push
        if (vm.tabs.length == 0) {
            return
        } else {
            if (vm.id == 0) {
                vm.tabs = []
            } else {
                var item = vm.item
                vm.tabs = []
                vm.tabs.push({id: item.id, data: item})
                $('.tab-item-ul').css("left", 0)
            }
        }
    }

    //关闭所有标签页
    function closeTabAll() {
        vm.tabs = []
        vm.welcome = true
        vm.id = '0'
        $('.tab-item-ul').css("left", 0)
    }

    // 关闭tabs时重新调整位置
    function closeWidth() {
        var tbox = $('.tab-item-box').width() //外边盒子距离长度
        var ul = $('.tab-item-ul').width() //tabs外边盒子长度
        var left = $('.tab-item-ul').position().left; //ul 左边偏移距离
        if (ul > tbox) {
            $('.tab-item-ul').css("left", tbox - ul + 60)
        } else {
            $('.tab-item-ul').css("left", 0)
        }
    }

</script>
</html>
