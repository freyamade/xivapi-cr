require "./pagination"

module XIVAPI
  # A struct that represents a page of results from paginated endpoints.
  # The Page struct is a generic, so that we can use it for all kinds of endpoints.
  struct Page(T)
    JSON.mapping(
      results: Array(T),
      pagination: Structs::Pagination
    )

    # The results contained in the page
    getter results
    # An `XIVAPI::Structs::Pagination` struct containing the pagination info for the request
    getter pagination
  end
end
