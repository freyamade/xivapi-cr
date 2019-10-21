require "../spec_helper"

# Some Free Company detail constants that will be handy for the tests
FREE_COMPANY_NAME   = "The Blobs of Heart"
FREE_COMPANY_SERVER = "Lich"
FREE_COMPANY_ID     = "9228438586435675634"

describe XIVAPI::Client do
  # Series of tests for the FreeCompany Client methods
  describe "FreeCompany" do
    it "successfully searches for FreeCompanies" do
      client = XIVAPI::Client.new
      page = client.free_company_search FREE_COMPANY_NAME
      free_company = page.results[0]
      free_company.name.should eq FREE_COMPANY_NAME
      free_company.server.should eq FREE_COMPANY_SERVER
      free_company.id.should eq FREE_COMPANY_ID
    end

    it "successfully raises an exception if an invalid search is sent" do
      client = XIVAPI::Client.new
      ex = expect_raises(XIVAPI::Exceptions::XIVAPIException) do
        client.free_company_search ""
      end
      ex.api_exception.message.should eq "You must provide a name to search."
    end

    it "has an empty results list when a search is sent that won't return any details" do
      client = XIVAPI::Client.new
      page = client.free_company_search FREE_COMPANY_NAME, "Shiva"
      page.results.size.should eq 0
    end

    it "reads a FreeCompany properly without requesting the members" do
      client = XIVAPI::Client.new
      free_company_response = client.free_company FREE_COMPANY_ID

      # Check that the FreeCompany returned is the right one
      free_company_response.free_company.name.should eq FREE_COMPANY_NAME
      free_company_response.free_company.server.should eq FREE_COMPANY_SERVER

      # Check that the non-requested details are nil
      free_company_response.free_company_members.should be_nil
    end

    it "reads a FreeCompany properly, also requesting the members" do
      client = XIVAPI::Client.new
      free_company_response = client.free_company FREE_COMPANY_ID, true

      # Check that the FreeCompany returned is the right one
      free_company_response.free_company.name.should eq FREE_COMPANY_NAME
      free_company_response.free_company.server.should eq FREE_COMPANY_SERVER

      # Check that the non-requested details are nil
      free_company_response.free_company_members.should_not be_nil
    end
  end
end
