require "json"

module XIVAPI
  # An enum for the various states of the Info state values.
  enum InfoStates
    # Content is not on XIVAPI and will not be added via this request.
    NONE

    # Content does not exist on the API and needs adding.
    # The Payload should be empty if this state is provided.
    # It should take 2 minutes or less to add the content.
    ADDING

    # Content exists in the system and you're being provided a cached response.
    CACHED

    # Content does not exist on The Lodestone.
    NOT_FOUND

    # Content has been Blacklisted.
    # No data can be obtained via the API for any application.
    BLACKLIST

    # Content is private on Lodestone, ask the owner to make the content public and then try again!
    PRIVATE
  end

  module Dataclasses
    # Dataclass for the availability of a certain piece of data
    class Info
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        is_active: {type: Bool, key: "IsActive"},
        priority: {type: UInt64, key: "Priority"},
        state: {type: InfoStates, key: "State"},
        updated: {type: Time, key: "Updated", converter: Time::EpochConverter}
      )
      # A flag stating whether or not the item in question is in the API.
      getter is_active
      # The value of the priority of the item.
      getter priority
      # The current state of the item.
      # Uses the `InfoStates` enum.
      getter state
      # the time the data was last updated at
      getter updated
    end
  end
end
