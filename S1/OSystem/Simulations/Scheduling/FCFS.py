class Process:
    def __init__(self, id, arrival_time, burst_time):
        self.id = id
        self.arrival_time = arrival_time
        self.burst_time = burst_time

    def __str__(self):
        return f"Process {self.id}:\n" \
            + f" |> Arrival Time: {self.arrival_time}\n" \
            + f" |> Burst Time: {self.burst_time}\n"


def runFCFS(queue):
    queue.sort(key=lambda process: process.arrival_time)

    time = 0
    runtime = 0
    current = queue.pop(0)

    while (True):
        if (runtime + 1 < current.burst_time):
            runtime = runtime + 1
        else:
            runtime = 0
            current = queue.pop(0) if len(queue) > 0 else None
            if (current is None):
                break

            print(f"[{time}] Chaging to Process {current.id}")

        print(f"[{time}] Running Process {current.id}")
        time = time + 1


queue = []
queue.append(Process(123, 2, 5))
queue.append(Process(336, 1, 7))
queue.append(Process(911, 11, 3))
runFCFS(queue)
