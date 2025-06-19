#!/bin/bash

# 提交消息验证脚本
# 允许用户在提交前测试提交消息是否符合规范

# 使用方法
usage() {
    echo "用法: $0 [提交消息]"
    echo ""
    echo "示例:"
    echo "  $0 'feat(auth): add login functionality'"
    echo "  $0 'fix: correct typo in documentation'"
    echo ""
    echo "如果不提供消息，将进入交互模式"
}

# 验证函数 (与commit-msg hook相同的逻辑)
validate_commit_message() {
    local commit_message="$1"
    local commit_regex='^(feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert|hotfix|wip)(\(.+\))?: .{1,50}'

    # 跳过merge提交
    if echo "$commit_message" | grep -qE "^Merge (branch|remote-tracking branch)"; then
        echo "✅ Merge提交，跳过验证"
        return 0
    fi

    # 跳过revert提交的详细检查
    if echo "$commit_message" | grep -qE "^revert: "; then
        echo "✅ Revert提交，跳过详细验证"
        return 0
    fi

    # 检查提交消息格式
    if ! echo "$commit_message" | head -1 | grep -qE "$commit_regex"; then
        echo "❌ 提交消息格式不正确!"
        echo ""
        echo "正确格式: <type>(<scope>): <subject>"
        echo ""
        echo "type 必须是以下之一:"
        echo "  feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert|hotfix|wip"
        echo ""
        echo "示例:"
        echo "  feat(auth): add login functionality"
        echo "  fix(cart): correct price calculation"
        echo "  docs: update README"
        return 1
    fi

    # 检查标题长度
    local title=$(echo "$commit_message" | head -1)
    if [ ${#title} -gt 100 ]; then
        echo "❌ 提交消息标题过长!"
        echo "标题长度: ${#title} 字符 (最大 100 字符)"
        return 1
    fi

    # 检查是否以大写字母开头
    local subject=$(echo "$title" | sed -E 's/^[a-z]+(\(.+\))?: //')
    if echo "$subject" | grep -qE "^[A-Z]"; then
        echo "❌ 主题描述不应以大写字母开头!"
        echo "当前主题: $subject"
        echo "建议修改为: $(echo "$subject" | sed 's/^./\L&/')"
        return 1
    fi

    # 检查是否以句号结尾
    if echo "$title" | grep -qE "\.$"; then
        echo "❌ 主题描述不应以句号结尾!"
        return 1
    fi

    echo "✅ 提交消息格式正确!"
    return 0
}

# 主函数
main() {
    if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
        usage
        exit 0
    fi

    if [ $# -eq 0 ]; then
        # 交互模式
        echo "请输入要验证的提交消息 (按Ctrl+C退出):"
        read -r commit_message
    else
        # 命令行参数模式
        commit_message="$1"
    fi

    if [ -z "$commit_message" ]; then
        echo "❌ 提交消息不能为空"
        exit 1
    fi

    echo "验证提交消息: $commit_message"
    echo "----------------------------------------"

    if validate_commit_message "$commit_message"; then
        exit 0
    else
        exit 1
    fi
}

main "$@"
