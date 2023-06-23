from mako.template import Template
import yaml
from types import SimpleNamespace
from dotdict import dotdict
from pathlib import Path
from shutil import copytree

if __name__ == "__main__":
    raw_data = yaml.safe_load(open("links.yaml").read())
    data = dotdict(raw_data)

    template = Template(filename='templates/main.mako')

    copytree("static", "output", dirs_exist_ok=True)
    with open("output/index.html", "w") as outfile:
        outfile.write(template.render(**data))

