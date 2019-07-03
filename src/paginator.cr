require "./structs/page"

module XIVAPI
  # A class that abstracts iterating through pages of API data by implementing `Enumerable`
  class Paginator(T)
    # include Enumerable
    JSON.mapping(
      pagination: {type: Structs::Pagination, key: "Pagination"},
      results: {type: Array(T), key: "Results"},
    )

    # TODO - Fill in instance variables

    # def each : Structs::Page(T)
    #   return Page(T).from_json "{}"
    # end

    # Pagination data
    getter pagination
    # Results Array
    getter results
  end
end
