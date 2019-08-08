<template>
  <div class="login box">
    <img src="/static/image/Loginbg.3377d0c.jpg" alt="">
    <div class="login">
      <div class="login-title">
        <img src="/static/image/Logotitle.1ba5466.png" alt="">
        <p>帮助有志向的年轻人通过努力学习获得体面的工作和生活!</p>
      </div>
      <div class="login_box">
        <div class="title">
          <span @click="login_type=0" :class="login_type==0?'current':''">密码登录</span>
          <span @click="login_type=1" :class="login_type==1?'current':''">短信登录</span>
        </div>
        <div class="inp" v-if="login_type==0">
          <input v-model="username" type="text" placeholder="用户名 / 手机号码" class="user">
          <input v-model="password" type="password" name="" class="pwd" placeholder="密码">
          <div id="geetest1"></div>
          <div class="rember">
            <p>
              <input type="checkbox" class="no" v-model="remember"/>
              <span>记住密码</span>
            </p>
            <p>忘记密码</p>
          </div>
          <button class="login_btn" @click="loginHander">登录</button>
          <p class="go_login">没有账号 <span>立即注册</span></p>
        </div>
        <div class="inp" v-show="login_type==1">
          <input v-model="username" type="text" placeholder="手机号码" class="user">
          <input v-model="password" type="text" class="pwd" placeholder="短信验证码">
          <button id="get_code">获取验证码</button>
          <button class="login_btn">登录</button>
          <p class="go_login">没有账号 <span>立即注册</span></p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
    export default {
        name: 'Login',
        data() {
            return {
                login_type: 0,
                username: "",
                password: "",
                remember: "",
            }
        },

        methods: {
            loginHander(){
                // 登录功能实现
                // 1.验证数据（剔除脏数据），从vue中提取username和password
                if(this.username.length<1 || this.password.length<1){
                    this.$message('对不起，账号和密码不能为空');
                    // 账号不对，直接终止
                    return false
                }
                // 2.发送ajax提交登录信息,因为只有post才有请求体，所以只能用post方式
                this.$axios.post(`${this.$settings.Host}/user/authorizations/`,{
                    username: this.username,
                    password: this.password,
                }).then(response=>{
                    // 3.接受jwt的token字符串
                    // 根据用户是否勾选 记住密码 来判断使用不同的存储对象保存数据
                    if(this.remember){
                        // 永久存储
                        // localStorage.setItem('user_token', response.data.token);
                        localStorage.user_token = response.data.token;
                        localStorage.user_id = response.data.token;
                        localStorage.user_username = response.data.token;
                        sessionStorage.removeItem('user.token');
                        sessionStorage.removeItem('user.id');
                        sessionStorage.removeItem('user.username');
                    }else{
                        // 会话存储你
                        sessionStorage.user_token = response.data.token;
                        sessionStorage.user_id = response.data.token;
                        sessionStorage.user_username = response.data.token;
                        localStorage.removeItem('user.token');
                        localStorage.removeItem('user.id');
                        localStorage.removeItem('user.username');
                    }

                    // 4.提示登入成功，跳转到其他页面【首页】
                    let self = this;
                    this.$alert('登入成功！','路飞学城',{
                        callback(){
                            // this.$router.go(-1);  // 跳转到上一个页面
                            self.$router.push('/');  // 跳转到指定页面
                        }
                    });

                }).catch(error=>{
                    // 获取后端的错误信息
                    this.$message(error.response.data.non_field_errors[0],'警告！');
                })

            }
        },

    };
</script>

<style scoped>
  .box {
    width: 100%;
    height: 100%;
    position: relative;
    overflow: hidden;
  }

  .box img {
    width: 100%;
    min-height: 100%;
  }

  .box .login {
    position: absolute;
    width: 500px;
    height: 400px;
    left: 0;
    margin: auto;
    right: 0;
    bottom: 0;
    top: -338px;
  }

  .login .login-title {
    width: 100%;
    text-align: center;
  }

  .login-title img {
    width: 190px;
    height: auto;
  }

  .login-title p {
    font-size: 18px;
    color: #fff;
    letter-spacing: .29px;
    padding-top: 10px;
    padding-bottom: 50px;
  }

  .login_box {
    width: 400px;
    height: auto;
    background: #fff;
    box-shadow: 0 2px 4px 0 rgba(0, 0, 0, .5);
    border-radius: 4px;
    margin: 0 auto;
    padding-bottom: 40px;
  }

  .login_box .title {
    font-size: 20px;
    color: #9b9b9b;
    letter-spacing: .32px;
    border-bottom: 1px solid #e6e6e6;
    display: flex;
    justify-content: space-around;
    padding: 50px 60px 0 60px;
    margin-bottom: 20px;
    cursor: pointer;
  }

  .login_box .title .current {
    color: #4a4a4a;
    border-bottom: 2px solid #84cc39;
  }

  .inp {
    width: 350px;
    margin: 0 auto;
  }

  .inp input {
    outline: 0;
    width: 100%;
    height: 45px;
    border-radius: 4px;
    border: 1px solid #d9d9d9;
    text-indent: 20px;
    font-size: 14px;
    background: #fff !important;
  }

  .inp input.user {
    margin-bottom: 16px;
  }

  .inp .rember {
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: relative;
    margin-top: 10px;
  }

  .inp .rember p:first-of-type {
    font-size: 12px;
    color: #4a4a4a;
    letter-spacing: .19px;
    margin-left: 22px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    /*position: relative;*/
  }

  .inp .rember p:nth-of-type(2) {
    font-size: 14px;
    color: #9b9b9b;
    letter-spacing: .19px;
    cursor: pointer;
  }

  .inp .rember input {
    outline: 0;
    width: 30px;
    height: 45px;
    border-radius: 4px;
    border: 1px solid #d9d9d9;
    text-indent: 20px;
    font-size: 14px;
    background: #fff !important;
  }

  .inp .rember p span {
    display: inline-block;
    font-size: 12px;
    width: 100px;
    /*position: absolute;*/
    /*left: 20px;*/

  }

  #geetest {
    margin-top: 20px;
  }

  .login_btn {
    width: 100%;
    height: 45px;
    background: #84cc39;
    border-radius: 5px;
    font-size: 16px;
    color: #fff;
    letter-spacing: .26px;
    margin-top: 30px;
  }

  .inp .go_login {
    text-align: center;
    font-size: 14px;
    color: #9b9b9b;
    letter-spacing: .26px;
    padding-top: 20px;
  }

  .inp .go_login span {
    color: #84cc39;
    cursor: pointer;
  }
</style>
