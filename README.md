# xivapi-cr

An unofficial Crystal library for [XIVAPI](https;//xivapi.com), written by a couple of people who like Final Fantasy XIV and Crystal!

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
    - [Lodestone](#lodestone)
        - [`lodestone`](#lodestone-1)
        - [`news`](#news)
        - [`notices`](#notices)
        - [`maintenance`](#maintenance)
        - [`updates`](#updates)
        - [`status`](#status)
        - [`topics`](#topics)
        - [`world_status`](#world_status)
        - [`devblog`](#devblog)
        - [`devposts`](#devposts)
        - [`palace_of_the_dead`](#palace_of_the_dead)
        - [`heaven_on_high`](#heaven_on_high)
        - [`feasts`](#feasts)
    - [Market](#market)
      - [`market`](#market-1)
        - [Multiple Servers](#multiple-servers)
        - [Multiple Items](#multiple-items)
      - [`sellable_item_ids`](#sellable_item_ids)
      - [`market_search_categories`](#market_search_categories)
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

To add API methods to the Client class, you can import the needed files. For example, importing `xivapi/client/character` will add the character methods to the Client class.
Alternatively, if you want all of the methods, you can import `xivapi/client/*` instead of just `xivapi/client`.

***NOTE:*** By default, `extended=1` is sent in every request.
This is a design choice until we figure out the best way to allow this flag to be sent on a per-request basis, given the fact that we've had to make structs for all the response data.

The various Client files and their methods are detailed below;

### Character
```crystal
require "xivapi/client/character"
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

#### `character_update`
```crystal
XIVAPI::Client.new().character_update(id: 123456)
```
Send a request to update the details in XIVAPI for the chosen character.
The response from this method will be either a 1 or 0, representing success or failure respectively.

According to the XIVAPI Docs, you can only run this method for a given character once every 12 hours.

[XIVAPI Docs](https://xivapi.com/docs/Character#update)

### Free Company
```crystal
require "xivapi/client/free_company"
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
require "xivapi/client/linkshell"
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

### Lodestone
```crystal
require "xivapi/client/lodestone"
```

Methods related to Lodestone information.

NOTE: All of these methods only come from the NA Lodestone, as it is the only one that is parsed.
Therefore, the language parameter will not affect the output.

#### `lodestone`
```crystal
XIVAPI::Client.new().lodestone()
```

This is the recommended method for fetching Lodestone data, as it is cached every 15 minutes.
It returns a response that contains the information from each of the following requests;
- `news`
- `notices`
- `maintenance`
- `updates`
- `status`
- `topics`
- `devblog`
- `devposts`

As well as some other information, like an array of banners currently being displayed in the official FFXIV Launcher.

[XIVAPI Docs](https://xivapi.com/docs/Lodestone#lodestone)

#### `news`
```crystal
XIVAPI::Client.new().news()
```

Retrieves the latest news from the Lodestone.

As far as I can tell, this method parses the Lodestone in real time instead responding from a cache, but I am unsure.

[XIVAPI Docs](https://xivapi.com/docs/Lodestone#news)

#### `notices`
```crystal
XIVAPI::Client.new().notices()
```

Retrieves the latest notices from the Lodestone.

As far as I can tell, this method parses the Lodestone in real time instead responding from a cache, but I am unsure.

[XIVAPI Docs](https://xivapi.com/docs/Lodestone#notices)

#### `maintenance`
```crystal
XIVAPI::Client.new().maintenance()
```

Retrieves the latest maintenance posts from the Lodestone.
These do not contain specific details, such as times, however.

As far as I can tell, this method parses the Lodestone in real time instead responding from a cache, but I am unsure.

[XIVAPI Docs](https://xivapi.com/docs/Lodestone#maintenance)

#### `updates`
```crystal
XIVAPI::Client.new().updates()
```

Retrieves the latest update posts from the Lodestone.

As far as I can tell, this method parses the Lodestone in real time instead responding from a cache, but I am unsure.

[XIVAPI Docs](https://xivapi.com/docs/Lodestone#updates)

#### `status`
```crystal
XIVAPI::Client.new().status()
```

Retrieves the latest status posts from the Lodestone.

As far as I can tell, this method parses the Lodestone in real time instead responding from a cache, but I am unsure.

[XIVAPI Docs](https://xivapi.com/docs/Lodestone#status)

#### `topics`
```crystal
XIVAPI::Client.new().topics()
```

Retrieves the latest topics from the Lodestone.

As far as I can tell, this method parses the Lodestone in real time instead responding from a cache, but I am unsure.

This endpoint is acually undocumented on the API.

#### `world_status`
```crystal
XIVAPI::Client.new().world_status()
```

Retrieves the latest world status information from the Lodestone.

As far as I can tell, this method parses the Lodestone in real time instead responding from a cache, but I am unsure.

[XIVAPI Docs](https://xivapi.com/docs/Lodestone#worldstatus)

#### `devblog`
```crystal
XIVAPI::Client.new().devblog()
```

Retrieves the latest developer blog information.
This data is pulled from an XML feed.

[XIVAPI Docs](https://xivapi.com/docs/Lodestone#devblog)

#### `devposts`
```crystal
XIVAPI::Client.new().devposts()
```

Retrieves the latest dev posts from the official forums.

[XIVAPI Docs](https://xivapi.com/docs/Lodestone#devposts)

#### `palace_of_the_dead`
```crystal
XIVAPI::Client.new().palace_of_the_dead(ranking_type: "solo", job_name: "whm", datacenter: "Light")
```

This method provides access to the Palace of the Dead rankings.

[XIVAPI Docs](https://xivapi.com/docs/Lodestone#deepdungeon)

#### `heaven_on_high`
```crystal
XIVAPI::Client.new().heaven_on_high(ranking_type: "solo", job_name: "pld", datacenter: "Light")
```

This method provides access to the Heaven On High rankings.

[XIVAPI Docs](https://xivapi.com/docs/Lodestone#HeavenOnHigh)

#### `feasts`
```crystal
XIVAPI::Client.new().feasts(season: "12", rank_type: "all", datacenter: "Light")
```

This method provides access to the Feasts rankings.
If no season is provided, the endpoint will return the current season.
If the current season is not active, the method will return an empty response.

[XIVAPI Docs](https://xivapi.com/docs/Lodestone#feasts)

### Market
```crystal
require "xivapi/client/market"
```

Methods related to Market information.

#### `market`
```crystal
XIVAPI::Client.new().market(item_id: 3_u64, server: "Lich", max_history: 2)
```

Retrieve the prices and history for a given item on a given server.

[XIVAPI Docs](https://xivapi.com/docs/Market#market)

This method has the following overloads;

##### Multiple Servers
```crystal
XIVAPI::Client.new().market(item_id: 3_u64, servers: ["Lich", "Phoenix"], max_history: 2)
XIVAPI::Client.new().market(item_id: 3_u64, datacenter: "Light", max_history: 2)
```

Retrieve the prices and history for a given item on various specified servers.

The servers to search can either be passed as an array of names, or the `datacenter` parameter can be used to list details for the item in every server in the specified datacenter.

This method returns a Hash of Server name to the item details.

[XIVAPI Docs](https://xivapi.com/docs/Market#multi)

##### Multiple Items
```crystal
XIVAPI::Client.new().market(item_ids: [3_u64, 2_u64], servers: ["Lich", "Phoenix"], max_history: 2)
XIVAPI::Client.new().market(item_ids: [3_u64, 2_u64], datacenter: "Light", max_history: 2)
```

Retrieve the prices and history for an array of items on various specified servers.

The servers to search can either be passed as an array of names, or the `datacenter` parameter can be used to list details for the item in every server in the specified datacenter.

This method returns an array where each item is the same Hash returned from the Multiple Servers method, and each item in the array is the response for the item whose id is in the same position in the array of item ids.
e.g. for the above examples, you will receive something like this;

```crystal
[
  {Lich: {...}, Phoenix: {...}},  # Item ID 3
  {Lich: {...}, Phoenix: {...}},  # Item ID 2
]
```

[XIVAPI Docs](https://xivapi.com/docs/Market#ids)

#### `sellable_item_ids`
```crystal
XIVAPI::Client.new().sellable_item_ids()
```

Retrieve a list of IDs for the items that are sellable on the Market Board.

[XIVAPI Docs](https://xivapi.com/docs/Market#ids)

#### `market_search_categories`
```crystal
XIVAPI::Client.new().market_search_categories()
```

Retrieve a list of search categories for the Market items.

[XIVAPI Docs](https://xivapi.com/docs/Market#categories)

### Other
```crystal
require "xivapi/client/other"
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

***NOTE:*** The other Game-Data methods are not currently available, we need to figure out the best way to implement them.

Retrieve an Array of all of the various types of Game Content that are available from the API.

[XIVAPI Docs](https://xivapi.com/docs/Game-Data#content)

#### `patch_list`
```crystal
XIVAPI::Client.new().patch_list
```

Retrieves an Array of Patch data from the API.

[XIVAPI Docs](https://xivapi.com/docs/Patch-List)

### PvP Team
```crystal
require "xivapi/client/pvp_team"
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
require "xivapi/client/servers"
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
