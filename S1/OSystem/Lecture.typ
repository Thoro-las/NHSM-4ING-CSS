#import "@THR/Wide:1.0.0": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#show: template

#text("Operating Systems", size: 4em)
#v(1fr)
#text("Disclaimer", size: 2em)\
#text([This contains lessons from Mr. Metrouh, with contents that are either added, changed or rearranged, written by HADIOUCHE Azouaou.])

#chap([Introduction])[
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
#sect("Historical Evolution Of OSs")
+ *First Generation (1950s):* The first operating systems were batch systems where the programs were processed in batches which used punch cards to enter data.
+ *Second Generation (1960s):* introduction of multiple users to share the same computing resources which inccreased productivity.
+ *Third Generation (1970s):* systems start to run interactive tasks simultaneously thus making it more efficent in tasks and the minicomputers made operating systems more accessible and affordable for small scale usages.
+ *Fourth Generation (1980-1990s):* the popularization of micro-computers and personal-computers gave more access to a wide audience and the development of networks and management of shared resources.
+ *Fifth Generation (After 2000s):* The evolution of rebost, secure and cross-platform operating systems that give the best user experience and more user-friendly services and the birth of mobile computers and laptops for portability.
