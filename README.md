## 自建gitlab
### 使用流程
- `sh build.sh` 构建镜像
- `sh service.sh` 创建服务

> Gitlab CE版本目前的tag列表：https://hub.docker.com/r/gitlab/gitlab-ce/tags/

### 修改访问Gitlab使用的域名,必须要在下面的位置进行设置
```
vim service.sh
--hostname git.yujianbo.vip \
```
