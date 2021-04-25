#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <openssl/md5.h>

#define LEN 32

void pb(char * buffer) {
    for (int i=0;i<MD5_DIGEST_LENGTH;i++) {
        printf("%d ",buffer[i]);
    }
    printf("\n");
}

void findone() {
    char buffer[LEN];
    for(int i=0;i<4000000;i++) {
        memset(buffer,'\0',LEN);
        sprintf(buffer,"%s%d","abc",i);
        unsigned char result[MD5_DIGEST_LENGTH];
        MD5(buffer,strlen(buffer),result);
        if ((result[0]==0) && (result[1]==0) && (result[2]<16)) {
            printf("%d : ",i);
            pb(result);
        }
    }
}

void findall() {

    // buffer to hold the string that is tested
    char buffer[LEN];

    // make a buffer for the md5 result
    unsigned char result[MD5_DIGEST_LENGTH];

    // index
    int i = 0;

    // used for finding 8 values
    int count = 0;
    
    // hold final 8 char+NULL result
    char finalresult[9];
    // clear it
    memset(finalresult,'\0',9);


    while(1) {
        // clear the buffer used to create the input
        memset(buffer,'\0',LEN);
        // create the input: prefix+number
        // sprintf will return the number of chars written
        int ll = sprintf(buffer,"%s%d","abc",i);

        // perform MD5
        MD5(buffer,ll,result);

        // check it
        // needs 5 zeros
        if ((result[0]==0) && (result[1]==0) && (result[2]<16)) {
            //printf("%d : ",i);
            sprintf(&finalresult[count],"%x",result[2]);
            //printf("%x", result[2]);
            count++;
            if (count>7) {
                //printf("\n");
                break;
            }
        }
        i++;
    }
    printf("final result %s\n",finalresult);
}

void check_strlen() {
    char buffer[32];
    memset(buffer,'\0',32);
    int ll = sprintf(buffer,"%s%d","abc",123);
    printf("%d\n",ll);
    printf("strlen %d\n",strlen(buffer));
}

int main() {
    findall();
}