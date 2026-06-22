x-ui setting -username text01 -password 123456789



# 1. 使用 centos:7 作为基础镜像
FROM centos:7

# 2. 修复源并安装必要的依赖 (curl 和 wget 是必须的)
RUN sed -i 's/mirror.centos.org/vault.centos.org/g' /etc/yum.repos.d/*.repo && \
    sed -i 's/^#.*baseurl=http/baseurl=http/g' /etc/yum.repos.d/*.repo && \
    sed -i 's/mirrorlist=http/#mirrorlist=http/g' /etc/yum.repos.d/*.repo && \
    yum install -y curl wget

# 3. 安装 x-ui 面板
RUN curl -Ls https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh | bash

# 4. 设置启动命令 (这是容器启动时要执行的程序)
CMD ["/usr/local/x-ui/x-ui"]
