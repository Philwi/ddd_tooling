# frozen_string_literal: true

# Event is a base class for events.
# It provides a default implementation for the equality operator.
# It is recommended to use this class as a base class for all events.
# It provides a unique identifier for each event.
# It should be unmutatable.
# @abstract
class DDDTooling::Event
  include DDDTooling::Concerns::Seriazable

  attr_reader :unique_identifier, :occurred_at

  # @return [void]
  def initialize
    # Each event should have a unique identifier. Because otherwhise it is not possible to detect duplicate events.
    @unique_identifier = SecureRandom.uuid
    @occurred_at = Time.zone.now
  end

  # @param [Object] other
  # @return [Boolean]
  def ==(other)
    self.class == other.class && attributes == other.attributes
  end
end
