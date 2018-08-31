//
// Student_Class.cpp : Defines the entry point for the console application.
//
//  studentClass
//
//  Created by Bill Feng on 11/6/16.
//  Copyright © 2016 Bill Feng. All rights reserved.
//  Version 1.0

#include <iostream>
#include <iomanip>
#include "Student.h"
using namespace std;

// define an array of students
Student CIS054[] = {
    Student ("Joe Williams",        44536, 3.4, "CIS"),
    Student ("Sally Washington",    55458, 3.7, "CIS"),
    Student ("Fred MacIntosh",      66587, 2.9, "CIS"),
    Student ("Jose De La Cruz",     67892, 3.5, "CIS"),
    Student ("777 Dan McElroy",     77777, 4.0, "CIS"),
    Student ("Thinh Nguyen",        73657, 3.6, "CIS")
};

Student ENGLISH[] = {
    Student ("Emma Watson",         00001, 4.0, "ENGLISH"),
    Student ("Emma Stone",          00002, 4.0, "ENGLISH"),
    Student ("Scarlett Johansson",  00003, 4.0, "ENGLISH"),
    Student ("Jennifer Lawrence",   00004, 4.0, "ENGLISH"),
    Student ("Angelina Jolie",      00005, 4.0, "ENGLISH"),
    Student ("Elizabeth Taylor",    00006, 4.0, "ENGLISH")
};




int main(int argc, char* argv[])
{
    int NumberOfStudents = sizeof(CIS054)/sizeof(Student);
    
    // Display the header line
    // List all the students in the course
    cout << "  ID #   Name" << setw(23) << "Major" << endl;
    cout << "====================================" << endl;
    
    for (int i=0; i<NumberOfStudents; i++) {
        string tmp = CIS054[i].getName();
        long length = tmp.length();
        cout << "  " << CIS054[i].getIdNumber() << "  " << CIS054[i].getName() << setw(25.0 - length) << CIS054[i].getMajor() <<endl;
    }
    cout << endl;   // blank line after displaying the student names
    
    // compute the average gpa of all the students
    double total=0;
    for (int i=0; i<NumberOfStudents; i++)
        total += CIS054[i].getGpa();
    double average = total / NumberOfStudents;
    cout << "  " << "The average GPA of all the students is " << average << endl << endl;
    return 0;
}
