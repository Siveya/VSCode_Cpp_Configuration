#include "module1/module1.h"
#include "module2/module2.h"

int main()
{
    module1::greet("User");
    module2::greet("User");
    return 0;
}
