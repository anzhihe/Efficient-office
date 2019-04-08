## 使用PopClip + Alfred 一键登陆服务器(One-click login to server)
![image](https://github.com/anzhihe/Efficient-office/blob/master/one-click-login-server/Alfred-Server-demo.gif)
> 配置信息，根据自己的实际情况修改
1. con 复制到 /usr/local/bin/ 下并授权
2. ssh.exp 放到 ~ 目录下
> 使用方法：
1. 安装`PopClip`，解压 Server.popclipextz.zip,双击 Server.popclipext 安装扩展
2. 需要在服务器执行自定义命令需修改 relay.alfredworkflow bash: `tell current session to write text "/usr/local/bin/con $(echo {query} |awk -F "//" '{print $2}')"`
3. relay.alfredworkflow 可以单独使用登陆服务器
4. PopClip 使用： https://chegva.com/3417.html

---

#### 2019-02-19 create by anzhihe
One-click login to server: https://chegva.com
