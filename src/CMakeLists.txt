# 收集源文件
file(GLOB_RECURSE SOURCE_FILES
    "*.cpp"
    "module1/*.cpp"
    "module2/*.cpp"
)

# 创建库目标
add_library(${PROJECT_NAME} ${SOURCE_FILES})

# 设置包含目录
target_include_directories(${PROJECT_NAME}
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
)

# 设置编译选项
target_compile_features(${PROJECT_NAME} PUBLIC cxx_std_17)

# 如果有需要链接的外部库，在这里添加
# target_link_libraries(${PROJECT_NAME} PRIVATE/PUBLIC external_lib)
