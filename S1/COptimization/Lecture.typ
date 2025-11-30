#import "@THR/Wide:1.0.0": *
#show: template.with(
  title: "Combinatorial Optimization",
  writer: "HADIOUCHE Azouaou",
  disclaimer: [
    That typed course follows the course Pr.YAGOUNI.
  ]
)

#chapter("Introduction")[]

#def(name: "Information")[
  An _information_ is the set of data, formulas, rules, results... etc., which results in knowledge and should be interesting, logical, complete, premise... etc.
]

An information goes through the a treatment, for example if we take a rectangle with width $W = 50m$ and height $H = 20m$, to calculate the surface with the formula $S = W dot.c H$ and using it we get $S = 1000m^2$, and each step is information of different types

#align(center)[
  #table(
    columns: 3,
    align: center + horizon,
    [ $W=50m$ \ $H=20m$ ], 
    [ $S = W dot.c H$ ], 
    [ $S = 1000m^2$ ], 
    [ info. to treat ], 
    [ treating info. ], 
    [ treated info. ]
  )
]

#def(name: "Algorithm")[
  An _algorithm_ is a finite sequence of steps that are: elementary, complementary, logical, chronological and non-ambiguous, that transforms a string representing the data to a string representing a solution, a set of solutions or the non-existence of solutions.
]

Each algorithm has one or many stop condition, taking for example a search algorithm on a list to find the minimum value, the stop condition would be that we passed through all the items of the list, or if we look for some value val, its either passing through all the items of the list or finding the value val.

// For a given problem $(cal(P))$, we make an algorithm $cal(A)$ to solve $(cal(P))$, that is an algorithm given any instance $I$ of $(cal(P))$, it returns a solution. The algorithm has the multiple components which include:
// - Constants & Variables:
//   - Constant: a value that stays unchanged throughout the treatment.
//   - Variable: a memory case that can save a value and admits a change through the treatment.
// - Affectations ($:=$): changing the value of a variable.
// - Tests:
//   - Simple Test (if block): a condition only containing the if block
//     #code(```pcode
//       if (condition) 
//         then <action-1>;
//              <action-2>;
//              ...
//              <action-n>
//       end
//     ```)
//   - Complete Test (if-else block): a condition containing both if and else
//     #code(```pcode
//       if (condition) 
//         then <action1>;
//         else <action2>;
//       end
//     ```)
//   - Complete Composed Test (if-else if-else block): a condition containing if, else, and a set of else if statements
//     #code(```pcode
//       if (condition1)
//         then <action1>;
//       else
//         if (condition2)
//           then <action2>;
//         else 
//           <action3>;
//         end
//       end
//     ```)
// #colbreak()
// - Loops:
//   - For Loop
//     #code(```pcode
//       for i = 1 to n do
//         <action>;
//       end
//     ```)
//
//
