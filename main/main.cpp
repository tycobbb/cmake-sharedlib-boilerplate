#include <iostream>
#include "core/Module.hpp"

int main(int argc, char *argv[]){
  std::cout << Module::Foo().foo() << std::endl;
  return 0;
}
