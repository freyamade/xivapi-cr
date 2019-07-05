require "./client"

module XIVAPI
  class Client
    # In this file, add methods for retrieving FreeCompany data

    # An Array of Strings representing the fields that can be requested using the FreeCompany endpoint
    FREE_COMPANY_DATA_VALUES = ["FCM"]

    # Search the Lodestone API for Free Companies with a given name.
    # Optionally, search specific servers.
    def free_company_search(name : String, server : String = "", page : UInt32 = 1) : Dataclasses::Page(Dataclasses::FreeCompanyProfile)
      # Send a request to the API for free company data, sending the passed parameters along with it
      params = {
        "name"   => name,
        "server" => server,
        "page"   => page.to_s,
      }
      response = request "freecompany/search", params
      return Dataclasses::Page(Dataclasses::FreeCompanyProfile).from_json response
    end

    # Retrieve the details of the FreeCompany with the given Lodestone ID.
    # Any data fields that are requested will me mapped against the `FREE_COMPANY_DATA_VALUES` variable to ensure only allowed values are sent.
    def free_company(id : String, data : Array(String) = [] of String) : Dataclasses::FreeCompanyResponse
      data.reject! { |field| !FREE_COMPANY_DATA_VALUES.includes? field }
      endpoint = "freecompany/#{id}"
      response = request endpoint, {"data" => data.join ","}
      return Dataclasses::FreeCompanyResponse.from_json response
    end
  end
end
