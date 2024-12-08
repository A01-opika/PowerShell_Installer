#!/bin/bash

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)

echo "${GREEN}============================${RESET}"
echo "${YELLOW}   欢迎使用 PowerShell 安装脚本   ${RESET}"
echo "${GREEN}============================${RESET}"

echo "${BLUE}可用镜像列表:${RESET}"
echo "1) 清华镜像"
echo "2) 阿里云镜像"
echo "3) 不使用镜像"

read -p "请选择镜像 (1-3): " mirror_choice

case $mirror_choice in
    1)
        mirror="清华镜像"
        url="https://mirrors.tuna.tsinghua.edu.cn/powershell/"
        ;;
    2)
        mirror="阿里云镜像"
        url="https://mirrors.aliyun.com/powershell/"
        ;;
    3)
        mirror="不使用镜像"
        url=""
        ;;
    *)
        echo "${RED}无效选择，退出脚本。${RESET}"
        exit 1
        ;;
esac

echo "${GREEN}您选择的镜像是: ${mirror}${RESET}"

echo "${YELLOW}正在进行 PowerShell 安装...请稍候...${RESET}"

if [ "$mirror" != "不使用镜像" ]; then
    echo "${BLUE}使用 ${mirror} 进行安装...${RESET}"
    wget ${url}powershell-latest-linux-x64.tar.gz -O /tmp/pwsh.tar.gz
    mkdir -p ~/powershell && tar -xzf /tmp/pwsh.tar.gz -C ~/powershell
    sudo ~/powershell/pwsh-install.sh
else
    echo "${BLUE}不使用镜像，直接进行安装...${RESET}"
    wget https://github.com/PowerShell/PowerShell/releases/latest/download/powershell-latest-linux-x64.tar.gz -O /tmp/pwsh.tar.gz
    mkdir -p ~/powershell && tar -xzf /tmp/pwsh.tar.gz -C ~/powershell
    sudo ~/powershell/pwsh-install.sh
fi

echo "${GREEN}PowerShell 安装完成！${RESET}"
