# 使用 node 12.14.0 的精简版作为基础镜像
FROM node:12.14.0-slim

# 安装 nginx
RUN apt-get update \
    && apt-get install -y nginx

# 指定工作目录
WORKDIR /app/

# 将当前目录下的所有文件拷贝到工作目录
COPY . /app/

# 声明容器运行时提供的服务端口
EXPOSE 80

# 构建并转移资源
RUN npm install \
    && npm run build \
    && cp -r build/* /var/www/html \
    && rm -rf /app

# 以前台方式启动 nginx
CMD ["nginx", "-g", "daemon off;"]