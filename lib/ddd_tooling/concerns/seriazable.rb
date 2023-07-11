# frozen_string_literal: true

# Seriazable is a concern for serializing objects.
module DDDTooling::Concerns::Seriazable
  # @return [Hash]
  def to_h
    attributes
  end

  # @return [String]
  def to_s
    "#{self.class.name}#{attributes}"
  end

  # @return [String]
  def inspect
    to_s
  end

  # @return [String]
  def to_json(*_args)
    to_h.to_json
  end

  # @return [String]
  def to_yaml(*_args)
    to_h.to_yaml
  end

  # @return [String]
  def to_xml(*_args)
    to_h.to_xml
  end

  private

  # @return [Hash]
  def attributes
    instance_variables.each_with_object({}) do |name, hash|
      hash[name] = instance_variable_get(name)
    end
  end
end
