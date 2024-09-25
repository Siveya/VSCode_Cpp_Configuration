# C++_project_template

## 项目介绍：
    这是一个 C++ 项目模板，参考了其他项目工程并根据自己习惯总结出来，用于快速搭建 C++ 项目。

## 项目结构：

```shell
C++_project_template/
├── .gitignore                  # Git 忽略文件
├── CMakeLists.txt              # CMake 构建文件
├── README.md                   # 项目介绍
├── LICENSE                     # 许可证
├── CHANGELOG.md                # 更新日志
├── docs/                       # 文档
│   ├── GitCommitGuidelines.md  # Git 提交规范
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
│   ├── library1/       
│   └── library2/       
├── scripts/                    # 自动化脚本
└── build/                      # 构建输出目录
```
