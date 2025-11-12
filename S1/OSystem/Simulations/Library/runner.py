from abc import ABC, abstractmethod
from queues import Queue


class Process:
    def __init__(self, id, arrival_time, burst_time):
        self.id = id
        self.arrival_time = arrival_time
        self.burst_time = burst_time

        self.running_time = 0
        self.done = False


class Algorithm(ABC):
    @abstractmethod
    def preprocess(self, processes: Queue):
        return processes

    @abstractmethod
    def schedule(self, processes: Queue, time):
        pass


def run(processes: Queue, algorithm: Algorithm):
    if (processes.empty()):
        print("No processes given")
        return

    time = 0
    processes = algorithm.preprocess(processes)

    while not all(process.done for process in processes):
        current = algorithm.schedule(processes, time)

        while current is None:
            current = algorithm.schedule(processes, time)

        print(f"Running: {current.id}")

        current.running_time += 1
        if (current.running_time >= current.burst_time):
            print(f"Done: {current.id}")
            current.done = True
            processes.remove(current)

        time = time + 1

    print("Done")
