# cookiecutter-example [![Build Status](https://travis-ci.org/henrahmagix/cookiecutter-example.svg?branch=master)](https://travis-ci.org/henrahmagix/cookiecutter-example)

An example [Cookiecutter](https://github.com/audreyr/cookiecutter) to show usage, options, and output.

See the `expected/` folder for expected output.

## Quick start

Install cookiecutter
```shell
pip install cookiecutter
```

Run this example with custom options
```shell
cookiecutter gh:henrahmagix/cookiecutter-example
# You will be prompted for values
```

Run this example with default options
```shell
cookiecutter --no-input gh:henrahmagix/cookiecutter-example
```

## Test

Follow the `install` and `script` commands in `.travis.yml`.

To run the tests again, make sure to remove the generated `myfolder` folder.
