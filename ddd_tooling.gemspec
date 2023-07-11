# frozen_string_literal: true

require_relative "lib/ddd_tooling/version"

Gem::Specification.new do |spec|
  spec.name = "ddd_tooling"
  spec.version = DddTooling::VERSION
  spec.authors = ["Philipp Winkler"]
  spec.email = ["philrigid@gmail.com"]

  spec.summary = "DDD Tooling is a collection of tools to support DDD development. The tools are based on the DDD Building Blocks."
  spec.required_ruby_version = ">= 2.6.0"

  spec.require_paths = ["lib"]
end
