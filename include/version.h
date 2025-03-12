#pragma once

#define TEMPLATE_VERSION_MAJOR 1
#define TEMPLATE_VERSION_MINOR 0
#define TEMPLATE_VERSION_PATCH 0

#define TEMPLATE_VERSION_STRING "1.0.0"

namespace Template {
struct Version
{
    static constexpr int major = TEMPLATE_VERSION_MAJOR;
    static constexpr int minor = TEMPLATE_VERSION_MINOR;
    static constexpr int patch = TEMPLATE_VERSION_PATCH;

    static constexpr const char* string = TEMPLATE_VERSION_STRING;

    static constexpr bool isAtLeast(int majorReq, int minorReq = 0, int patchReq = 0)
    {
        return (major > majorReq) ||
               (major == majorReq && minor > minorReq) ||
               (major == majorReq && minor == minorReq && patch >= patchReq);
    }
};
}  // namespace Template
