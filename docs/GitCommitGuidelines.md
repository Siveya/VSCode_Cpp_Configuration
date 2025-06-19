# Git 提交规范

### 来自[AngularJS](https://github.com/angular/angular.js/blob/master/DEVELOPERS.md)

## 格式
```
<type>(<scope>): <subject>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

- **type**: 必填，提交类型
- **scope**: 可选，影响范围
- **subject**: 必填，简短描述
- **body**: 可选，详细说明
- **footer**: 可选, 提供额外说明

## 提交类型
- **feat**: 新功能
- **fix**: 修复bug
- **docs**: 文档更改
- **style**: 代码格式（不影响功能）
- **refactor**: 代码重构
- **perf**: 性能优化
- **test**: 添加或修改测试
- **build**: 构建系统或外部依赖的更改
- **ci**: CI配置文件和脚本的更改
- **chore**: 构建工具、依赖等
- **revert**: 撤销之前的提交
- **hotfix**: 紧急修复
- **wip**: 进行中的工作（临时提交）

## Footer说明
Footer用于提供额外信息，常见用法：
- **关联Issue**: `Closes #123`, `Fixes #456`, `Resolves #789`
- **Breaking Changes**: `BREAKING CHANGE: 说明破坏性变更`
- **共同作者**: `Co-authored-by: 姓名 <邮箱>`
- **参考链接**: `Ref: https://example.com/doc`
- **审查者**: `Reviewed-by: 姓名 <邮箱>`

## 规则
- 每行不超过100字符
- subject 使用动词原形，首字母小写，结尾不加句号
- 如果影响多个模块，scope 可以用 `*`
- footer 每项单独一行，使用标准格式

## 示例

**新功能**
```
feat(auth): add XXX support

实现XXX功能

Closes #156
BREAKING CHANGE: XXXAPI将在v2.0中移除
Co-authored-by: 张三 <zhangsan@example.com>
Ref: https://wiki.example.com/auth-design
```

**修复bug**
```
fix(cart): correct XXXX

修复XXXX问题

Closes #45.
```

**文档更新**
```
docs: update README installation guide
```

**重构**
```
refactor(api): simplify authentication logic
```

**性能优化**
```
perf(database): optimize user query performance

使用索引优化用户查询，查询时间从2s降低到200ms
```

**构建配置**
```
build(deps): update webpack to v5.0.0

升级webpack到最新版本，支持更好的打包优化
```

**CI配置**
```
ci: add automated testing for pull requests

为PR添加自动化测试流程，确保代码质量
```

**撤销提交**
```
revert: revert "feat(user): add login functionality"

This reverts commit abc1234.
```
