#import "@THR/Sum:1.0.0": *
#show: template
#import "@preview/timeliney:0.4.0": *

#sect("Tutorial 1", level: 1)

#exr[Explain the difference between the following scheduling algorithms:
  - Round Robin Scheduling.
  - Priority Scheduling.
  - First-Come, First-Served Scheduling.
  - Shortest Job First Scheduling.
]

#ooc[
  Skipped because why not of course.
]

#exr[
  Given the following processes, the arrival and burst times are in time units, and the _time quantum_ is $3$ units.
  #align(center)[
    #set text(style: "normal")
    #table(
      columns: 3,
      table.header([Name], [Arrival Time], [Burst Time]),
      [P1], [0], [10],
      [P2], [0], [4],
      [P3], [0], [5],
      [P4], [0], [3],
      [P5], [0], [6]
    )
  ]
]

#qst[
  Drawing the Grantt Diagram for the execution of those processes in Round Robin algorithm.
]

#timeline(
  show-grid: true, 
  {
    headerline(
      group(..range(1, 11).map(n => str(3*n))),
    )
    task($P_5$, (4, 5), (7, 8))
    task($P_4$, (3, 4))
    task($P_3$, (2, 3), (6.33, 7))
    task($P_2$, (1, 2), (6, 6.33))
    task($P_1$, (0, 1), (5, 6), (8, 9.33))
  }
)

#qst[
  Calculate the turnaround and waiting time for each of the processes.
]

#align(center)[
  #set text(style: "normal")
  #table(
    columns: 3,
    table.header([Name], [Turnaround Time], [Waiting Time]),
    [P1], [29], [19],
    [P2], [19], [15],
    [P3], [21], [16],
    [P4], [12], [9],
    [P5], [24], [18]
  )
]

#qst[
  Calculate the average waiting time for the processes.
]

$"Average waiting" = (19+15+16+9+18)\/5=15.4$.

#colbreak()
#exr[
  Given the following processes, the arrival and burst times are in time units.
  #align(center)[
    #set text(style: "normal")
    #table(
      columns: 3,
      table.header([Name], [Arrival Time], [Burst Time]),
      [P1], [0], [6],
      [P2], [0], [2],
      [P3], [0], [8],
      [P4], [0], [3],
    )
  ]
]

#qst[
  Draw the Grantt diagram for the non-preemtive SJF algorithm.
]

#timeline(
  show-grid: true, 
  {
    headerline(
      group(..range(1, 11).map(n => str(2*n))),
    )
    task($P_4$, (1, 2.5))
    task($P_3$, (5.5, 9.5))
    task($P_2$, (0, 1))
    task($P_1$, (2.5, 5.5))
  }
)

#qst[
  Calculate the turnaround time and the waiting time for each process.
]

#align(center)[
  #set text(style: "normal")
  #table(
    columns: 3,
    table.header([Name], [Turnaround Time], [Waiting Time]),
    [P1], [11], [5],
    [P2], [2],  [0],
    [P3], [19], [11],
    [P4], [5],  [2],
  )
]

#qst[
  Compare the results with those obtained using FCFS algorithm.
]

By comparing the average waiting time we get that SJF has less then FCFS, thus it is better.

#ooc[
  Can't see how this conclusion is coherent, so accept it.
]

#colbreak()
#exr[
  Given the following processes, the arrival and burst times are in time units.
  #align(center)[
    #set text(style: "normal")
    #table(
      columns: 4,
      table.header([Name], [Arrival Time], [Burst Time], [Priority]),
      [P1], [1], [7], [2],
      [P2], [1], [5], [3],
      [P3], [1], [3], [1],
      [P4], [1], [2], [4],
      [P5], [1], [4], [2],
    )
  ]
  where $1$ is the highest priority and $4$ is the lowest priority.
]

#qst[
  Simulate a static priority-based scheduling.
]

#qst[
  Describe an implementation of a dynamic priority-based scheduling, where the more time a process is waiting, the more its priority increases.
]
