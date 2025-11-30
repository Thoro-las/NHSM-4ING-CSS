import time

class Mutex:
    def __init__(self):
        self.available = True

    def acquire(self):
        while not self.available:
            time.sleep(0.1)
        self.available = False

    def release(self):
        self.available = True


lock = Mutex()
data = {
    "value": "Hello"
}
