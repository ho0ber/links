import random, string


class dotdict():
    """
    Provides dot notation to a dict but still allows it to be passed as kwargs
    for templating purposes.
    """
    @staticmethod
    def _gen_id():
        return ''.join(random.choices(string.ascii_letters, k=16))

    def __init__(self, input):
        self._storage = {"_id": self._gen_id()}
        for k,v in input.items():
            if type(v) == dict:
                self._storage[k] = dotdict(v)
            elif type(v) == list:
                self._storage[k] = []
                for e in v:
                    if type(e) == dict:
                        self._storage[k].append(dotdict(e))
                    else:
                        self._storage[k].append(e)
            else:
                self._storage[k] = v

    def items(self):
        return self._storage.items()

    def keys(self):
        return self._storage.keys()
    
    def __getitem__(self, key):
        return self._storage[key]
    
    def __iter__(self):
        return self._storage.__iter__()
    
    def __getattr__(self, name):
        return self._storage[name]
