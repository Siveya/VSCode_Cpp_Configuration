#pragma once

// 定义导出宏
#if defined(_MSC_VER)
#define TEMPLATE_EXPORT __declspec(dllexport)
#define TEMPLATE_IMPORT __declspec(dllimport)
#elif defined(__GNUC__)
#define TEMPLATE_EXPORT __attribute__((visibility("default")))
#define TEMPLATE_IMPORT
#else
#define TEMPLATE_EXPORT
#define TEMPLATE_IMPORT
#endif

#ifdef TEMPLATE_BUILD_SHARED
#ifdef TEMPLATE_EXPORTS
#define TEMPLATE_API TEMPLATE_EXPORT
#else
#define TEMPLATE_API TEMPLATE_IMPORT
#endif
#else
#define TEMPLATE_API
#endif
