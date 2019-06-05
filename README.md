# xivapi-cr

An unofficial Crystal library for [XIVAPI](https;//xivapi.com).

This library tries to stay as close to the [ruby library](https://github.com/xivapi/xivapi-ruby) as possible.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     xivapi:
       github: freyamade/xivapi-cr
   ```

2. Run `shards install`

## Usage

```crystal
require "xivapi"

# Basic Configuration (just initialize with the API Key)
client = XIVAPI::Client.new "abc123"

# Advanced Configuration
client = XIVAPI::Client.new "abc123", language: "en", poll_rate: 5
```

### Response Data
Unlike Ruby, Crystal does not have an OpenStruct type, so structs have been defined for all of the various schemas in the API.
Similar to the Ruby lib, there will be an `XIVAPI::Paginator` object, that will be used for requests that return multiple results.
This paginator will be `Enumerable` and will have the methods that are associated with being `Enumerable` like `first`, `each`, `map`, `to_a`, etc.

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/freyamade/xivapi-cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [freyamade](https://github.com/freyamade) - creator and maintainer
- [Arthan](https://github.com/ArthanJans) - maintainer
