class Queue:
    def __init__(self, processes):
        self._queue = processes

    def __iter__(self):
        return iter(self._queue)

    def __repr__(self):
        return f"Queue: {list(self._queue)}"

    def __len__(self):
        return len(self._queue)

    def empty(self):
        return len(self) == 0

    def sort(self, key, reverse=False):
        if not self.empty():
            self._queue.sort(key=key, reverse=reverse)
        return self

    def enqueue(self, item):
        self._queue.append(item)

    def dequeue(self):
        if self.empty():
            return None
        return self._queue.pop(0)

    def remove(self, item):
        if item in self._queue:
            self._queue.remove(item)
        return self
