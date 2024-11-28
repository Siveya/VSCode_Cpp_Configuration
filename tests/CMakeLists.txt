# 添加Google Test目录
add_subdirectory(${CMAKE_SOURCE_DIR}/third_party/googletest googletest-build)

# 添加测试可执行文件
file(GLOB TEST_SOURCES "*.cpp")
add_executable(test_${PROJECT_NAME} ${TEST_SOURCES})

# 链接Google Test库
target_link_libraries(test_${PROJECT_NAME} gtest gtest_main)

# 添加测试
add_test(NAME Test COMMAND test_${PROJECT_NAME})
