# Now Or Never

`mutter.whatsid.me` 的 Hexo 源码。`develop` 分支保存源码，`master`
分支由 Hexo 生成并发布到 GitHub Pages。

## 环境

- Node.js 20.19 或更高版本
- npm（随 Node.js 安装）

首次使用或依赖变化后执行：

```bash
npm ci
```

## 常用命令

```bash
npm run build    # 清理并生成 public/
npm run serve    # 本地写作预览：http://localhost:4000
npm run preview  # 生成后以静态模式预览
```

## 发布

先提交并推送 `develop` 分支中的源码，然后执行：

```bash
./deploy.sh
```

脚本使用本项目锁定的 Hexo 版本重新构建，并通过 `_config.yml` 中的
`hexo-deployer-git` 配置把 `public/` 发布到 `master`。执行发布会向远端
分支写入内容；只想检查构建时请使用 `npm run build`。

## 维护说明

当前 NexT 主题仍使用已经停止维护的 Swig 模板渲染器。它只参与本地
静态构建，不进入 GitHub Pages 运行环境。若需要彻底清除相关 npm 审计
告警，应单独规划 NexT 主题升级或模板迁移。
