require "./structs/*"

module XIVAPI
  ENDPOINT_MAP = {
    "/search"     => Array(Structs::SearchResult),
    "/lore"       => Array(Structs::Lore),
    "/content"    => Array(String),
    "/servers"    => Array(String),
    "/servers/dc" => HashMap(String, Array(String)),

    
    "/market/{server}/item/{item_id}"                 => Structs::MarketItem,
    "/market/item/{item_id}?servers=[]"               => Hash(String, Structs::MarketItem),
    "/market/items?servers=[]&ids=[]"                 => Array(Hash(String, Structs::MarketItem)),
    "/market/ids"                                     => Array(Int32),
    "/market/categories"                              => Array(Structs::Category),                  # Some kind of ItemSearchCategory struct? Might be also used elsewhere
    "/character/search?name=First+Last&server=Server" => Structs::NameServer, # Character data
    "/character/{id}"                                 => Structs::Character,
    "/character/{id}/verification"                    => Structs::Verification,
    "/character/{id}/update"                          => Int32,
    "/freecompany/search"                             => Structs::FreeCompanySearch,
    "/freecompany/{id}"                               => Structs::FC,
    "/linkshell/search"                               => Structs::LinkshellSearch,
    "/linkshell/{id}"                                 => Structs::LS,
    # Begin not done block
    "/pvpteam/search"                                 => Array(HashMap(String, String)),
    "/pvpteam/{id}"                                   => HashMap(String, String),
    # End not done block

    "/lodestone"              => Structs::Lodestone,
    "/lodestone/news"         => Array(Structs::News),
    "/lodestone/notices"      => Array(Structs::Notice),
    "/lodestone/maintenance"  => Array(Structs::Status),
    "/lodestone/updates"      => Array(Structs::Notice),
    "/lodestone/status"       => Array(Structs::Status),
    "/lodestone/topics"       => Array(Structs::News),
    "/lodestone/worldstatus"  => Array(Structs::WorldStatus),
    "/lodestone/devblog"      => Array(Structs::Devblog),
    "/lodestone/devposts"     => Array(Structs::Devpost),
    "/lodestone/deepdungeon"  => Array(Structs::DeepDungeon),
    "/lodestone/heavenonhigh" => Array(Structs::DeepDungeon),
    "/lodestone/feasts"       => Array(Structs::Feast),
    "/patchlist"              => Array(Structs::Patch),
  }
end
