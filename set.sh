#!/bin/bash
function SetHostname(){
    read -p "input your hostname:" hostname
    hostnamectl set-hostname $hostname
    hostnamectl
}

function SetCron(){
    num=$(grep -n "pam_unix" /etc/pam.d/common-session-noninteractive | cut -d ":" -f 1)
    echo "pam in line $num"
    sed -i "${num}i\session [success=1 default=ignore] pam_succeed_if.so service in cron quiet use_uid" /etc/pam.d/common-session-noninteractive
    cat /etc/pam.d/common-session-noninteractive
    /etc/init.d/cron restart
}


function start(){
    echo "1.set hostname  2.set cron  0.exit"
    read -p "input your number:" number
    case "$number" in
        1) SetHostname && start
        ;;
        2) SetCron && start
        ;;
        0) exit 1
        ;;
    esac
}

start
