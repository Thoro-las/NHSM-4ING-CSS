#import "@THR/Wide:1.0.0": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#show: template.with(
  title: "Operating Systems",
  writer: "HADIOUCHE Azouaou",
  disclaimer: [Man... Not sure if there is a course, but it follows what is supposed to be in it. Presented by Mr. METROUH. For the purposes of a better understanding of the course, a small library of operations and functions is made to run the programs that will be given in the course. A proper implementation will be found later.]
)

#set table(
  fill: (x, _) => if (x == 0) { color.oklch(95%, 12%, 190deg, 40%) },
  stroke: 0.5mm + color.oklch(66%, 60%, 190deg, 100%)
)

#show table: content => align(center)[#content]

#chapter([Operating Systems])[
  Operating System is an abstraction layer in software that goes between the user and hardware, which gives the ability to easily access the resources and the services given from the hardware layer to the software.
]

#def(name: "Operating System")[
  The OS is a set of essential programs for managing the services of a computer, which interfaces between the user and hardware and facilitates the execution of programs, those are some services
  - *Basics*: file management, user management, networking...
  - *Resource Management*: loading files, distributing processes on cores...
  - *Program Execution*: loading program in RAM and running...
  - *User Interface*: displaying graphical or command-line interfaces...
]

The usual architecture we use in this case is the Von Neumann architecture to represent the computer workarounds which can be represented in a really simple way as follows.

#align(center)[
  #box(
    inset: 5mm,
    diagram(
      edge-stroke: 1pt,
      node-corner-radius: 2pt,
      // edge-corner-radius: 8pt,
      mark-scale: 80%,

      node((0.162, 0), [
        CPU
        #v(-2mm)
        #line(length: 100%)
        #v(-2mm)
        #set align(left)
        - ALU
        - Registers
      ], width: 2.5cm, height: 2cm, stroke: rgb("#333")),

      node((0.9, 0), [
        RAM
        #v(-2mm)
        #line(length: 100%)
        #v(-2mm)
        #set align(left)
        - Kernel
        - OS
      ], width: 2cm, height: 2cm, stroke: rgb("#333")),

      node((0.5, 0.8), [I/O Devices], width: 5cm, height: 1cm, stroke: rgb("#333")),

      edge((0, 0), (1, 0), "->"),
      edge((0, 0.2), (1, 0.2), "<-"),
      edge((0, 0), (0, 0.7), "->"),
      edge((0.2, 0), (0.2, 0.7), "<-"),
      edge((0.8, 0), (0.8, 0.7), "->"),
      edge((1, 0), (1, 0.7), "<-")
    )
  )
]


#colbreak()
#section("Historical Evolution Of OSs")
+ *First Generation (1950s):* The first operating systems were batch systems where the programs were processed in batches which used punch cards to enter data.
+ *Second Generation (1960s):* introduction of multiple users to share the same computing resources which inccreased productivity.
+ *Third Generation (1970s):* systems start to run interactive tasks simultaneously thus making it more efficent in tasks and the minicomputers made operating systems more accessible and affordable for small scale usages.
+ *Fourth Generation (1980-1990s):* the popularization of micro-computers and personal-computers gave more access to a wide audience and the development of networks and management of shared resources.
+ *Fifth Generation (After 2000s):* The evolution of rebost, secure and cross-platform operating systems that give the best user experience and more user-friendly services and the birth of mobile computers and laptops for portability.

#chapter([Process Management])[
  Process management is the part of the operating system that is responsible for the creation, execution, synchronization and termination of processes. The goal is to have the best algorithms for sharing and managing the resources of the computer to maximize efficency.
]

#section("Basic Concepts")
#def(name: "Process")[
  A process is an instance or a program in execution including the binaries or scripts of the running program, also the program data like variables, heap and the execution state information like the contents of the CPU registers, the call stack.
]

The process can have the following states
#align(center)[
  #table(
    columns: 2,
    align: (left + horizon, left),
    [*New*],[the process is in the creation phase, the OS is allocating the resources and initializes the process.],
    [*Ready*],[once the 'New' phase is done, the process becomes ready to execute and waits for the CPU allocation, i.e. it is put in a queue to receive CPU time.],
    [*Running*],[the process is in the top of the queue and is being executed by the CPU.],
    [*Waiting/Blocked*],[the process is waiting for an event like a key press and it will not process until the event happens.],
    [*Terminated/Exited*],[the process has completed its execution, all the allocated resources will be freed.],
    [*Suspended/Swapped*],[the process is moved temporarily from the RAM to another memory to free some RAM for other processes.],
  )
]

#colbreak()
#v(2.5cm)

#def(name: "Process Control Block")[
  A process control block (PCB) is a data structure that the operating system relies on to manage processes, it contains all the information for controlling the process. For each process, we have a PCB that has the following main components
  - *PID*: a unique identifier integer assigned for the process.
  - *Process State*: the state of the process.
  - *Program Counter*: the address of the next instruction in memory.
  - *CPU Registers*: the value of registers in the process.
  - *Stack Pointer*: the address of the process stack.
  - *Scheduling Information:* process priority, scheduling policy...
  - *Memory Information:* process's address space, page tables...
  - *Accounting Information:* resources used by the process.
  - *Signal Information:* pending signals for the process...
]

The PCB is unique for each process and helps resume the process even after an interruption by a change of context. This part is important for multitasking.

#section("Process Scheduling")
scheduling processes aims to optimize usage of the resources by having the following objectives:
- Maximize CPU Usage
- Minimize Waiting & Response Time
- Uniform Distribution Of CPU Time
We will check some standard algorithms for process scheduling.

#subsection("Process Scheduling Algorithms")
In the scheduling information of the PCB, we have some parameters that we will use, in each algorithm we have extra information that we will give and how they are used in the algorithm.

#v(5mm)
+ *FCFS: First-Come, First-Served.*
  #table(
    columns: (25%, 75%),
    align: left + horizon,
    [*Workflow*], [the processes are executed in their order in the queue.],
    [*Pros*], [
      - easy to implement.
      - fastest execution time.
    ],
    [*Cons*], [
      - short processes may take long to execute.
      - processes blocking others from execution.
    ]
  )

#let code(title: none, link: none, code) = [
  #align(center)[
    #block(
      fill: color.rgb("#282C34"),
      inset: 3mm,
      width: 90%,
      radius: 1mm,
      code
    )
  ]
]

#code(```py
class FCFS(Algorithm):
  def preprocess(self, processes):
    return processes.sort(lambda p: p.arrival_time)

  def schedule(self, processes, time):
    return processes.dequeue()
```)

+ *SJN: Shortest Job Next.*
  #table(
    columns: (25%, 75%),
    align: left + horizon,
    [*Information*], [
      - _burst time:_ the amount of time needed to complete.
    ],
    [*Workflow*], [the processes are sorted by burst time, from shortest to longest, and then executed in this order.],
    [*Pros*], [
      - minimizes time between arrival and completion.
      - short processes are done quicker.
    ],
    [*Cons*], [
      - slower execution by the sorting.
      - more complicated to implement.
      - starvation of longer processes.
    ]
  )

+ *Priority Scheduling*

  #table(
    columns: (25%, 75%),
    align: left + horizon,
    [*Information*], [
      - _priority:_ an integer determining process priority.
    ],
    [*Workflow*], [the processes are sorted by process priority, from highest to lowest, and then executed in this order.],
    [*Pros*], [
      - prioritizes critical processes.
      - allows control on processes.
    ],
    [*Cons*], [
      - slower execution by the sorting.
      - starvation of processes with low priority.
    ]
  )

+ *RR: Round Robin*
  #table(
    columns: (25%, 75%),
    align: left + horizon,
    [*Information*], [
      - _quantum:_ fixed amount of CPU time.
    ],
    [*Workflow*], [
      each process is given a quantum in CPU time and processes are executed in rotation.
    ],
    [*Pros*], [
      - easy implementation.
      - improved response time.
      - fairness in distribution of resources to process.
    ],
    [*Cons*], [
      - efficency depends on quantum size.
    ]
  )


+ *Multilevel Queue Scheduling*
  #table(
    columns: (25%, 75%),
    align: left + horizon,
    [*Information*], [
      - _type:_ a type to categorize processes.
    ],
    [*Workflow*], [
      processes are grouped by their type and each group can have its own scheduling algorithm.
    ],
    [*Pros*], [
      - better control on processes by their types.
      - multiple algorithms can improve management.
    ],
    [*Cons*], [
      - queue management can be more complicated.
      - efficency is highly dependent on the types and the algorithms used for each type.
    ]
  )

+ *Multilevel Feedback Queue*
  #table(
    columns: (25%, 75%),
    align: left + horizon,
    [*Workflow*], [
      Similar to the multilevel queue, but processes may switch their queue depending on their behavior.
    ],
    [*Pros*], [
      - more flexible by adapting to process behavior.
      - multiple algorithms can improve management.
    ],
    [*Cons*], [
      - complicated implementation.
      - efficency is highly dependent on the types and the algorithms used for each category and extra parameters.
    ]
  )

#section([Communication & Synchronization])
Processes need to use common resources or communicate throughout their execution, thus we have multiple synchronization techniques for there not to be any overlap of usage or corruption of resources in use of those processes.

#subsection([Processes Communication])
+ *Pipes:* provide a uni-directional communication channel between processes, usually between a parent process and its children processes.
+ *Message Queues:* allows the exchange of message between processes through a messages queue.
+ *Shared Memory:* multiple processes can access the same region of memory like files and allows a fast and efficent communication.
+ *Sockets:* a socket enables communication over a network using some protocols for exchanging data such as TCP/IP or UDP.
#nte[Will be finished soon]

#subsection([Processes Synchronization])

```java
class Mutex {
  private boolean locked = false;
  
  public void lock() {
    while (locked) wait();
    locked = true;
  }
  
  public void unlock() { locked = false; }
}

public class MutexSimulation {
  static int sharedCounter = 0;
  static Mutex mutex = new Mutex();
  
  static void process(int processId) {
    mutex.lock();
    
    sharedCounter++;
    System.out.println("Process " + processId);
    System.out.println(": counter = " + sharedCounter);
    
    mutex.unlock();
  }
  
  public static void main(String[] args) {
    process(1);
    process(2);
    process(3);
    
    System.out.println("Final counter: " + sharedCounter);
  }
}
```
