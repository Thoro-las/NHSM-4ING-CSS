#import "@THR/Sum:1.0.0": *
#show: template
#import "@preview/timeliney:0.4.0": timeline

#sect("Tutorial 1", level: 1)

#exr[Explain the difference between the following scheduling algorithms:
  - Round Robin Scheduling.
  - Priority Scheduling.
  - First-Come, First-Served Scheduling.
  - Shortest Job First Scheduling.
]

#exr[
  Given the following processes, the arrival and burst times are in time units, and the _time quantum_ is $3$ units.
  #align(center)[
    #set text(style: "normal")
    #table(
      columns: 3,
      table.header([Name], [Arrival Time], [Burst Time]),
      [P1], [1], [10],
      [P2], [2], [4],
      [P3], [3], [5],
      [P4], [4], [3],
      [P5], [5], [6]
    )
  ]
]

#qst[
  Drawing the Grantt Diagram for the execution of those processes in Round Robin algorithm.
]

#qst[
  Calculate the turnaround and waiting time for each of the processes.
]

#qst[
  Calculate the average waiting time for the processes.
]

#exr[
  Given the following processes, the arrival and burst times are in time units.
  #align(center)[
    #set text(style: "normal")
    #table(
      columns: 3,
      table.header([Name], [Arrival Time], [Burst Time]),
      [P1], [1], [6],
      [P2], [1], [2],
      [P3], [1], [8],
      [P4], [1], [3],
    )
  ]
]

#qst[
  Draw the Grantt diagram for the non-preemtive SJF algorithm.
]

#qst[
  Calculate the turnaround time and the waiting time for each process.
]

#qst[
  Compare the results with those obtained using FCFS algorithm.
]

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
