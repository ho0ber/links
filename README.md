# links
Sam's links page, using [ho0ber/lazylinks](https://github.com/ho0ber/lazylinks), a simple python package for generating links pages from YAML.

### Live at [links.sam.codes](https://links.sam.codes)

## How to use this example
Simply fork this repo and modify, or:
* create a links.yaml in the format of [links.yaml](links.yaml)
* create a `static` directory with `style.css` similar based on [static/style.css](stastic/style.css)
* `pip install git+https://github.com/ho0ber/lazylinks#egg=lazylinks`
* run `lazylinks links.yaml`

Also, see [deploy.yaml](.github/workflows/deploy.yaml) for an idea of how to deploy your static HTML.

Full tutorial can be found [on my blog](https://blog.sam.codes/lazylinks-link-pages-for-lazy-people.html).
