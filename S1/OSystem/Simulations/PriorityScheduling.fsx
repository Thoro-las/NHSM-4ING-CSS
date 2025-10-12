type Process = {
  PID: int;
  Name: string;

  ArrivalTime: int;
  BurstTime: int;

  Priority: int;
}

let processes: Process list = [
  { PID = 312;  Name = "A";  ArrivalTime = 1; BurstTime = 10; Priority = 3; }
  { PID = 1214; Name = "B";  ArrivalTime = 2; BurstTime =  1; Priority = 1; }
  { PID = 4142; Name = "A1"; ArrivalTime = 4; BurstTime =  8; Priority = 5; }
  { PID = 912;  Name = "A2"; ArrivalTime = 6; BurstTime = 12; Priority = 7; }
]

let staticScheduling (processes: Process list) =
