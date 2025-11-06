class Process:
    def __init__(self, id, arrival_time, burst_time):
        self.id = id
        self.arrival_time = arrival_time
        self.burst_time = burst_time

    def __str__(self):
        return f"Process {self.id}:\n" \
            + f" |> Arrival Time: {self.arrival_time}\n" \
            + f" |> Burst Time: {self.burst_time}\n"


def runSJF(queue):
    queue.sort(key=lambda process: process.burst_time)

    time = 0
    runtime = 0
    current = queue.pop(0)

    while (True):
        if (current is None) or (runtime + 1 < current.burst_time):
            runtime = runtime + 1
        else:
            runtime = 0
            current = queue.pop(0) if len(queue) > 0 else None
            if (current is None):
                break

            print(f"[{str(time).rjust(4)}] Chaging to Process {current.id}")

        print(f"[{str(time).rjust(4)}] Running Process {current.id}")
        time = time + 1


queue = []
queue.append(Process(123, 13, 6))
queue.append(Process(336, 5, 1))
queue.append(Process(911, 11, 15))
runSJF(queue)
