# frozen_string_literal: true

# Entity is a base class for entities.
class DDDTooling::Entity
  include DDDTooling::Concerns::Seriazable

  # @param [Object] other
  # @return [Boolean]
  def ==(other)
    self.class == other.class && attributes == other.attributes
  end
end
