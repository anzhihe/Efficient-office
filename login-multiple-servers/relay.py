#!/usr/bin/env python3
# -*- coding:utf-8 -*-
# create by anzhihe 20210513
 
import click
import pexpect
import pyotp
import struct, fcntl, sys, signal
import termios
 
 
def sigwinch_passthrough (sig, data):
    """设置合适的终端窗口大小
    This returns the window size of the child tty.
    The return value is a tuple of (rows, cols).
    """
    if not global_pexpect_instance:
        return
    if 'TIOCGWINSZ' in dir(termios):
        TIOCGWINSZ = termios.TIOCGWINSZ
    else:
        TIOCGWINSZ = 1074295912 # Assume
    s = struct.pack('HHHH', 0, 0, 0, 0)
    a = struct.unpack ('HHHH', fcntl.ioctl(sys.stdout.fileno(), TIOCGWINSZ , s))
    # print(a[0],a[1])
    global_pexpect_instance.setwinsize(a[0],a[1])
  
def get_auth_token(secret):
    """获取谷歌认证码"""
    totp = pyotp.TOTP(secret)
    return totp.now()
 
def login_relay(child, secret, interact):
    """登陆中控机"""
    index = child.expect(["Verification code", pexpect.EOF, pexpect.TIMEOUT])
    if index in (0, 2):
        token = get_auth_token(secret)
        child.sendline(token)
        index = child.expect(["relay", pexpect.EOF, pexpect.TIMEOUT])
        if (index == 0):
            click.echo(click.style('认证成功:)', fg='blue'))
            # 取消标准输出，否则会导致每个字符重复显示两遍
            child.logfile_read = None
            if interact:
                # 在中控机上执行指定命令,登陆到指定服务器
                child.sendline('ssh anzhihe@machine')
                click.clear() # 清屏
                child.interact() # 将控制权交给用户
            else:
                child.close()
        elif index == 1:
            click.echo(click.style('认证失败:(', fg='red'))
            child.close()
 
             
CONTEXT_SETTINGS = dict(help_option_names = ['-h', '--help'])
@click.command(context_settings = CONTEXT_SETTINGS)
@click.option('--username', '-u', required=True, type=str, help='username', default='anzhihe')
@click.option('--password','-p', required=True, type=str, help='password', default='passwd')
@click.option('--secret', '-s', required=True, type=str, help='secret', default='google_auth_key')
@click.option('--interact', '-i', is_flag=True, help='进入交互模式', default=False)
def login(username: str, password: str, secret: str, interact: bool):
        """连接中控机"""
        child = pexpect.spawn('ssh %s@relay' % username, timeout=3)
 
        global global_pexpect_instance
        global_pexpect_instance = child
        sigwinch_passthrough(1,2)
         
        ## debug模式
        #child.logfile = open("logfile.txt", 'wb')
        #child.logfile_read = sys.stdout.buffer
      
        # 重定向输出到stdout，不包含输入的密码
        if interact:
            child.logfile_read = sys.stdout.buffer
      
        # 开始匹配
        index = child.expect(["id_rsa", "code", "relay", pexpect.EOF, pexpect.TIMEOUT])
        if index == 0:
            child.sendline(password)
            login_relay(child, secret, interact)
        elif index == 1:
            login_relay(child, secret, interact)
        elif index == 2:
            click.echo(click.style('亲，已经认证过了哦~', fg='green'))
            child.logfile_read = None
            if interact:
                child.sendline('ssh anzhihe@machine')
                click.clear()
                child.interact()
            else:
                child.close()
  
if __name__ == '__main__':
    login()
