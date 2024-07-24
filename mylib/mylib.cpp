#include "includes/mylib.h"
#include <iostream>

int nativeAdd(int a, int b)
{
    return a + b;
}

void load()
{
    std::cout << "mylib load" << std::endl;
}