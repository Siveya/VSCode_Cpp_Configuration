#!/bin/bash

# Git Hooks 安装脚本
# 将项目的 git hooks 安装到 .git/hooks/ 目录

set -e

# 脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
HOOKS_DIR="$PROJECT_ROOT/.git/hooks"

echo "🔧 安装 Git Hooks..."

# 检查是否在git仓库中
if [ ! -d "$PROJECT_ROOT/.git" ]; then
    echo "❌ 错误: 当前目录不是git仓库根目录"
    exit 1
fi

# 创建hooks目录(如果不存在)
mkdir -p "$HOOKS_DIR"

# 安装commit-msg hook
echo "📝 安装 commit-msg hook..."
cp "$SCRIPT_DIR/commit-msg" "$HOOKS_DIR/commit-msg"
chmod +x "$HOOKS_DIR/commit-msg"

# 备份已存在的hooks(如果有)
if [ -f "$HOOKS_DIR/commit-msg.sample" ]; then
    echo "💾 备份原有的 commit-msg.sample"
fi

echo "✅ Git Hooks 安装完成!"
echo ""
echo "现在所有的提交消息都会被验证是否符合项目规范。"
echo ""
echo "测试hook是否工作:"
echo "  1. 尝试提交: git commit -m 'test: invalid format'"
echo "  2. 应该看到错误提示"
echo "  3. 然后提交: git commit -m 'test: valid format'"
echo ""
echo "如需卸载，运行: rm $HOOKS_DIR/commit-msg"
