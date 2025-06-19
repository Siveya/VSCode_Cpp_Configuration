#!/bin/bash

# C++ 项目构建脚本
set -e

# 默认配置
BUILD_TYPE="Release"
BUILD_TESTS="ON"
BUILD_EXAMPLES="ON"
ENABLE_COVERAGE="OFF"
ENABLE_SANITIZERS="OFF"
USE_NINJA="OFF"
CLEAN_BUILD="OFF"
# 获取 CPU 核心数（跨平台兼容）
if command -v nproc >/dev/null 2>&1; then
    PARALLEL_JOBS=$(nproc)
elif command -v sysctl >/dev/null 2>&1; then
    PARALLEL_JOBS=$(sysctl -n hw.ncpu)
else
    PARALLEL_JOBS=4  # 默认值
fi

# 帮助信息
show_help() {
    cat << EOF
用法: $0 [选项]

选项:
    -h, --help              显示此帮助信息
    -d, --debug             调试构建 (默认: Release)
    -t, --enable-tests      启用测试 (默认: ON)
    -e, --enable-examples   启用示例 (默认: ON)
    -c, --enable-coverage   启用代码覆盖率 (默认: OFF)
    -s, --enable-sanitizers 启用内存检查器 (默认: OFF)
    -n, --ninja             使用 Ninja 构建 (默认: Make)
    --clean                 清理构建目录
    -j, --jobs NUM          并行任务数 (默认: CPU核心数)

示例:
    $0                      # 默认Release构建
    $0 -d -c               # Debug构建并启用覆盖率
    $0 -d -s               # Debug构建并启用内存检查
    $0 --clean -d          # 清理并进行Debug构建
EOF
}

# 解析命令行参数
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        -d|--debug)
            BUILD_TYPE="Debug"
            shift
            ;;
        -t|--enable-tests)
            BUILD_TESTS="ON"
            shift
            ;;
        -e|--enable-examples)
            BUILD_EXAMPLES="ON"
            shift
            ;;
        -c|--enable-coverage)
            ENABLE_COVERAGE="ON"
            BUILD_TYPE="Debug"  # 覆盖率需要Debug模式
            shift
            ;;
        -s|--enable-sanitizers)
            ENABLE_SANITIZERS="ON"
            shift
            ;;
        -n|--ninja)
            USE_NINJA="ON"
            shift
            ;;
        --clean)
            CLEAN_BUILD="ON"
            shift
            ;;
        -j|--jobs)
            PARALLEL_JOBS="$2"
            shift 2
            ;;
        *)
            echo "未知选项: $1"
            show_help
            exit 1
            ;;
    esac
done

# 项目根目录
PROJECT_ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
BUILD_DIR="$PROJECT_ROOT/build"

echo "===== C++ 项目构建脚本 ====="
echo "构建类型: $BUILD_TYPE"
echo "构建目录: $BUILD_DIR"
echo "并行任务数: $PARALLEL_JOBS"

# 清理构建目录
if [[ "$CLEAN_BUILD" == "ON" ]]; then
    echo "清理构建目录..."
    rm -rf "$BUILD_DIR"
fi

# 创建构建目录
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

# 准备CMake参数
CMAKE_ARGS=(
    "-DCMAKE_BUILD_TYPE=$BUILD_TYPE"
    "-DTEMPLATE_BUILD_TESTS=$BUILD_TESTS"
    "-DTEMPLATE_BUILD_EXAMPLES=$BUILD_EXAMPLES"
    "-DTEMPLATE_ENABLE_COVERAGE=$ENABLE_COVERAGE"
    "-DTEMPLATE_ENABLE_SANITIZERS=$ENABLE_SANITIZERS"
)

if [[ "$USE_NINJA" == "ON" ]]; then
    CMAKE_ARGS+=("-GNinja")
    BUILD_TOOL="ninja"
else
    BUILD_TOOL="make"
fi

# 配置项目
echo "配置项目..."
cmake "${CMAKE_ARGS[@]}" "$PROJECT_ROOT"

# 构建项目
echo "构建项目..."
if [[ "$USE_NINJA" == "ON" ]]; then
    ninja -j "$PARALLEL_JOBS"
else
    make -j "$PARALLEL_JOBS"
fi

echo "构建完成！"

# 运行测试
if [[ "$BUILD_TESTS" == "ON" ]]; then
    echo "运行测试..."
    ctest --output-on-failure --parallel "$PARALLEL_JOBS"
fi

# 生成覆盖率报告
if [[ "$ENABLE_COVERAGE" == "ON" ]]; then
    echo "生成覆盖率报告..."
    lcov --capture --directory . --output-file coverage.info
    lcov --remove coverage.info '/usr/*' '*/tests/*' '*/third_party/*' --output-file coverage.info
    lcov --list coverage.info
    genhtml coverage.info --output-directory coverage_html
    echo "覆盖率报告已生成到: $BUILD_DIR/coverage_html"
fi

echo "===== 构建完成 ====="
