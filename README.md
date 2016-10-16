[![Code Climate](https://codeclimate.com/github/ltran/middleman/badges/gpa.svg)](https://codeclimate.com/github/ltran/middleman)
[![Test Coverage](https://codeclimate.com/github/ltran/middleman/badges/coverage.svg)](https://codeclimate.com/github/ltran/middleman/coverage)
[![Issue Count](https://codeclimate.com/github/ltran/middleman/badges/issue_count.svg)](https://codeclimate.com/github/ltran/middleman)
# middleman

URL Shortener written in Crystal.

## Installation


Optional:
```bash
$ curl -L https://raw.github.com/pine/crenv/master/install.sh | bash
$ echo 'export PATH="$HOME/.crenv/bin:$PATH"' >> ~/.bash_profile
$ echo 'eval "$(crenv init -)"' >> ~/.bash_profile
$ exec $SHELL -l
$ crenvn -v
```

Install Crystal Build
```
$ git clone https://github.com/pine/crystal-build.git ~/.crenv/plugins/crystal-build
```

Install Crystal by crenv
```bash
$ crenv install 0.19.0 # install Crystal
$ crenv global 0.19.0 # set global Crystal version
$ crenv rehash

$ crystal --version
Crystal 0.19.0 (2016-09-02)

$ shards --version
Shards 0.6.3 (2016-09-02)
```

## Usage

Run without compiling
```bash
crystal ./src/middleman.cr
```

Compiling
```bash
crystal build ./src/middleman.cr
crystal build -d ./src/middleman.cr  # debug mode
```

Running Compiled Project
```bash
./middleman
```

## Development

TODO: Write test.

## Contributing

1. Fork it ( https://github.com/ltran/middleman/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [[ltran]](https://github.com/ltran) Louis Tran - creator, maintainer
