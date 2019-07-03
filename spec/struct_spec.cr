# Spec file testing that the different structs are properly constructed from JSON data
require "http/client"
require "./spec_helper"

describe XIVAPI::Structs do
  describe XIVAPI::Structs::Character do
    it "is properly constructed from JSON from the API" do
      test = HTTP::Client.get("https://xivapi.com/character/9811984?data=AC,FR,FC,FCM,PVP&extended=1").body
      begin
        XIVAPI::Structs::Character.from_json test
      rescue e
        fail "Error occurred when mapping struct from JSON: #{e}"
      end
    end
  end

  describe XIVAPI::Structs::CharacterSearch do
    it "is properly constructed from JSON from the API" do
      test = HTTP::Client.get("https://xivapi.com/character/search?name=Terrance+Rihker&server=Lich").body
      begin
        response = XIVAPI::Paginator(XIVAPI::Structs::CharacterSearch).from_json test
        response.results[0].name.should eq "Terrance Rihker"
      rescue e
        fail "Error occurred when mapping struct from JSON: #{e}"
      end
    end
  end

  describe XIVAPI::Structs::MarketItem do
    it "is properly constructed from JSON from the API" do
      test = HTTP::Client.get("https://xivapi.com/market/Lich/item/25058?extended=1").body
      begin
        XIVAPI::Structs::MarketItem.from_json test
      rescue e
        fail "Error occurred when mapping struct from JSON: #{e}"
      end
    end
  end

  describe XIVAPI::Structs::Category do
    it "is properly constructed from JSON from the API" do
      test = HTTP::Client.get("https://xivapi.com/market/categories").body
      begin
        Array(XIVAPI::Structs::Category).from_json test
      rescue e
        fail "Error occurred when mapping struct from JSON: #{e}"
      end
    end
  end

  describe XIVAPI::Structs::MarketItem do
    it "is properly constructed from JSON from the API" do
      test = HTTP::Client.get("https://xivapi.com/market/items?servers=Lich&ids=25058").body
      begin
        Array(Hash(String, XIVAPI::Structs::MarketItem)).from_json test
      rescue e
        fail "Error occurred when mapping struct from JSON: #{e}"
      end
    end
  end

  describe XIVAPI::Structs::Verification do
    it "is properly constructed from JSON from the API" do
      test = HTTP::Client.get("https://xivapi.com/character/9811984/verification").body
      begin
        XIVAPI::Structs::Verification.from_json test
      rescue e
        fail "Error occurred when mapping struct from JSON: #{e}"
      end
    end
  end

  describe Int32 do
    it "is properly constructed from JSON from the API" do
      test = HTTP::Client.get("https://xivapi.com/character/9811984/update").body
      begin
        Int32.from_json test
      rescue e
        fail "Error occurred when mapping struct from JSON: #{e}"
      end
    end
  end

  describe XIVAPI::Structs::FreeCompanySearch do
    it "is properly constructed from JSON from the API" do
      test = HTTP::Client.get("https://xivapi.com/freecompany/search?name=Blobs").body
      begin
        XIVAPI::Structs::FreeCompanySearch.from_json test
      rescue e
        fail "Error occurred when mapping struct from JSON: #{e}"
      end
    end
  end

  describe XIVAPI::Structs::FC do
    it "is properly constructed from JSON from the API" do
      test = HTTP::Client.get("https://xivapi.com/freecompany/9228438586435675634?data=FCM&extended=1").body
      begin
        XIVAPI::Structs::FC.from_json test
      rescue e
        fail "Error occurred when mapping struct from JSON: #{e}"
      end
    end
  end

  describe XIVAPI::Structs::LinkshellSearch do
    it "is properly constructed from JSON from the API" do
      test = HTTP::Client.get("https://xivapi.com/linkshell/search?name=a").body
      begin
        XIVAPI::Structs::LinkshellSearch.from_json test
      rescue e
        fail "Error occurred when mapping struct from JSON: #{e}"
      end
    end
  end

  describe XIVAPI::Structs::LS do
    it "is properly constructed from JSON from the API" do
      test = HTTP::Client.get("https://xivapi.com/linkshell/12947848928791712").body
      begin
        XIVAPI::Structs::FC.from_json test
      rescue e
        fail "Error occurred when mapping struct from JSON: #{e}"
      end
    end
  end

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

  describe XIVAPI::Structs::Devblog do
    it "is properly constructed from JSON from the API" do
      test = %({
        "author": {
          "name":"FINAL FANTASY XIV Blog (English_US)"
        },
        "content": "Hello, Ridrina here reporting live from ...",
        "id": "tag:na.finalfantasyxiv.com,2019:\/pr\/blog\/\/6.2749",
        "link": {
          "@attributes": {
            "href": "https:\/\/na.finalfantasyxiv.com\/pr\/blog\/002749.html",
            "rel": "alternate",
            "type": "text\/html"
          }
        },
        "published": "2019-05-18T00:31:36Z",
        "summary": "Hello, Ridrina here reporting live from ...",
        "title": "Can't Read Mah Mahjong Face",
        "updated": "2019-05-17T17:43:22Z"
      })
      begin
        data = XIVAPI::Structs::Devblog.from_json test
        data.author.name.should eq "FINAL FANTASY XIV Blog (English_US)"
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

  describe XIVAPI::Structs::Lodestone do
    it "is properly constructed from JSON from the API" do
      test = HTTP::Client.get("https://xivapi.com/lodestone").body
      begin
        XIVAPI::Structs::Lodestone.from_json test
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

  describe XIVAPI::Structs::News do
    it "is properly constructed from JSON from the API" do
      test = %({
        "Banner": "https://img.finalfantasyxiv.com/t/454a0b1de48637517e66661ca795634122b0a7c0.png?1558944047",
        "Html": "<p>The Callback Campaign Ends on June 3!</p>",
        "Time": 1558944000,
        "Title": "The Callback Campaign Ends on June 3!",
        "Url": "/lodestone/topics/detail/454a0b1de48637517e66661ca795634122b0a7c"
      })
      begin
        data = XIVAPI::Structs::News.from_json test
        data.title.should eq "The Callback Campaign Ends on June 3!"
      rescue e
        fail "Error occurred when mapping struct from JSON: #{e}"
      end
    end
  end

  describe XIVAPI::Structs::Notice do
    it "is properly constructed from JSON from the API" do
      test = %({
        "Time": 1557823085,
        "Title": "FINAL FANTASY XIV Updated (May 13)",
        "Url": "https:\/\/na.finalfantasyxiv.com\/\/lodestone\/news\/detail\/aa7eae53676256068d298dac577459e9621b5f46"
      })
      begin
        data = XIVAPI::Structs::Notice.from_json test
        data.title.should eq "FINAL FANTASY XIV Updated (May 13)"
      rescue e
        fail "Error occurred when mapping struct from JSON: #{e}"
      end
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

  describe XIVAPI::Structs::Status do
    it "is properly constructed from JSON from the API" do
      test = %({
        "Tag": "[Recovery]",
        "Time": 1558775404,
        "Title": "Recovery from Mog Station Technical Difficulties (May 25)",
        "Url": "https:\/\/na.finalfantasyxiv.com\/\/lodestone\/news\/detail\/859d7337460b13d4a416a6939714859f8fc5fe02"
      })
      begin
        data = XIVAPI::Structs::Status.from_json test
        data.tag.should eq "[Recovery]"
      rescue e
        fail "Error occurred when mapping struct from JSON: #{e}"
      end
    end
  end

  describe XIVAPI::Structs::WorldStatus do
    it "is properly constructed from JSON from the API" do
      test = %({
        "Status": "Online",
        "Title": "Aegis"
      })
      begin
        data = XIVAPI::Structs::WorldStatus.from_json test
        data.title.should eq "Aegis"
      rescue e
        fail "Error occurred when mapping struct from JSON: #{e}"
      end
    end
  end
end
