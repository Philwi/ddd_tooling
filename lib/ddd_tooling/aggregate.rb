# frozen_string_literal: true

# Aggregate is a base class for aggregates.
class DDDTooling::Aggregate
  include DDDTooling::Concerns::Seriazable

  # @param [Object] other
  # @return [Boolean]
  def ==(other)
    self.class == other.class && attributes == other.attributes
  end
end
