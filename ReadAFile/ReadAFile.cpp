//
//  ReadAFile.cpp
//  Bill Feng
//  Ver. 1.0
//  Created by Bill Feng on 10/8/16.
//  Copyright © 2016 Bill Feng. All rights reserved.
//

#include <iostream> //input output stream
#include <fstream>  //file stream
#include <iomanip>
using namespace std;

int main() {
    char filename[] = "/Users/BingBao/Desktop/Balances.txt";
    int acct;
    char name[1000] = "";
    double bal;
    double total= 0;
    int accCounter = 0;
    ifstream infile(filename);  //open file
    
    if(infile.fail()) {
        cout << "Unable to open " << filename << endl << endl;
        system("Pause");
        return 1;
    }
    infile >> acct >> name >> bal;  //read first record
    while (!infile.eof() ) {
        accCounter++;
        total += bal;
        cout << acct << "\t" << name << "\t" << bal << endl;
        infile >> acct >> name >> bal;  //read next record
    }
    cout << fixed << showpoint;
    cout << "\nTotal balance is: "   << setprecision(2) << total << endl;
    cout << "Average balance is: "   << setprecision(0) << total / accCounter << endl;
    infile.close();
    
    system("Pause");
    return 0;
}
