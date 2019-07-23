## 使用Alfred workflow一键登陆多服务器(One-click login to multiple servers)
![image](https://github.com/anzhihe/Efficient-office/blob/master/login-multiple-servers/Login-Multiple-Servers.gif)
> 配置信息，根据自己的实际情况修改
1. con 复制到 /usr/local/bin/ 下并授权
2. 服务器信息放在中转文件 ~/hosts 里

![image](https://github.com/anzhihe/Efficient-office/blob/master/login-multiple-servers/Login-Multiple-Servers.png)
> 使用方法：
1. Use HotKey：
Select the servers name or IP,Press `Command + g`
2. Use keyword：
First copy the name(or ip) of the servers，Then use alfred to enter the keyword `ag`
3. After that, you can use `Command + Option + i` or `Command + Shift + i` to operate multiple servers

---

#### 2019-04-06 create by anzhihe
One-click login to multiple servers: https://chegva.com/3422.html

> 2019/7/23 直接使用con脚本登陆，ssh.exp废弃
