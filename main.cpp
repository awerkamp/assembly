#include <iostream>
#include <sys/time.h>
using namespace std;

extern "C" {
    void myPuts();
    void sayHello();   
    timeval getTimeOfDay(); 
}

int main(int argc, char **argv) {

    myPuts();
    std::cout <<  "" << endl; 
    sayHello();
 
    timeval times = getTimeOfDay();
    std::cout << times.tv_sec << endl;
    std::cout << times.tv_usec << endl;

    timeval tv;

    gettimeofday(&tv, NULL);
    std::cout << tv.tv_sec << "\n";
    std::cout << tv.tv_usec << "\n";

    return 0;
}

// 