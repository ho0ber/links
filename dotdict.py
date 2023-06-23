class dotdict(dict):
    """
    Provides dot notation to a dict but still allows it to be passed as kwargs
    for templating purposes.
    """
    def __init__(self, input):
        for k,v in input.items():
            if type(v) == dict:
                self[k] = dotdict(v)
            elif type(v) == list:
                self[k] = []
                for e in v:
                    if type(e) == dict:
                        self[k].append(dotdict(e))
                    else:
                        self[k].append(e)
            else:
                self[k] = v

    def __getattr__(self, name):
        return self[name]
