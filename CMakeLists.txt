# 指定构建项目所需的最低 CMake 版本
cmake_minimum_required(VERSION 3.12)
# cpp_project_template 为项目名
project(cpp_project_template)

# 要求使用 C++14 标准
set(CMAKE_CXX_STANDARD 14)
# 编译器不支持则报错
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 设置构建类型（Debug或Release）
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug)
endif()

# src目录中的源文件,GLOB_RECURSE表示递归子目录
FILE(GLOB_RECURSE SOURCE_FILES "src/*.cpp")

# 创建一个可执行文件，包含所有找到的源文件
add_executable(${PROJECT_NAME} ${SOURCE_FILES})

# 添加头文件的路径到编译器的搜索路径中
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_SOURCE_DIR}/src)


# 启用测试支持
enable_testing()

# 添加测试目录
add_subdirectory(tests)