module Eval

type Value = int

type Expression =
  | Const of Value
  | Sum of Expression * Expression

let rec eval (expression: Expression) =
  match expression with
    | Const n -> n
    | Sum (a, b) -> (eval a) + (eval b)

let rec parse (expression: string) =
  

printf "%A" (eval (Const 3))
