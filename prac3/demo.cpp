#include <iostream>

int main()
{
    uint8_t indexToLHR = (uint8_t) 0xAE46 & 0x7F;
    std::cout << 0xAE46 << '\n';

    std::cout << indexToLHR << '\n'; // formally implementation-defined, typically 0
}