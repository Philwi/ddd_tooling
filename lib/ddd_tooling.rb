# frozen_string_literal: true

require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect "ddd_tooling" => "DDDTooling"
loader.setup

module DDDTooling
  class Error < StandardError; end
  # Your code goes here...
end
