#include <iostream>
using namespace std;

extern "C" {
    void sayHello();    
}


int main(int argc, char **argv) {

    sayHello();

    return 0;

}