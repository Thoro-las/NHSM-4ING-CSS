#import "@preview/zap:0.4.0"

#import "@THR/Wide:1.0.0": *
#show: template

#mainpage([Theory Of Computer Arithmetic], [HADIOUCHE Azouaou], [Oudjida])

#chap("Classical logic")[
  The most basic part of executing a computation on a machine is to describe the most basic information, which is true/false, and then compose them into a statement or a proposition.
]

informally, given a sentence, it is said to be a _statement_ if
- its declaritive, either affirmative or negative.
- its possible truth values are true or false.
- its verifiable in reality.

on those statements, we have some rules to give them truth values
- law of identity: $A=A$ is a true statement.
- law of non-contradiction: $not (A and not A)$ is false statement.
- law of excluded middle: either $not A$ or $A$ is true statement.

#sect("Transistors")
One of the biggest advancements in our modern world is the creation of a transistor, in principle the idea is simple, a transistor is simply an electrically affected button. It is represented as follows in electrical circuits

multiple basic operations can be made using these transistors, from a baasic memory to some logic gates and then bigger sequential circuits.

- AND OR NOT
- NOR XOR
- Data Latch
