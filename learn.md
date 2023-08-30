1.vscode相关设置：https://zhuanlan.zhihu.com/p/261721279

```
1.windows 控制台是GBK编码，解决办法：
g++  -o test  main.cpp public.cpp -fexec-charset=GBK -finput-charset=UTF-8
```

2.vmware安装ubuntu：https://blog.csdn.net/qq_45657288/article/details/116084337

vmware tools安装:https://blog.csdn.net/adminkeys/article/details/107914813

[vmware 剪切板共享：](https://blog.csdn.net/tsundere_x/article/details/104529864?spm=1001.2101.3001.6661.1&utm_medium=distribute.pc_relevant_t0.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-1-104529864-blog-80606235.235%5Ev38%5Epc_relevant_anti_vip&depth_1-utm_source=distribute.pc_relevant_t0.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-1-104529864-blog-80606235.235%5Ev38%5Epc_relevant_anti_vip&utm_relevant_index=1)

girrit搭建：https://juejin.cn/post/7067188350449287182 (有些报错看下面的总结)

gerrit下载:https://gerrit-releases.storage.googleapis.com/index.html

~/review_site/etc/gerrit.config

```
ughskpqqzlfqbdgf
lizwznwkpudrbchj
```



```
[gerrit]
        basePath = git
        serverId = f9036676-7b5a-4366-b616-24423e2d6226
        canonicalWebUrl = http://192.168.31.80:28888/ #gerrit服务器的管理页面,监听8081端口
[database]
        type = h2
        database = /root/review_site/db/ReviewDB
[noteDb "changes"]
        disableReviewDb = true
        primaryStorage = note db
        read = true
        sequence = true
        write = true
[index]
        type = LUCENE
[auth]
        type = HTTP #使用HTTP Auth方式，需要使用Apache做反向代理
[receive]
        enableSignedPush = false
[sendemail]
        smtpServer = smtp.163.com #用于推送通知邮件的smtp服务器
        smtpServerPort = 465
        smtpEncryption = ssl
        smtpUser = 13594939343@163.com #邮箱用户名
        smtpPass =IACANLJQYOVWTIVI
        sslVerify = false
        #from = CodeReview<13594939343@163.com> #用于显示推送邮件的发件人地址
        from = 13594939343@163.com #用于显示推送邮件的发件人地址
[container]
        user = root
        javaHome = /usr/local/jdk1.8.0_381/jre
[sshd]
        listenAddress = *:29418
[httpd]
        listenUrl = proxy-http://192.168.31.80:28888/ #Gerrit服务器监听该url
[cache]
        directory = cache

```

/etc/apache2/sites-enabled/000-default.conf

```
ServerName 192.168.31.80
<VirtualHost *:8080>
    ProxyRequests Off
    ProxyVia Off
    ProxyPreserveHost On
    AllowEncodedSlashes On
    RewriteEngine On
    RewriteRule ^/(.*) http://192.168.31.80:28888/$1 [NE,P]

    <Proxy *>
          Order deny,allow
          Allow from all
    </Proxy>

    <Location /login/>
        AuthType Basic
        AuthName "Gerrit Code Review"
        Require valid-user
        AuthBasicProvider file
        AuthUserFile /etc/apache2/passwords
    </Location>

    ProxyPass / http://192.168.31.80:28888/
        # The ServerName directive sets the request scheme, hostname and port that
  # the server uses to identify itself. This is used when creating
  # redirection URLs. In the context of virtual hosts, the ServerName
  # specifies what hostname must appear in the request's Host: header to
  # match this virtual host. For the default virtual host (this file) this
  # value is not decisive as it is used as a last resort host regardless.
  # However, you must set it for any further virtual host explicitly.
  #ServerName www.example.com

  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/html

  # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
  # error, crit, alert, emerg.
  # It is also possible to configure the loglevel for particular
  # modules, e.g.
  #LogLevel info ssl:warn

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined

  # For most configuration files from conf-available/, which are
  # enabled or disabled at a global level, it is possible to
  # include a line for only one particular virtual host. For example the
  # following line enables the CGI configuration for this host only
  # after it has been globally disabled with "a2disconf".
  #Include conf-available/serve-cgi-bin.conf
</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet

```

/etc/apache2/ports.conf

```
# If you just change the port or add more ports here, you will likely also
# have to change the VirtualHost statement in
# /etc/apache2/sites-enabled/000-default.conf

Listen 80
Listen 8080

<IfModule ssl_module>
        Listen 443
</IfModule>

<IfModule mod_gnutls.c>
        Listen 443
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet

```

运行：

```
sudo ~/review_site/bin/gerrit.sh restart;sudo /etc/init.d/apache2 restart
```

jdk安装报错：https://blog.csdn.net/shichen2010/article/details/77964188

```
vim ~/.profile
export JAVA_HOME=/usr/local/jdk1.8.0_381
export JRE_HOME=${JAVA_HOME}/jre  
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib  
export PATH=${JAVA_HOME}/bin:$PATH

```

jdk安装11以上

ubuntu16 apt换源：https://blog.csdn.net/qq_40301372/article/details/108622277

```
sudo cp /etc/apt/sources.list sources_backup.list
sudo gedit /etc/apt/sources.list
```

```
#阿里云源
deb-src http://archive.ubuntu.com/ubuntu xenial main restricted
deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted
deb-src http://mirrors.aliyun.com/ubuntu/ xenial main restricted multiverse universe
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted multiverse universe
deb http://mirrors.aliyun.com/ubuntu/ xenial universe
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates universe
deb http://mirrors.aliyun.com/ubuntu/ xenial multiverse
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates multiverse
deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse
deb http://archive.canonical.com/ubuntu xenial partner
deb-src http://archive.canonical.com/ubuntu xenial partner
deb http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted multiverse universe
deb http://mirrors.aliyun.com/ubuntu/ xenial-security universe
deb http://mirrors.aliyun.com/ubuntu/ xenial-security multiverse
```

```
sudo apt-get update
```

拉去代码

```
git clone ssh://root@192.168.31.80:29418/learn.git
```

配置gitweb(没成功）：https://www.cnblogs.com/anliven/p/12008564.html