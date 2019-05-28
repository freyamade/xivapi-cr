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
    "/lodestone/news"                                 => Arrah(HashMap(String, String)),
    "/lodestone/notices"                              => Arrah(HashMap(String, String)),
    "/lodestone/maintenance"                          => Arrah(Structs::Status),
    "/lodestone/updates"                              => Arrah(Structs::UpdatePost),
    "/lodestone/status"                               => Arrah(Structs::Status),
    "/lodestone/worldstatus"                          => Arrah(Structs::WorldStatus),
    "/lodestone/devblog"                              => Arrah(Structs::Devblog),
    "/lodestone/devposts"                             => Arrah(Structs::Devpost),
    "/lodestone/deepdungeon"                          => Arrah(Structs::DeepDungeon),
    "/lodestone/heavenonhigh"                         => Arrah(Structs::DeepDungeon),
    "/lodestone/feasts"                               => Arrah(Structs::Feast),
    "/patchlist"                                      => Array(Structs::Patch),
  }
end
