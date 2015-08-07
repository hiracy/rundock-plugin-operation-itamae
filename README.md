# Rundock::Plugin::Operation::Itamae

[Rundock](https://github.com/hiracy/rundock) plugin for [itamae](https://github.com/itamae-kitchen/itamae) operation.

## Installation

```
$ gem install rundock
```

```
$ gem install rundock-plugin-operation-itamae
```

## Usage

Edit your operation scenario to "[scenario.yml](https://github.com/hiracy/rundock/blob/master/scenario_sample.yml)" like this sample.

```
- node: anyhost-01
  itamae:
    - /local/path/to/nginx.rb             # itamae recipe
    - /local/path/to/mysql.rb
    - node_json: /local/path/to/attr.js   # itamae --node-json option
      log_level: info                     # you can use itamae any options here
---
anyhost-01:                               # see rundock options(https://github.com/hiracy/rundock/blob/master/README.md)
  host: 192.168.10.11
  ssh_opts:
    port: 22
    user: anyuser
    key:  ~/.ssh/id_rsa
```

and execute rundock.

    $ rundock do /path/to/your-dir/scenario.yml

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rundock-plugin-operation-itamae/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

