# 添加 Google Test 目录
add_subdirectory(${CMAKE_SOURCE_DIR}/third_party/googletest googletest-build)

# 包含测试模块，生成 DartConfiguration.tcl
include(CTest)

# 添加测试可执行文件
add_executable(unit_tests
    main_test.cpp
    module1_test.cpp
    module2_test.cpp
)

# 链接依赖库
target_link_libraries(unit_tests
    PRIVATE
        ${PROJECT_NAME}
        gtest
        gtest_main
)

# 添加测试
include(GoogleTest)
gtest_discover_tests(unit_tests)
