# Spec file testing that the different structs are properly constructed from JSON data
require "./spec_helper"
describe XIVAPI::Structs do
  describe XIVAPI::Structs::DeepDungeon do
    it "is properly constructed from JSON from the API" do
      test = %({
        "Character": {
          "Avatar": "https:\/\/img2.finalfantasyxiv.com\/f\/43322997b23010639d565bee229c9570_ba22853447012a24cee115315d6a5bebfc0_96x96.jpg",
          "ID": 17092863,
          "Name": "Kana Vara",
          "Server": "Sargatanas"
        },
        "ClassJob": {
          "Name": ""
        },
        "Leaderboard": {
          "Floor": 100,
          "Rank": 1,
          "Score": 1597474,
          "Time": 1534295180
        }
      })
      begin
        data = XIVAPI::Structs::DeepDungeon.from_json test
        data.character.name.should eq "Kana Vara"
      rescue e
        fail "Error occurred when mapping struct from JSON: #{e}"
      end
    end
  end

  describe XIVAPI::Structs::Devpost do
    it "is properly constructed from JSON from the API" do
      test = %({
        "Content": "<article><p>I'm most excited for Shadowbringers to see everyone brought together! The beginning of an expansion is always the most exciting for me, seeing a friend wander around just about everywhere I go. So many adventures to be had, so many memories to cherish! It's nice to see what everyone is excited about<img src=\\"https:\/\/forum.square-enix.com\/ffxiv\/images\/smilies\/redface.png\\" border=\\"0\\" alt=\\"\\" title=\\"Embarrassment\\" class=\\"inlineimg\\"\/><\/p><\/article>",
        "PostCount": 224,
        "Time": 1557257760,
        "Title": "What are you most excited for in Shadowbringers?",
        "Url": "https:\/\/forum.square-enix.com\/ffxiv\/threads\/389437-What-are-you-most-excited-for-in-Shadowbringers?p=4972998#post4972998",
        "UserAvatar": "https:\/\/forum.square-enix.com\/ffxiv\/images\/avatars\/Leviathan.png",
        "UserColour": "#cc2929",
        "UserName": "Ridrina",
        "UserSignature": "Neha \\"Ridrina\\" Nair - Community Team",
        "UserTitle": "Community Rep",
        "id": 4972998
      })
      begin
        data = XIVAPI::Structs::Devpost.from_json test
        data.user_name.should eq "Ridrina"
      rescue e
        fail "Error occurred when mapping struct from JSON: #{e}"
      end
    end
  end

  describe XIVAPI::Structs::Exception do
    it "is properly constructed from JSON from the API" do
      test = %({
        "Error": true,
        "Subject": "XIVAPI Service Error",
        "Message": "The details of the error message",
        "Hash": "A sha1 trackable hash of the error message",
        "Ex": "The name of the exception thrown",
        "Debug": {"some key": "some value"}
      })
      begin
        data = XIVAPI::Structs::Exception.from_json test
        data.subject.should eq "XIVAPI Service Error"
      rescue e
        fail "Error occurred when mapping struct from JSON: #{e}"
      end
    end
  end

  describe XIVAPI::Structs::Feast do
    it "is properly constructed from JSON from the API" do
      test = %({
        "Character": {
          "Avatar": "https:\/\/img2.finalfantasyxiv.com\/f\/06474f472310d759766363e8e8f53b3f_96ab1df8877c1f8ba6a89a39cccfd437fc0_96x96.jpg",
          "ID": 12424525,
          "Name": "Air Weaver",
          "Server": "Cactuar"
        },
        "Leaderboard": {
          "Matches": "",
          "Rank": 1,
          "RankImage": "https:\/\/img.finalfantasyxiv.com\/lds\/h\/j\/pFl1xCbi1zFuh0zRjxVPLwBoL0.png",
          "RankPrevious": "",
          "Rating": 2682,
          "WinCount": "",
          "WinRate": ""
        }
      })
      begin
        data = XIVAPI::Structs::Feast.from_json test
        data.character.name.should eq "Air Weaver"
      rescue e
        fail "Error occurred when mapping struct from JSON: #{e}"
      end
    end
  end

  describe XIVAPI::Structs::Lore do
    it "is properly constructed from JSON from the API" do
      test = %({
        "Context": "Quest_ToDo",
        "Data": null,
        "Source": "Quest",
        "SourceID": 68738,
        "Text": "Speak with Nonotta at the Knot."
      })
      begin
        data = XIVAPI::Structs::Lore.from_json test
        data.data.should be_nil
      rescue e
        fail "Error occurred when mapping struct from JSON: #{e}"
      end
    end
  end

  describe XIVAPI::Structs::LoreData do
    it "is properly constructed from JSON from the API" do
      test = %({
        "GamePatchID": null,
        "ID": 290,
        "Icon": "\/c\/Leve.png",
        "Name": "Food Fight",
        "Name_cn": null,
        "Name_de": "Der Geheimauftrag",
        "Name_en": "Food Fight",
        "Name_fr": "Cuisine: un hachis pacificateur",
        "Name_ja": "\u88fd\u4f5c\u4f9d\u983c\uff1a\u30a2\u30f3\u30c6\u30ed\u30fc\u30d7\u8089\u306e\u30d1\u30a4",
        "Name_kr": null,
        "Url": "\/Leve\/290"
      })
    end
  end

  describe XIVAPI::Structs::Pagination do
    it "is properly constructed from JSON from the API" do
      test = %({
        "Page": 607,
        "PageNext": null,
        "PagePrev": 606,
        "PageTotal": 607,
        "Results": 38,
        "ResultsPerPage": 100,
        "ResultsTotal": 60638
      })
      begin
        data = XIVAPI::Structs::Pagination.from_json test
        data.next_page.should be_nil
      rescue e
        fail "Error occurred when mapping struct from JSON: #{e}"
      end
    end
  end

  describe XIVAPI::Structs::Patch do
    it "is properly constructed from JSON from the API" do
      test = %({
        "Banner": "https:\/\/i.imgur.com\/ZUUtGzH.png",
        "ExVersion": 0,
        "ID": 0,
        "Name": "Patch 2.0: A Realm Reborn",
        "Name_cn": "Patch 2.0: A Realm Reborn",
        "Name_de": "Patch 2.0: A Realm Reborn",
        "Name_en": "Patch 2.0: A Realm Reborn",
        "Name_fr": "Patch 2.0: A Realm Reborn",
        "Name_ja": "\u65b0\u751f\u30a8\u30aa\u30eb\u30bc\u30a2 2.0",
        "Name_kr": "Patch 2.0: A Realm Reborn",
        "ReleaseDate": 1376611200,
        "Version":"2.0"
      })
      begin
        data = XIVAPI::Structs::Patch.from_json test
        data.name.should eq "Patch 2.0: A Realm Reborn"
      rescue e
        fail "Error occurred when mapping struct from JSON: #{e}"
      end
    end
  end

  describe XIVAPI::Structs::SearchResult do
    it "is properly constructed from JSON from the API" do
      test = %({
        "ID": 8631,
        "Icon": "\/i\/045000\/045492.png",
        "Name": "Ironwork Breeches of Casting",
        "Url": "\/Item\/8631",
        "UrlType": "Item",
        "_": "item",
        "_Score": 1
      })
      begin
        data = XIVAPI::Structs::SearchResult.from_json test
        data.name.should eq "Ironwork Breeches of Casting"
      rescue e
        fail "Error occurred when mapping struct from JSON: #{e}"
      end
    end
  end
end
