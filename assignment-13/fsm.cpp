#include <iostream>
using namespace std;

enum state {
    on,
    off
};

state final_state_fsm(string& s){
    state res = off;
    for(char i : s){
        if(i == '1' && res == on){
            res = off;
        }else if(i == '1' && res == off){
            res = on;
        }
    }
    return res;
}

int main(){
    string s ;
    cin >> s;
    cout << final_state_fsm(s) << "\n";
}
