# frozen_string_literal: true

# EventCommitter is a base class for event committers.
# It commits the composed events to the event store.
class DDDTooling::Infrastructure::EventCommitter
  private

  attr_reader :event_store, :event_composer

  public

  # @param [Object] event_store
  # it should implement the following interface:
  # - store(event:)
  # @param [Object] event_composer
  # it should implement the following interface:
  # - uncommitted_events
  # - clear
  # @return [void]
  def initialize(event_store:, event_composer:)
    @event_store = event_store
    @event_composer = event_composer
  end

  # @return [void]
  def commit
    event_composer.uncommitted_events.each do |event|
      event_store.store(event: event)
    end

    event_composer.clear
  end
end
