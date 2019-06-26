require "./structs/page"

module XIVAPI
  # A class that abstracts iterating through pages of API data by implementing `Enumerable`
  class Paginator(T)
    include Enumerable

    # TODO - Fill in instance variables

    def each : Structs::Page(T)
      return Page(T).from_json "{}"
    end
  end
end
