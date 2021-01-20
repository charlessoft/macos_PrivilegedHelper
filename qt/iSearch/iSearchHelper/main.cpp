#include <stdio.h>
#include <unistd.h>
    #include <sys/types.h>
int main(int argc, char *argv[])
{
    FILE* fp = fopen("/tmp/qt_helper.txt","w");
    char szbuf[100]={0};
              sprintf(szbuf,"hello World11: uid=%d,euid=%d, pid=%d\n",         (int)getuid(),(int) geteuid(), (int) getpid());
//    sprintf(szbuf,"hello");
    fwrite (szbuf , sizeof(char), sizeof(szbuf), fp);
    fclose(fp);


    //        srpintf(szbuf,"Hello world! uid = %d, euid = %d, pid = %d\n", (int) getuid(), (int) geteuid(), (int) getpid());

            // insert code here...
//            NSLog(@"Hello, World!");
}
