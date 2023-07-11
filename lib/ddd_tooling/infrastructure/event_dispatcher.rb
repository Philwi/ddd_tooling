# frozen_string_literal: true

# EventDispatcher is a base class for event dispatchers.
# The event dispatcher is used to dispatch events to the event subscribers.
# It is mostly used for local events. Without a message queue.
# @abstract
class DDDTooling::Infrastructure::EventDispatcher
  private

  attr_reader :event_subscribers

  public

  def initialize
    @event_subscribers = {}
  end

  # @param [Object] event_class
  # @param [Object] subscriber_class
  # @return [void]
  def subscribe(event_class:, subscriber_class:)
    event_subscribers[event_class] ||= []
    event_subscribers[event_class] << subscriber_class
  end

  # @param [Object] event
  # @return [void]
  def dispatch(event:)
    event_subscribers[event.class]&.each do |subscriber_class|
      subscriber_class.new.handle(event: event)
    end
  end

  # @param [Object] events
  # @return [void]
  def dispatch_all(events:)
    events.each do |event|
      dispatch(event: event)
    end
  end

  # @return [void]
  def clear
    @event_subscribers = {}
  end
end
