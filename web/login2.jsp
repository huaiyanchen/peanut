<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/6/1
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>🥜🚇の地铁</title>
    <%-- elementui中的外部引入--%>
    <link rel="stylesheet" href="static/css/login.css"/>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://unpkg.com/vue/dist/vue.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/element-ui/2.15.1/index.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/layer/3.4.0/layer.js"></script>
    <script src="https://cdn.bootcss.com/qs/6.7.0/qs.min.js"></script>
    <%-- ==================================================================== --%>
    <link rel="stylesheet" type="text/css" href="static/css/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="static/css/demo.css"/>
    <!--必要样式-->
    <link rel="stylesheet" type="text/css" href="static/css/component.css"/>
    <style>
         input.el-input__inner {
            border-radius:15px;
            background: transparent;
        }
    </style>
</head>
<body>


<div class="container demo-1">
    <div class="content" >
        <div id="large-header" class="large-header">
            <canvas id="demo-canvas"></canvas>
            <div class="logo_box" style="top: 350px">


                <div id="login" style="top: 20px">
                    <el-row>
                        <el-col :span="9">
                            <div class="mid_left_box">
                                <img src="static/img/ylzz.gif"/>
                            </div>
                        </el-col>
                        <el-col :span="1" :offset="2">
                            <div class="title" style="">🥜🚇の登录</div>
                        </el-col>
                        <el-col :span="1">
                            <div class="mid_left_box">
                                <img src="static/img/ylzz.gif"/>
                            </div>
                        </el-col>
                    </el-row>

                    <div class="mid_middle_box">

                        <el-form :model="ruleForm" :rules="rules" ref="ruleForm" class="ruleForm" status-icon>
                            <el-form-item prop="name">
                                <el-input v-model="ruleForm.username" placeholder="请输入用户名" ></el-input>
                            </el-form-item>
                            <el-form-item prop="pwd">
                                <el-input v-model="ruleForm.pwd" type="password" placeholder="请输入密码" ></el-input>
                            </el-form-item>

                            <el-form-item>
                                <el-button type="primary" class="login_btn" @click="submitForm('ruleForm')">登录
                                </el-button>
                            </el-form-item>
                        </el-form>
                    </div>

                </div>


            </div>
        </div>
    </div>
</div><!-- /container -->


<script src="static/js/TweenLite.min.js"></script>
<script src="static/js/EasePack.min.js"></script>
<script src="static/js/rAF.js"></script>
<script src="static/js/demo-1.js"></script>

</body>
<script>
    var vm = new Vue({
        el: '#login',
        data() {
            return {
                ruleForm: {
                    username: '',
                    pwd: ''
                },
                message: "提示登录错误信息",
                show: false,
                rules: {
                    username: {
                        required: true,
                        message: '请输入用户名',
                        trigger: 'blur'
                    },
                    pwd: {
                        required: true,
                        message: '请输入密码',
                        trigger: 'blur'
                    },
                },
            }
        },
        methods: {
            submitForm(formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        var user = window.Qs.stringify(this.$data.ruleForm, {arrayFormat: 'repeat'});
                        axios.post("${path}login.do", "type=login&" + user).then((res) => {

                            console.log(res)
                            if (res.data.code == "200") {
                                //将登陆的对象放入 session中
                                sessionStorage.setItem("uid", res.data.t.uid);
                                location.href = "${path}main.jsp";
                                console.log("user" + res.data.t.uid);
                            }
                            layer.msg(res.data.message);
                        })
                    } else {
                        console.log('error submit!!');
                        return false;
                    }
                });
            },
        }
    })
</script>

</html>