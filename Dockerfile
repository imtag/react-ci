# 使用 node 12.14.0 的精简版作为基础镜像
FROM node:12.14.0-slim

# 安装 nginx
RUN apt-get update \
    && apt-get install -y nginx

# 将构建的资源拷贝到 ngxin
COPY ./build/ /var/www/html

# 以前台方式启动 nginx
CMD ["nginx", "-g", "daemon off;"]