FROM centos:7

# 1. 修复源并安装必要依赖
RUN sed -i 's/mirror.centos.org/vault.centos.org/g' /etc/yum.repos.d/*.repo && \
    sed -i 's/^#.*baseurl=http/baseurl=http/g' /etc/yum.repos.d/*.repo && \
    sed -i 's/mirrorlist=http/#mirrorlist=http/g' /etc/yum.repos.d/*.repo && \
    yum install -y curl wget

# 2. 自动下载并安装 x-ui (这里使用官方一键脚本)
RUN bash <(curl -Ls https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh)

# 3. 设置启动命令
CMD ["/usr/local/x-ui/x-ui"]
