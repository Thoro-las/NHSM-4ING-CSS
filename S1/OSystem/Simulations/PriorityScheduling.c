#include <stdio.h>
#include <time.h>

typedef struct {
  int PID;

  int arrival_time;
  int burst_time;

  int priority;
} Process;

typedef struct {
  Process process;

  int waiting_time;
  int turnaround_time;
} ExecutionResult;

ExecutionResult static_priority(Process* processes, int n) {
  printf("This is executed\n");
}

void execution_time(void (*fun)(Process*, int), Process* processes, int n) {
  int start = clock();
  fun(processes, n);
  int stop = clock();
  printf("Took: %d clock(s) with %d CPS\n", stop - start , CLOCKS_PER_SEC);
}

void main() {
  Process processes[] = {
    { 123, 1, 12, 1 },
    {  13, 2,  8, 1 },
    { 183, 2,  7, 2 },
  };

  int n = sizeof(processes) / sizeof(Process);

  execution_time(&static_priority, processes, n);
}
