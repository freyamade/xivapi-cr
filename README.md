# xivapi-cr [![Latest Release Version](https://img.shields.io/github/release/freyamade/xivapi-cr?style=flat-square)](https://github.com/freyamade/xivapi-cr/releases/latest)

An unofficial Crystal library for [XIVAPI](https://xivapi.com), written by a couple of people who like Final Fantasy XIV and Crystal!

## Table Of Contents
- [Installation](#installation)
- [Usage](#usage)
    - [Character](#character)
      - [`character_search`](#character_search)
      - [`character`](#character-1)
      - [`character_verification`](#character_verification)
      - [`character_update`](#character_update)
    - [Free Company](#free-company)
      - [`free_company_search`](#free_company_search)
      - [`free_company`](#free_company)
    - [Linkshell](#linkshell)
      - [`linkshell_search`](#linkshell_search)
      - [`linkshell`](#linkshell-1)
    - [Other](#other)
      - [`search`](#search)
      - [`lore`](#lore)
      - [`content`](#content)
      - [`patch_list`](#patch_list)
    - [PvP Team](#pvp-team)
      - [`pvp_team_search`](#pvp_team_search)
      - [`pvp_team`](#pvp_team)
    - [Servers](#servers)
      - [`servers`](#servers-1)
      - [`datacenters`](#datacenters)
- [Development](#development)
- [Contributing](#contributing)
- [Contributors](#contributors)

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     xivapi-cr:
       github: freyamade/xivapi-cr
   ```

2. Run `shards install`

## Usage
The base Client class can be imported from `xivapi-cr/client`.

This class can be instantiated as follows;

```crystal
require "xivapi-cr"
client = XIVAPI::Client.new "api_key", "language", staging: true
```

All parameters are optional.
The `language` parameter must be a [supported language](https://xivapi.com/docs/Common-Features#language) for the API.
`staging` is a flag stating whether you want to interact with the stage API (if true) or the live API (if false).

To add API methods to the Client class, you can import the needed files. For example, importing `xivapi-cr/client/character` will add the character methods to the Client class.
Alternatively, if you want all of the methods, you can import `xivapi-cr/client/all` instead of just `xivapi-cr/client`.

***NOTE:*** By default, `extended=1` is sent in every request.
This is a design choice until we figure out the best way to allow this flag to be sent on a per-request basis, given the fact that we've had to make structs for all the response data.

The various Client files and their methods are detailed below;

### Character
```crystal
require "xivapi-cr/client/character"
```

Methods related to Character information.

#### `character_search`
```crystal
XIVAPI::Client.new().character_search("name", "server", page: 1)
```
The character search method interacts with the `/character/search` endpoint of the API.
Only the `name` parameter is required, the others are optional.

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

By default, only the `character` field is always returned.
You can request other fields as necessary using the `data` array.
The allowed fields are taken from the docs.

[XIVAPI Docs](https://xivapi.com/docs/Character#character)

#### `character_verification`
```crystal
XIVAPI::Client.new().character_verification(id: 123456, "token")
```
This method reads and returns the chosen character's Lodestone bio.
If the token parameter is passed, then the response struct will have the `pass` field set to true if the bio contains the supplied token.

[XIVAPI Docs](https://xivapi.com/docs/Character#verification)

### Free Company
```crystal
require "xivapi-cr/client/free_company"
```

Methods related to Free Company information.

#### `free_company_search`
```crystal
XIVAPI::Client.new().free_company_search("name", "server", page: 1)
```
The character search method interacts with the `/freecompany/search` endpoint of the API.
Only the `name` parameter is required, the others are optional.

[XIVAPI Docs](https://xivapi.com/docs/Free-Company#search)

#### `free_company`
```crystal
# Just returns the Free Company data
XIVAPI::Client.new().free_company(id: "123456")
# Fetch Free Company Members information too
XIVAPI::Client.new().free_company(id: 123456, members: true)
```
This method reads the information for the specified Free Company and returns it.
It uses the `extended` field by default currently, though we plan to eventually allow users to choose whether or not to make the extended request.

By default, only the `free_company` field is always returned.
If you require the Array of Characters that are Members of the Free Company, then set the `members` flag to `true`.

[XIVAPI Docs](https://xivapi.com/docs/Free-Company#free-company)

### Linkshell
```crystal
require "xivapi-cr/client/linkshell"
```

Methods related to Linkshell information.

#### `linkshell_search`
```crystal
XIVAPI::Client.new().linkshell_search("name", "server", page: 1)
```
The character search method interacts with the `/linkshell/search` endpoint of the API.
Only the `name` parameter is required, the others are optional.

[XIVAPI Docs](https://xivapi.com/docs/Linkshell#search)

#### `linkshell`
```crystal
XIVAPI::Client.new().linkshell(id: "123456")
```
This method reads the information for the Linkshell and returns it.
It uses the `extended` field by default currently, though we plan to eventually allow users to choose whether or not to make the extended request.

[XIVAPI Docs](https://xivapi.com/docs/Linkshell#linkshell)

### Other
```crystal
require "xivapi-cr/client/other"
```

A collection of methods that did not fit into the other groupings.

#### `search`
```crystal
XIVAPI::Client.new().search(
  string: "",
  string_algo: "",
  string_column: "",
  filters: [] of String,
  indexes: [] of String,
  sort_field: "",
  sort_order: "",
  page: 1,
  limit: 50,
)
```

Search the XIV API for anything in particular.
All the parameters to this method follow the XIVAPI docs and work as intended, except for `string_algo` as we have not included the `query_string` algorithm for now until we understand how it works.

***NOTE:*** This client does not currently support the Elastic Search payload method of searching. If there is a need for it, we can add it in at a later date.

[XIVAPI Docs](https://xivapi.com/docs/Search#search)

#### `lore`
```crystal
XIVAPI::Client.new().lore(
  string: "",
  string_algo: "",
  string_column: "",
  filters: [] of String,
  indexes: [] of String,
  sort_field: "",
  sort_order: "",
  page: 1,
  limit: 50,
  include_data: true,
)
```
Search through the XIVAPI for Lore entries.
The parameters to this method are the same as the ones for the `search` method, except for the `include_data` parameter.
Setting the `include_data` parameter to true will make the response also contain the `Data` column.

***NOTE:*** This client does not currently support the Elastic Search payload method of searching. If there is a need for it, we can add it in at a later date.

[XIVAPI Docs](https://xivapi.com/docs/Search#lore)

#### `content`
```crystal
XIVAPI::Client.new().content
```

Retrieve an Array of all of the various types of Game Content that are available from the API.

[XIVAPI Docs](https://xivapi.com/docs/Game-Data#content)

```crystal
XIVAPI::Client.new().list_game_data(
  index: "",
  page: Int32 = 1,
  limit: Int32 = 100,
  ids: [20]
)
```

Retrieve a page of the ID, Icon, Name and URL of all mentioned item IDs, retrieves all items if no id is specified

[XIVAPI Docs](https://xivapi.com/docs/Game-Data#lists)

```crystal
XIVAPI::Client.new().read_game_data(
  index: "",
  id: 1
)
```

Retrieve a JSON::Any object of the game data with the given ID

[XIVAPI Docs](https://xivapi.com/docs/Game-Data#data)

#### `patch_list`
```crystal
XIVAPI::Client.new().patch_list
```

Retrieves an Array of Patch data from the API.

[XIVAPI Docs](https://xivapi.com/docs/Patch-List)

### PvP Team
```crystal
require "xivapi-cr/client/pvp_team"
```

Methods related to PvP Team information.

#### `pvp_team_search`
```crystal
XIVAPI::Client.new().pvp_team_search("name", "server", page: 1)
```
The character search method interacts with the `/pvpteam/search` endpoint of the API.
Only the `name` parameter is required, the others are optional.

[XIVAPI Docs](https://xivapi.com/docs/PVP-Team#search)

#### `pvp_team`
```crystal
XIVAPI::Client.new().pvp_team(id: "123456")
```
This method reads the information for the PvP Team and returns it.
It uses the `extended` field by default currently, though we plan to eventually allow users to choose whether or not to make the extended request.

[XIVAPI Docs](https://xivapi.com/docs/PVP-Team#pvp-team)

### Servers
```crystal
require "xivapi-cr/client/servers"
```

Methods related to Server information.

#### `servers`
```crystal
XIVAPI::Client.new().servers
```

Retrieves a list of official Server names.

[XIVAPI Docs](https://xivapi.com/docs/Game-Data#servers)

#### `datacenters`
```crystal
XIVAPI::Client.new().datacenters
```

Retrieves a HashMap of Datacenter names to an Array of the Servers in the Datacenter.

[XIVAPI Docs](https://xivapi.com/docs/Game-Data#data-center)

## Contributing

1. Fork it (<https://github.com/freyamade/xivapi-cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

Please ensure to add extra specs as needed, and ensure all specs pass before we will merge any pull requests.

## Contributors

- [freyamade](https://github.com/freyamade) - co-creator and maintainer
- [ArthanJans](https://github.com/ArthanJans) - co-creator and maintainer
