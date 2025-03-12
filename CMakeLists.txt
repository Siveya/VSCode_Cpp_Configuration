# 指定构建项目所需的最低 CMake 版本
cmake_minimum_required(VERSION 3.12)

# 设置项目名称和版本
project(Template
    VERSION 1.0.0
    DESCRIPTION "A modern C++ project template"
    LANGUAGES CXX)

# 指定 C++ 标准
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# 编译选项
option(TEMPLATE_BUILD_TESTS "Build tests" ON)
option(TEMPLATE_BUILD_EXAMPLES "Build examples" ON)
option(TEMPLATE_BUILD_BENCHMARKS "Build benchmarks" OFF)
option(TEMPLATE_ENABLE_WARNINGS "Enable warnings" ON)
option(TEMPLATE_BUILD_SHARED "Build shared library" OFF)

# 设置默认构建类型
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Debug")
endif()

# 编译器警告
if(TEMPLATE_ENABLE_WARNINGS)
    if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
        add_compile_options(-Wall -Wextra -Wpedantic -Werror)
    elseif(MSVC)
        add_compile_options(/W4 /WX)
    endif()
endif()

# MSVC 特定设置
if(MSVC)
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /MTd")
    set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} /MTd")
endif()

# 添加子目录
add_subdirectory(src)

# 创建可执行文件
add_executable(${PROJECT_NAME}_exe src/main.cpp)
target_link_libraries(${PROJECT_NAME}_exe PRIVATE ${PROJECT_NAME})
set_target_properties(${PROJECT_NAME}_exe PROPERTIES OUTPUT_NAME ${PROJECT_NAME})

# 预编译头文件
target_precompile_headers(${PROJECT_NAME}
    PUBLIC
        include/pch.h
)

if(TEMPLATE_BUILD_TESTS)
    enable_testing()
    add_subdirectory(tests)
endif()

if(TEMPLATE_BUILD_EXAMPLES)
    add_subdirectory(examples)
endif()

if(TEMPLATE_BUILD_BENCHMARKS)
    add_subdirectory(benchmarks)
endif()

# 安装配置
include(GNUInstallDirs)
install(TARGETS ${PROJECT_NAME} ${PROJECT_NAME}_exe
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

# 导出配置
install(DIRECTORY include/
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}
    FILES_MATCHING PATTERN "*.h" PATTERN "*.h"
)

# 生成并安装 CMake 配置文件
include(CMakePackageConfigHelpers)
write_basic_package_version_file(
    "${PROJECT_NAME}ConfigVersion.cmake"
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion
)
