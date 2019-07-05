require "./src/client/*"

client = XIVAPI::Client.new
page = client.character_search "Erika Vaincannet"
id = page.results[0].id
puts client.character(id).info.not_nil!.character.not_nil!.updated
puts client.character_verification(id, "-").bio
puts client.character_update id
