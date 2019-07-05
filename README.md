# xivapi-cr

An unofficial Crystal library for [XIVAPI](https;//xivapi.com), written by a couple of people who like Final Fantasy XIV and Crystal!

## Table Of Contents
- [Installation]()
- [Usage]()
    - [Character]()
        - [`character_search`]()
        - [`character`]()
        - [`character_verify`]()
        - [`character_update`]()
    - [Free Company]()
    - [Linkshell]()
    - [Lodestone]()
    - [Market]()
    - [Other]()
    - [PvP Team]()
    - [Servers]()
- [Development]()
- [Contributing]()
- [Contributors]()

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     xivapi:
       github: freyamade/xivapi-cr
   ```

2. Run `shards install`

## Usage
The base Client class can be imported from `xivapi/client`.

This class can be instantiated as follows;

```crystal
client = XIVAPI::Client.new "api_key", "language", poll_rate: 5, staging: true
```

All parameters are optional.
The `language` parameter must be a [supported language](https://xivapi.com/docs/Common-Features#language) for the API.
`poll_rate` is the number of seconds the Client will wait when attempting to poll cached responses (currently unused).
`staging` is a flag stating whether you want to interact with the stage API (if true) or the live API (if false).

To add API methods to the Client class, you can import the needed files. For example, importing `xivapi/client/character` will add the character methods to the Client class. Alternatively, if you want all of the methods, you can import `xivapi/client/*` instead of just `xivapi/client`.

The various Client files and their methods are detailed below;

### Character
```crystal
require "xivapi/client/character"
```

#### `character_search`
```crystal
XIVAPI::Client.new().character_search("name", "server", page: 0)
```
The character search method interacts with the `/character/search` endpoint of the API. Only the `name` parameter is required, the others are optional.

[XIVAPI Docs](https://xivapi.com/docs/Character#search)

#### `character`
```crystal
# Just returns the Character data
XIVAPI::Client.new().character(id: 123456)
# Fetch Achievement data as well
XIVAPI::Client.new().character(id: 123456, data: ["AC"])
# Fetch all data
XIVAPI::Client.new().character(id: 123456, data: XIVAPI::Client::CHARACTER_DATA_VALUES)
```
This method reads the information for the specified character and returns it.
It uses the `extended` field by default currently, though we plan to eventually allow users to choose whether or not to make the extended request.

By default the `character` field is always returned, and you can add extra fields using the `data` parameter.
The allowed fields are take from the docs.

[XIVAPI Docs](https://xivapi.com/docs/Character#character)

#### `character_verification`
```crystal
XIVAPI::Client.new().character_verification(id: 123456, "token")
```
This method reads and returns the chosen character's Lodestone bio.
If the token parameter is passed, then the response struct will have the `pass` field set to true if the bio contains the supplied token.

[XIVAPI Docs](https://xivapi.com/docs/Character#verification)

#### `character_update`
```crystal
XIVAPI::Client.new().character_update(id: 123456)
```
Send a request to update the details in XIVAPI for the chosen character.
The response from this method will be either a 1 or 0, representing success or failure respectively.

According to the XIVAPI Docs, you can only run this method for a given character once every 12 hours.

[XIVAPI Docs](https://xivapi.com/docs/Character#update)

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
