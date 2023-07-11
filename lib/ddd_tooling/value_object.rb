# frozen_string_literal: true

# ValueObject is a base class for value objects.
# It provides a default implementation for the equality operator.
# It is recommended to use this class as a base class for all value objects.
# It should be unmutatable.
# @abstract
class DDDTooling::ValueObject
  include DDDTooling::Concerns::Seriazable

  # @param [Object] other
  # @return [Boolean]
  def ==(other)
    self.class == other.class && attributes == other.attributes
  end
end
