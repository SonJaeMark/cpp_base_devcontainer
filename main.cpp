#include <iostream>
#include <string>

#include "lib/hello.h"

using namespace std;

int main() {
    hello("Mark");
    hello("Mark");
    hello("Mark");

    int weekPerSem = 18;
    float firstSemGrade = 93.9;
    char gender = 'M';
    string name = "Mark Jayson Lanuzo";
    bool isEnrolled = true;
    string str(1, gender);

    cout<< name + " grades: " + to_string(firstSemGrade) + " gender: " + str + " is enrolled " + to_string(isEnrolled)<<endl;
    cout<< "Week per sem: " + to_string(weekPerSem) <<endl;

    return 0;
}
