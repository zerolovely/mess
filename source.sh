#!/bin/bash
setTencentyun(){
cat > /etc/apt/sources.list << EOF
deb http://mirrors.tencentyun.com/debian $(lsb_release -sc) main contrib non-free
deb http://mirrors.tencentyun.com/debian-security $(lsb_release -sc)/updates main contrib non-free
deb http://mirrors.tencentyun.com/debian $(lsb_release -sc)-updates main contrib non-free
deb http://mirrors.tencentyun.com/debian $(lsb_release -sc)-backports main contrib non-free
EOF
}
setTencent(){
cat > /etc/apt/sources.list << EOF
deb http://mirrors.tencent.com/debian $(lsb_release -sc) main contrib non-free
deb http://mirrors.tencent.com/debian-security $(lsb_release -sc)/updates main contrib non-free
deb http://mirrors.tencent.com/debian $(lsb_release -sc)-updates main contrib non-free
deb http://mirrors.tencent.com/debian $(lsb_release -sc)-backports main contrib non-free
EOF
}
setAWS(){
cat > /etc/apt/sources.list << EOF
deb http://cdn-aws.deb.debian.org/debian $(lsb_release -sc) main contrib non-free
deb http://cdn-aws.deb.debian.org/debian-security $(lsb_release -sc)/updates main contrib non-free
deb http://cdn-aws.deb.debian.org/debian $(lsb_release -sc)-updates main contrib non-free
deb http://cdn-aws.deb.debian.org/debian $(lsb_release -sc)-backports main contrib non-free
EOF
}
setMicrosoft(){
cat > /etc/apt/sources.list << EOF
deb http://debian-archive.trafficmanager.net/debian $(lsb_release -sc) main contrib non-free
deb http://debian-archive.trafficmanager.net/debian-security $(lsb_release -sc)/updates main contrib non-free
deb http://debian-archive.trafficmanager.net/debian $(lsb_release -sc)-updates main contrib non-free
deb http://debian-archive.trafficmanager.net/debian $(lsb_release -sc)-backports main contrib non-free
EOF
}
main(){
    echo "1.set tencentyun 2.set tencent 3.set AWS 4.set Microsoft 0.exit"
    read -p "input your number:" number
    case "$number" in
        1) setTencentyun&&main
        ;;
        2) setTencent&&main
        ;;
        3) setAWS&&main
        ;;
        4) setMicrosoft&&main
        ;;
        0) exit 1
        ;;
    esac
}
main