import shutil
from datetime import datetime
import yaml
import argparse
from mako.template import Template
from dotdict import dotdict
import os.path


if __name__ == "__main__":
    dir_path = os.path.dirname(os.path.realpath(__file__))
    parser = argparse.ArgumentParser(description="Static links page generator")
    parser.add_argument("filename", help="Path to the yaml file of links")           # positional argument
    parser.add_argument("-s", "--static", default="static", help="Path to a static directory for images and css")
    parser.add_argument("-o", "--output", default="output", help="Path of the output directory for generated content")
    parser.add_argument("-t", "--template", default=os.path.join(dir_path, "lazylinks.mako"), help="Path of the mako template to be used")
    args = parser.parse_args()

    raw_data = yaml.safe_load(open(args.filename).read())
    raw_data["metadata"] = {"last_updated": datetime.now()}
    data = dotdict(raw_data)

    template = Template(filename=args.template)

    if os.path.exists(args.static):
        shutil.copytree(args.static, "output", dirs_exist_ok=True)
    with open(os.path.join(args.output, "index.html"), "w") as outfile:
        outfile.write(template.render(**data))
