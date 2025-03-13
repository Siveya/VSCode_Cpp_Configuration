# C++ 项目模板

## 项目介绍
这是一个现代 C++ 项目模板，提供了完整的项目结构、构建系统和开发工具链配置。

## 特性
- 现代 CMake 构建系统
- C++17 标准支持
- 预编译头文件支持
- 单元测试框架 (Google Test)
- 性能测试支持 (Google Benchmark)
- 代码格式化 (clang-format)
- VS Code 配置
- 示例代码和文档

## 项目结构
```shell
cpp_project_template/
├── .vscode/                    # VS Code 配置
│   ├── c_cpp_properties.json   # C/C++ 配置
│   ├── launch.json            # 调试配置
│   ├── settings.json          # 编辑器设置
│   └── tasks.json             # 任务配置
├── include/                    # 公共头文件
│   ├── module1/           # 模块1的公共头文件
│   ├── module2/           # 模块2的公共头文件
│   ├── version.hpp        # 版本信息
│   ├── export.hpp         # 导出宏定义
│   └── pch.hpp            # 预编译头文件
├── src/                       # 源代码
│   ├── module1/              # 模块1实现
│   ├── module2/              # 模块2实现
│   └── main.cpp              # 主程序
├── tests/                    # 单元测试
│   ├── main_test.cpp        # 测试主程序
│   ├── module1_test.cpp     # 模块1测试
│   ├── module2_test.cpp     # 模块2测试
│   └── CMakeLists.txt       # 测试构建配置
├── resource/                   # 资源文件
│   ├── config/                 # 配置文件
│   ├── images/                 # 图片文件
│   ├── sounds/                 # 音效文件
│   └── locales/                # 翻译文件
├── examples/                 # 示例代码
│   ├── basic_usage.cpp      # 基本用法示例
│   └── CMakeLists.txt       # 示例构建配置
├── benchmarks/              # 性能测试
│   ├── benchmark_test.cpp   # 性能测试代码
│   └── CMakeLists.txt       # 性能测试构建配置
├── build/                      # 构建输出目录
├── docs/                    # 文档
├── scripts/                 # 工具脚本
├── third_party/            # 第三方依赖
│   ├── googletest/         # Google Test 源码 用于单元测试
│   └── library2/
├── assets/                 # 资源文件
├── CMakeLists.txt         # 主构建文件
├── .clang-format          # 代码格式化配置
├── .gitignore            # Git 忽略配置
├── .gitmodules          # Git 子模块配置
├── LICENSE              # 许可证
└── README.md           # 本文件
```

## 构建要求
- CMake 3.12 或更高版本
- 支持 C++17 的编译器
- Git（用于获取依赖）

## 快速开始

1. 克隆仓库并初始化子模块：
```bash
git clone https://github.com/yourusername/cpp_project_template.git
cd cpp_project_template
git submodule update --init --recursive
```

2. 创建构建目录并构建：
```bash
mkdir build && cd build
cmake ..
make
```

3. 运行测试：
```bash
ctest
```

4. 运行示例：
```bash
./examples/basic_usage
```

## 配置选项
在 CMake 配置时可以使用以下选项：
- `TEMPLATE_BUILD_TESTS`: 构建单元测试 (默认: ON)
- `TEMPLATE_BUILD_EXAMPLES`: 构建示例 (默认: ON)
- `TEMPLATE_BUILD_BENCHMARKS`: 构建性能测试 (默认: OFF)
- `TEMPLATE_ENABLE_WARNINGS`: 启用警告 (默认: ON)
- `TEMPLATE_BUILD_SHARED`: 构建共享库 (默认: OFF)

示例：
```bash
cmake -DTEMPLATE_BUILD_TESTS=OFF -DTEMPLATE_BUILD_SHARED=ON ..
```

## VS Code 集成
项目包含完整的 VS Code 配置：
- 智能代码补全
- 调试支持
- 任务运行器
- 代码格式化

## 许可证
[许可证名称] - 查看 [LICENSE](LICENSE) 文件了解详情。
