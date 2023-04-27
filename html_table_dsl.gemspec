# frozen_string_literal: true

require_relative "lib/html_table_dsl/version"

Gem::Specification.new do |spec|
  spec.name          = "html_table_dsl"
  spec.version       = HtmlTableDsl::VERSION
  spec.authors       = ["Aleksandr Khoroshko"]
  spec.email         = ["aleksandrkhoroshko@gmail.com"]

  spec.summary       = "Domain-specific language (DSL) for generating HTML tables"
  spec.description   = "HtmlTableDSL is a Ruby gem that provides a simple DSL for generating HTML tables"
  spec.homepage      = "https://github.com/AlexKhoroshko/html_table_dsl"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/AlexKhoroshko/html_table_dsl"
  spec.metadata["changelog_uri"] = "https://github.com/AlexKhoroshko/html_table_dsl"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
