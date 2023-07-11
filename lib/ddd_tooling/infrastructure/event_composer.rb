# frozen_string_literal: true

# EventComposer is a base class for event composers.
# It composes events from the domain model.
# The compose events are used to publish the events.
class DDDTooling::Infrastructure::EventComposer
  private

  attr_reader :events

  public

  def initialize
    @events = []
  end

  # @param [Object] event
  # @return [void]
  def compose(event:)
    @events << event
  end

  # @param [Object] events
  # @return [void]
  def compose_all(events:)
    events.each do |event|
      compose(event: event)
    end
  end

  # @return [Array<Object>]
  # @note This method is used by the event publisher to publish the events.
  def uncommitted_events
    @events
  end

  # @return [void]
  def clear
    @events = []
  end
end
