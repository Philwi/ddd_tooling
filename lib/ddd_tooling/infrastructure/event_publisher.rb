# frozen_string_literal: true

# EventPublisher is a base class for event publishers.
# You have to implement the method #publish(event:) in your subclass.
# You can use something like RabbitMQ, Kafka, etc. to publish the events.
# You also can use something like the EventDispatcher for local events.
# @abstract
class DDDTooling::Infrastructure::EventPublisher
  # @param [Object] event
  def publish(event:) # rubocop:disable Lint/UnusedMethodArgument
    raise NoMethodError, 'You have to implement the method #publish(event:)'
  end

  # @param [Object] events
  # @return [void]
  def publish_all(events:)
    events.each do |event|
      publish(event: event)
    end
  end
end
