# lazylinks
Linktree-style socials page for lazy people

## Example Usage
`python lazylinks/lazylinks.py links.yaml`

(See [deploy.yaml](.github/workflows/deploy.yaml))

## Command Help
```
usage: lazylinks.py [-h] [-s STATIC] [-o OUTPUT] [-t TEMPLATE] filename

Static links page generator

positional arguments:
  filename              Path to the yaml file of links

options:
  -h, --help            show this help message and exit
  -s STATIC, --static STATIC
                        Path to a static directory for images and css
  -o OUTPUT, --output OUTPUT
                        Path of the output directory for generated content
  -t TEMPLATE, --template TEMPLATE
                        Path of the mako template to be used
```