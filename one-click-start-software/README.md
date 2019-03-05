## 使用Alfred workflow一键启动办公软件(One-click start office software)
> 配置信息，可以自行修改
1. config复制到.ssh目录下
2. con复制到/usr/local/bin/下并授权
3. ssh.exp放到~目录下
---
> Maximize iterm2 interface 2019/3/5 
```
      tell application "System Events" 
                key code 36 using {command down}
      end tell
```
