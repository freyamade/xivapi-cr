# Spec file testing that the different structs are properly constructed from JSON data
require "./spec_helper"
describe XIVAPI::Structs do
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
end
