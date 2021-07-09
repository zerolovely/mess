### DD

```shell
bash <(wget –no-check-certificate -qO- 'https://raw.githubusercontent.com/zerolovely/dd/master/net.sh') -d 10 -v 64 -a
```

### DD(内网)

```shell
bash <(wget –no-check-certificate -qO- 'https://raw.githubusercontent.com/zerolovely/dd/master/net.sh') -d 10 -v 64 -a --mirror 'http://mirrors.tencentyun.com/debian/'
```

### DD(指定镜像)

```shell
bash <(wget –no-check-certificate -qO- 'https://raw.githubusercontent.com/zerolovely/dd/master/net.sh') -d 10 -v 64 -a --mirror 'http://mirrors.tencent.com/debian/'
```

### 初始化

```shell
source <(curl -L https://raw.githubusercontent.com/zerolovely/mess/master/add.sh)
```

### 网盘安装
```shell
bash <(curl -L https://raw.githubusercontent.com/zerolovely/mess/master/fileb.sh)
```


### 升级内核

```shell
apt install -t $(lsb_release -sc)-backports linux-image-$(dpkg --print-architecture) linux-headers-$(dpkg --print-architecture) --install-recommends -y
```


### 升级为cloud内核

```shell
apt install -t $(lsb_release -sc)-backports linux-image-cloud-$(dpkg --print-architecture) linux-headers-cloud-$(dpkg --print-architecture) --install-recommends -y
```
