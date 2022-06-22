#!/bin/bash

builds=$(dpkg --print-architecture)
install_nfcheck(){
    if [[ -f "/usr/local/bin/nf" ]]; then
        rm /usr/local/bin/nf
    fi
    nf_version=$(curl -s https://api.github.com/repos/sjlleo/netflix-verify/releases/latest | grep tag_name | awk -F ":" '{print $2}' | sed 's/\"//g;s/,//g;s/ //g')
    wget -O /usr/local/bin/nf https://github.com/sjlleo/netflix-verify/releases/download/${nf_version}/nf_linux_${builds}
    chmod +x /usr/local/bin/nf
}

install_dpcheck(){
    if [[ -f "/usr/local/bin/dp" ]]; then
        rm /usr/local/bin/dp
    fi
    dp_version=$(curl -s https://api.github.com/repos/sjlleo/VerifyDisneyPlus/releases | grep tag_name | head -n 1 | awk -F ":" '{print $2}' | sed 's/\"//g;s/,//g;s/ //g')
    wget -O /usr/local/bin/dp https://github.com/sjlleo/VerifyDisneyPlus/releases/download/${dp_version}/dp_${dp_version}_linux_${builds}
    chmod +x /usr/local/bin/dp
}

install_tucheck(){
    if [[ -f "/usr/local/bin/tucheck" ]]; then
        rm /usr/local/bin/tucheck
    fi
    tu_version=$(curl -s https://api.github.com/repos/sjlleo/TubeCheck/releases | grep tag_name | head -n 1 | awk -F ":" '{print $2}' | sed 's/\"//g;s/,//g;s/ //g')
    wget -O /usr/local/bin/tucheck https://github.com/sjlleo/TubeCheck/releases/download/${tu_version}/tubecheck_${tu_version}_linux_${builds}
    chmod +x /usr/local/bin/tucheck
}


uninstall(){
    if [[ -f "/usr/local/bin/nf" ]]; then
        rm /usr/local/bin/nf
    fi
    if [[ -f "/usr/local/bin/dp" ]]; then
        rm /usr/local/bin/dp
    fi
    if [[ -f "/usr/local/bin/tucheck" ]]; then
        rm /usr/local/bin/tucheck
    fi    
}

main(){
    if [[ $1 == 'install' ]]; then
        install_nfcheck && install_dpcheck && install_tucheck
        nf && seq -s "=" ${COLUMNS}|sed -E "s/[0-9]//g" && dp && seq -s "=" ${COLUMNS}|sed -E "s/[0-9]//g" && tucheck
    elif [[ $1 == 'uninstall' ]]; then
        uninstall
    else
        echo "Wrong input parameters!"
    fi
}

main "$@"
