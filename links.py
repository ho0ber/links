import shutil
from datetime import datetime
import yaml
from mako.template import Template
from dotdict import dotdict

if __name__ == "__main__":
    raw_data = yaml.safe_load(open("links.yaml").read())
    raw_data["metadata"] = {"last_updated": datetime.now()}
    data = dotdict(raw_data)

    template = Template(filename='templates/main.mako')

    shutil.copytree("static", "output", dirs_exist_ok=True)
    with open("output/index.html", "w") as outfile:
        outfile.write(template.render(**data))

