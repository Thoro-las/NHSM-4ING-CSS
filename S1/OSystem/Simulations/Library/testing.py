from runner import Algorithm, Process, run
from queues import Queue


class FCFS(Algorithm):
    def preprocess(self, processes: Queue):
        return processes.sort(lambda p: p.arrival_time)

    def schedule(self, processes, time):
        return processes.dequeue()


processes = Queue([
    Process(123, 1, 10),
    Process(133, 3, 6),
    Process(153, 2, 4),
])

run(processes, FCFS())
