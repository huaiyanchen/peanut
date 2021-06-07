<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/5/25
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath() + "/";
    session.setAttribute("path", path);
%>
<html>
<head>
    <meta charset="utf-8">
    <title>🥜🚇</title>

    <link rel="stylesheet" href="static/css/login.css"/>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://unpkg.com/vue/dist/vue.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/element-ui/2.15.1/index.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/layer/3.4.0/layer.js"></script>
    <script src="https://cdn.bootcss.com/qs/6.7.0/qs.min.js"></script>

</head>
<body>
<div id="login">
    <div class="mid_box">
        <div class="mid_left_box">
            <img src="static/img/preview.gif"/>
        </div>
        <div class="mid_right_box">
            <div class="title">欢迎登录使用</div>
            <el-form :model="ruleForm" :rules="rules" ref="ruleForm" class="ruleForm" status-icon>
                <el-form-item prop="name">
                    <el-input v-model="ruleForm.username" placeholder="请输入用户名"></el-input>
                </el-form-item>
                <el-form-item prop="pwd">
                    <el-input v-model="ruleForm.pwd" type="password" placeholder="请输入密码"></el-input>
                </el-form-item>

                <el-form-item>
                    <el-button type="primary" class="login_btn" @click="submitForm('ruleForm')">登录</el-button>
                </el-form-item>
            </el-form>
        </div>
    </div>
</div>
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
                            if (res.data.code == "200") {
                                //将登陆的对象放入 session中
                                sessionStorage.setItem("uid", res.data.t.uid);
                                location.href = "${path}main.jsp";
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
