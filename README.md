# goreportcard-cli

将https://github.com/gojp/goreportcard 项目的命令行工具构建成docker镜像

## 安装基于docker镜像的goreportcard-cli命令

1. wget https://github.com/luo-zn/goreportcard-cli/scripts/goreportcard-cli.sh /usr/local/bin/goreportcard-cli
2. chmod +x /usr/local/bin/goreportcard-cli
3. 添加export GOPATH=/go-path-workspace[go-path-workspace替换成正确的go工作空间目录]到/etc/profile.d/go-path.sh
