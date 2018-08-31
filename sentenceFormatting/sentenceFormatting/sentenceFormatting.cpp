//
//  sentenceFormatting.cpp
//  sentenceFormatting
//
//  Created by Bill Feng on 10/23/16.
//  Copyright © 2016 Bill Feng. All rights reserved.
//  Ver. 1.0

#include <iostream>
#include <cctype>
using namespace std;

void sentenceReformate(string sentence) {
    int i;
    for(i = 0; sentence[i]; i++) {
        if(isspace(sentence[i])) {
            sentence[i] = ' ';
        }
    }
    i = 0;
    while(sentence[i] == ' ') {
        for(int j = i; sentence [j]; j++) {
            sentence[j] = sentence[j+1];
        }
    }
    
    i =0;
    while(sentence[i] != '\0') {
        if(sentence[i] == ' ' && sentence[i+1] == ' ')
            for(int j = i; sentence [j]; j++) {
                sentence[j] = sentence[j+1];
            }
        else
            i++;
    }
    sentence[0] = toupper(sentence[0]);
    
    for(int i = 1; sentence[i]; i++) {
        sentence[i] = tolower(sentence[i]);
    }
    cout << sentence << endl;
    
}

int main(int argc, const char * argv[]) {
    
    char sentence[100];
    cout << "Enter a sentence:" << endl;
    cin.getline(sentence, 100);

    sentenceReformate(sentence);
    
    return 0;
}
