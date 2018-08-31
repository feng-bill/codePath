//
//  main.cpp
//  SearchStructBinary
//
//  Created by Bill Feng on 11/6/16.
//  Copyright © 2016 Bill Feng. All rights reserved.
//  Ver 1.0

// Search_Struct_Binary.cpp
//
#include <iostream>
using namespace std;

typedef struct S_STATE_LIST {
    char Abbreviation[3];
    char StateName[15];
    
} States;

States StateList [] = {
    {"AK", "Alaska"}, {"AL", "Alabama"}, {"AR", "Arkansas"}, {"AZ", "Arizona"},
    {"CA", "California"}, {"CO", "Colorado"}, {"CT", "Connecticut"}, {"DE", "Delaware"},
    {"FL", "Florida"}, {"GA", "Georgia"}, {"HI", "Hawaii"}, {"IA", "Iowa"}, {"ID", "Idaho"},
    {"IL", "Illinois"}, {"IN", "Indiana"}, {"KS", "Kansas"}, {"KY", "Kentucky"},
    {"LA", "Louisiana"}, {"MA", "Massachusetts"}, {"MD", "Maryland"}, {"ME", "Maine"},
    {"MI", "Michigan"}, {"MN", "Minnesota"}, {"MO", "Missouri"}, {"MS", "Mississippi"},
    {"MT", "Montana"}, {"NC", "North Carolina"}, {"ND", "North Dakota"}, {"NE", "Nebraska"},
    {"NH", "New Hampshire"}, {"NJ", "New Jersey"}, {"NM", "New Mexico"}, {"NV", "Nevada"},
    {"NY", "New York"}, {"OH", "Ohio"}, {"OK", "Oklahoma"}, {"OR", "Oregon"},
    {"PA", "Pennsylvania"}, {"RI", "Rhode Island"}, {"SC", "South Carolina"},
    {"SD", "South Dakota"}, {"TN", "Tennessee"}, {"TX", "Texas"}, {"UT", "Utah"},
    {"VA", "Virginia"}, {"VT", "Vermont"}, {"WA", "Washington"}, {"WI", "Wisconsin"},
    {"WV", "West Virginia"}, {"WY", "Wyoming"}
};

int main(int argc, char* argv[])
{
    int length = 50;
    char Selection[10];
    cout << "Enter the state abbreviation: ";
    cin  >> Selection;
    
    // Binary Search
    int imin = 0;           // start index for the current search
    int imax = length-1;    // end index for the current search
    int imid;               // midpoint for roughly equal parts
    int tries=0;            // counter to see efficency
    bool found = false;
    
    while ( imax >= imin && !found )
    {
        tries++;
        imid = (imin + imax) / 2;
        if ( strcmp(Selection, StateList[imid].Abbreviation) == 0 )  // found
        {
            found = true;
        }
        // if need to go lower, change upper limit to search lower subarray
        else if ( strcmp(Selection, StateList[imid].Abbreviation) < 0 )
        {
            imax = imid - 1;
        }
        // if need to go higher, change lower limit to search upper subarray
        else
        {
            imin = imid + 1;
        }
    }
    if (found)
        cout << StateList[imid].StateName << " in " << tries << " tries" << endl;
    else
        cout << "Not Found" << endl;
    return 0;
}

