//#include <stdio.h>
//#include <stdlib.h>
//#include <time.h>

#define MAX_SAMPLES 10000  // Maximum number of samples
#define FIR_FILTER_SIZE 5 // FIR filter size
#define HIGH_THRESHOLD 12// Upper threshold for Schmitt trigger
#define LOW_THRESHOLD 11  // Lower threshold for Schmitt trigger

#define N 5


int out=0; // trigger out 
int area = 0; // area value
int rddata[5] = {-1, 2, 1 , 3, 1};

int getData(){
    //srand(time(NULL));
    // Generate a random number between -3 and 20
    static int count = 0;
    if(count==4){count=0;}else{count++;};
    return rddata[count];//rand() % 24 - 3; // 24 is the range (20 - (-3) + 1)
}


int FIR(int in){
    //printf("Register Stack 2\n");

    register int coeff0=1, coeff1= 2, coeff2=4, coeff3=2, coeff4=1; // FIR coefficient
    static int val0 = 0, val1 = 0, val2 = 0, val3 = 0, val4 = 0; // FIR shared values

    
    int current=0;

    val0=val1;
    val1=val2;
    val2=val3;
    val3=val4;
    val4=in;

    current += coeff0 * val0;
    current += coeff1 * val1;
    current += coeff2 * val2;
    current += coeff3 * val3;
    current += coeff4 * val4;

    return current;
}


void trigger(int in){
    //printf("Register Stack 3\n");

    if (out == 0 && in > HIGH_THRESHOLD){
        out=1;
    }
    else if ( out == 1 && in < LOW_THRESHOLD){
        out=0;
    }
}

void pulse_area(int in){
    //printf("Register Stack 4\n");
    static int start = 0; // area comp flag

    if (out == 1) {
        if (start == 0) start = 1; // Start of impulse
        area += in;          // Accumulate area
    } else if (start !=  1) {
        // End of impulse
        start = -1;
        area = 0;
    }
}


int main() {
    //printf("Register Stack 0\n");
    register int currentSample, filtered_sample;  // sample treated in loop
    register int count = 0;

    while (count < MAX_SAMPLES)  { 
        currentSample = getData();
        filtered_sample = FIR(currentSample);
        trigger(filtered_sample); 
        pulse_area(filtered_sample);

        //printf("%03d %03d %03d %03d\n", currentSample, filtered_sample, out, area);
        count++;
    }
    return 0;
}

