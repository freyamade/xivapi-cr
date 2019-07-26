require "./client"

module XIVAPI
  module Client::FreeCompany
    # In this file, add methods for retrieving FreeCompany data

    # Search the Lodestone API for Free Companies with a given name.
    # Optionally, search specific servers.
    def free_company_search(name : String, server : String = "", page : UInt32 = 1) : Dataclasses::Page(Dataclasses::FreeCompanyProfile)
      # Send a request to the API for free company data, sending the passed parameters along with it
      endpoint = "freecompany/search"
      params = {
        "name"   => name,
        "server" => server,
        "page"   => page.to_s,
      }
      response = request endpoint, params
      begin
        return Dataclasses::Page(Dataclasses::FreeCompanyProfile).from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end

    # Retrieve the details of the FreeCompany with the given Lodestone ID.
    # If the Members Array is also needed, then it can be requested using the `members` flag by setting it to true.
    def free_company(id : String, members : Bool = false) : Dataclasses::FreeCompanyResponse
      endpoint = "freecompany/#{id}"
      response : String
      if members
        response = request endpoint, {"data" => "FCM"}
      else
        response = request endpoint
      end
      begin
        return Dataclasses::FreeCompanyResponse.from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end
  end

  # When this file is required, include the FreeCompany module to have access to the commands
  class Client
    include FreeCompany
  end
end
