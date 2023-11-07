#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

extern char **environ;

void printenv(){
  int i=0;
  while (environ != NULL)
    printf("%s\n", environ[i++]);
}

int main()
{
  pid_t childPID;
  switch (childPID = fork()){
    case 0: 	// child process
      // printenv();
      exit(0);
    default:	// father process
      printenv();
      exit(0);
  }
  return 0 ;
}

