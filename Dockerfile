FROM centos:7

# 1. 修复源并安装必要依赖
RUN sed -i 's/mirror.centos.org/vault.centos.org/g' /etc/yum.repos.d/*.repo && \
    sed -i 's/^#.*baseurl=http/baseurl=http/g' /etc/yum.repos.d/*.repo && \
    sed -i 's/mirrorlist=http/#mirrorlist=http/g' /etc/yum.repos.d/*.repo && \
    yum install -y curl wget

# 使用 curl 下载脚本并直接通过管道传给 bash 执行
RUN curl -Ls https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh | bash

# 3. 设置启动命令
CMD ["/usr/local/x-ui/x-ui"]
