# VS Code C++ Project Template

## 项目介绍：
    VS Code的C++ 项目文件配置和说明

## 项目结构：

```shell
Cpp_project_template/
├── .vscode                     # vscode 配置文件
│   ├── c_cpp_properties.json   # c/c++ 配置文件
│   ├── launch.json             # 调试配置文件
│   ├── settings.json           # 其他配置文件
│   └── tasks.json              # 编译任务配置文件
├── .gitignore                  # Git 忽略文件
├── .gitmodules                 # Git 的子模块
├── .clang-format               # Clang 格式化规则
├── CMakeLists.txt              # CMake 构建文件
├── README.md                   # 项目介绍
├── LICENSE                     # 许可证
├── CHANGELOG.md                # 更新日志
├── docs/                       # 文档
│   └── GitCommitGuidelines.md  # Git 提交规范
├── src/                        # 源代码
│   ├── module1/                # 模块1
│   │   ├── module1.h
│   │   └── module1.cpp
│   ├── module2/                # 模块2
│   │   ├── module2.h
│   │   └── module2.cpp
│   └── main.cpp                # 主函数
├── tests/                      # 测试代码
│   ├── module1/
│   │   └── module1_test.cpp
│   ├── module2/
│   │   └── module2_test.cpp
│   └── CMakeLists.txt
├── resource/                   # 资源文件
│   ├── config/                 # 配置文件
│   ├── images/                 # 图片文件
│   ├── sounds/                 # 音效文件
│   └── locales/                # 翻译文件
├── third_party/                # 外部依赖库
│   ├── googletest/             # Google Test源码 用于单元测试
│   └── library2/       
├── scripts/                    # 自动化脚本
└── build/                      # 构建输出目录
```
