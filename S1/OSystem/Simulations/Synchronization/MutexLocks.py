import time
import threading


def current(): return threading.current_thread().name


class Mutex:
    def __init__(self):
        self.available = True

    def acquire(self):
        while not self.available:
            time.sleep(0.1)

        print(f"[{current()}] Acquired Lock")
        self.available = False

    def release(self):
        print(f"[{current()}] Released Lock")
        self.available = True


lock = Mutex()
data = {
    "value": "Hello"
}
