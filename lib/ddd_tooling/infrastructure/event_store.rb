# frozen_string_literal: true

# EventStore is a base class for event stores.
# It provides the persistance layer for published events and stores them.
# It provides the replay functionality for all stored events.
# It provides the clear functionality for all stored events.
# You have to provide a repository to store the events. It should implement the following interface:
#  - store(event:)
#  - stored_events
#  - clear
#  You have to provide a publisher to publish the events. It should implement the following interface:
#  - publish(event:)
# @abstract
class DDDTooling::Infrastructure::EventStore
  private

  attr_reader :event_store_repository, :event_dispatcher

  public

  def initialize(event_store_repository:, event_dispatcher:)
    @event_store_repository = event_store_repository
    @event_dispatcher = event_dispatcher
  end

  def store(event:)
    @event_store_repository.store(event: event)
  end

  def stored_events
    @event_store_repository.stored_events
  end

  def replay_events
    stored_events.each do |event|
      @event_dispatcher.dispatch(event: event)
    end
  end

  def clear
    @event_store_repository.clear
  end
end
