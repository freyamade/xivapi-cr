require "./structs/*"

module XIVAPI
  ENDPOINT_MAP = {
    "/search"                                         => Array(Structs::SearchResult),
    "/lore"                                           => Array(Structs::Lore),
    "/content"                                        => Array(String),
    "/servers"                                        => Array(String),
    "/servers/dc"                                     => HashMap(String, Array(String)),
    "/market/{server}/item/{item_id}"                 => HashMap(String, String),
    "/market/item/{item_id}?servers=[]"               => HashMap(String, String),
    "/market/item?servers=[]&items=[]"                => HashMap(String, String),
    "/market/ids"                                     => Array(Int32),
    "/market/categories"                              => Array(String),                  # Some kind of ItemSearchCategory struct? Might be also used elsewhere
    "/character/search?name=First+Last&server=Server" => Array(HashMap(String, String)), # Character data
    "/character/{id}"                                 => HashMap(String, String),
    "/character/{id}/verification"                    => HashMap(String, String),
    "/character/{id}/update"                          => Int32,
    "/freecompany/search"                             => Array(HashMap(String, String)),
    "/freecompany/{id}"                               => HashMap(String, String),
    "/linkshell/search"                               => Array(HashMap(String, String)),
    "/linkshell/{id}"                                 => HashMap(String, String),
    "/pvpteam/search"                                 => Array(HashMap(String, String)),
    "/pvpteam/{id}"                                   => HashMap(String, String),
    "/lodestone"                                      => Structs::Lodestone,
    "/lodestone/news"                                 => Array(Structs::News),
    "/lodestone/notices"                              => Array(Structs::Notice),
    "/lodestone/maintenance"                          => Array(Structs::Status),
    "/lodestone/updates"                              => Array(Structs::Notice),
    "/lodestone/status"                               => Array(Structs::Status),
    "/lodestone/topics"                               => Array(Structs::News),
    "/lodestone/worldstatus"                          => Array(Structs::WorldStatus),
    "/lodestone/devblog"                              => Array(Structs::Devblog),
    "/lodestone/devposts"                             => Array(Structs::Devpost),
    "/lodestone/deepdungeon"                          => Array(Structs::DeepDungeon),
    "/lodestone/heavenonhigh"                         => Array(Structs::DeepDungeon),
    "/lodestone/feasts"                               => Array(Structs::Feast),
    "/patchlist"                                      => Array(Structs::Patch),
  }
end
