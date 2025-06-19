# Git Hooks 设置指南

## 概述
本项目使用Git Hooks来强制执行提交消息规范，确保所有提交消息都符合[Git提交规范](./GitCommitGuidelines.md)。

## 快速安装

### 1. 安装Git Hooks
```bash
# 在项目根目录执行
./scripts/install-hooks.sh
```

### 2. 验证安装
安装完成后，尝试一个不规范的提交来测试：
```bash
git commit -m "invalid commit message"
```
应该看到错误提示。

然后尝试规范的提交：
```bash
git commit -m "feat: add new feature"
```
应该提交成功。

## 使用说明

### 提交前验证
在提交前，可以使用验证脚本测试提交消息：
```bash
# 直接验证消息
./scripts/validate-commit-msg.sh "feat(auth): add login functionality"

# 交互模式
./scripts/validate-commit-msg.sh
```

### 常见提交格式示例
```bash
# ✅ 正确格式
git commit -m "feat(auth): add user authentication"
git commit -m "fix(cart): resolve checkout bug"
git commit -m "docs: update API documentation"
git commit -m "test(user): add login tests"

# ❌ 错误格式
git commit -m "Add new feature"           # 缺少type
git commit -m "feat: Add new feature"     # subject首字母大写
git commit -m "feat: add new feature."    # subject以句号结尾
git commit -m "feat(auth): This is a very long commit message that exceeds the 100 character limit and will be rejected by the hook"  # 过长
```

## Hook 验证规则

### 格式检查
- 必须符合 `<type>(<scope>): <subject>` 格式
- `scope` 是可选的
- `type` 必须是允许的类型之一

### 长度检查
- 标题不能超过100字符

### 大小写检查
- `subject` 不应以大写字母开头
- `subject` 不应以句号结尾

### 特殊情况
- Merge提交会自动跳过验证
- Revert提交只做基本格式检查

## 允许的提交类型
- `feat` - 新功能
- `fix` - 修复bug
- `docs` - 文档更改
- `style` - 代码格式
- `refactor` - 代码重构
- `perf` - 性能优化
- `test` - 测试
- `build` - 构建系统
- `ci` - CI配置
- `chore` - 构建工具、依赖等
- `revert` - 撤销提交
- `hotfix` - 紧急修复
- `wip` - 进行中的工作

## 故障排除

### Hook 不生效
检查文件权限：
```bash
ls -la .git/hooks/commit-msg
```
应该显示可执行权限(-rwxr-xr-x)。

如果没有权限，运行：
```bash
chmod +x .git/hooks/commit-msg
```

### 临时绕过Hook
在紧急情况下，可以使用 `--no-verify` 标志绕过hook：
```bash
git commit --no-verify -m "emergency fix"
```
**注意：这应该只在紧急情况下使用！**

### 卸载Hook
如需移除hook：
```bash
rm .git/hooks/commit-msg
```

## 团队协作

### 新成员入职
1. 克隆仓库后立即运行 `./scripts/install-hooks.sh`
2. 阅读 [Git提交规范](./GitCommitGuidelines.md)
3. 使用 `./scripts/validate-commit-msg.sh` 练习提交消息格式

### CI/CD集成
可以在CI流水线中添加提交消息检查：
```bash
# 在CI脚本中验证最后一次提交
./scripts/validate-commit-msg.sh "$(git log -1 --pretty=%B)"
```
